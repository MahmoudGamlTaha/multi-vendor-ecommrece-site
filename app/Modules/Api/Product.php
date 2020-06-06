<?php
#app/Modules/Api/Product.php
namespace App\Modules\Api;

use App\Models\ShopProduct;
use Illuminate\Http\Request;
class Product extends General
{
    public $limit;
    public $start;
    public $orderBy;
    public $sort;
    public $model;
    public function __construct(Request $request)
    {
        parent::__construct($request);
        $data          = $this->data;
        $this->limit   = empty($data['limit']) ? 10 : $data['limit'];
        $this->start   = empty($data['start']) ? 0 : (int) $data['start'];
        $this->orderBy = empty($data['orderBy']) ? [] : explode(',', $data['orderBy']);
        $this->sort    = $data['sort'] ?? 'ASC';
        $this->model   = empty($data['model']) ? '' : $data['model'];

    }

/**
 * [index description]
 * @return [type] [description]
 */
    public function index()
    {
        $this->apiName = 'api_product_list';
        if ($this->apiName == 'api_product_list') {
            return $this->list();
        }
        if ($this->apiName == 'api_product_detail') {
            return $this->detail($this->model);
        }
    }

/**
 * [index description]
 * @return [type] [description]
 */
    function list() {
        $limit        = $this->limit;
        $start        = $this->start;
        $orderBy      = $this->orderBy;
        $sort         = $this->sort;
        $query        = ShopProduct::with('descriptions', 'images', 'options', 'specialPrice');
        $hiddenFields = empty($this->hiddenFields) ? [] : explode(',', $this->hiddenFields);
//Order by
        if ($orderBy) {
            foreach ($orderBy as $order) {
                $query->orderBy($order, $sort);
            }
        }
//Limit
        $query->offset($start);
        $query->limit($limit);

//Render
        return $query->get()->each(function ($item) use ($hiddenFields) {
            $item->setAppends([]);
            if ($hiddenFields) {
                $item->makeHidden($hiddenFields);
            }
        })->toJson();
    }

/**
 * [detail description]
 * @param  [type] $sku [description]
 * @return [type]      [description]
 */
    public function detail($sku)
    {
        $query = ShopProduct::with('descriptions', 'images', 'options', 'specialPrice')->where('sku', $sku)->first();
        if ($query) {
            $hiddenFields = empty($this->hiddenFields) ? [] : explode(',', $this->hiddenFields);
            $query->setAppends([]);
            if ($hiddenFields) {
                $query->makeHidden($hiddenFields);
            }
            return $query->toJson();
        } else {
            $error = array(
                'error'  => 1,
                'code'   => 404,
                'detail' => 'Product not found!',
                'msg'    => 'Not found',
            );
            return json_encode($error);
        }
    }
}
