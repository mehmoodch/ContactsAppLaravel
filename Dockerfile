# Use official PHP image as base
FROM php:8.1-fpm

# Set working directory
WORKDIR /var/www

# Install system dependencies
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg62-turbo-dev \
    libfreetype6-dev \
    zip \
    unzip \
    git \
    curl \
    mariadb-client # MySQL client to enable app to interact with MySQL server

# Install PHP extensions
RUN docker-php-ext-install pdo pdo_mysql gd

# Install Composer
COPY --from=composer:2.0 /usr/bin/composer /usr/bin/composer

# Copy application code
COPY . .

# Install application dependencies
RUN composer install --optimize-autoloader --no-dev

# Expose the port your Laravel app will run on
EXPOSE 5000

# Start Laravel server (Change port if needed)
CMD ["php", "artisan", "serve", "--host=0.0.0.0", "--port=8000"]
