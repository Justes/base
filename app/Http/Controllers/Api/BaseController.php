<?php

// 核心配置
namespace App\Http\Controllers\Api;
use App\Http\Controllers\Controller;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Container\Container;
use Illuminate\Support\Facades\Redis;
use Illuminate\Http\Request;
use Validator;
use Exception;
use App\Models\App;
use App\Models\Api;
use App\Models\Setting;
use App\Models\User;

class BaseController extends Controller {
	private $la;
	protected $model;
	protected $common = ['l', 'token'];

	protected $app;
	protected $uid;
	protected $val;

	public function __construct(Request $req) {
		$this->la = new Container;

		if(empty($this->model)) {
			$class = get_called_class();
			$arr = explode('\\',$class);
			$className = array_pop($arr);
			$str = substr($className, 0, strpos($className, 'Controller'));
			$this->model = 'App\Models\\'.$str;
		}
		$this->makeModel();

		if($req->token) {
			$token = $req->token;
			$tokenk = 'ut_'.$token;
		
			if(!Redis::exists($tokenk)) {
				$user = User::where('token', $req->token)->first();
				Redis::set($tokenk, $user->id);
			}
			$this->uid = Redis::get($tokenk);
		}

		$this->content($req);
	}

	public function makeModel() {
		$model = $this->la->make($this->model);

		if(!$model instanceof Model) {
			throw new Exception("Class {$this->model} must be an instance of Illuminate\\Database\\Eloquent\\Model");
		}
		return $this->model = $model;
	}

	public function rules($req, $valid, $exit=1) {
		$validator = Validator::make($req->all(), $valid);
		if($validator->fails()) {
			if($exit) {
				err(2, $validator->errors()->all(), '', 1);
			} else {
				return false;
			}
		}
		return true;
	}

	public function required($req, $valid, $exit=1) {
		$v = [];
		foreach($valid as $item) {
			$v[$item] = 'required';
		}
		return $this->rules($req, $v, $exit);
	}

	public function content($req) {
		$data = $req->all();
		$tmp = [];
		foreach($data as $key => $item) {
			if(!in_array($key, $this->common)) {
				$tmp[$key] = $item;
			}
		}
		$this->val = $tmp;
	}
}
