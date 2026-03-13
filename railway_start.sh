#!/usr/bin/env sh
set -eu

is_truthy() {
    value="${1:-}"
    value="$(echo "$value" | tr '[:upper:]' '[:lower:]' | tr -d '[:space:]')"
    [ "$value" = "1" ] || [ "$value" = "true" ] || [ "$value" = "yes" ] || [ "$value" = "on" ]
}

run_migrations_with_retry() {
    max_attempts="${1:-12}"
    delay_seconds="${2:-5}"

    attempt=1
    while [ "$attempt" -le "$max_attempts" ]; do
        if php artisan migrate --force; then
            return 0
        fi

        echo "Migration failed (attempt $attempt/$max_attempts). Retrying in ${delay_seconds}s..." >&2
        sleep "$delay_seconds"
        attempt=$((attempt + 1))
    done

    echo "Migrations failed after ${max_attempts} attempts." >&2
    return 1
}

should_run_migrations=false
if is_truthy "${SKIP_MIGRATIONS:-}"; then
    should_run_migrations=false
elif is_truthy "${RUN_MIGRATIONS:-}" || [ -n "${DATABASE_URL:-}" ] || [ -n "${MYSQL_URL:-}" ] || [ -n "${MYSQL_PUBLIC_URL:-}" ]; then
    should_run_migrations=true
fi

if [ "$should_run_migrations" = "true" ]; then
    echo "Running migrations (set SKIP_MIGRATIONS=true to disable)..." >&2
    run_migrations_with_retry "${MIGRATE_MAX_ATTEMPTS:-12}" "${MIGRATE_RETRY_DELAY:-5}"
fi

if is_truthy "${RUN_SEED:-}"; then
    echo "RUN_SEED enabled: running InitialSetupSeeder..." >&2
    if ! php artisan db:seed --class=InitialSetupSeeder --force; then
        echo "InitialSetupSeeder failed. Continuing..." >&2
    fi
fi

# Hatari: DatabaseSeeder inatruncate tables (sample data). Tumia kwenye DB mpya tu.
if is_truthy "${RUN_SAMPLE_DATA:-}"; then
    echo "RUN_SAMPLE_DATA enabled: running DatabaseSeeder (DESTRUCTIVE)..." >&2
    if ! php artisan db:seed --class=DatabaseSeeder --force; then
        echo "DatabaseSeeder failed. Continuing..." >&2
    fi
fi

if is_truthy "${RUN_CACHE:-}"; then
    echo "RUN_CACHE enabled: caching config/routes/views..." >&2
    php artisan config:cache
    php artisan route:cache
    php artisan view:cache
fi

exec php artisan serve --host=0.0.0.0 --port="${PORT:-8000}"
