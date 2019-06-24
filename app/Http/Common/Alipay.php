<?php

namespace App\Http\Common;

require_once dirname(__FILE__).DIRECTORY_SEPARATOR.'Alipay/AopSdk.php';
use App\Models\Alipay as Ap;
use Illuminate\Support\Facades\Redis;

class Alipay {

	protected static function init() {
		$appid = request()->header('appid');
		if($appid) {
			$app = json_decode(Redis::get('appid_'.$appid));
			$plt = $app->plt;
			$ali = Ap::where('plt', $plt)->first();
		}

		$aliAppid = request('app_id');
		if($aliAppid) {
			$ali = Ap::where('app_id', $aliAppid)->first();
		}

		if(empty($ali)) {
			throw new \Exception('Missing Alipay setting');
		}
		return $ali;
	}

	public static function order($biz) {
		$ali = self::init();

		$aop = new \AopClient;
		$aop->gatewayUrl = $ali->gateway;
		$aop->appId = $ali->app_id;
		$aop->rsaPrivateKey = $ali->private_key;
		$aop->alipayrsaPublicKey = $ali->public_key;
		$aop->format = $ali->format;
		$aop->charset = $ali->charset;
		$aop->signType = $ali->sign_type;

		$request = new \AlipayTradeAppPayRequest();
		$biz['product_code'] = 'QUICK_MSECURITY_PAY';
		$request->setNotifyUrl($ali->notify_url);
		$request->setBizContent(json_encode($biz));

		$response = $aop->sdkExecute($request);
		return $response;
	}

	public static function check() {
		$ali = self::init();

		$aop = new \AopClient;
		$aop->alipayrsaPublicKey = $ali->public_key;
		$flag = $aop->rsaCheckV1($_POST, NULL, $ali->sign_type);
		return $flag;
	}

}
