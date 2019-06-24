<?php

namespace App\Http\Common;
use App\Models\Wxpay as Wp;
use Illuminate\Support\Facades\Redis;

class Wxpay {

	protected static function init() {
		$appid = request()->header('appid');
		$app = json_decode(Redis::get('appid_'.$appid));
		$plt = $app->plt;

		$wx = Wp::where('plt', $plt)->first();
		if(empty($wx)) {
			throw new \Exception('Missing wxpay setting');
		}

		return $wx;
	}

	public static function order($data) {
		$wx = self::init();

		$ip = $_SERVER['REMOTE_ADDR'];
		$v['appid'] = $wx->appid;
		$v['mch_id'] = $wx->mch_id;
		$v['nonce_str'] = md5(time() . $ip);
		$v['spbill_create_ip'] = $ip;
		$v['notify_url'] = $wx->notify_url;
		$v['trade_type'] = 'APP';
		$v['fee_type'] = 'CNY';
		$v['out_trade_no'] = $data['out_trade_no'];
		$v['body'] = $data['body'];
		$v['total_fee'] = $data['total_fee'] * 100;
		$v['sign'] = self::sign($v, $wx->wxkey);

		$xml = self::arrayToXml($v);
		$wxRes = self::xmlToArray(self::postXmlCurl($xml, $wx->gateway));

		if($wxRes['return_code'] == 'SUCCESS') {
			$res['appid'] = $wx->appid;
			$res['partnerid'] = $wx->mch_id;
			$res['prepayid'] = $wxRes['prepay_id'];
			$res['package'] = 'Sign=WXPay';
			$res['noncestr'] = md5(time() . $ip);
			$res['timestamp'] = time();
			$sign = self::sign($res, $wx->wxkey);
			$res['sign'] = $sign;
			return $res;
		} else {
			return false;
		}
	}

	protected static function sign($pre, $key) {
		ksort($pre);
		$str = self::format($pre) . 'key=' . $key;
		$sign = strtoupper(md5($str));
		return $sign;
	}

	protected static function format($pre) {
		$str = '';
		foreach($pre as $k => $item) {
			$str .= $k . '=' . $item . '&';
		}
		return $str;
	}

	public static function arrayToXml($arr) {
		$xml = "<xml>";
		foreach($arr as $key=>$val){
			$xml .= "<$key>$val</$key>";
		}
		$xml .= "</xml>";
		return $xml;
	}

	public static function xmlToArray($xml) {
		libxml_disable_entity_loader(true);
		$xmlstring = simplexml_load_string($xml, 'SimpleXMLElement', LIBXML_NOCDATA);
		$arr = json_decode(json_encode($xmlstring), true);
		return $arr;
	}

	protected static function postXmlCurl($xml,$url,$second=30) {
		//初始化curl
		$ch = curl_init();
		curl_setopt($ch,CURLOPT_URL, $url);
		curl_setopt($ch,CURLOPT_SSL_VERIFYPEER,FALSE);
		curl_setopt($ch,CURLOPT_SSL_VERIFYHOST,FALSE);
		//设置header
		curl_setopt($ch, CURLOPT_HEADER, FALSE);
		//要求结果为字符串且输出到屏幕上
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, TRUE);
		//post提交方式
		curl_setopt($ch, CURLOPT_POST, TRUE);
		curl_setopt($ch, CURLOPT_POSTFIELDS, $xml);
		//运行curl
		$data = curl_exec($ch);
		curl_close($ch);
		//返回结果
		if($data) {
			return $data;
		} else {
			return false;
		}
	} 

	public static function checkSign($data) {
		$appid = $data['appid'];
		$wx = Wp::where('appid', $appid)->first();

		$originSign = $data['sign'];
		unset($data['sign']);
		$sign = self::sign($data, $wx->wxkey);
		return $originSign == $sign;
	}
}
