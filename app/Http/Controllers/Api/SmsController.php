<?php

namespace App\Http\Controllers\Api;
use App\Helpers\Utils;
use Illuminate\Http\Request;

class SmsController extends BaseController {

	// 发送验证码
	public function send(Request $req) {
		$this->required($req, ['tel']);

		$code = mt_rand(100000,999999);
		$sender = Utils::sms($this->app, $req->tel, $code);
		if($sender->result == 0) {
			$v['tel'] = $req->tel;
			$v['code'] = $code;
			$v['expire'] = time() + 300;
			$this->model->create($v);
		}
		return res(!$sender->result);
	}

	// 验证验证码
	public function verify(Request $req) {
		$this->required($req, ['tel', 'code']);
		$sms = $this->model->where(['tel' => $req->tel, 'code' => $req->code])->orderBy('id', 'desc')->first();
		if($sms && ($sms->expire > time())) {
			return err();
		}
		return err(4005);
	}
}
