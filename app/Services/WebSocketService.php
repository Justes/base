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
		$fd = $frame->fd;
		if(isset($data['open'])) {
			$user = User::where('token', $data['token'])->first();
			app('swoole')->wsTable->set('uid:' . $user->id, ['value' => $fd]);
			app('swoole')->wsTable->set('fd:' . $fd, ['value' => $user->id]);
			$user->fd = $fd;
			$user->save();
		} else {
			$userId = app('swoole')->wsTable->get('fd:' . $fd);
			$v = $data;
			$v['from_uid'] = $w['user_id'] = $userId['value'];
			$w['friend_id'] = $data['to_uid'];

			$row = UserFriend::where($w)->first();
			if($row) {
				$to = app('swoole')->wsTable->get('uid:'.$data['to_uid']);
				if($to !== false) {
					$server->push($to['value'], $data['msg']);
					$v['send'] = 1;
				}
				Message::create($v);
			}
		}
	}

	public function onClose(Server $server, $fd, $reactorId) {
		$userId = app('swoole')->wsTable->get('fd:' . $fd);
		if($userId !== false) {
			app('swoole')->wsTable->del('uid:' . $userId['value']);
		}
		app('swoole')->wsTable->del('fd:' . $fd);
		User::where('fd', $fd)->update(['fd' => 0]);
	}
}
