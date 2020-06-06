<?php

Route::group(
    [
        'namespace' => 'App\Modules\Cms\Controllers',
    ], function () {
        Route::get('/cms/{name}_{id}.html', 'Content@category')
            ->where(['id' => '[0-9]+'])->name('cmsCategory');
        Route::get('/entry/{name}_{id}.html', 'Content@content')
            ->where(['id' => '[0-9]+'])->name('cmsContent');
    });
