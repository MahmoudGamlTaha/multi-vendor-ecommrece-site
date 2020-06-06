<?php

namespace App\Http\Middleware;

use App\Models\Language;
use Closure;
use Session;

class Localization
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
//Set language
        $configsGlobal = \Helper::configsGlobal();
        $languages     = Language::where('status', 1)->get()->keyBy('code');
        $requestLocale = $request->get('lang');
        if ($requestLocale) {
            $detectLocale = $requestLocale;
        } else
        if (!Session::has('locale')) {
            $detectLocale = $configsGlobal['locale'] ?? config('app.locale');
        } else {
            $detectLocale = session('locale');
        }
        $currentLocale = array_key_exists($detectLocale, $languages->toArray()) ? $detectLocale : $languages->first()->code;
        session(['locale' => $currentLocale, 'locale_id' => $languages[$currentLocale]['id']]);
        app()->setLocale($currentLocale);
//End language
        return $next($request);
    }
}
