<?php
#app\Extensions\Shipping\Controllers\ShippingBasic.php
namespace App\Extensions\Shipping\Controllers;

use App\Models\Config;

class ShippingBasic extends \App\Http\Controllers\Controller
{
    protected $configType = 'Extensions';
    protected $configCode = 'Shipping';
    protected $configKey  = 'ShippingBasic';

    public $title;
    public $image;
    const ALLOW  = 1;
    const DENIED = 0;
    const ON     = 1;
    const OFF    = 0;
    public function __construct()
    {
        $this->title = trans($this->configType . '/' . $this->configCode . '/' . $this->configKey . '.title');
        $this->image = 'images/' . $this->configType . '/' . $this->configCode . '/' . $this->configKey . '.png';
    }

    public function getData()
    {
        return $this->processData();
    }

    public function processData()
    {
        $arrData = [
            'title'      => $this->title,
            'code'       => $this->configKey,
            'image'      => $this->image,
            'permission' => self::ALLOW,
            'value'      => 200,
        ];
        return $arrData;
    }

    public function install()
    {
        $return = ['error' => 0, 'msg' => ''];
        $check  = Config::where('key', $this->configKey)->first();
        if ($check) {
            $return = ['error' => 1, 'msg' => 'Module exist'];
        } else {
            $process = Config::insert(
                [
                    'code'   => $this->configCode,
                    'key'    => $this->configKey,
                    'type'   => $this->configType,
                    'sort'   => 0,
                    'value'  => self::ON, //Enable extension
                    'detail' => $this->configType . '/' . $this->configCode . '/' . $this->configKey . '.title',
                ]
            );
            if (!$process) {
                $return = ['error' => 1, 'msg' => 'Error when install'];
            }
        }

        return $return;
    }

    public function uninstall()
    {
        $return  = ['error' => 0, 'msg' => ''];
        $process = (new Config)->where('key', $this->configKey)->delete();
        if (!$process) {
            $return = ['error' => 1, 'msg' => 'Error when uninstall'];
        }
        return $return;
    }
    public function enable()
    {
        $return  = ['error' => 0, 'msg' => ''];
        $process = (new Config)->where('key', $this->configKey)->update(['value' => self::ON]);
        if (!$process) {
            $return = ['error' => 1, 'msg' => 'Error enable'];
        }
        return $return;
    }
    public function disable()
    {
        $return  = ['error' => 0, 'msg' => ''];
        $process = (new Config)->where('key', $this->configKey)->update(['value' => self::OFF]);
        if (!$process) {
            $return = ['error' => 1, 'msg' => 'Error disable'];
        }
        return $return;
    }
    public function config()
    {
        //
    }
    public function processConfig($data)
    {
//
    }
}
