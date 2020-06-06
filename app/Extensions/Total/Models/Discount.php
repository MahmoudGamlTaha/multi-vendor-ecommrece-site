<?php
#App\Extension\Total\Models\Discount.php
namespace App\Extensions\Total\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class Discount extends Model
{
    public $timestamps    = false;
    public $table         = 'shop_discount';
    public $table_related = 'shop_discount_user';
    protected $fillable   = ['code', 'reward', 'type', 'expires_at', 'number_uses', 'used', 'status', 'login'];
    protected $dates      = ['expires_at'];
    public function __construct(array $attributes = [])
    {
        parent::__construct($attributes);

    }
    public function uninstallExtension()
    {
        if (Schema::hasTable($this->table)) {
            Schema::drop($this->table);
        }
        if (Schema::hasTable($this->table_related)) {
            Schema::drop($this->table_related);
        }
    }

    public function installExtension()
    {
        $return = ['error' => 0, 'msg' => 'Install extension success'];
        if (!Schema::hasTable($this->table)) {
            try {
                Schema::create($this->table, function (Blueprint $table) {
                    $table->increments('id');
                    $table->string('code', 32)->unique();
                    $table->integer('reward')->default(0);
                    $table->tinyInteger('type')->default(0);
                    $table->text('data')->nullable();
                    $table->integer('number_uses')->default(1);
                    $table->integer('used')->default(0);
                    $table->tinyInteger('status')->default(1);
                    $table->integer('login')->default(0);
                    $table->timestamp('expires_at')->nullable();
                });
            } catch (\Exception $e) {
                $return = ['error' => 1, 'msg' => $e->getMessage()];
            }
        } else {
            $return = ['error' => 1, 'msg' => 'Table ' . $this->table . ' exist!'];
        }
        $return2 = ['error' => 0, 'msg' => 'Install extension success'];
        if (!Schema::hasTable($this->table_related)) {
            try {
                Schema::create($this->table_related, function (Blueprint $table) {
                    $table->integer('user_id');
                    $table->integer('discount_id');
                    $table->text('log')->nullable();
                    $table->timestamp('used_at')->nullable();
                });
            } catch (\Exception $e) {
                $return2 = ['error' => 1, 'msg' => $e->getMessage()];
            }
        } else {
            $return2 = ['error' => 1, 'msg' => 'Table ' . $this->table . ' exist!'];
        }
        if ($return) {
            return $return;
        } else {
            return $return2;
        }

    }
    /**
     * Get the users who is related promocode.
     *
     * @return \Illuminate\Database\Eloquent\Relations\BelongsToMany
     */
    public function users()
    {
        return $this->belongsToMany(\App\User::class, $this->table_related)
            ->withPivot('used_at', 'log');
    }

    /**
     * Query builder to find promocode using code.
     *
     * @param $query
     * @param $code
     *
     * @return mixed
     */
    public function scopeByCode($query, $code)
    {
        return $query->where('code', $code);
    }

    /**
     * Query builder to get expired promotion codes.
     *
     * @param $query
     * @return mixed
     */
    public function scopeExpired($query)
    {
        return $query->whereNotNull('expires_at')->whereDate('expires_at', '<=', Carbon::now());
    }

    /**
     * Check if code is expired.
     *
     * @return bool
     */
    public function isExpired()
    {
        return $this->expires_at ? Carbon::now()->gte($this->expires_at) : false;
    }
}
