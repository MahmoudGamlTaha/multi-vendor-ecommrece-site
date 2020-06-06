<?php
#app\Extensions\Shipping\Controllers\ShippingStandard.php
namespace App\Extensions\Shipping\Controllers;

use App\Extensions\Shipping\Models\ShippingStandard as ShippingStandardModel;
use App\Models\Config;

class ShippingStandard extends \App\Http\Controllers\Controller
{
    protected $configType = 'Extensions';
    protected $configCode = 'Shipping';
    protected $configKey  = 'ShippingStandard';

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
        $subtotal = \Cart::subtotal();
        $shipping = ShippingStandardModel::first();
        if ($subtotal >= $shipping->shipping_free) {
            $arrData = [
                'title'      => $this->title,
                'code'       => $this->configKey,
                'image'      => $this->image,
                'permission' => self::ALLOW,
                'value'      => 0,
            ];
        } else {
            $arrData = [
                'title'      => $this->title,
                'code'       => $this->configKey,
                'image'      => $this->image,
                'permission' => self::ALLOW,
                'value'      => $shipping->fee,
            ];

        }
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
                    'sort'   => 0, // Sort extensions in group
                    'value'  => self::ON, //1- Enable extension; 0 - Disable
                    'detail' => $this->configType . '/' . $this->configCode . '/' . $this->configKey . '.title',
                ]
            );
            if (!$process) {
                $return = ['error' => 1, 'msg' => 'Error when install'];
            } else {
                $return = (new ShippingStandardModel)->installExtension();
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
        (new ShippingStandardModel)->uninstallExtension();
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
        return view('admin.' . $this->configType . '.' . $this->configCode . '.' . $this->configKey)->with(
            [
                'group' => $this->configCode,
                'key'   => $this->configKey,
                'title' => $this->title,
                'data'  => ShippingStandardModel::first(),
            ])->render();
    }

    public function processConfig($data)
    {
        $return  = ['error' => 0, 'msg' => ''];
        $process = ShippingStandardModel::where('id', $data['pk'])->update([$data['name'] => $data['value']]);
        if (!$process) {
            $return = ['error' => 1, 'msg' => 'Error update'];
        }
        return $return;
    }

}
