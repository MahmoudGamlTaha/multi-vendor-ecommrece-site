<?php
#app/Http/Controller/GeneralController.php
namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\Config;
use App\Models\ShopActivity;
use App\Models\Company;

use App\Models\Language;
use App\Models\Layout;
use App\Models\LayoutUrl;
use App\Models\ShopCurrency;
use App\Models\Subscribe;
use Illuminate\Http\Request;
use Mail;
use View;

class GeneralController extends Controller
{
    public $configs;
    public $configsGlobal;
    public $theme;
    public $theme_asset;
    public $path_file;
    public $logo;
    public $languages;
    public $currencies;

    public function __construct()
    {
        //=======Config====
        //Config for  SMTP
        $configs       = \Helper::configs();
        $configsGlobal = \Helper::configsGlobal();
        config(['app.name' => $configsGlobal['title']]);
        config(['mail.driver' => ($configs['smtp_mode']) ? 'smtp' : 'sendmail']);
        config(['mail.host' => empty($configs['smtp_host']) ? env('MAIL_HOST', '') : $configs['smtp_host']]);
        config(['mail.port' => empty($configs['smtp_port']) ? env('MAIL_PORT', '') : $configs['smtp_port']]);
        config(['mail.encryption' => empty($configs['smtp_security']) ? env('MAIL_ENCRYPTION', '') : $configs['smtp_security']]);
        config(['mail.username' => empty($configs['smtp_user']) ? env('MAIL_USERNAME', '') : $configs['smtp_user']]);
        config(['mail.password' => empty($configs['smtp_password']) ? env('MAIL_PASSWORD', '') : $configs['smtp_password']]);
        config(['mail.from' =>
            ['address' => $configsGlobal['email'], 'name' => $configsGlobal['title']]]
        );
        //SMTP

        //============end config====

        //end
        $this->path_file     = config('filesystems.disks.path_file', '');
        $this->configsGlobal = $configsGlobal;
        $this->configs       = $configs;
        $this->theme_asset   = 'templates/' . $this->configsGlobal['template'];
        $this->theme         = 'templates.' . $this->configsGlobal['template'];
        $this->logo          = $this->path_file . '/' . $this->configsGlobal['logo'];
        $this->languages     = Language::where('status', 1)->get()->keyBy('code');
        $this->currencies    = ShopCurrency::getAll();
//Share variable

        View::share('path_file', $this->path_file);
        View::share('layouts', Layout::getLayout());
        View::share('layoutsUrl', LayoutUrl::getAllUrl());
        View::share('configs', $this->configs);
        View::share('configsGlobal', $this->configsGlobal);
        View::share('theme_asset', $this->theme_asset);
        View::share('theme', $this->theme);
        View::share('logo', $this->logo);
        View::share('languages', $this->languages);
        View::share('currencies', $this->currencies);
        View::share('Activities', ShopActivity::all());
        View::share('Companies', Company::all());
    }

/**
 * [emailSubscribe description]
 * @param  Request $request [description]
 * @return [type]           [description]
 */
    public function emailSubscribe(Request $request)
    {
        $data      = $request->all();
        $validator = $request->validate([
            'subscribe_email' => 'required|email',
        ], [
            'subscribe_email.required' => trans('validation.required'),
            'subscribe_email.email'    => trans('validation.email'),
        ]);

        $checkEmail = Subscribe::where('email', $data['subscribe_email'])->first();
        if (!$checkEmail) {
            Subscribe::insert(['email' => $data['subscribe_email']]);
        }
        return redirect()->back()->with(['message' => trans('language.subscribe.subscribe_success')]);
    }

    public function pageNotFound()
    {
        return view($this->theme . '.notfound',
            array(
                'title'       => '404 - Page not found',
                'msg'         => trans('language.page_not_found'),
                'description' => '',
                'keyword'     => $this->configsGlobal['keyword'],

            )
        );
    }
    public function itemNotFound()
    {
        return view($this->theme . '.notfound',
            array(
                'title'       => '404 - Item not found',
                'msg'         => trans('language.item_not_found'),
                'description' => '',
                'keyword'     => $this->configsGlobal['keyword'],

            )
        );
    }

}
