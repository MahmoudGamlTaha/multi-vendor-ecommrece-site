<?php
#app/Models/ShopOrder.php
namespace App\Models;

use App\Models\ShopOrderHistory;
use App\Models\ShopProduct;
use Illuminate\Database\Eloquent\Model;

class ShopOrder extends Model
{
    protected $table    = 'shop_order';
    protected $fillable = ['id', 'transaction', 'payment_method', 'status'];
    public function details()
    {
        return $this->hasMany(ShopOrderDetail::class, 'order_id', 'id');
    }
    public function orderTotal()
    {
        return $this->hasMany(ShopOrderTotal::class, 'order_id', 'id');
    }

    public function customer()
    {
        return $this->belongsTo('App\User', 'user_id', 'id');
    }
    public function company(){ //sprint 3
        return $this->belongsTo(Company::class, 'company_id', 'id');
    }
    public function orderStatus()
    {
        return $this->hasOne(ShopOrderStatus::class, 'status', 'id');
    }
    public function paymentStatus()
    {
        return $this->hasOne(ShopPaymentStatus::class, 'payment_status', 'id');
    }
    public function history()
    {
        return $this->hasMany(ShopOrderHistory::class, 'order_id', 'id');
    }
    protected static function boot()
    {
        parent::boot();
        // before delete() method call this
        static::deleting(function ($order) {
            foreach ($order->details as $key => $value) {
                $item = ShopProduct::find($value->product_id);
                if ($item) {
                    $item->stock = $item->stock + $value->qty; // Restore stock
                    $item->sold  = $item->sold - $value->qty; // Subtract sold
                    $item->save();
                }
            }
            $order->details()->delete(); //delete order details
            $order->orderTotal()->delete(); //delete order total
            $order->history()->delete(); //delete history

        });
    }

/**
 * [updateInfo description]
 * Don't apply for fields discount, shiping, received, cause
 * @param  [type] $order_id  [description]
 * @param  [type] $arrFields [description]
 * @return [type]            [description]
 */
    public static function updateInfo($order_id, $arrFields)
    {
        return self::where('id', $order_id)->update($arrFields);
    }

/**
 * Update status order
 * @param  [type]  $id     [description]
 * @param  integer $status [description]
 * @param  string  $msg    [description]
 * @return [type]          [description]
 */
    public function updateStatus($id, $status = 0, $msg = '')
    {
        $uID   = auth()->user()->id ?? 0;
        $order = $this->find($id);
        //Update status
        $order->update(['status' => (int) $status]);

        //Update history
        $history           = new ShopOrderHistory();
        $history->admin_id = 0;
        $history->user_id  = $uID;
        $history->content  = $msg;
        $order->history()->save($history);
    }

//Scort
    public function scopeSort($query)
    {
        return $query->orderBy('id', 'desc');
    }
}
