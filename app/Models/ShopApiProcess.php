<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ShopApiProcess extends Model
{
    public $table       = 'shop_api_process';
    protected $fillable = ['api_id', 'secret_key', 'hidden_fileds', 'ip_allow', 'ip_deny', 'exp', 'status'];
}
