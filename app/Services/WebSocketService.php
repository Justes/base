<?php

namespace App\Services;
use Hhxsv5\LaravelS\Swoole\WebSocketHandlerInterface;
use Swoole\Http\Request;
use Swoole\WebSocket\Frame;
use Swoole\WebSocket\Server;

class WebSocketService implements WebSocketHandlerInterface {

	public function __construct() {
	}

	public function onOpen(Server $server, Request $request) {
		$server->push($request->fd, 'Welcome to las');
	}

	public function onMessage(Server $server, Frame $frame) {
		$server->push($frame->fd, date('Y-m-d H:i:s'));
	}

	public function onClose(Server $server, $fd, $reactorId) {
	}
}
