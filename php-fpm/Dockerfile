FROM php:7.3-fpm

RUN apt update && \
    apt install -y \
    git \
    libicu-dev \
    libzip-dev \
    unzip \
    nginx \
    libjpeg62-turbo-dev \
    libpng-dev \
    && rm -rf /var/lib/apt/lists/*

RUN docker-php-ext-install calendar gd intl pdo_mysql zip opcache mysqli sockets exif
RUN docker-php-ext-enable opcache

COPY docker-php-ext-opcache.ini /usr/local/etc/php/conf.d
COPY general.ini /usr/local/etc/php/conf.d

ENV PHP_MEMORY_LIMIT=256M
ENV PHP_OPCACHE_MEMORY_CONSUMPTION=128

WORKDIR /var/www/html

RUN curl -sS https://getcomposer.org/installer | php -d memory_limit=-1 -- --install-dir=/usr/local/bin --filename=composer
RUN composer config --global process-timeout 6000
