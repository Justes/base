<?php

use Illuminate\Routing\Router;

Admin::registerAuthRoutes();

Route::group([
    'prefix'        => config('admin.route.prefix'),
    'namespace'     => config('admin.route.namespace'),
    'middleware'    => config('admin.route.middleware'),
], function (Router $router) {

    $router->get('/', 'HomeController@index');
    $router->get('/sys', 'HomeController@sys');

	$router->resource('settings', SettingController::class);
	$router->resource('apps', AppController::class);
	$router->resource('apis', ApiController::class);

	$router->resource('users', UserController::class);
	$router->resource('devices', DeviceController::class);
	$router->resource('groups', GroupController::class);

});
