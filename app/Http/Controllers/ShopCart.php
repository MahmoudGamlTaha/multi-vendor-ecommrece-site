<?php
#app/Http/Controller/ShopCart.php
namespace App\Http\Controllers;

use App\Models\ShopAttributeGroup;
use App\Models\ShopOrder;
use App\Models\ShopOrderDetail;
use App\Models\ShopOrderHistory;
use App\Models\ShopOrderTotal;
use App\Models\ShopProduct;
use App\User;
use Cart;
use DB;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Validator;

class ShopCart extends GeneralController
{
    public function __construct()
    {
        parent::__construct();

    }
/**
 * [getCart description]
 * @return [type] [description]
 */
    public function getCart()
    {
        session()->forget('paymentMethod'); //destroy paymentMethod
        session()->forget('shippingMethod'); //destroy shippingMethod
        //Shipping
        $moduleShipping  = \Helper::getExtensionsGroup('shipping');
        $sourcesShipping = \FindClass::classNames('Extensions', 'shipping');
        $shippingMethod  = array();
        foreach ($moduleShipping as $key => $module) {
            if (in_array($module['key'], $sourcesShipping)) {
                $moduleClass                    = '\App\Extensions\Shipping\Controllers\\' . $module['key'];
                $shippingMethod[$module['key']] = (new $moduleClass)->getData();
            }
        }
        //Payment
        $modulePayment  = \Helper::getExtensionsGroup('payment');
        $sourcesPayment = \FindClass::classNames('Extensions', 'payment');
        $paymentMethod  = array();
        foreach ($modulePayment as $key => $module) {
            if (in_array($module['key'], $sourcesPayment)) {
                $moduleClass                   = 'App\Extensions\Payment\Controllers\\' . $module['key'];
                $paymentMethod[$module['key']] = (new $moduleClass)->getData();
            }
        }
        //Total
        $moduleTotal  = \Helper::getExtensionsGroup('total');
        $sourcesTotal = \FindClass::classNames('Extensions', 'total');
        $totalMethod  = array();
        foreach ($moduleTotal as $key => $module) {
            if (in_array($module['key'], $sourcesTotal)) {
                $moduleClass                 = '\App\Extensions\Total\Controllers\\' . $module['key'];
                $totalMethod[$module['key']] = (new $moduleClass)->getData();
            }
        }

        //====================================================
        $objects           = array();
        $objects[]         = (new ShopOrderTotal)->getShipping();
        $objects[]         = (new ShopOrderTotal)->getDiscount();
        $objects[]         = (new ShopOrderTotal)->getReceived();
        $extensionDiscount = $totalMethod['Discount'] ?? '';
        if (!empty(session('Discount'))) {
            $hasCoupon = true;
        } else {
            $hasCoupon = false;
        }
        $user = auth()->user();
        if ($user) {
            $addressDefaul = [
                'toname'   => $user->name,
                'email'    => $user->email,
                'address1' => $user->address1,
                'address2' => $user->address2,
                'phone'    => $user->phone,
                'comment'  => '',
            ];
        } else {
            $addressDefaul = [
                'toname'   => '',
                'email'    => '',
                'address1' => '',
                'address2' => '',
                'phone'    => '',
                'comment'  => '',
            ];
        }
        $shippingAddress = session('shippingAddress') ? json_decode(session('shippingAddress'), true) : $addressDefaul;
        return view($this->theme . '.shop_cart',
            array(
                'title'             => trans('language.cart_title'),
                'description'       => '',
                'keyword'           => '',
                'cart'              => Cart::content(),
                'attributesGroup'   => ShopAttributeGroup::all()->keyBy('id'),
                'shippingMethod'    => $shippingMethod,
                'paymentMethod'     => $paymentMethod,
                'totalMethod'       => $totalMethod,
                'dataTotal'         => ShopOrderTotal::processDataTotal($objects),
                'hasCoupon'         => $hasCoupon,
                'extensionDiscount' => $extensionDiscount,
                'shippingAddress'   => $shippingAddress,
                'uID'               => $user->id ?? 0,
                'layout_page'       => 'shop_cart',
            )
        );
    }

/**
 * Process Cart
 * @param  Request $request [description]
 * @return [type]           [description]
 */
    public function processCart(Request $request)
    {
        if (Cart::count() == 0) {
            return redirect()->route('cart');
        }
        //Not allow for guest
        if (!$this->configs['shop_allow_guest'] && !auth()->user()) {
            return redirect()->route('login');
        } //

        $messages = [
            'max'      => trans('validation.max.string'),
            'required' => trans('validation.required'),
        ];
        $v = Validator::make($request->all(), [
            'toname'         => 'required|max:100',
            'address1'       => 'required|max:100',
            //'address2'       => 'required|max:100',
            'phone'          => 'required|regex:/^0[^0][0-9\-]{7,13}$/',
            'email'          => 'required|string|email|max:255',
            'shippingMethod' => 'required',
            'paymentMethod'  => 'required',
        ], $messages);
        if ($v->fails()) {
            return redirect()->back()->withInput()->withErrors($v->errors());
        }
        session(['shippingMethod' => request('shippingMethod')]);
        session(['paymentMethod' => request('paymentMethod')]);
        session(['shippingAddress' => json_encode([
            'toname'   => $request->get('toname'),
            'email'    => $request->get('email'),
            'address1' => $request->get('address1'),
            'address2' => $request->get('address2'),
            'phone'    => $request->get('phone'),
            'comment'  => $request->get('comment'),
        ]
        )]);
        // dd(session()->all());
        return redirect()->route('checkout');
    }

/**
 * [getCheckout description]
 * @return [type] [description]
 */
    public function getCheckout()
    {
        if (!session('shippingMethod') || !session('paymentMethod') || !session('shippingAddress')) {
            return redirect()->route('cart');
        }
        //====================================================
        $payment             = session('paymentMethod');
        $shipping            = session('shippingMethod');
        $address             = session('shippingAddress');
        $classShippingMethod = '\App\Extensions\Shipping\Controllers\\' . $shipping;
        $shippingMethod      = (new $classShippingMethod)->getData();
        $classPaymentMethod  = '\App\Extensions\Payment\Controllers\\' . $payment;
        $paymentMethod       = (new $classPaymentMethod)->getData();
        $objects             = array();
        $objects[]           = (new ShopOrderTotal)->getShipping();
        $objects[]           = (new ShopOrderTotal)->getDiscount();
        $objects[]           = (new ShopOrderTotal)->getReceived();
        $dataTotal           = ShopOrderTotal::processDataTotal($objects);
        session()->forget('paymentMethod'); //destroy paymentMethod
        session()->forget('shippingMethod'); //destroy shippingMethod
        return view($this->theme . '.shop_checkout',
            array(
                'title'           => trans('language.checkout_title'),
                'description'     => '',
                'keyword'         => '',
                'cart'            => Cart::content(),
                'dataTotal'       => $dataTotal,
                'paymentMethod'   => $paymentMethod,
                'shippingMethod'  => $shippingMethod,
                'payment'         => $payment,
                'shipping'        => $shipping,
                'address'         => json_decode($address, true),
                'attributesGroup' => ShopAttributeGroup::all()->keyBy('id'),
            )
        );
    }

/**
 * [postCart description]
 * @param  Request $request [description]
 * @return [type]           [description]
 */
    public function postCart(Request $request)
    {
        $data       = $request->all();
        $product_id = $data['product_id'];
        $opt_sku    = $data['opt_sku'] ?? null;
        $attribute  = $data['attribute'] ?? null;
        $qty        = $data['qty'];
        $product    = ShopProduct::find($product_id);
        if ($product->allowSale()) {
            $options        = array();
            $options['opt'] = $opt_sku;
            $options['att'] = $attribute;
            Cart::add(
                array(
                    'id'      => $product_id,
                    'name'    => $product->name,
                    'qty'     => $qty,
                    'price'   => (new ShopProduct)->getPrice($product_id, $opt_sku),
                    'options' => $options,
                )
            );
            return redirect()->route('cart')
                ->with(
                    ['message' => trans('language.cart.success', ['instance' => 'cart'])]
                );
        } else {
            return redirect()->route('cart')
                ->with(
                    ['error' => trans('language.cart.dont_allow_sale')]
                );
        }

    }

/**
 * [storeOrder description]
 * @param  Request $request [description]
 * @return [type]           [description]
 */
    public function storeOrder(Request $request)
    {
        if (Cart::count() == 0) {
            return redirect()->route('home');
        }
        //Not allow for guest
        if (!$this->configs['shop_allow_guest'] && !auth()->user()) {
            return redirect()->route('login');
        } //
        $data = request()->all();
        if (!$data) {
            return redirect()->route('cart');
        } else {
            $dataTotal = json_decode($data['dataTotal'], true);
            $address   = json_decode($data['address'], true);
            $payment   = $data['payment'];
            $shipping  = $data['shipping'];
        }
        try {
            //Process total
            $subtotal       = (new ShopOrderTotal)->sumValueTotal('subtotal', $dataTotal);
            $shipping       = (new ShopOrderTotal)->sumValueTotal('shipping', $dataTotal); //sum shipping
            $discount       = (new ShopOrderTotal)->sumValueTotal('discount', $dataTotal); //sum discount
            $received       = (new ShopOrderTotal)->sumValueTotal('received', $dataTotal); //sum received
            $total          = (new ShopOrderTotal)->sumValueTotal('total', $dataTotal);
            $payment_method = $payment;
            //end total
            DB::connection('mysql')->beginTransaction();
            $arrOrder['user_id'] = auth()->user()->id ?? 0;

            $arrOrder['subtotal']        = $subtotal;
            $arrOrder['shipping']        = $shipping;
            $arrOrder['discount']        = $discount;
            $arrOrder['received']        = $received;
            $arrOrder['payment_status']  = 0;
            $arrOrder['shipping_status'] = 0;
            $arrOrder['status']          = 0;
            $arrOrder['currency']        = \Helper::currencyCode();
            $arrOrder['exchange_rate']   = \Helper::currencyRate();
            $arrOrder['total']           = $total;
            $arrOrder['balance']         = $total + $received;
            $arrOrder['toname']          = $address['toname'];
            $arrOrder['email']           = $address['email'];
            $arrOrder['address1']        = $address['address1'];
            $arrOrder['address2']        = $address['address2'];
            $arrOrder['phone']           = $address['phone'];
            $arrOrder['payment_method']  = $payment_method;
            $arrOrder['comment']         = $address['comment'];
            $arrOrder['created_at']      = date('Y-m-d H:i:s');

            //Insert to Order
            $orderId = ShopOrder::insertGetId($arrOrder);
            //

            //Insert order total
            ShopOrderTotal::insertTotal($dataTotal, $orderId);
            //End order total

            foreach (Cart::content() as $value) {
                $product                  = ShopProduct::find($value->id);
                $arrDetail['order_id']    = $orderId;
                $arrDetail['product_id']  = $value->id;
                $arrDetail['name']        = $value->name;
                $arrDetail['price']       = \Helper::currencyValue($value->price);
                $arrDetail['qty']         = $value->qty;
                $arrDetail['attribute']   = ($value->options->att) ? json_encode($value->options->att) : null;
                $arrDetail['sku']         = $product->sku;
                $arrDetail['total_price'] = \Helper::currencyValue($value->price) * $value->qty;
                $arrDetail['created_at']  = date('Y-m-d H:i:s');
                ShopOrderDetail::insert($arrDetail);
                //If product out of stock
                if (!$this->configs['product_buy_out_of_stock'] && $product->stock < $value->qty) {
                    return redirect()->route('home')->with('error', trans('language.cart.over', ['item' => $product->sku]));
                } //
                $product->stock -= $value->qty;
                $product->sold += $value->qty;
                $product->save();

            }

            //Add history
            $dataHistory = [
                'order_id' => $orderId,
                'content'  => 'New order',
                'user_id'  => auth()->user()->id ?? 0,
                'add_date' => date('Y-m-d H:i:s'),
            ];
            ShopOrderHistory::insert($dataHistory);

            //Process Discount
            $codeDiscount = session('Discount') ?? '';
            if ($codeDiscount) {
                if (!empty(\Helper::configs()['Discount'])) {
                    $moduleClass             = '\App\Extensions\Total\Controllers\Discount';
                    $uID                     = auth()->user()->id ?? 0;
                    $returnModuleDiscount    = (new $moduleClass)->apply($codeDiscount, $uID, $msg = 'Order #' . $orderId);
                    $arrReturnModuleDiscount = json_decode($returnModuleDiscount, true);
                    if ($arrReturnModuleDiscount['error'] == 1) {
                        if ($arrReturnModuleDiscount['msg'] == 'error_code_not_exist') {
                            $msg = trans('language.promotion.process.invalid');
                        } elseif ($arrReturnModuleDiscount['msg'] == 'error_code_cant_use') {
                            $msg = trans('language.promotion.process.over');
                        } elseif ($arrReturnModuleDiscount['msg'] == 'error_code_expired_disabled') {
                            $msg = trans('language.promotion.process.expire');
                        } elseif ($arrReturnModuleDiscount['msg'] == 'error_user_used') {
                            $msg = trans('language.promotion.process.used');
                        } elseif ($arrReturnModuleDiscount['msg'] == 'error_uID_input') {
                            $msg = trans('language.promotion.process.user_id_invalid');
                        } elseif ($arrReturnModuleDiscount['msg'] == 'error_login') {
                            $msg = trans('language.promotion.process.must_login');
                        } else {
                            $msg = trans('language.promotion.process.undefined');
                        }
                        return redirect()->route('cart')->with(['error_discount' => $msg]);
                    }
                }
            }
            //End process Discount

            $dataItems = Cart::content();
            Cart::destroy(); // destroy cart

            //End discount
            DB::connection('mysql')->commit();

            //Process paypal
            if ($payment_method === 'Paypal') {
                $data_payment = [];
                foreach ($dataItems as $value) {
                    $product        = ShopProduct::find($value->id);
                    $data_payment[] =
                        [
                        'name'     => $value->name,
                        'quantity' => $value->qty,
                        'price'    => \Helper::currencyValue($value->price),
                        'sku'      => $product->sku,
                    ];
                }
                $data_payment[] =
                    [
                    'name'     => 'Shipping',
                    'quantity' => 1,
                    'price'    => $shipping,
                    'sku'      => 'shipping',
                ];
                $data_payment[] =
                    [
                    'name'     => 'Discount',
                    'quantity' => 1,
                    'price'    => $discount,
                    'sku'      => 'discount',
                ];
                $data_payment['order_id'] = $orderId;
                $data_payment['currency'] = \Helper::currencyCode();
                return redirect()->route('paypal')->with('data_payment', $data_payment);
            } else {
                return $this->completeOrder($orderId);
            }

            //

        } catch (\Exception $e) {
            DB::connection('mysql')->rollBack();
            echo 'Caught exception: ', $e->getMessage(), "\n";

        }

    }

/**
 * [addToCart description]
 * @param Request $request [description]
 */
    public function addToCart(Request $request)
    {
        $instance = request('instance') ?? 'default';
        $cart     = \Cart::instance($instance);
        if (!$request->ajax()) {
            return redirect()->route('cart');
        }
        $id             = request('id');
        $attribute      = request('attribute') ?? null;
        $opt_sku        = request('opt_sku') ?? null;
        $options        = [];
        $options['att'] = $attribute;
        $options['opt'] = $opt_sku;
        $product        = ShopProduct::find($id);
        $html           = '';
        switch ($instance) {
            case 'default':
                if ($product->allowSale()) {
                    $cart->add(
                        array(
                            'id'      => $id,
                            'name'    => $product->name,
                            'qty'     => 1,
                            'price'   => $product->getPrice($id),
                            'options' => $options,
                        )
                    );
                } else {
                    return response()->json(
                        [
                            'error' => 1,
                            'msg'   => trans('language.cart.dont_allow_sale'),
                        ]
                    );
                }
                break;

            default:
                //Wishlist or Compare...
                ${'arrID' . $instance} = array_keys($cart->content()->groupBy('id')->toArray());
                if (!in_array($id, ${'arrID' . $instance})) {
                    try {
                        $cart->add(
                            array(
                                'id'    => $id,
                                'name'  => $product->name,
                                'qty'   => 1,
                                'price' => $product->getPrice($id),
                            )
                        );
                    } catch (\Exception $e) {
                        return response()->json(
                            [
                                'error' => 1,
                                'msg'   => $e->getMessage(),
                            ]
                        );
                    }

                } else {
                    return response()->json(
                        [
                            'error' => 1,
                            'msg'   => trans('language.cart.exist', ['instance' => $instance]),
                        ]
                    );
                }
                break;
        }

        $carts = \Helper::getListCart($instance);
        if ($instance == 'default' && $carts['count']) {
            $html .= '<div><div class="shopping-cart-list">';
            foreach ($carts['items'] as $item) {
                $html .= '<div class="product product-widget"><div class="product-thumb">';
                $html .= '<img src="' . $item['image'] . '" alt="">';
                $html .= '</div>';
                $html .= '<div class="product-body">';
                $html .= '<h3 class="product-price">' . $item['price'] . ' <span class="qty">x' . $item['qty'] . '</span></h3>';
                $html .= '<h2 class="product-name"><a href="' . $item['url'] . '">' . $item['name'] . '</a></h2>';
                $html .= '</div>';
                $html .= '<a href="' . route("removeItem", ['id' => $item['rowId']]) . '"><button class="cancel-btn"><i class="fa fa-trash"></i></button></a>';
                $html .= '</div>';
            }
            $html .= '</div></div>';
            $html .= '<div class="shopping-cart-btns">
                    <a href="' . route('cart') . '"><button class="main-btn">' . trans('language.cart_title') . '</button></a>
                    <a href="' . route('checkout') . '"><button class="primary-btn">' . trans('language.checkout_title') . ' <i class="fa fa-arrow-circle-right"></i></button></a>
                  </div>';
        }
        return response()->json(
            [
                'error'      => 0,
                'count_cart' => $carts['count'],
                'instance'   => $instance,
                'subtotal'   => $carts['subtotal'],
                'html'       => $html,
                'msg'        => trans('language.cart.success', ['instance' => ($instance == 'default') ? 'cart' : $instance]),
            ]
        );

    }

/**
 * [updateToCart description]
 * @param  Request $request [description]
 * @return [type]           [description]
 */
    public function updateToCart(Request $request)
    {
        if (!$request->ajax()) {
            return redirect()->route('cart');
        }
        $id      = $request->get('id');
        $rowId   = $request->get('rowId');
        $product = ShopProduct::find($id);
        $new_qty = $request->get('new_qty');
        if ($product->stock < $new_qty && !$this->configs['product_buy_out_of_stock']) {
            return response()->json(
                [
                    'error' => 1,
                    'msg'   => trans('language.cart.over', ['item' => $product->sku]),
                ]);
        } else {
            Cart::update($rowId, ($new_qty) ? $new_qty : 0);
            return response()->json(
                ['error' => 0,
                ]);
        }

    }

/**
 * [wishlist description]
 * @return [type] [description]
 */
    public function wishlist()
    {

        $wishlist = Cart::instance('wishlist')->content();
        return view($this->theme . '.shop_wishlist',
            array(
                'title'       => trans('language.wishlist'),
                'description' => '',
                'keyword'     => '',
                'wishlist'    => $wishlist,
                'layout_page' => 'shop_wishlist',
            )
        );
    }

/**
 * [compare description]
 * @return [type] [description]
 */
    public function compare()
    {
        $compare = Cart::instance('compare')->content();
        return view($this->theme . '.shop_compare',
            array(
                'title'       => trans('language.compare'),
                'description' => '',
                'keyword'     => '',
                'compare'     => $compare,
                'layout_page' => 'product_compare',
            )
        );
    }

/**
 * [clearCart description]
 * @return [type] [description]
 */
    public function clearCart()
    {
        Cart::destroy();
        return redirect()->route('cart');
    }

/**
 * Remove item from cart
 * @author lanhktc
 */
    public function removeItem($id = null)
    {
        if ($id === null) {
            return redirect()->route('cart');
        }

        if (array_key_exists($id, Cart::content()->toArray())) {
            Cart::remove($id);
        }
        return redirect()->route('cart');
    }

/**
 * [removeItem_wishlist description]
 * @param  [type] $id [description]
 * @return [type]     [description]
 */
    public function removeItemWishlist($id = null)
    {
        if ($id === null) {
            return redirect()->route('wishlist');
        }

        if (array_key_exists($id, Cart::instance('wishlist')->content()->toArray())) {
            Cart::instance('wishlist')->remove($id);
        }
        return redirect()->route('wishlist');
    }

/**
 * [removeItemCompare description]
 * @param  [type] $id [description]
 * @return [type]     [description]
 */
    public function removeItemCompare($id = null)
    {
        if ($id === null) {
            return redirect()->route('compare');
        }

        if (array_key_exists($id, Cart::instance('compare')->content()->toArray())) {
            Cart::instance('compare')->remove($id);
        }
        return redirect()->route('compare');
    }

    public function completeOrder($orderId)
    {
        session()->forget('paymentMethod'); //destroy paymentMethod
        session()->forget('shippingMethod'); //destroy shippingMethod
        session()->forget('totalMethod'); //destroy totalMethod
        session()->forget('otherMethod'); //destroy otherMethod
        session()->forget('Discount'); //destroy Discount
        //Send email
        try {
            $data = ShopOrder::with('details')->find($orderId)->toArray();
            Mail::send('vendor.mail.order_new', $data, function ($message) use ($orderId) {
                $message->to($this->configsGlobal['email'], $this->configsGlobal['title']);
                $message->replyTo($this->configsGlobal['email'], $this->configsGlobal['title']);
                $message->subject(trans('language.order.email.new_title') . '#' . $orderId);
            });
        } catch (\Exception $e) {
            echo 'Error send mail';
        } //
        return redirect()->route('cart')->with('message', trans('language.order.success'));
    }
}
