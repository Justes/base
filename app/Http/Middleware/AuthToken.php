<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Support\Facades\Redis;
use App\Models\User;

class AuthToken
{
    public function handle($request, Closure $next)
    {
		$token = $request->token;
		if(empty($token)) {
			return err(2);
		}

		/*
		$tokenk = 'ut_'. $token;
		if(!Redis::exists($tokenk)) {
			$user = User::where('token', $token)->first();
			if(empty($user)) {
				return err(6);
			}
		}
		 */
		return $next($request);
    }
}
