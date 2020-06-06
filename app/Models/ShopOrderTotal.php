<?php
#app/Models/ShopOrderTotal.php
namespace App\Models;

use App\Models\ShopOrder;
use Cart;
use Illuminate\Database\Eloquent\Model;

class ShopOrderTotal extends Model
{
    public $table           = 'shop_order_total';
    const POSITION_SUBTOTAL = 1;
    const POSITION_SHIPPING = 10;
    const POSITION_DISCOUNT = 20;
    const POSITION_TOTAL    = 100;
    const POSITION_RECEIVED = 200;
    const NOT_YET_PAY       = 0;
    const PART_PAY          = 1;
    const PAID              = 2;
    const NEED_REFUND       = 3;

/**
 * [processDataTotal description]
 * @param  array      $objects  [description]
 * @param  float|null $subtotal [description]
 * @return [type]               [description]
 */
    public static function processDataTotal(array $objects = [])
    {
        $subtotal = \Helper::currencySumCart(Cart::content());
        //You can't use Cart::subtotal(), becase when use currency, Cart::subtotal() may be not equal $subtotal

        //Set subtotal
        $arraySubtotal = [
            'title' => trans('language.total.sub_total'),
            'code'  => 'subtotal',
            'value' => $subtotal,
            'text'  => \Helper::currencyOnlyRender($subtotal, \Helper::currencyCode()),
            'sort'  => self::POSITION_SUBTOTAL,
        ];

        // set total
        $total = $subtotal;
        foreach ($objects as $key => $object) {
            if ($object) {
                $objects[$key]['value'] = \Helper::currencyValue($object['value']);
                $objects[$key]['text']  = \Helper::currencyRender($object['value']);
                if ($object['code'] != 'received') {
                    $total += \Helper::currencyValue($object['value']);
                }
            } else {
                unset($objects[$key]);
            }

        }
        $arrayTotal = array(
            'title' => trans('language.total.total'),
            'code'  => 'total',
            'value' => $total,
            'text'  => \Helper::currencyOnlyRender($total, \Helper::currencyCode()),
            'sort'  => self::POSITION_TOTAL,
        );

        $objects[] = $arraySubtotal;
        $objects[] = $arrayTotal;

        //re-sort item total
        usort($objects, function ($a, $b) {
            return $a['sort'] > $b['sort'];
        });
//

        return $objects;
    }

    /**
     * Get sum value in order total
     * @param  string $code      [description]
     * @param  arra $dataTotal [description]
     * @return int            [description]
     */
    public function sumValueTotal($code, $dataTotal)
    {
        $keys  = array_keys(array_column($dataTotal, 'code'), $code);
        $value = 0;
        foreach ($keys as $key => $object) {
            $value += $dataTotal[$object]['value'];
        }
        return $value;
    }

    public function getShipping()
    {
        $arrShipping    = [];
        $shippingMethod = session('shippingMethod') ?? '';
        if ($shippingMethod) {
            $moduleClass          = '\App\Extensions\Shipping\Controllers\\' . $shippingMethod;
            $returnModuleShipping = (new $moduleClass)->getData();
            $arrShipping          = [
                'title' => $returnModuleShipping['title'],
                'code'  => 'shipping',
                'value' => $returnModuleShipping['value'],
                'text'  => $returnModuleShipping['value'],
                'sort'  => self::POSITION_SHIPPING,
            ];
        }
        return $arrShipping;
    }

    public function getPayment()
    {
        $arrPayment    = [];
        $paymentMethod = session('paymentMethod') ?? '';
        if ($paymentMethod) {
            $moduleClass         = '\App\Extensions\Payment\Controllers\\' . $paymentMethod;
            $returnModulePayment = (new $moduleClass)->getData();
            $arrPayment          = [
                'title'  => $returnModulePayment['title'],
                'method' => $paymentMethod,
            ];
        }
        return $arrPayment;
    }

