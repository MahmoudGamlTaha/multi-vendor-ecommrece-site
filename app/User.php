<?php

namespace App;

use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;

class User extends Authenticatable
{
    use Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $table    = 'shop_users';
    protected $fillable = [
        'name', 'email', 'password', 'address1', 'address2', 'phone',
    ];
    protected $appends = [
        'order_total',
        'order_amount',
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];

    public function orders()
    {
        return $this->hasMany('App\Models\ShopOrder', 'user_id', 'id');
    }

    public function ordersAmount()
    {
        $amount = 0;
        foreach ($this->orders as $order) {
            $amount += $order->total;
        }
        return $amount;
    }

    public function likes()
    {
        return $this->hasMany('App\Models\ShopProductLike', 'users_id', 'id');
    }

    public function getOrderTotalAttribute()
    {
        return $this->orders->count();
    }
    public function getOrderAmountAttribute()
    {
        return $this->ordersAmount();
    }
    
}
