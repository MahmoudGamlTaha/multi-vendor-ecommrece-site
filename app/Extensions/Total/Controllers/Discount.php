<?php
#app\Extensions\Total\Controllers\Discount.php
namespace App\Extensions\Total\Controllers;

use App\Extensions\Total\Models\Discount as DiscountModel;
use App\Extensions\Total\Providers\DiscountService;
use App\Models\Config;

class Discount extends \App\Http\Controllers\Controller
{
    protected $configKey  = 'Discount';
    protected $configCode = 'Total';
    protected $configType = 'Extensions';
    public $title;
    public $image;
    const ALLOW  = 1;
    const DENIED = 0;
    const ON     = 1;
    const OFF    = 0;
    protected $discountService;
    public function __construct()
    {
        $this->title           = trans('Extensions/' . $this->configCode . '/' . $this->configKey . '.title');
        $this->image           = 'images/Extensions/' . $this->configCode . '/' . $this->configKey . '.png';
        $this->separator       = false;
        $this->suffix          = false;
        $this->prefix          = false;
        $this->length          = 8;
        $this->mask            = '****-****';
        $this->discountService = new DiscountService;

    }

    public function getData()
    {
        return $this->processData();
    }

    public function processData()
    {
        $uID     = auth()->user()->id ?? 0;
        $arrData = [
            'title'      => $this->title,
            'code'       => $this->configKey,
            'image'      => $this->image,
            'permission' => self::ALLOW,
            'value'      => 0,
        ];

        $configs  = \Helper::configs();
        $Discount = session('Discount');
        $check    = json_decode($this->discountService->check($Discount, $uID), true);
        if (!empty($Discount) && !$check['error']) {
            $arrType = [
                '0' => 'Cash',
                '1' => 'Point',
                '2' => '%',
            ];
            $subtotal = \Cart::subtotal();
            $value    = ($check['content']['type'] == '2') ? floor($subtotal * $check['content']['reward'] / 100) : $check['content']['reward'];
            $arrData  = array(
                'title'      => '<b>' . $this->title . ':</b> ' . $Discount . '',
                'code'       => $this->configKey,
                'image'      => $this->image,
                'permission' => self::ALLOW,
                'value'      => ($value > $subtotal) ? -$subtotal : -$value,
            );
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
                    'sort'   => 0,
                    'value'  => self::ON, //Enable extension
                    'detail' => 'Extensions/' . $this->configCode . '/' . $this->configKey . '.title',
                ]
            );
            if (!$process) {
                $return = ['error' => 1, 'msg' => 'Error when install'];
            } else {
                $return = (new DiscountModel)->installExtension();
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
        (new DiscountModel)->uninstallExtension();
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
        return redirect()->route('discountControl.index');
    }
    public function processConfig($data)
    {
        //Process
    }
    public function useDiscount()
    {
        return $this->discountService->useDiscount();
    }
    public function removeDiscount()
    {
        return $this->discountService->removeDiscount();
    }
    public function apply($code, $uID = null, $msg = null)
    {
        return $this->discountService->apply($code, $uID, $msg);
    }
}
