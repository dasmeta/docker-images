FROM php:8.2-fpm

# Upgrade system packages to latest versions to reduce vulnerabilities
RUN apt-get update && apt-get upgrade -y && apt-get install -y \
    git \
    libicu-dev \
    libzip-dev \
    unzip \
    nginx \
    libjpeg62-turbo-dev \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    jpegoptim optipng pngquant gifsicle \
    gcc make autoconf libc-dev pkg-config libmagickwand-dev \
    default-mysql-client \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd calendar intl pdo_mysql zip opcache mysqli sockets exif \
    && docker-php-ext-enable gd calendar intl pdo_mysql zip opcache mysqli sockets exif \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN pecl install redis && echo "extension=redis.so" > /usr/local/etc/php/conf.d/redis.ini
RUN pecl install imagick && echo "extension=imagick.so" > /usr/local/etc/php/conf.d/imagick.ini

COPY docker-php-ext-opcache.ini /usr/local/etc/php/conf.d
COPY general.ini /usr/local/etc/php/conf.d

ENV PHP_MEMORY_LIMIT=256M
ENV PHP_OPCACHE_MEMORY_CONSUMPTION=128

WORKDIR /var/www/html

RUN curl -sS https://getcomposer.org/installer | php -d memory_limit=-1 -- --install-dir=/usr/local/bin --filename=composer
RUN composer config --global process-timeout 6000
