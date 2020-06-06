<?php
namespace App\Scart;

use App\Models\Config;
use App\Models\ConfigGlobal;
use App\Models\ShopCurrency;

class Helper
{
    public static function strToUrl($str)
    {
        $unicode = array(
            'a' => 'á|à|ả|ã|ạ|ă|ắ|ặ|ằ|ẳ|ẵ|â|ấ|ầ|ẩ|ẫ|ậ',
            'd' => 'đ',
            'e' => 'é|è|ẻ|ẽ|ẹ|ê|ế|ề|ể|ễ|ệ',
            'i' => 'í|ì|ỉ|ĩ|ị',
            'o' => 'ó|ò|ỏ|õ|ọ|ô|ố|ồ|ổ|ỗ|ộ|ơ|ớ|ờ|ở|ỡ|ợ',
            'u' => 'ú|ù|ủ|ũ|ụ|ư|ứ|ừ|ử|ữ|ự',
            'y' => 'ý|ỳ|ỷ|ỹ|ỵ',
            'A' => 'Á|À|Ả|Ã|Ạ|Ă|Ắ|Ặ|Ằ|Ẳ|Ẵ|Â|Ấ|Ầ|Ẩ|Ẫ|Ậ',
            'D' => 'Đ',
            'E' => 'É|È|Ẻ|Ẽ|Ẹ|Ê|Ế|Ề|Ể|Ễ|Ệ',
            'I' => 'Í|Ì|Ỉ|Ĩ|Ị',
            'O' => 'Ó|Ò|Ỏ|Õ|Ọ|Ô|Ố|Ồ|Ổ|Ỗ|Ộ|Ơ|Ớ|Ờ|Ở|Ỡ|Ợ',
            'U' => 'Ú|Ù|Ủ|Ũ|Ụ|Ư|Ứ|Ừ|Ử|Ữ|Ự',
            'Y' => 'Ý|Ỳ|Ỷ|Ỹ|Ỵ',
        );

        foreach ($unicode as $nonUnicode => $uni) {
            $str = preg_replace("/($uni)/i", $nonUnicode, $str);
        }
        return strtolower(preg_replace(
            array('/[^a-zA-Z0-9\s-]/', '/[\s-]+|[-\s]+|[--]+/', '/^[-\s_]|[-_\s]$/'),
            array('', '-', ''),
            strtolower($str)));
    }

    //Currency
    public static function currencyRender(float $money, $currency = null, $rate = null, $space_between_symbol = false, $useSymbol = true)
    {
        return ShopCurrency::render($money, $currency, $rate, $space_between_symbol, $useSymbol);
    }

    public static function currencyOnlyRender(float $money, $currency, $space_between_symbol = false, $include_symbol = true)
    {
        return ShopCurrency::onlyRender($money, $currency, $space_between_symbol, $include_symbol);
    }
    public static function currencySumCart($details, float $rate = null)
    {
        return ShopCurrency::sumCart($details, $rate);
    }
    public static function currencyValue(float $money, $rate = null)
    {
        return ShopCurrency::getValue($money, $rate);
    }
    public static function currencyCode()
    {
        return ShopCurrency::getCode();
    }
    public static function currencyRate()
    {
        return ShopCurrency::getRate();
    }
    public static function currencyFormat(float $money)
    {
        return ShopCurrency::format($money);
    }
    public static function getCurrency()
    {
        return ShopCurrency::getCurrency();
    }
    //End currency

    //Value config
    public static function configs()
    {
        return Config::pluck('value', 'key')->all();
    }
    public static function configsGlobal()
    {
        return ConfigGlobal::first();
    }
    //End config

    //Extensions
    public static function getExtensionsGroup($group, $onlyActive = true)
    {
        return Config::getExtensionsGroup($group, $onlyActive);
    }
    //End Extensions

    public static function processImageThumb($pathRoot, $pathFile, $widthThumb = 250, $heightThumb = null, $statusWatermark = false, $fileWatermark = '')
    {
        if (!file_exists($pathRoot . '/thumb/' . $pathFile)) {
            //Insert watermark
            if ($statusWatermark) {
                \Image::make($pathRoot . '/' . $pathFile)
                    ->insert($fileWatermark, 'bottom-right', 10, 10)
                    ->save($pathRoot . '/' . $pathFile);
            }

            //thumbnail
            $image_thumb = \Image::make($pathRoot . '/' . $pathFile);
            $image_thumb->resize($widthThumb, $heightThumb, function ($constraint) {
                $constraint->aspectRatio();
            });
            $image_thumb->save($pathRoot . '/thumb/' . $pathFile);
        }
    }

    public static function getListCart($instance = 'default')
    {
        $cart                = \Cart::instance($instance);
        $arrCart['count']    = $cart->count();
        $arrCart['subtotal'] = \Helper::currencyRender($cart->subtotal());
        $arrCart['items']    = [];
        if ($cart->count()) {
            foreach ($cart->content() as $key => $item) {
                $product            = \App\Models\ShopProduct::find($item->id);
                $arrCart['items'][] = [
                    'id'        => $item->id,
                    'qty'       => $item->qty,
                    'image'     => asset($product->getThumb()),
                    'price'     => $product->getPrice(),
                    'showPrice' => $product->showPrice(),
                    'url'       => $product->getUrl(),
                    'rowId'     => $item->rowId,
                    'name'      => $product->getName(),
                ];
            }
        }

        return $arrCart;
    }

}
