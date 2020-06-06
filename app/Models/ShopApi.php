<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ShopApi extends Model
{
    public $table      = 'shop_api';
    public $timestamps = false;
    public function secrets()
    {
        return $this->hasMany(ShopApiProcess::class, 'api_id', 'id');
    }
}
