<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;

class CheckRole
{
    public function handle(Request $request, Closure $next, ...$roles)
    {
        if (!auth()->check()) {
            return redirect()->route('login');
        }

        $userRoleRaw = strtolower(trim((string) (auth()->user()->role ?? 'employee')));

        $roleAliases = [
            'administrator' => 'admin',
            'hr manager' => 'hr',
            'human resources' => 'hr',
            'human resource' => 'hr',
        ];

        $userRole = $roleAliases[$userRoleRaw] ?? $userRoleRaw;

        $allowedRoles = array_map(function ($role) use ($roleAliases) {
            $normalized = strtolower(trim((string) $role));
            return $roleAliases[$normalized] ?? $normalized;
        }, $roles);
        
        // Check if user has any of the required roles
        if (!in_array($userRole, $allowedRoles, true)) {
            abort(403, 'Unauthorized access.');
        }

        return $next($request);
    }
}
