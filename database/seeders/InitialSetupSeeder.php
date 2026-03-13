<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Schema;

class InitialSetupSeeder extends Seeder
{
    public function run(): void
    {
        $now = now();

        if (Schema::hasTable('roles')) {
            foreach ([
                ['name' => 'admin', 'slug' => 'admin'],
                ['name' => 'hr manager', 'slug' => 'hr'],
                ['name' => 'employee', 'slug' => 'employee'],
                ['name' => 'manager', 'slug' => 'manager'],
            ] as $role) {
                DB::table('roles')->updateOrInsert(
                    ['slug' => $role['slug']],
                    ['name' => $role['name'], 'updated_at' => $now, 'created_at' => $now]
                );
            }
        }

        if (Schema::hasTable('departments')) {
            foreach ([
                ['name' => 'Operations', 'description' => 'Operations Department'],
                ['name' => 'HR', 'description' => 'Human Resources Department'],
                ['name' => 'Finance', 'description' => 'Finance Department'],
                ['name' => 'IT', 'description' => 'Information Technology Department'],
                ['name' => 'Marketing', 'description' => 'Marketing Department'],
            ] as $department) {
                DB::table('departments')->updateOrInsert(
                    ['name' => $department['name']],
                    ['description' => $department['description'], 'updated_at' => $now, 'created_at' => $now]
                );
            }
        }

        if (Schema::hasTable('banks')) {
            foreach ([
                ['name' => 'CRDB Bank', 'code' => 'CRDB', 'swift_code' => 'CORUTZTZ'],
                ['name' => 'NMB Bank', 'code' => 'NMB', 'swift_code' => 'NMBTZTXZ'],
                ['name' => 'NBC Bank', 'code' => 'NBC', 'swift_code' => 'NLCBTZTX'],
                ['name' => 'Stanbic Bank', 'code' => 'STANBIC', 'swift_code' => 'SBICTZTX'],
                ['name' => 'Exim Bank', 'code' => 'EXIM', 'swift_code' => 'EXIMTZTX'],
            ] as $bank) {
                DB::table('banks')->updateOrInsert(
                    ['code' => $bank['code']],
                    ['name' => $bank['name'], 'swift_code' => $bank['swift_code'], 'updated_at' => $now, 'created_at' => $now]
                );
            }
        }

        if (! Schema::hasTable('employees')) {
            return;
        }

        $defaultAdminEmail = env('DEFAULT_ADMIN_EMAIL', 'admin@payroll.com');
        $defaultAdminPassword = env('DEFAULT_ADMIN_PASSWORD', 'password');
        $defaultHrEmail = env('DEFAULT_HR_EMAIL', 'hr@payroll.com');
        $defaultHrPassword = env('DEFAULT_HR_PASSWORD', 'password');

        $resetAdminPassword = filter_var(env('RESET_ADMIN_PASSWORD', false), FILTER_VALIDATE_BOOLEAN);
        $resetHrPassword = filter_var(env('RESET_HR_PASSWORD', false), FILTER_VALIDATE_BOOLEAN);

        $this->upsertEmployee(
            email: $defaultAdminEmail,
            employeeId: 'EMP-ADMIN',
            name: env('DEFAULT_ADMIN_NAME', 'Admin User'),
            password: $defaultAdminPassword,
            role: 'admin',
            department: 'Operations',
            position: 'System Administrator',
            baseSalary: 0,
            shouldResetPassword: $resetAdminPassword
        );

        $this->upsertEmployee(
            email: $defaultHrEmail,
            employeeId: 'EMP-HR',
            name: env('DEFAULT_HR_NAME', 'HR Manager'),
            password: $defaultHrPassword,
            role: 'hr',
            department: 'HR',
            position: 'HR Manager',
            baseSalary: 0,
            shouldResetPassword: $resetHrPassword
        );
    }

    private function upsertEmployee(
        string $email,
        string $employeeId,
        string $name,
        string $password,
        string $role,
        string $department,
        string $position,
        float|int $baseSalary,
        bool $shouldResetPassword
    ): void {
        $now = now();

        $existing = DB::table('employees')->where('email', $email)->first();

        if ($existing) {
            $update = [
                'name' => $name,
                'department' => $department,
                'role' => $role,
                'position' => $position,
                'base_salary' => $baseSalary,
                'status' => 'active',
                'updated_at' => $now,
            ];

            if ($shouldResetPassword) {
                $update['password'] = Hash::make($password);
            }

            DB::table('employees')->where('id', $existing->id)->update($update);

            return;
        }

        DB::table('employees')->insert([
            'employee_id' => $employeeId,
            'name' => $name,
            'email' => $email,
            'password' => Hash::make($password),
            'department' => $department,
            'role' => $role,
            'position' => $position,
            'base_salary' => $baseSalary,
            'allowances' => 0,
            'deductions' => 0,
            'status' => 'active',
            'hire_date' => $now->toDateString(),
            'created_at' => $now,
            'updated_at' => $now,
        ]);
    }
}

