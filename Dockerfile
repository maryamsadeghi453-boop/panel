FROM php:8.1-apache

RUN docker-php-ext-install pdo pdo_mysql mysqli
RUN a2enmod rewrite

# غیرفعال کردن MPMهای اضافی
RUN a2dismod mpm_event
RUN a2dismod mpm_worker
RUN a2enmod mpm_prefork

COPY . /var/www/html/

COPY start.sh /start.sh
RUN chmod +x /start.sh

CMD ["/start.sh"]
