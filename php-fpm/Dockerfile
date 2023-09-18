FROM php:8.2-fpm

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

WORKDIR /var/www/html

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN composer config --global process-timeout 6000
