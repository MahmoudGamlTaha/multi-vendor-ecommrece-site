<?php
#App\Models\ShopShippingStatus.php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ShopShippingStatus extends Model
{
    public $timestamps = false;
    public $table      = 'shop_shipping_status';
    public static function mapValue()
    {
        $new_arr = [];
        foreach (self::pluck('name', 'id')->all() as $key => $value) {
            $new_arr[] = ['value' => $key, 'text' => $value];
        }
        return $new_arr;
    }
}
