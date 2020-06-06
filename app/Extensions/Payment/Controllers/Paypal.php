<?php
#app\Extensions\Payment\Controllers\Paypal.php
namespace App\Extensions\Payment\Controllers;

use App\Extensions\Payment\Models\Paypal as PaypalModel;
use App\Extensions\Payment\Providers\PayPalService as PayPalSvc;
use App\Http\Controllers\ShopCart;
use App\Models\Config;
use App\Models\ShopOrder;
use App\Models\ShopOrderHistory;
use App\Models\ShopOrderStatus;
use Illuminate\Http\Request;

class Paypal extends \App\Http\Controllers\Controller
{
    protected $configType = 'Extensions';
    protected $configCode = 'Payment';
    protected $configKey  = 'Paypal';
    public $title;
    public $image;
    const ALLOW  = 1;
    const DENIED = 0;
    const ON     = 1;
    const OFF    = 0;
    private $paypalSvc;

    public function __construct()
    {
        $this->title     = trans($this->configType . '/' . $this->configCode . '/' . $this->configKey . '.title');
        $this->image     = 'images/' . $this->configType . '/' . $this->configCode . '/' . $this->configKey . '.png';
        $this->paypalSvc = new PayPalSvc;
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
                    'sort'   => 0, // Sort extensions in group
                    'value'  => self::ON, //1- Enable extension; 0 - Disable
                    'detail' => $this->configType . '/' . $this->configCode . '/' . $this->configKey . '.title',
                ]
            );
            if (!$process) {
                $return = ['error' => 1, 'msg' => 'Error when install'];
            } else {
                $return = (new PaypalModel)->installExtension();
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
        (new PaypalModel)->uninstallExtension();
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
                'group'           => $this->configCode,
                'key'             => $this->configKey,
                'title'           => $this->title,
                'jsonStatusOrder' => json_encode(ShopOrderStatus::mapValue()),
                'data'            => PaypalModel::first(),
            ])->render();
    }

    public function processConfig($data)
    {
        $return  = ['error' => 0, 'msg' => ''];
        $process = PaypalModel::where('id', $data['pk'])->update([$data['name'] => $data['value']]);
        if (!$process) {
            $return = ['error' => 1, 'msg' => 'Error update'];
        }
        return $return;
    }

//===========process===
    /**
     * Send data to Paypal
     * @param  Request $request [description]
     * @return [type]           [description]
     */
    public function index(Request $request)
    {
        $data     = session('data_payment');
        $order_id = $data['order_id'];
        $currency = $data['currency'];
        unset($data['order_id']);
        unset($data['currency']);
        session()->forget('data_payment');
        $transactionDescription = "From website";
        try {
            $paypalCheckoutUrl = $this->paypalSvc
                ->setCurrency($currency)
                ->setReturnUrl(route('returnPaypal', ['order_id' => $order_id]))
                ->setCancelUrl(route('cart'))
                ->setItem($data)
                ->createPayment($transactionDescription);
            if ($paypalCheckoutUrl) {
                return redirect($paypalCheckoutUrl);
            } else {
                $paypalConfigs = PaypalModel::first();
                $msg           = 'Error while process Paypal';
                (new ShopOrder)->updateStatus($order_id, $status = $paypalConfigs['paypal_order_status_faild'], $msg);
                return redirect()->route('cart')->with(["error" => $msg]);
            }
        } catch (\Exception $e) {
            $paypalConfigs = PaypalModel::first();
            $msg           = 'Error while process Paypal';
            (new ShopOrder)->updateStatus($order_id, $status = $paypalConfigs['paypal_order_status_faild'], $msg);
            return redirect()->route('cart')->with(["error" => $msg]);
        }

    }

/**
 * [getReturn description]
 * @param  [type] $order_id [description]
 * @return [type]           [description]
 */
    public function getReturn($order_id)
    {
        if (!empty(session('paypal_payment_id'))) {
            $paymentStatus = $this->paypalSvc->getPaymentStatus();
            // dd($paymentStatus);
            if ($paymentStatus) {
                $paypalConfigs = PaypalModel::first();
                ShopOrder::find($order_id)->update(['transaction' => $paymentStatus->id, 'status' => $paypalConfigs['paypal_order_status_success']]);
                //Add history
                $dataHistory = [
                    'order_id' => $order_id,
                    'content'  => 'Transaction ' . $paymentStatus->id,
                    'user_id'  => auth()->user()->id ?? 0,
                    'add_date' => date('Y-m-d H:i:s'),
                ];
                ShopOrderHistory::insert($dataHistory);
                return (new ShopCart)->completeOrder($order_id);
            } else {
                return redirect()->route('cart')->with(['error' => 'Have an error paypal']);
            }
        } else {
            return redirect()->route('cart')->with(['error' => 'Can\'t get payment id']);
        }

    }

}
