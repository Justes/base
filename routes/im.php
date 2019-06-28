<?php

Route::group(['namespace' => 'Im', 'middleware' => 'cross'], function() {
	Route::match(['options', 'post'], 'login', 'UserController@login');
});
