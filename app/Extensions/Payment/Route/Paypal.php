<?php

Route::group(
    [
        'prefix'    => 'extension/payment',
        'namespace' => 'App\Extensions\Payment\Controllers',
    ], function () {
        Route::get('paypal', 'Paypal@index')->name('paypal');
        Route::get('return/{order_id}', 'Paypal@getReturn')->name('returnPaypal');
    });
