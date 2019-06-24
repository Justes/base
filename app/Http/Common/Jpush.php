<?php

namespace App\Http\Common;
use JPush\Client as Jp;
use Illuminate\Support\Facades\Redis;

class Jpush {

	protected static function init($plt='') {
		if($plt) {
			$app = json_decode(Redis::get('plt_'.$plt));
		} else {
			$appid = request()->header('appid');
			$app = json_decode(Redis::get('appid_'.$appid));
		}
		return $app;
	}

	/**
	 *	发送通知栏推送
	 *  @param string $regid 
	 *  @param array $data
	 *  $data require ['title','msg','type']
	 */
	public static function push($regid, $data, $plt='', $file='jpush') {
		if(empty($regid)) return false;

		$app = self::init($plt);
		$iosSet = json_decode($app->ios);

		$jp = new Jp($app->jpush_key, $app->jpush_secret);

		$v['title'] = $data['title'];
		$v['extras'] = $data;

		$ios = $v;
		$ios['sound'] = $data['title'];
		unset($ios['title']);

		$push = $jp->push()
			->setPlatform('all')
			->addRegistrationId($regid)
			->iosNotification($data['msg'], $ios)
			->androidNotification($data['msg'], $v)
			->options(['apns_production' => $iosSet->env]);

		try {
			$response = $push->send();
			writeLog($file, 'notify '. json_encode($response['body']));
			return true;
		} catch(Exception $e) {
			writeLog($file, 'error '.$e->getCode(). ' '. $e->getMessage());
			return false;
		}
	}

	/**
	 *	发送普通消息
	 *  @param string $regid 
	 *  @param array $data
	 *  $data require ['title','msg','type']
	 */
	public static function msg($regid, $data, $plt='') {
		if(empty($regid)) return false;

		$app = self::init($plt);
		$iosSet = json_decode($app->ios);

		$jp = new Jp($app->jpush_key, $app->jpush_secret);

		$v['title'] = $data['title'];
		$v['extras'] = $data;

		$push = $jp->push()
			->setPlatform('all')
			->addRegistrationId($regid)
			->message($data['msg'], $v)
			->options(['apns_production' => $iosSet->env]);

		try {
			$response = $push->send();
			writeLog('jpush', 'msg '. json_encode($response['body']));
			return true;
		} catch(Exception $e) {
			writeLog('jpush', 'error '.$e->getCode(). ' '. $e->getMessage());
			return false;
		}
	}
}
