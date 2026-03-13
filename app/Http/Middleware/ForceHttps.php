<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;

class ForceHttps
{
    public function handle(Request $request, Closure $next)
    {
        if (! config('app.force_https')) {
            return $next($request);
        }

        if ($request->secure()) {
            return $next($request);
        }

        $httpsUrl = 'https://'.$request->getHttpHost().$request->getRequestUri();

        return redirect()->to($httpsUrl, 301);
    }
}

