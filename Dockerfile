# Dockerfile for Laravel 12 on PHP 8.4 with GD, Composer, and .env setup

# Step 1: Base image
FROM php:8.4-fpm

# Step 2: Set working directory
WORKDIR /var/www/html

# Step 3: Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    unzip \
    libzip-dev \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    curl \
    && docker-php-ext-install pdo_mysql mbstring zip exif pcntl bcmath gd

# Step 4: Install Composer
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

# Step 5: Copy project files
COPY . .

# Step 6: Copy .env.example to .env
RUN cp .env.example .env

# Step 7: Install PHP dependencies
RUN composer install --ignore-platform-req=ext-gd --optimize-autoloader --no-dev

# Step 8: Generate Laravel application key
RUN php artisan key:generate

# Step 9: Cache config/routes/views for better performance
RUN php artisan config:cache
RUN php artisan route:cache
RUN php artisan view:cache

# Step 10: Expose port
EXPOSE 8000

# Step 11: Start Laravel server
CMD ["php", "artisan", "serve", "--host=0.0.0.0", "--port=8000"]