FROM php:7.4.20-alpine3.14

RUN apk add --no-cache shadow openssl bash mysql-client nodejs npm git $PHPIZE_DEPS
RUN pecl install redis
RUN docker-php-ext-enable redis.so
RUN docker-php-ext-install pdo pdo_mysql 

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN usermod -u 1000 www-data

WORKDIR /var/www/html

USER www-data