<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/
Route::group(['namespace' => 'Api'], function() {
	Route::any('/test', 'IndexController@test');
});

Route::group(['namespace' => 'Api'], function() {

	Route::get('/', 'IndexController@index');
	Route::get('/sms/send', 'SmsController@send');
	Route::get('/sms/verify', 'SmsController@verify');

	Route::post('/user/reg', 'UserController@reg');
	Route::post('/user/login', 'UserController@login');

});

Route::group(['namespace' => 'Api', 'middleware' => ['auth.token']], function() {

	Route::post('/user/logout', 'UserController@logout');
	Route::post('/user/forgetPass', 'UserController@forgetPass');
	Route::post('/user/edit', 'UserController@edit');
	Route::post('/user/resetUsername', 'UserController@resetUsername');
	Route::post('/user/resetPass', 'UserController@resetPass');

	Route::resources([
		'users'	 => 'UserController',
	]);
});
