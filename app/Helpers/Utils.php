<?php

namespace App\Helpers;

use Qcloud\Sms\SmsSingleSender;

class Utils {

	public static function sms($app, $tel, $content, $zone='86') {
		$params = [$content, 5];
		$sender = new SmsSingleSender($app->sms_id, $app->sms_key);
		$result = $sender->sendWithParam($zone, $tel, $app->sms_tpl_id, $params, $app->sms_sign, "", "");
		return json_decode($result);
	}
}
