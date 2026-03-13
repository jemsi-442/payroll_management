FROM php:8.3-fpm

# Install system dependencies
RUN apt-get update && apt-get install -y \
    libzip-dev \
    libpng-dev \
    libonig-dev \
    zip \
    unzip \
    git \
    curl \
    && docker-php-ext-install pdo_mysql zip gd

# Install Composer
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

WORKDIR /var/www/html

# Copy project
COPY . .

# Install dependencies
RUN composer install --optimize-autoloader --no-dev --ignore-platform-req=ext-gd

# Give permissions
RUN mkdir -p storage bootstrap/cache && chown -R www-data:www-data storage bootstrap/cache

RUN chmod +x railway_start.sh

EXPOSE 8000

USER www-data

CMD ["sh", "-c", "./railway_start.sh"]
