<?php

namespace App\Http\Controllers\Api;

class IndexController extends BaseController {

	protected $model = 'App\Models\User';

	public function index() {
		return 'api';
	}

	public function test() {
		header('Access-Control-Allow-Origin:*');
		header('Access-Control-Allow-Headers:x-requested-with, echodata-token, content-type');
		return '233';
	}
}
