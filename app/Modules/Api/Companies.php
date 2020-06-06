<?php
#app/Modules/Api/Order.php
namespace App\Modules\Api;
use App\Models\Company;
use App\Models\ShopActivity;
use Illuminate\Http\Request;
class Companies extends General
{
    public $limit;
    public $start;
    public $orderBy;
    public $sort;
    public $activity_id;
    public function __construct(Request $request)
    {
        parent::__construct($request);
        $data           = $this->data;
        $this->limit    = empty($data['limit']) ? 10 : $data['limit'];
        $this->start    = empty($data['start']) ? 0 : (int) $data['start'];
        $this->orderBy  = empty($data['orderBy']) ? [] : explode(',', $data['orderBy']);
        $this->sort     = $data['sort'] ?? 'ASC';
        $this->activity_id = empty($data['activity_id']) ? '' : $data['activity_id'];
      
    }
    public function index()
    {
        $this->apiName = 'api_shop_list';
	//print_r($this->apiName);
	//die;
        if ($this->apiName == 'api_shop_list') {
            return $this->list();
        }
        if ($this->apiName == 'api_activity_shop') {
            return $this->detail($this->activity_id);
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
        $query        = new company();//::all();//Activity::with('companies');
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
    public function detail($order_id)
    {
        $query = ShopOrder::with('details')->where('id', $order_id)->first();
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
                'detail' => 'Order not found!',
                'msg'    => 'Not found',
            );
            return json_encode($error);
        }
    }
}
