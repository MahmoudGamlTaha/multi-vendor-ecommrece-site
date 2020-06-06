<?php

namespace App\Scart;

use Illuminate\Support\ServiceProvider;

class ScartServiceProvider extends ServiceProvider
{
    /**
     * Bootstrap services.
     *
     * @return void
     */
    public function boot()
    {
        //
    }

    /**
     * Register services.
     *
     * @return void
     */
    public function register()
    {
        foreach (glob(app_path() . '/Scart/Helpers/*.php') as $filename) {
            require_once $filename;
        }

    }
}
