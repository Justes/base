<?php

namespace App\Http\Middleware;

use Closure;

class EnableCross
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        $req = $next($request);

		$req->header('Access-Control-Allow-Origin', '*');
		$req->header('Access-Control-Allow-Headers', '*');
		$req->header('Access-Control-Allow-Methods', '*');

		return $req;
    }
}
