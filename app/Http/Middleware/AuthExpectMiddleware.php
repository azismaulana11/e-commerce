<?php

namespace App\Http\Middleware;

use Closure;

class AuthExpectMiddleware
{
    public function handle($request, Closure $next, ...$actions)
    {
        if (!auth()->check() && in_array($request->route()->getActionMethod(), $actions)) {
            return response()->json(['error' => 'Anda harus login untuk mengakses ini.'], 401);
        }

        return $next($request);
    }
}
