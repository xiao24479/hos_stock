<?php

use Illuminate\Routing\Router;

Admin::registerAuthRoutes();

Route::group([
    'prefix'        => config('admin.route.prefix'),
    'namespace'     => config('admin.route.namespace'),
    'middleware'    => config('admin.route.middleware'),
], function (Router $router) {

    $router->get('/', 'HomeController@index');
    $router->resource('hospitals', HospitalController::class);
    $router->resource('auth/users', UserController::class);
    $router->resource('goods', GoodsController::class,['names' => [ 'index' => 'goods']]);
    $router->resource('purchase', PurchaseController::class,['names' => [ 'index' => 'purchase']]);
    $router->resource('categories', CategoryController::class);
    $router->resource('stocklog', StockLogController::class, ['only' => ['index', 'destroy'],'names' => [ 'index' => 'stocklog']]);
    $router->resource('application', ApplicationController::class, ['except' => ['show','destroy']]);
    $router->resource('reback', RebackController::class, ['except' => ['show','destroy']]);


    $router->post('/switchHos', 'AjaxController@switchHos')->name('switchHos');
});


