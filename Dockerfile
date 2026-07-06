FROM ubuntu:22.04

RUN apt-get update && apt-get install -y \
    apache2 \
    php \
    php-mysql \
    php-pdo \
    php-mysqli \
    curl \
    wget

RUN a2enmod rewrite

COPY . /var/www/html/

COPY start.sh /start.sh
RUN chmod +x /start.sh

CMD ["/start.sh"]
