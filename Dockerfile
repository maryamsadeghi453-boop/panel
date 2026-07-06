FROM php:8.1-apache

RUN docker-php-ext-install pdo pdo_mysql mysqli
RUN a2enmod rewrite

COPY . /var/www/html/

COPY start.sh /start.sh
RUN chmod +x /start.sh

CMD ["/start.sh"]
