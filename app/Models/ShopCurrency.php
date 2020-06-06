<?php
#app/Models/ShopCurrency.php
/**
 * @author Naruto <lanhktc@gmail.com>
 */
namespace App\Models;

use Cart;
use Illuminate\Database\Eloquent\Model;

class ShopCurrency extends Model
{
    public $table                   = 'shop_currency';
    public $timestamps              = false;
    protected static $code          = '';
    protected static $name          = '';
    protected static $symbol        = '';
    protected static $exchange_rate = 1;
    protected static $precision     = 0;
    protected static $symbol_first  = 0;
    protected static $thousands     = ',';
    protected static $decimal       = '.';

/**
 * [setCode description]
 * @param [type] $code [description]
 */

    public static function setCode($code)
    {
        self::$code    = $code;
        $checkCurrency = self::where('code', $code)->first();
        if ($checkCurrency) {
            self::$name          = $checkCurrency->name;
            self::$symbol        = $checkCurrency->symbol;
            self::$exchange_rate = $checkCurrency->exchange_rate;
            self::$precision     = $checkCurrency->precision;
            self::$symbol_first  = $checkCurrency->symbol_first;
            self::$thousands     = $checkCurrency->thousands;
            self::$decimal       = ($checkCurrency->thousands == '.') ? ',' : '.';
        }
    }

/**
 * [getCurrency description]
 * @return [type] [description]
 */
    public static function getCurrency()
    {
        return [
            'code'          => self::$code,
            'name'          => self::$name,
            'symbol'        => self::$symbol,
            'exchange_rate' => self::$exchange_rate,
            'precision'     => self::$precision,
            'symbol_first'  => self::$symbol_first,
            'thousands'     => self::$thousands,
            'decimal'       => self::$decimal,
        ];
    }

/**
 * [getCode description]
 * @return [type] [description]
 */
    public static function getCode()
    {
        return self::$code;
    }
/**
 * [getRate description]
 * @return [type] [description]
 */
    public static function getRate()
    {
        return self::$exchange_rate;
    }

/**
 * [getValue description]
 * @param  float  $money [description]
 * @param  [type] $rate  [description]
 * @return [type]        [description]
 */
    public static function getValue(float $money, $rate = null)
    {
        if ($rate) {
            return $money * $rate;
        } else {
            return $money * self::$exchange_rate;
        }

    }

/**
 * [format description]
 * @param  float  $money [description]
 * @return [type]        [description]
 */
    public static function format(float $money)
    {
        return number_format($money, self::$precision, self::$decimal, self::$thousands);
    }

/**
 * [render description]
 * @param  float   $money                [description]
 * @param  [type]  $currency             [description]
 * @param  [type]  $rate                 [description]
 * @param  boolean $space_between_symbol [description]
 * @param  boolean $include_symbol       [description]
 * @return [type]                        [description]
 */
    public static function render(float $money, $currency = null, $rate = null, $space_between_symbol = false, $include_symbol = true)
    {
        $space_symbol = ($space_between_symbol) ? ' ' : '';
        $dataCurrency = self::getCurrency();
        if ($currency) {
            $checkCurrency = self::where('code', $currency)->first();
            if ($checkCurrency) {
                $dataCurrency = $checkCurrency;
            }
        }
//Get currently value
        $value = self::getValue($money, $rate);

        $symbol = ($include_symbol) ? $dataCurrency['symbol'] : '';

        if ($dataCurrency['symbol_first']) {
            if ($money < 0) {
                return '-' . $symbol . $space_symbol . self::format(abs($value));
            } else {
                return $symbol . $space_symbol . self::format($value);
            }
        } else {
            return self::format($value) . $space_symbol . $symbol;
        }
    }

/**
 * [onlyRender description]
 * @param  float   $money                [description]
 * @param  [type]  $currency             [description]
 * @param  boolean $space_between_symbol [description]
 * @param  boolean $include_symbol       [description]
 * @return [type]                        [description]
 */
    public static function onlyRender(float $money, $currency, $space_between_symbol = false, $include_symbol = true)
    {
        $checkCurrency = self::where('code', $currency)->first();
        $space_symbol  = ($space_between_symbol) ? ' ' : '';
        $symbol        = ($include_symbol) ? $checkCurrency['symbol'] : '';
        if ($checkCurrency['symbol_first']) {
            if ($money < 0) {
                return '-' . $symbol . $space_symbol . self::format(abs($money));
            } else {
                return $symbol . $space_symbol . self::format($money);
            }

        } else {
            return self::format($money) . $space_symbol . $symbol;
        }
    }
/**
 * [sumCart description]
 * @param  [type]     $details [description]
 * @param  float|null $rate    [description]
 * @return [type]              [description]
 */
    public static function sumCart($details, float $rate = null)
    {
        $sum  = 0;
        $rate = ($rate) ? $rate : self::$exchange_rate;
        foreach ($details as $detail) {
            $sum += $detail->qty * self::getValue($detail->price, $rate);
        }
        return $sum;

    }

    public static function getAll()
    {
        return self::where('status', 1)->sort()->get();
    }
//Scort
    public function scopeSort($query, $column = null)
    {
        $column = $column ?? 'sort';
        return $query->orderBy($column, 'asc')->orderBy('id', 'desc');
    }
}
