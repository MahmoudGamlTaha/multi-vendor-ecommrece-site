<?php
#app/Modules/Other/Controllers/LastViewProduct.php
namespace App\Modules\Other\Controllers;

use App\Models\Config;
use App\Models\Layout;
use App\Models\ShopProduct;

class LastViewProduct extends \App\Http\Controllers\GeneralController
{
    protected $configType = 'Modules';
    protected $configCode = 'Other';
    protected $configKey  = 'LastViewProduct';
    protected $namespace  = '';

    public $title;
    const ON  = 1;
    const OFF = 0;
    public function __construct()
    {
        parent::__construct();
        $this->namespace = '\App\\' . $this->configType . '\\' . $this->configCode . '\\Controllers\\' . $this->configKey;
        $this->title     = trans($this->configType . '/' . $this->configCode . '/' . $this->configKey . '.title');
        app('view')->prependNamespace($this->configType,
            base_path('app/' . $this->configType . '/' . $this->configCode . '/Views'));

    }
    public function getData()
    {
        return $this->processData();
    }

    public function processData()
    {
        $arrData = [
            'title' => $this->title,
            'code'  => $this->configKey,
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
                    'value'  => self::ON, //1- Enable extension; 0 - Disable
                    'detail' => $this->configType . '/' . $this->configCode . '/' . $this->configKey . '.title',
                ]
            );
            $this->processDefault();
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
        (new Layout)->where('content', $this->namespace)->delete();
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
        //Process
    }
    public function processConfig($data)
    {
        //Process
    }

//=======================

    public function render()
    {
        if (!empty($this->configs[$this->configKey])) {
            $arrProductsLastView = array();
            $lastView            = empty(\Cookie::get('productsLastView')) ? [] : json_decode(\Cookie::get('productsLastView'), true);
            if ($lastView) {
                arsort($lastView);
            }

            if (count($lastView)) {
                $lastView         = array_slice($lastView, 0, 5, true);
                $productsLastView = ShopProduct::whereIn('id', array_keys($lastView))->get();
                foreach ($lastView as $pId => $time) {
                    foreach ($productsLastView as $key => $product) {
                        if ($product['id'] == $pId) {
                            $product['timelastview'] = $time;
                            $arrProductsLastView[]   = $product;
                        }
                    }
                }
            }
            return view($this->configType . '::' . $this->configKey, ['arrProductsLastView' => $arrProductsLastView]);
        }
    }

    public function processDefault()
    {
        return $process = Layout::insert(
            [
                'name'     => $this->title,
                'position' => 'left',
                'page'     => '',
                'type'     => 'module',
                'content'  => $this->namespace,
                'status'   => self::ON, //1- Enable extension; 0 - Disable
                'sort'     => 0,
            ]
        );

    }

}
