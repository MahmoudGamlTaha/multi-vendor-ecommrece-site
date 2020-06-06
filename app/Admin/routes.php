<?php

use Illuminate\Routing\Router;

Admin::registerAuthRoutes();

Route::group([
    'prefix'     => config('admin.route.prefix'),
    'namespace'  => config('admin.route.namespace'),
    'middleware' => config('admin.route.middleware'),
], function (Router $router) {

    $router->get('/', 'HomeController@index')->name('homeAdmin');
    $router->resource('banner', BannerController::class)->names('bannerControl');
    $router->resource('layout', LayoutController::class)->names('layoutControl');
    $router->resource('layout_url', LayoutUrlController::class)->names('layoutUrlControl');
    $router->resource('language', LanguageController::class)->names('languageControl');
    $router->resource('currencies', CurrencyController::class)->names('currencyControl');
    $router->resource('subscribe', EmailSubscribeController::class)->names('subscribeControl');
//Config
    $router->resource('config_info', ConfigInfoController::class)->names('configInfoControl');
    $router->resource('config_global', ConfigGlobalController::class)->names('configGlobalControl');
    $router->get('config_template', 'TemplateController@index');
    $router->post('config_template', 'TemplateController@changeTemplate')->name('changeTemplate');
    $router->get('backup_database', 'BackupController@index');
    $router->post('backup_database', 'BackupController@processBackupFile')->name('processBackupFile');
    $router->post('backup', 'BackupController@generateBackup')->name('generateBackup');
    $router->any('/config_updateConfigField', 'ConfigInfoController@updateConfigField')
        ->name('updateConfigField');
        $router->any('/updateUofm', 'UnitOfMeasureController@updateUofm')
        ->name('updateUofmFields');
    $router->get('/ckfinder', function () {
        return view('admin.ckfinder');
    });

//Shop sprint 3
    $router->resource('shop_customer', ShopCustomerController::class)->names('customerControl');
    $router->resource('shop_order', ShopOrderController::class)->names('orderControl');
    $router->resource('shop_product', ShopProductController::class)->names('productControl');
    $router->resource('shop_category', ShopCategoryController::class)->names('categoryControl');
    $router->resource('shop_brand', ShopBrandController::class)->names('brandControl');
    $router->resource('shop_vendor', ShopVendorController::class)->names('vendorControl');
    $router->resource('shop_order_status', ShopOrderStatusController::class)->names('orderStatusControl');
    $router->resource('shop_payment_status', ShopPaymentStatusController::class)->names('paymentStatusControl');
    $router->resource('shop_shipping_status', ShopShipingStatusController::class)->names('shippingStatusControl');
    $router->resource('shop_special_price', ShopSpecialPriceController::class)->names('specialPriceControl');
    $router->resource('shop_attribute_group', ShopAttributeGroupController::class)->names('attributeControl');
    $router->resource('shop_page', ShopPageController::class)->names('pageControl');
    //companies
    $router->resource('company', CompanyController::class)->names('company');
    $router->resource('item_units', UnitOfMeasureController::class)->names('item_units');
    $router->resource('activities', ActivityController::class)->names('activities');
    $router->resource('price_list', ShopPriceListController::class)->names('priceList');
   // $router->get('company', 'CompanyController@index');
    //$router->get('/company/{id}/edit','CompanyController@edit');
     //$router->get('/company/{id}/','CompanyController@edit');
   // $router->get('compnay', 'CompanyController@index')->names('compnayControl');
  
  //$router->get('compnay','CompanyController@index');//->name('company');
//Get info
    $router->group(['prefix' => 'get_info'], function ($router) {
        $router->get('productInfo', 'ShopOrderController@getInfoProduct')->name('getInfoProduct');
        $router->get('userInfo', 'ShopOrderController@getInfoUser')->name('getInfoUser');
        $router->get('itemInfo', 'ShopOrderController@getInfoItem')->name('getInfoItem');
    });
//

    $router->group(['prefix' => 'shop_order_edit'], function ($router) {
        $router->get('/{id}', 'ShopOrderController@detailOrder')->name('order_edit_get');
        $router->post('/order_add_item', 'ShopOrderController@postAddItem')->name('order_add_item');
        $router->post('/order_edit_item', 'ShopOrderController@postEditItem')->name('order_edit_item');
        $router->post('/order_delete_item', 'ShopOrderController@postDeleteItem')->name('order_delete_item');
        $router->put('/shop_order_update', 'ShopOrderController@postOrderUpdate')->name('order_update');
    });
//Modules
    $router->group(['prefix' => 'modules'], function ($router) {
        $router->get('/{modulesGroup}', 'ModulesController@index')->name('modulesGroup');
        $router->post('/installModule', 'ModulesController@installModule')->name('installModule');
        $router->post('/uninstallModule', 'ModulesController@uninstallModule')->name('uninstallModule');
        $router->post('/enableModule', 'ModulesController@enableModule')->name('enableModule');
        $router->post('/disableModule', 'ModulesController@disableModule')->name('disableModule');
        $router->match(['put', 'post'], '/processModule/{moduleGroup}/{module}', 'ModulesController@processModule')->name('processModule');
    });
    $router->group(['prefix' => 'modules', 'namespace' => 'Modules'], function ($router) {
        $router->resource('cms/cms_category', Cms\CmsCategoryController::class)->names('cmsCategoryControl');
        $router->resource('cms/cms_content', Cms\CmsContentController::class)->names('cmsContentControl');
        $router->resource('cms/cms_news', Cms\CmsNewsController::class)->names('cmsNewsControl');
        $router->resource('api/shop_api', Api\ShopApiController::class)->names('apiControl');
    });
//End module

//Extensions
    $router->group(['prefix' => 'extensions'], function ($router) {
        $router->get('/{extensionGroup}', 'ExtensionsController@index')->name('extensionGroup');
        $router->post('/installExtension', 'ExtensionsController@installExtension')->name('installExtension');
        $router->post('/uninstallExtension', 'ExtensionsController@uninstallExtension')->name('uninstallExtension');
        $router->post('/enableExtension', 'ExtensionsController@enableExtension')->name('enableExtension');
        $router->post('/disableExtension', 'ExtensionsController@disableExtension')->name('disableExtension');
        $router->match(['put', 'post'], '/processExtension/{extensionGroup}/{extension}', 'ExtensionsController@processExtension')->name('processExtension');
    });
    $router->resource('shop_discount', Extensions\Total\DiscountController::class)->names('discountControl');
//end extensions

//Process Simpe
    $router->prefix('process')->group(function ($router) {
        $router->any('/productImport', 'ProcessController@importProduct')->name('productImport');
    });
    $router->get('/report/{key}', 'ReportController@index')->name('report');
    //Language
    $router->get('locale/{code}', function ($code) {
        session(['locale' => $code]);
        return back();
    })->name('admin.locale');
});