    public function getDiscount()
    {
        $arrDiscount = [];
        $arrDiscount = array(
            'title' => trans('language.total.discount'),
            'code'  => 'discount',
            'value' => 0,
            'text'  => 0,
            'sort'  => self::POSITION_DISCOUNT,
        );
        if (!empty(\Helper::configs()['Discount'])) {
            $moduleClass          = '\App\Extensions\Total\Controllers\Discount';
            $returnModuleDiscount = (new $moduleClass)->getData();
            $arrDiscount          = [
                'title' => $returnModuleDiscount['title'],
                'code'  => 'discount',
                'value' => $returnModuleDiscount['value'],
                'text'  => $returnModuleDiscount['value'],
                'sort'  => self::POSITION_DISCOUNT,
            ];
        }

        return $arrDiscount;
    }

    public function getReceived()
    {
        return array(
            'title' => trans('language.total.received'),
            'code'  => 'received',
            'value' => 0,
            'text'  => 0,
            'sort'  => self::POSITION_RECEIVED,
        );
    }

/**
 * Get item order total, then re-sort
 * @param  [int] $order_id [description]
 * @return [array]           [description]
 */
    public static function getTotal($order_id)
    {
        $objects = self::where('order_id', $order_id)->get()->toArray();
        usort($objects, function ($a, $b) {
            return $a['sort'] > $b['sort'];
        });
        return $objects;
    }

/**
 * [updateSubTotal description]
 * @param  [type] $order_id [description]
 * @param  [type] $subtotal_value    [description]
 * @return [type]           [description]
 */
    public static function updateSubTotal($order_id, $subtotal_value)
    {

        try {
            $order           = ShopOrder::find($order_id);
            $order->subtotal = $subtotal_value;
            $total           = $subtotal_value + $order->discount + $order->shipping;
            $balance         = $total + $order->received;
            $payment_status  = 0;
            if ($balance == $total) {
                $payment_status = self::NOT_YET_PAY; //Not pay
            } elseif ($balance < 0) {
                $payment_status = self::NEED_REFUND; //Need refund
            } elseif ($balance == 0) {
                $payment_status = self::PAID; //Paid
            } else {
                $payment_status = self::PART_PAY; //Part pay
            }
            $order->payment_status = $payment_status;
            $order->total          = $total;
            $order->balance        = $balance;
            $order->save();

            //Update total
            $updateTotal        = self::where('order_id', $order_id)->where('code', 'total')->first();
            $updateTotal->value = $total;
            $updateTotal->save();
            //Update Subtotal
            $updateSubTotal        = self::where('order_id', $order_id)->where('code', 'subtotal')->first();
            $updateSubTotal->value = $subtotal_value;
            $updateSubTotal->save();

            return 1;
        } catch (\Exception $e) {
            return $e->getMessage();
        }

    }
/**
 * Insert item order total
 * @param  [type] $data     [description]
 * @param  [type] $order_id [description]
 * @return [type]           [description]
 */
    public static function insertTotal($data, $order_id)
    {
        for ($i = 0; $i < count($data); $i++) {
            $data[$i]['order_id']   = $order_id;
            $data[$i]['created_at'] = date('Y-m-d H:i:s');
        }
        return self::insert($data);
    }

/**
 * [updateField description]
 * @param  [type] $field [description]
 * @return [type]        [description]
 */
    public static function updateField($field)
    {
        //Udate field
        $upField             = self::find($field['id']);
        $upField->value      = $field['value'];
        $upField->text       = $field['text'];
        $upField->updated_at = date('Y-m-d H:i:s');
        $upField->save();
        $order_id = $upField->order_id;

        //Sum value item order total
        $totalData = self::where('order_id', $order_id)->get();
        $total     = $discount     = $shipping     = $received     = 0;
        foreach ($totalData as $key => $value) {
            if ($value['code'] === 'subtotal') {
                $total += $value['value'];
            }
            if ($value['code'] === 'discount') {
                $discount += $value['value'];
                $total += $value['value'];
            }
            if ($value['code'] === 'shipping') {
                $shipping += $value['value'];
                $total += $value['value'];
            }
            if ($value['code'] === 'received') {
                $received += $value['value'];
            }
        }

        //Update total
        $updateTotal        = self::where('order_id', $order_id)->where('code', 'total')->first();
        $updateTotal->value = $total;
        $updateTotal->save();

        //Update Order
        $order           = ShopOrder::find($order_id);
        $order->discount = $discount;
        $order->shipping = $shipping;
        $order->received = $received;
        $order->balance  = $total + $received;
        $order->total    = $total;
        $order->save();

        return $order_id;
    }
}
