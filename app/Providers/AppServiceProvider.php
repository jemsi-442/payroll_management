<?php

namespace App\Providers;

use Illuminate\Cache\RateLimiting\Limit;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\RateLimiter;
use Illuminate\Support\Facades\URL;
use Illuminate\Support\ServiceProvider;
use Illuminate\Support\Str;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
        //
    }

    /**
     * Bootstrap any application services.
     */
    public function boot(): void
    {
        if (config('app.force_https')) {
            URL::forceScheme('https');
        }

        RateLimiter::for('login', function (Request $request) {
            $email = Str::lower((string) $request->input('email', ''));

            return Limit::perMinute(config('app.login_rate_limit_per_minute', 5))
                ->by($email.'|'.$request->ip());
        });

        RateLimiter::for('password-reset', function (Request $request) {
            $email = Str::lower((string) $request->input('email', ''));

            return Limit::perMinute(config('app.password_reset_rate_limit_per_minute', 3))
                ->by($email.'|'.$request->ip());
        });
    }
}
