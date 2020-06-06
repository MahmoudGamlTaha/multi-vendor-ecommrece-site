<?php
#app/Models/ShopOrderDetail.php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ShopOrderDetail extends Model
{
    protected $table    = 'shop_order_detail';
    protected $fillable = ['product_id', 'price', 'order_id', 'qty', 'total_price', 'sku', 'option'];
    public function order()
    {
        return $this->belongsTo(ShopOrder::class, 'order_id', 'id');
    }

    public function product()
    {
        return $this->belongsTo(ShopProduct::class, 'product_id', 'id');
    }

    public function updateDetail($id, $data)
    {
        return $this->where('id', $id)->update($data);
    }
}
