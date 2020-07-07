FROM php:7.4-fpm-alpine

RUN apk update && \
    apk add --update --no-cache libzip-dev \
    unzip \
    zip && \
    docker-php-ext-install \
    bcmath \
    pdo_mysql \
    zip

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

ENV COMPOSER_ALLOW_SUPERUSER 1
ENV COMPOSER_HOME /composer
ENV PATH $PATH:/composer/vendor/bin
RUN composer global require "laravel/installer"