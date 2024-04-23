#!/bin/bash

source /var/www/html/.env
source /etc/apache2/envvars
cd /var/www/html
php artisan route:clear
php artisan route:cache
apache2 -D FOREGROUND -e debug
