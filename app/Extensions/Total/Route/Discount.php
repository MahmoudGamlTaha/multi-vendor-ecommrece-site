<?php

Route::group(
    [
        'prefix'    => 'extension/discount',
        'namespace' => 'App\Extensions\Total\Controllers',
    ], function () {
        Route::post('/useDiscount', 'Discount@useDiscount')->name('useDiscount');
        Route::post('/removeDiscount', 'Discount@removeDiscount')->name('removeDiscount');
    });
