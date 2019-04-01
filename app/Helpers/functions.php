<?php

if(!function_exists('debug')) {
	function debug($data,$type=0,$exit=1) {
		echo '<pre>';
		empty($type) ? print_r($data) : var_dump($data);
		echo '</pre>';
		if($exit) {
			exit;
		}
	}
}

if(!function_exists('writeLog')) {
	function writeLog($dir,$content,$plt='') {
		$date = date("Y-m-d");
		$now = date("Y-m-d H:i:s");
		$dirPath = storage_path().DIRECTORY_SEPARATOR."logs.".DIRECTORY_SEPARATOR.$dir;
		if(!is_dir($dirPath)) {
			mkdir($dirPath);
		}
		if($plt) {
			$date .= '-'.$plt;
		}
		$file = $dirPath . DIRECTORY_SEPARATOR . $date.'.log';
		file_put_contents($file, '['.$now.'] ------ '.$content.PHP_EOL,FILE_APPEND);
	}
}

if(!function_exists('err')) {
	function err($errcode=0, $data='', $message='', $exit=0) {
		$lang = request('l', 'en');
		$err = config('errcode_'.$lang);

		$message = empty($message) ? $err[$errcode] : $message;
		$arr = [
			'errcode' => $errcode,
			'message'	=> $message,
			'data' => $data
		];

		if($exit) {
			echo json_encode($arr);
			exit;
		}

		return response()->json($arr);
	}
}

if(!function_exists('res')) {
	function res($data='', $errcode=0, $message='') {
		if(empty($data) && $errcode == 0) {
			$errcode = 1;
		}
		return err($errcode, $data, $message);
	}
}

if(!function_exists('curl')) {
	function curl($url, $params='', $authorization='', $type="GET") {
		$plt = request('plt');
		$stime = microtime(true); //运行开始时间
		$curl = curl_init();
		curl_setopt($curl, CURLOPT_URL, $url);
		curl_setopt($curl, CURLOPT_CUSTOMREQUEST, $type);
		if(!empty($params)) {
			curl_setopt($curl, CURLOPT_POST, 1);
			curl_setopt($curl, CURLOPT_POSTFIELDS, $params);
		}
		curl_setopt($curl, CURLOPT_TIMEOUT, 30);				// 设置超时限制防止死循环
		if($authorization){
			$header[] = 'Authorization:'.$authorization;
			curl_setopt($curl, CURLOPT_HTTPHEADER, $header);
		}
		curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
		$output = curl_exec($curl);
		curl_close($curl);
		$etime = microtime(true);
		$time = $etime - $stime;
		$result = json_decode($output, true);

		$content1 = "url:".$url.",params:".json_encode($params).",auth:".$authorization.",type:".$type;
		$content2 = 'begin:'.$stime.',end:'.$etime.',exe:'.$time.',result:'.$output;
		if($result['code'] == 0) {
			writeLog("curl", $content1, $plt);
			writeLog('curl', $content2, $plt);
		} else {
			writeLog("curlerr", $content1, $plt);
			writeLog("curlerr", $content2, $plt);
		}
		return $result;
	}
}

if(!function_exists('apiRes')) {
	function apiRes($res) {
		if($res['code'] == 0) {
			return $res['data'];
		} else {
			err(5, '', '', 1);
		}
	}
}
