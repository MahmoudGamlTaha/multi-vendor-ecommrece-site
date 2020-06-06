<?php
#app/Models/ShopCategoryDescription.php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ShopCategoryDescription extends Model
{
    protected $primaryKey = null;
    public $timestamps    = false;
    public $table         = 'shop_category_description';
    protected $fillable   = ['lang_id', 'name', 'description', 'keyword', 'shop_category_id'];
}
