<?php
#App\Extension\Total\Providers\PayPalService.php
namespace App\Extensions\Total\Providers;

use App\Extensions\Total\Models\Discount as DiscountModel;
use App\Models\Config;
use App\Models\ShopOrderTotal;
use Carbon\Carbon;

class DiscountService
{
    private $codes = [];
    private $length;
    private $separator;
    private $suffix;
    private $prefix;
    private $mask;
    public function __construct()
    {

        $this->separator = false;
        $this->suffix    = false;
        $this->prefix    = false;
        $this->length    = 8;
        $this->mask      = '****-****';

    }

    public function output($amount = 1)
    {
        $collection = [];

        for ($i = 1; $i <= $amount; $i++) {
            $random = $this->generate();

            while (!$this->validate($collection, $random)) {
                $random = $this->generate();
            }

            array_push($collection, $random);
        }

        return $collection;
    }

    /**
     * Save promocodes into database
     * Successful insert returns generated promocodes
     * Fail will return empty collection.
     *
     * @param int $amount
     * @param null $reward
     * @param array $data
     * @param int|null $expires_in
     *
     * @return \Illuminate\Support\Collection
     */
    public function create($amount = 1, $reward = 0, $number_uses = 1, $type = null, array $data = [], $expires_in = null)
    {
        $records = [];

        foreach ($this->output($amount) as $code) {
            $records[] = [
                'code'        => $code,
                'reward'      => $reward,
                'data'        => json_encode($data),
                'expires_at'  => $expires_in ? Carbon::now()->addDays($expires_in) : null,
                'number_uses' => $number_uses,
                'type'        => $type,
                'status'      => 1,
            ];
        }

        if (DiscountModel::insert($records)) {
            return collect($records)->map(function ($record) {
                $record['data'] = json_decode($record['data'], true);
                return $record;
            });
        }

        return collect([]);
    }

/**
 * [check description]
 * @param  [type]  $code       [description]
 * @param  [type]  $uID        [description]
 * @return [type]              [description]
 */
    public function check($code, $uID = null)
    {
        $uID       = (int) $uID;
        $promocode = DiscountModel::byCode($code)->first();
        if ($promocode === null) {
            return json_encode(['error' => 1, 'msg' => "error_code_not_exist"]);
        }
        //Check user  login
        if ($promocode->login && !$uID) {
            return json_encode(['error' => 1, 'msg' => "error_login"]);
        }

        if ($promocode->number_uses == 0 || $promocode->number_uses <= $promocode->used) {
            return json_encode(['error' => 1, 'msg' => "error_code_cant_use"]);
        }

        if ($promocode->status == 0 || $promocode->isExpired()) {
            return json_encode(['error' => 1, 'msg' => "error_code_expired_disabled"]);
        }
        if ($promocode->login) {
            //check if this user has already used this code already
            $arrUsers = [];
            foreach ($promocode->users as $value) {
                $arrUsers[] = $value->pivot->user_id;
            }
            if (in_array($uID, $arrUsers)) {
                return json_encode(['error' => 1, 'msg' => "error_user_used"]);
            }
        }

        return json_encode(['error' => 0, 'content' => $promocode]);
    }

/**
 * [apply description]
 * @param  [type] $code [description]
 * @param  [type] $uID  [description]
 * @param  [type] $msg  [description]
 * @return [type]       [description]
 */
    public function apply($code, $uID = null, $msg = null)
    {
        //check code valid
        $check = json_decode($this->check($code, $uID), true);

        if ($check['error'] === 0) {
            $promocode = DiscountModel::byCode($code)->first();
            try {
                $promocode->users()->attach($uID, [
                    'used_at' => Carbon::now(),
                    'log'     => $msg,
                ]);
                // increment used
                $promocode->used += 1;
                $promocode->save();
                return json_encode(['error' => 0, 'content' => $promocode->load('users')]);
            } catch (\Exception $e) {
                return json_encode(['error' => 1, 'msg' => $e->getMessage()]);
            }
        } else {
            return $this->check($code, $uID);
        }

    }

/**
 * [redeem description]
 * @param  [type]  $code             [description]
 * @param  [type]  $uID              [description]
 * @param  [type]  $msg              [description]
 * @return [type]                    [description]
 */
    public function redeem($code, $uID = null, $msg = null)
    {
        return $this->apply($code, $uID, $msg);
    }

/**
 * [disable description]
 * @param  [type] $code [description]
 * @return [type]       [description]
 */
    public function disableDiscount($code)
    {
        $promocode = DiscountModel::byCode($code)->first();

        if ($promocode === null) {
            return json_encode(['error' => 1, 'msg' => "error_code_not_exist"]);
        }
        $promocode->status = 0;
        $promocode->save();
        return json_encode(['error' => 0, 'content' => $promocode->save()]);
    }

/**
 * [enable description]
 * @param  [type] $code [description]
 * @return [type]       [description]
 */
    public function enableDiscount($code)
    {
        $promocode = DiscountModel::byCode($code)->first();

        if ($promocode === null) {
            return json_encode(['error' => 1, 'msg' => "error_code_not_exist"]);
        }
        $promocode->status = 1;
        $promocode->save();
        return json_encode(['error' => 0, 'content' => $promocode->save()]);
    }

