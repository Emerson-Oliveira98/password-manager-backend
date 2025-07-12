FROM php:7.4-apache

WORKDIR /var/www/html
COPY index.php /var/www/html/
COPY add_credential.php /var/www/html/
COPY config.php /var/www/html/
COPY dashboard.php /var/www/html/
COPY logout.php /var/www/html/
COPY register.php /var/www/html/
COPY style.css /var/www/html/

RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-install pdo_mysql \
    && docker-php-ext-install mysqli


EXPOSE 80