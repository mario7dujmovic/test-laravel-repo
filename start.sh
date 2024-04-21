#!/bin/bash

source /var/www/html/.env
source /etc/apache2/envvars
apache2 -D FOREGROUND -e debug