    /**
     * Here will be generated single code using your parameters from config.
     *
     * @return string
     */
    public function generate()
    {
        $characters = '23456789ABCDEFGHJKLMNPQRSTUVWXYZ';
        $promocode  = '';
        $random     = [];

        for ($i = 1; $i <= $this->length; $i++) {
            $character = $characters[rand(0, strlen($characters) - 1)];
            $random[]  = $character;
        }

        shuffle($random);
        $length = count($random);

        $promocode .= $this->getPrefix();

        for ($i = 0; $i < $length; $i++) {
            $this->mask = preg_replace('/\*/', $random[$i], $this->mask, 1);
        }

        $promocode .= $this->mask;
        $promocode .= $this->getSuffix();

        return $promocode;
    }

    /**
     * Generate prefix with separator for promocode.
     *
     * @return string
     */
    public function getPrefix()
    {

        return (bool) $this->prefix ? $this->prefix . $this->separator : '';
    }

    /**
     * Generate suffix with separator for promocode.
     *
     * @return string
     */
    public function getSuffix()
    {
        return (bool) $this->suffix ? $this->separator . $this->suffix : '';
    }

    /**
     * Your code will be validated to be unique for one request.
     *
     * @param $collection
     * @param $new
     *
     * @return bool
     */
    public function validate($collection, $new)
    {
        $this->codes = DiscountModel::pluck('code')->toArray();
        return !in_array($new, array_merge($collection, $this->codes));
    }

/**
 * [useDiscount description]
 * @return [type]           [description]
 */
    public function useDiscount()
    {
        $html  = '';
        $code  = request('code');
        $uID   = request('uID');
        $check = json_decode($this->check($code, $uID), true);
        if ($check['error'] == 1) {
            $error = 1;
            if ($check['msg'] == 'error_code_not_exist') {
                $msg = trans('language.promotion.process.invalid');
            } elseif ($check['msg'] == 'error_code_cant_use') {
                $msg = trans('language.promotion.process.over');
            } elseif ($check['msg'] == 'error_code_expired_disabled') {
                $msg = trans('language.promotion.process.expire');
            } elseif ($check['msg'] == 'error_user_used') {
                $msg = trans('language.promotion.process.used');
            } elseif ($check['msg'] == 'error_uID_input') {
                $msg = trans('language.promotion.process.user_id_invalid');
            } elseif ($check['msg'] == 'error_login') {
                $msg = trans('language.promotion.process.must_login');
            } else {
                $msg = trans('language.promotion.process.undefined');
            }
        } else {
            $content = $check['content'];
            if ($content['type'] === 1) {
                //Point use in my page
                $error = 1;
                $msg   = trans('language.promotion.process.not_allow');
            } else {
                $arrType = [
                    '0' => trans('language.promotion.cash'),
                    '1' => trans('language.promotion.point'),
                    '2' => trans('language.promotion.%'),
                ];
                $error = 0;
                $msg   = trans('language.promotion.process.completed');
                session(['Discount' => $code]);

                $objects   = array();
                $objects[] = (new ShopOrderTotal)->getShipping();
                $objects[] = (new ShopOrderTotal)->getDiscount();
                $objects[] = (new ShopOrderTotal)->getReceived();
                $dataTotal = ShopOrderTotal::processDataTotal($objects);
                foreach ($dataTotal as $key => $element) {
                    if ($element['value'] != 0) {
                        if ($element['code'] == 'total') {
                            $html .= "<tr class='showTotal'  style='background:#f5f3f3;font-weight: bold;'>";
                        } else {
                            $html .= "<tr class='showTotal'>";
                        }
                        $html .= "<th>" . $element['title'] . "</th>
                        <td style='text-align: right' id='" . $element['code'] . "'>" . $element['text'] . "</td>
                    </tr>";
                    }

                }
            }

        }
        return json_encode(['error' => $error, 'msg' => $msg, 'html' => $html]);

    }

    public function removeDiscount()
    {
        $html = '';
        session()->forget('Discount'); //destroy coupon
        $objects   = array();
        $objects[] = (new ShopOrderTotal)->getShipping();
        $objects[] = (new ShopOrderTotal)->getDiscount();
        $objects[] = (new ShopOrderTotal)->getReceived();
        $dataTotal = ShopOrderTotal::processDataTotal($objects);
        foreach ($dataTotal as $key => $element) {
            if ($element['value'] != 0) {
                $html .= "<tr class='showTotal'>
                         <th>" . $element['title'] . "</th>
                        <td style='text-align: right' id='" . $element['code'] . "'>" . $element['text'] . "</td>
                    </tr>";
            }
        }
        return json_encode(['html' => $html]);
    }
}
