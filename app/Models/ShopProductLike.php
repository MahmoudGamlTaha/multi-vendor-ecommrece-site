<?php
#App\Models\ShopProductLike.php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ShopProductLike extends Model
{
    const UPDATED_AT      = null;
    public $incrementing  = false;
    protected $primaryKey = null;
    public $table         = 'shop_product_like';
}
