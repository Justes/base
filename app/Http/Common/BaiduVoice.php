<?php

namespace App\Http\Common;

require_once dirname(__FILE__).DIRECTORY_SEPARATOR.'BaiduVoice/AipSpeech.php';
use Illuminate\Support\Facades\Redis;

class BaiduVoice {

	protected static function init() {
		$appid = request()->header('appid');
		if($appid) {
			$app = json_decode(Redis::get('appid_'.$appid));

			$client = new \AipSpeech($app->baidu_voice_id, $app->baidu_voice_key, $app->baidu_voice_secret);
			return $client;
		}
	}

	public static function trans($text) {
		$client = self::init();
		$result = $client->synthesis($text, 'zh', 1, [
			'vol' => 10, 'spd' => 6, 'per' => 0
		]);

		if(!is_array($result)) {
			$filename = time() . mt_rand(100000, 999999). '.mp3';
			$url = Qiniu::upload($filename, $result);
			return $url;
		} else {
			return false;
		}
	}
}
