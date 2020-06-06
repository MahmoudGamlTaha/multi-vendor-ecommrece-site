<?php
#App\Extension\Payment\Models\Paypal.php
namespace App\Extensions\Payment\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class Paypal extends Model
{
    public $timestamps = false;
    public $table      = 'paypal';
    public function uninstallExtension()
    {
        if (Schema::hasTable($this->table)) {
            Schema::drop($this->table);
        }

    }

    public function installExtension()
    {
        $return = ['error' => 0, 'msg' => 'Install extension success'];
        if (!Schema::hasTable($this->table)) {
            try {
                Schema::create($this->table, function (Blueprint $table) {
                    $table->increments('id');
                    $table->string('paypal_client_id')->nullable();
                    $table->string('paypal_secrect')->nullable();
                    $table->integer('paypal_log');
                    $table->string('paypal_path_log')->nullable();
                    $table->string('paypal_mode');
                    $table->string('paypal_logLevel');
                    $table->string('paypal_currency');
                    $table->integer('paypal_order_status_success');
                    $table->integer('paypal_order_status_faild');
                });
                $this->insert(
                    [
                        'paypal_client_id'            => '',
                        'paypal_secrect'              => '',
                        'paypal_log'                  => 0,
                        'paypal_path_log'             => 'logs/paypal.log',
                        'paypal_currency'             => 'USD',
                        'paypal_order_status_success' => 1,
                        'paypal_order_status_faild'   => 5,
                        'paypal_mode'                 => 'sandbox',
                        'paypal_logLevel'             => 'DEBUG', //DEBUG-  sanbox, INFO,ERROR,WARNING - live
                    ]
                );
            } catch (\Exception $e) {
                $return = ['error' => 1, 'msg' => $e->getMessage()];
            }
        } else {
            $return = ['error' => 1, 'msg' => 'Table ' . $this->table . ' exist!'];
        }
        return $return;
    }
    public function checkTableExist()
    {
        return Schema::hasTable($this->table);
    }
}
