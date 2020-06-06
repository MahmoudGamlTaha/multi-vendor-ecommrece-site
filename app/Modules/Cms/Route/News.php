<?php

Route::group(
    [
        'namespace' => 'App\Modules\Cms\Controllers',
    ], function () {
        Route::get('/news.html', 'News@news')->name('news');
        Route::get('/news/{name}_{id}.html', 'News@newsDetail')
            ->where(['id' => '[0-9]+'])->name('newsDetail');
    });
