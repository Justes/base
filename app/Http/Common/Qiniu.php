<?php

namespace App\Http\Common;

use Illuminate\Support\Facades\Redis;
use Qiniu\Auth;
use Qiniu\Storage\UploadManager;

class Qiniu {

	public static function upload($filename, $binary) {
		$appid = request()->header('appid');
		$app = json_decode(Redis::get('appid_'.$appid));

		$auth = new Auth($app->qiniu_key, $app->qiniu_secret);
		$token = $auth->uploadToken($app->qiniu_bucket);
		$qi = new UploadManager();

		list($ret, $err) = $qi->put($token, $filename, $binary);
		if($err) {
			return false;
		} else {
			return $app->qiniu_url.$filename;
		}
	}

}
