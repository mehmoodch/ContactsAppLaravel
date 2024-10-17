# Use official PHP image as base
FROM php:8.2-fpm

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
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd pdo pdo_mysql

# Install Composer
COPY --from=composer:2.0 /usr/bin/composer /usr/bin/composer

# Copy application code
COPY . .

# Install application dependencies
RUN composer install --optimize-autoloader --no-dev

# Expose port 5000 and start php-fpm server
EXPOSE 5000

CMD ["php", "artisan", "serve", "--host=0.0.0.0", "--port=8000"]
