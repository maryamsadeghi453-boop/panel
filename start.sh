#!/bin/bash

# حذف و نصب مجدد Apache با فقط یک MPM
apt-get update
apt-get install -y apache2
a2dismod mpm_event
a2dismod mpm_worker
a2enmod mpm_prefork

# تنظیم پورت Railway
sed -i "s/Listen 80/Listen ${PORT:-80}/g" /etc/apache2/ports.conf
sed -i "s/<VirtualHost \*:80>/<VirtualHost *:${PORT:-80}>/g" /etc/apache2/sites-available/000-default.conf

# اجرای Apache
apache2-foreground
