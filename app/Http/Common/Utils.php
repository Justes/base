<?php

namespace App\Http\Common;

use Qcloud\Sms\SmsSingleSender;

class Utils {

	public static function sms($app, $tel, $content='', $zone='86') {
		if(empty($content)){
			$content = mt_rand(100000,999999);
		}
		$params = [$content, 5];
		$sender = new SmsSingleSender($app->sms_id, $app->sms_key);
		$result = $sender->sendWithParam($zone, $tel, $app->sms_tpl_id, $params, $app->sms_sign, "", "");
		return json_decode($result);
	}

	public static function force($app, $tel, $content=[], $zone='86') {
		$params = $content;
		$sender = new SmsSingleSender($app->sms_id, $app->sms_key);
		$result = $sender->sendWithParam($zone, $tel, $app->sms_tpl_id_force, $params, $app->sms_sign, "", "");
		return json_decode($result);
	}
}
