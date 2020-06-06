<?php
#App\Models\ShopProductOption.php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ShopProductOption extends Model
{
    public $table       = 'shop_product_option';
    protected $fillable = ['opt_name', 'product_id', 'opt_price', 'opt_sku', 'opt_image'];
    public $timestamps  = false;
    public function product()
    {
        return $this->belongsTo(ShopProduct::class, 'product_id', 'id');
    }

}
