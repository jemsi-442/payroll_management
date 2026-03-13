<?php

use Illuminate\Foundation\Application;
use Illuminate\Foundation\Configuration\Exceptions;
use Illuminate\Foundation\Configuration\Middleware;
use Illuminate\Http\Request;
use App\Http\Middleware\PreventBrowserHistory;

return Application::configure(basePath: dirname(__DIR__))
    ->withRouting(
        web: __DIR__.'/../routes/web.php',
        commands: __DIR__.'/../routes/console.php',
        health: '/up',
    )
    ->withMiddleware(function (Middleware $middleware): void {
        // Railway / reverse proxy: tumaini headers kama X-Forwarded-Proto ili app itambue HTTPS.
        $proxyHeaders = 0;
        foreach ([
            'HEADER_X_FORWARDED_FOR',
            'HEADER_X_FORWARDED_HOST',
            'HEADER_X_FORWARDED_PORT',
            'HEADER_X_FORWARDED_PROTO',
            // Symfony versions nyingine zina `HEADER_X_FORWARDED_PREFIX`, nyingine hazina.
            'HEADER_X_FORWARDED_PREFIX',
        ] as $headerConstant) {
            $constantName = Request::class.'::'.$headerConstant;
            if (defined($constantName)) {
                $proxyHeaders |= constant($constantName);
            }
        }

        $middleware->trustProxies(at: '*', headers: $proxyHeaders);

        // Global middleware
        $middleware->web(prepend: [
            \App\Http\Middleware\ForceHttps::class,
        ], append: [
            \App\Http\Middleware\CheckSessionTimeout::class,
            PreventBrowserHistory::class,
        ]);

        // Hapa tunasajili 'aliases' za middleware kwa ajili ya matumizi rahisi kwenye faili za 'routes'.
        $middleware->alias([
            'checkrole' => \App\Http\Middleware\CheckRole::class,
            'role' => \App\Http\Middleware\CheckRole::class, // Alias moja kwa role
            'employee' => \App\Http\Middleware\EmployeeMiddleware::class,
            'user.active' => \App\Http\Middleware\CheckUserStatus::class,
            'admin.hr' => \App\Http\Middleware\AdminHRMiddleware::class,
            'checksessiontimeout' => \App\Http\Middleware\CheckSessionTimeout::class,
            'session.timeout' => \App\Http\Middleware\CheckSessionTimeout::class, // Add this alias
            'customHeaders' => \App\Http\Middleware\AddHeaders::class, // <-- NEW ALIAS FOR HEADERS
        ]);
    })
    ->withExceptions(function (Exceptions $exceptions): void {
        //
    })->create();
