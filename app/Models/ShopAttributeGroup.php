<?php
#app/Models/ShopAttributeGroup.php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ShopAttributeGroup extends Model
{
    public $timestamps = false;
    public $table      = 'shop_attribute_group';
    public function attDetails()
    {
        return $this->hasMany(ShopAttributeDetail::class, 'attribute_id', 'id');
    }

    protected static function boot()
    {
        parent::boot();
        static::deleting(function ($group) {
            $group->attDetails()->delete();
        });
    }

}
