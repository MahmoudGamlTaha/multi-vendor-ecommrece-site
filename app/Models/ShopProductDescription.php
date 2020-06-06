<?php
#app/Models/ShopProductDescription.php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ShopProductDescription extends Model
{
    protected $primaryKey = null;
    public $timestamps    = false;
    public $table         = 'shop_product_description';
    protected $fillable   = ['lang_id', 'name', 'description', 'keyword', 'content', 'shop_product_id'];
}
