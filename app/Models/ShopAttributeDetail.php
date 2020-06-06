<?php
#app/Models/ShopAttributeDetail.php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ShopAttributeDetail extends Model
{
    public $timestamps = false;
    public $table      = 'shop_attribute_detail';
    protected $guarded = ['*'];
    public function attGroup()
    {
        return $this->belongsTo(ShopAttributeGroup::class, 'attribute_id', 'id');
    }
}
