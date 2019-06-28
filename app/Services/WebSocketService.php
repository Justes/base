<?php

namespace App\Services;
use Hhxsv5\LaravelS\Swoole\WebSocketHandlerInterface;
use Swoole\Http\Request;
use Swoole\WebSocket\Frame;
use Swoole\WebSocket\Server;
use App\Models\User;
use App\Models\UserFriend;
use App\Models\Message;

class WebSocketService implements WebSocketHandlerInterface {

	public function __construct() {
	}

	public function onOpen(Server $server, Request $request) {
		$server->push($request->fd, 'Welcome to webim');
	}

	public function onMessage(Server $server, Frame $frame) {
		$data = json_decode($frame->data, true);
		if(isset($data['open'])) {
			app('swoole')->wsTable->set($data['usercode'], ['value' => $frame->fd]);
			app('swoole')->wsTable->set('fd:' . $frame->fd, ['value' => $data['usercode']]);
			User::where('usercode', $data['usercode'])->update(['fd' => $frame->fd]);
		} else {
			$usercode = app('swoole')->wsTable->get('fd:' . $fd);
			$v['from_usercode'] = $usercode['value'];
			$v['to_usercode'] = $data['to_usercode'];
			$relation = UserFriend::where($v)->first();
			if($relation) {
				$v['message'] = $data['message'];
				$to = app('swoole')->wsTable->get($data['to_usercode']);
				if($to !== false) {
					$server->push($to['value'], $data['message']);
					$v['send'] = 1;
				}
				Message::create($v);
			}
		}
	}

	public function onClose(Server $server, $fd, $reactorId) {
		$usercode = app('swoole')->wsTable->get('fd:' . $fd);
		if($usercode !== false) {
			app('swoole')->wsTable->del($usercode['value']);
		}
		app('swoole')->wsTable->del('fd:' . $fd);
		User::where('fd', $fd)->update(['fd' => 0]);
	}
}
