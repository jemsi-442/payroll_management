# Dockerfile
FROM php:8.2-fpm

WORKDIR /var/www/html

RUN apt-get update && apt-get install -y \
    git \
    unzip \
    libzip-dev \
    libonig-dev \
    mariadb-client \
    && docker-php-ext-install pdo pdo_mysql mbstring zip

COPY . .

COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

RUN composer install --optimize-autoloader --no-dev

RUN php artisan key:generate

EXPOSE 8000

CMD php artisan serve --host=0.0.0.0 --port=8000