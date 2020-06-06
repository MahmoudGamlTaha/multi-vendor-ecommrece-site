<?php
#app/Http/Controller/ShopFront.php
namespace App\Http\Controllers;

use App\Models\ShopAttributeGroup;
use App\Models\ShopBrand;
use App\Models\ShopCategory;
use App\Models\ShopOrder;
use App\Models\ShopOrderStatus;
use App\Models\ShopPage;
use App\Models\ShopProduct;
use App\Models\ShopVendor;
use App\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class ShopFront extends GeneralController
{
    public function __construct()
    {
        parent::__construct();
    }
/**
 * [index description]
 * @return [type] [description]
 */
    public function index(Request $request)
    {
        return view($this->theme . '.shop_home',
            array(
                'title'        => $this->configsGlobal['title'],
                'description'  => $this->configsGlobal['description'],
                'keyword'      => $this->configsGlobal['keyword'],
                'products_new' => (new ShopProduct)->getProducts($type = null, $limit = $this->configs['product_new'], $opt = null),
                'products_hot' => (new ShopProduct)->getProducts($type = 1, $limit = $this->configs['product_hot'], $opt = 'random'),
                'categories'   => (new ShopCategory)->getCategoriesAll(),
                'layout_page'  => 'home',

            )
        );
    }

/**
 * [getCategories description]
 * @param  Request $request [description]
 * @return [type]           [description]
 */
    public function getCategories(Request $request)
    {
        $sortBy      = null;
        $sortOrder   = 'asc';
        $filter_sort = request('filter_sort') ?? '';
        $filterArr   = [
            'sort_desc' => ['sort', 'desc'],
            'sort_asc'  => ['sort', 'asc'],
            'id_desc'   => ['id', 'desc'],
            'id_asc'    => ['id', 'asc'],
        ];
        if (array_key_exists($filter_sort, $filterArr)) {
            $sortBy    = $filterArr[$filter_sort][0];
            $sortOrder = $filterArr[$filter_sort][1];
        }

        $itemsList = (new ShopCategory)->getCategories($parent = 0, $limit = $this->configs['item_list'], $opt = 'paginate', $sortBy, $sortOrder);
        return view($this->theme . '.shop_item_list',
            array(
                'title'       => trans('language.categories'),
                'itemsList'   => $itemsList,
                'keyword'     => '',
                'description' => '',
                'layout_page' => 'item_list',
                'filter_sort' => $filter_sort,
            ));
    }

/**
 * [productToCategory description]
 * @param  [type] $key [description]
 * @return [type]      [description]
 */
    public function productToCategory($name, $id)
    {
        $sortBy      = null;
        $sortOrder   = 'asc';
        $filter_sort = request('filter_sort') ?? '';
        $filterArr   = [
            'price_desc' => ['price', 'desc'],
            'price_asc'  => ['price', 'asc'],
            'sort_desc'  => ['sort', 'desc'],
            'sort_asc'   => ['sort', 'asc'],
            'id_desc'    => ['id', 'desc'],
            'id_asc'     => ['id', 'asc'],
        ];
        if (array_key_exists($filter_sort, $filterArr)) {
            $sortBy    = $filterArr[$filter_sort][0];
            $sortOrder = $filterArr[$filter_sort][1];
        }

        $category = (new ShopCategory)->find($id);
        if ($category) {
            $products  = $category->getProductsToCategory($id = $category->id, $limit = $this->configs['product_list'], $opt = 'paginate', $sortBy, $sortOrder);
            $itemsList = (new ShopCategory)->getCategories($parent = $id);
            return view($this->theme . '.shop_products_list',
                array(
                    'title'       => $category->name,
                    'description' => $category->description,
                    'keyword'     => $this->configsGlobal['keyword'],
                    'products'    => $products,
                    'itemsList'   => $itemsList,
                    'layout_page' => 'product_list',
                    'og_image'    => url($category->getImage()),
                    'filter_sort' => $filter_sort,
                )
            );
        } else {
            return $this->itemNotFound();
        }

    }

/**
 * All products
 * @param  [type] $key [description]
 * @return [type]      [description]
 */
    public function allProducts()
    {
        $sortBy      = null;
        $sortOrder   = 'asc';
        $filter_sort = request('filter_sort') ?? '';
        $filterArr   = [
            'price_desc' => ['price', 'desc'],
            'price_asc'  => ['price', 'asc'],
            'sort_desc'  => ['sort', 'desc'],
            'sort_asc'   => ['sort', 'asc'],
            'id_desc'    => ['id', 'desc'],
            'id_asc'     => ['id', 'asc'],
        ];
        if (array_key_exists($filter_sort, $filterArr)) {
            $sortBy    = $filterArr[$filter_sort][0];
            $sortOrder = $filterArr[$filter_sort][1];
        }
//print_r($this->theme);
//die;
        $products = (new ShopProduct)->getProducts($type = null, $limit = $this->configs['product_list'], $opt = 'paginate', $sortBy, $sortOrder);
        return view($this->theme . '.shop_products_list',
            array(
                'title'       => trans('language.all_product'),
                'description' => $this->configsGlobal['description'],
                'keyword'     => $this->configsGlobal['keyword'],
                'products'    => $products,
                'layout_page' => 'product_list',
                'filter_sort' => $filter_sort,
            )
        );
    }

/**
 * [productDetail description]
 * @param  [type] $name [description]
 * @param  [type] $id   [description]
 * @return [type]       [description]
 */
    public function productDetail($name, $id)
    {
        $product = ShopProduct::find($id);
        if ($product && $product->status && ($this->configs['product_display_out_of_stock'] || $product->stock > 0)) {
            //Update last view
            $product->view += 1;
            $product->date_lastview = date('Y-m-d H:i:s');
            $product->save();
            //End last viewed

            //Product last view
            if (!empty($this->configs['LastViewProduct'])) {
                $arrlastView      = empty(\Cookie::get('productsLastView')) ? array() : json_decode(\Cookie::get('productsLastView'), true);
                $arrlastView[$id] = date('Y-m-d H:i:s');
                arsort($arrlastView);
                \Cookie::queue('productsLastView', json_encode($arrlastView), (86400 * 30));
            }
            //End product last view

            $sortBy    = request('sortBy') ?? null;
            $sortOrder = request('sortOrder') ?? 'asc';

            //Check product available
            return view($this->theme . '.shop_product_detail',
                array(
                    'title'              => $product->name,
                    'description'        => $product->description,
                    'keyword'            => $this->configsGlobal['keyword'],
                    'product'            => $product,
                    'attributesGroup'    => ShopAttributeGroup::all()->keyBy('id'),
                    'productsToCategory' => (new ShopCategory)->getProductsToCategory($id = $product->category_id, $limit = $this->configs['product_relation'], $opt = 'random', $sortBy, $sortOrder),
                    'og_image'           => url($product->getImage()),
                    'layout_page'        => 'product_detail',
                )
            );
        } else {
            return $this->itemNotFound();
        }

    }
/**
 * [brands description]
 * @param  Request $request [description]
 * @return [type]           [description]
 */
    public function getBrands(Request $request)
    {
        $sortBy      = null;
        $sortOrder   = 'asc';
        $filter_sort = request('filter_sort') ?? '';
        $filterArr   = [
            'name_desc' => ['name', 'desc'],
            'name_asc'  => ['name', 'asc'],
            'sort_desc' => ['sort', 'desc'],
            'sort_asc'  => ['sort', 'asc'],
            'id_desc'   => ['id', 'desc'],
            'id_asc'    => ['id', 'asc'],
        ];
        if (array_key_exists($filter_sort, $filterArr)) {
            $sortBy    = $filterArr[$filter_sort][0];
            $sortOrder = $filterArr[$filter_sort][1];
        }

        $itemsList = (new ShopBrand)->getBrands($limit = $this->configs['item_list'], $opt = 'paginate', $sortBy, $sortOrder);
        return view($this->theme . '.shop_item_list',
            array(
                'title'       => trans('language.brands'),
                'itemsList'   => $itemsList,
                'keyword'     => '',
                'description' => '',
                'layout_page' => 'item_list',
                'filter_sort' => $filter_sort,
            ));
    }

/**
 * [productToBrand description]
 * @param  [type] $name [description]
 * @param  [type] $id   [description]
 * @return [type]       [description]
 */
    public function productToBrand($name, $id)
    {
        $sortBy      = null;
        $sortOrder   = 'asc';
        $filter_sort = request('filter_sort') ?? '';
        $filterArr   = [
            'price_desc' => ['price', 'desc'],
            'price_asc'  => ['price', 'asc'],
            'sort_desc'  => ['sort', 'desc'],
            'sort_asc'   => ['sort', 'asc'],
            'id_desc'    => ['id', 'desc'],
            'id_asc'     => ['id', 'asc'],
        ];
        if (array_key_exists($filter_sort, $filterArr)) {
            $sortBy    = $filterArr[$filter_sort][0];
            $sortOrder = $filterArr[$filter_sort][1];
        }

        $brand = ShopBrand::find($id);
        return view($this->theme . '.shop_products_list',
            array(
                'title'       => $brand->name,
                'description' => '',
                'keyword'     => '',
                'layout_page' => 'product_list',
                'products'    => $brand->getProductsToBrand($id, $limit = $this->configs['product_list'], $opt = 'paginate', $sortBy, $sortOrder),
                'filter_sort' => $filter_sort,
            )
        );
    }

/**
 * [vendors description]
 * @param  Request $request [description]
 * @return [type]           [description]
 */
    public function getVendors(Request $request)
    {
        $sortBy      = null;
        $sortOrder   = 'asc';
        $filter_sort = request('filter_sort') ?? '';
        $filterArr   = [
            'name_desc' => ['name', 'desc'],
            'name_asc'  => ['name', 'asc'],
            'sort_desc' => ['sort', 'desc'],
            'sort_asc'  => ['sort', 'asc'],
            'id_desc'   => ['id', 'desc'],
            'id_asc'    => ['id', 'asc'],
        ];
        if (array_key_exists($filter_sort, $filterArr)) {
            $sortBy    = $filterArr[$filter_sort][0];
            $sortOrder = $filterArr[$filter_sort][1];
        }

        $itemsList = (new ShopVendor)->getVendors($limit = $this->configs['item_list'], $opt = 'paginate', $sortBy, $sortOrder);

        return view($this->theme . '.shop_item_list',
            array(
                'title'       => trans('language.vendors'),
                'itemsList'   => $itemsList,
                'keyword'     => '',
                'description' => '',
                'layout_page' => 'item_list',
                'filter_sort' => $filter_sort,
            ));
    }

/**
 * [productToVendor description]
 * @param  [type] $name [description]
 * @param  [type] $id   [description]
 * @return [type]       [description]
 */
    public function productToVendor($name, $id)
    {
        $sortBy      = null;
        $sortOrder   = 'asc';
        $filter_sort = request('filter_sort') ?? '';
        $filterArr   = [
            'price_desc' => ['price', 'desc'],
            'price_asc'  => ['price', 'asc'],
            'sort_desc'  => ['sort', 'desc'],
            'sort_asc'   => ['sort', 'asc'],
            'id_desc'    => ['id', 'desc'],
            'id_asc'     => ['id', 'asc'],
        ];
        if (array_key_exists($filter_sort, $filterArr)) {
            $sortBy    = $filterArr[$filter_sort][0];
            $sortOrder = $filterArr[$filter_sort][1];
        }

        $vendor = ShopVendor::find($id);
        return view($this->theme . '.shop_products_list',
            array(
                'title'       => $vendor->name,
                'description' => '',
                'keyword'     => '',
                'layout_page' => 'product_list',
                'products'    => $vendor->getProductsToVendor($id, $limit = $this->configs['product_list'], $opt = 'paginate', $sortBy, $sortOrder),
                'filter_sort' => $filter_sort,
            )
        );
    }

    /**
     * [profile description]
     * @return [type] [description]
     */
    public function profile()
    {
        $user        = Auth::user();
        $id          = $user->id;
        $orders      = ShopOrder::with('orderTotal')->where('user_id', $id)->sort()->get();
        $statusOrder = ShopOrderStatus::pluck('name', 'id')->all();
        return view($this->theme . '.shop_profile')->with(array(
            'title'       => trans('language.my_profile'),
            'user'        => $user,
            'orders'      => $orders,
            'statusOrder' => $statusOrder,
            'layout_page' => 'shop_profile',
        ));
    }

/**
 * [search description]
 * @param  Request $request [description]
 * @return [type]           [description]
 */
    public function search(Request $request)
    {
        $sortBy      = null;
        $sortOrder   = 'asc';
        $filter_sort = request('filter_sort') ?? '';
        $filterArr   = [
            'price_desc' => ['price', 'desc'],
            'price_asc'  => ['price', 'asc'],
            'sort_desc'  => ['sort', 'desc'],
            'sort_asc'   => ['sort', 'asc'],
            'id_desc'    => ['id', 'desc'],
            'id_asc'     => ['id', 'asc'],
        ];
        if (array_key_exists($filter_sort, $filterArr)) {
            $sortBy    = $filterArr[$filter_sort][0];
            $sortOrder = $filterArr[$filter_sort][1];
        }
        $keyword = request('keyword') ?? '';
        return view($this->theme . '.shop_products_list',
            array(
                'title'       => trans('language.search') . ': ' . $keyword,
                'products'    => (new ShopProduct)->getSearch($keyword, $limit = $this->configs['product_list'], $sortBy, $sortOrder),
                'layout_page' => 'product_list',
                'filter_sort' => $filter_sort,
            ));
    }

/**
 * [getContact description]
 * @return [type] [description]
 */
    public function getContact()
    {
        $page = $this->getPage('contact');
        return view($this->theme . '.shop_contact',
            array(
                'title'       => trans('language.contact'),
                'description' => '',
                'page'        => $page,
                'keyword'     => $this->configsGlobal['keyword'],
                'og_image'    => $this->logo,
            )
        );
    }

/**
 * [postContact description]
 * @param  Request $request [description]
 * @return [type]           [description]
 */
    public function postContact(Request $request)
    {
        $validator = $request->validate([
            'name'    => 'required',
            'title'   => 'required',
            'content' => 'required',
            'email'   => 'required|email',
            'phone'   => 'required|regex:/^0[^0][0-9\-]{7,13}$/',
        ], [
            'name.required'    => trans('validation.required'),
            'content.required' => trans('validation.required'),
            'title.required'   => trans('validation.required'),
            'email.required'   => trans('validation.required'),
            'email.email'      => trans('validation.email'),
            'phone.required'   => trans('validation.required'),
            'phone.regex'      => trans('validation.phone'),
        ]);
        //Send email
        try {
            $data            = $request->all();
            $data['content'] = str_replace("\n", "<br>", $data['content']);
            Mail::send('vendor.mail.contact', $data, function ($message) use ($data) {
                $message->to($this->configsGlobal['email'], $this->configsGlobal['title']);
                $message->replyTo($data['email'], $data['name']);
                $message->subject($data['title']);
            });
            return redirect()->route('contact')->with('message', trans('language.thank_contact'));

        } catch (\Exception $e) {
            echo $e->getMessage();
        } //

    }

/**
 * [pages description]
 * @param  [type] $key [description]
 * @return [type]      [description]
 */
    public function pages($key = null)
    {
        $page = $this->getPage($key);
        if ($page) {
            return view($this->theme . '.shop_page',
                array(
                    'title'       => $page->title,
                    'description' => '',
                    'keyword'     => $this->configsGlobal['keyword'],
                    'page'        => $page,
                ));
        } else {
            return $this->pageNotFound();
        }
    }

/**
 * [getPage description]
 * @param  [type] $key [description]
 * @return [type]      [description]
 */
    public function getPage($key = null)
    {
        return ShopPage::where('uniquekey', $key)->where('status', 1)->first();
    }

}
