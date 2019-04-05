<?php

namespace App\Http\Controllers\Api;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Redis;
use App\Models\Sms;

class UserController extends BaseController {

	public function index() {
		return err(0);
	}

	// 注册
	public function reg(Request $req) {
		$this->required($req, ['username', 'password', 'code']);

		$v['username'] = $req->username;
		$user = $this->checkUser($req->username);
		if($user) {
			return err(4103);
		} else {
			$v['plt'] = $req->plt;
			$v['tel'] = $req->username;
			$v['nickname'] = $req->username;
			$v['password'] = bcrypt($req->password);
			$v['reg_ip'] = $_SERVER['REMOTE_ADDR'];
			$checked = $this->checkSms($v['tel'], $req->code);
			if($checked) {
				$this->model->create($v);
				return err();
			} else {
				return err(4005);
			}
		}
	}

	// 登录
	public function login(Request $req) {
		$this->required($req, ['username', 'password', 'regid']);

		$user = $this->checkUser($req->username);
		if($user && Hash::check($req->password, $user->password)) {
			$now = time();
			$user->regid = $req->regid;
			$user->token = md5($user->tel . $user->plt . $now);
			$user->create_token_time = $now;
			$user->last_login_ip = $_SERVER['REMOTE_ADDR'];
			$user->login_times += 1;
			if($user->save()) {
				return err(0, ['token' => $user->token]);
			} else {
				return err(1);
			}
		} else {
			return err(4101);
		}
	}

	// 退出
	public function logout(Request $req) {
		$row = $this->model->where('token', $req->token)->update(['token' => '', 'regid' => '']);
		if($row) {
			Redis::del('ut_'.$req->token);
		}
		return res($row);
	}

	// 重置密码
	public function forgetPass(Request $req) {
		$this->required($req, ['username', 'password', 'code']);

		$user = $this->checkUser($req->username);
		if($user) {
			$checked = $this->checkSms($req->username, $req->code);
			if($checked) {
				$user->password = bcrypt($req->password);
				$user->save();
				return err();
			} else {
				return err(4005);
			}
		} else {
			return err(4104);
		}
	}

	// 修改信息
	public function edit(Request $req) {
		$v = [];
		if(!empty($req->profile)) {
			$v['profile'] = $req->profile;
		}

		if(!empty($req->nickname)) {
			$v['nickname'] = $req->nickname;
		}

		$row = $this->model->updateBy($this->uid, $v);
		return res($row);
	}

	// 修改绑定手机
	public function resetUsername(Request $req) {
		$this->required($req, ['username', 'code']);

		$tel = $req->username;
		$checked = $this->checkSms($tel, $req->code);
		if($checked) {
			$row = $this->model->updateBy($this->uid, ['username' => $tel, 'tel' => $tel]);
			return res($row);
		} else {
			return err(4005);
		}
	}

	// 修改密码
	public function resetPass(Request $req) {
		$this->required($req, ['old', 'pass', 'repass']);

		if($req->pass != $req->repass) {
			return err(4102);
		}

		$user = $this->model->find($this->uid);
		if(Hash::check($req->old, $user->password)) {
			$row = $this->model->updateBy($this->uid, ['password' => bcrypt($req->pass)]);
			return res($row);
		} else {
			return err(4105);
		}
	}


	// 检查验证码是否有效
	protected function checkSms($tel, $code) {
		$sms = Sms::where(['tel' => $tel, 'code' => $code])->orderBy('id', 'desc')->first();
		if($sms && ($sms->expire > time())) {
			return true;
		} else {
			return false;
		}
	}

	// 检查账号是否已存在
   	// 存在返回用户信息, 不存在返回false
	protected function checkUser($username) {
		$user = $this->model->where('username', $username)->first();
		if(empty($user)) {
			return false;
		} else {
			return $user;
		}
	}
}
