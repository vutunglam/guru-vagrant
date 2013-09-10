#!/bin/bash

set -e

apt-get -y update
apt-get -y install \
	default-jre-headless \
	nginx \
	php-apc \
	php5 \
	php5-cli \
	php5-curl \
	php5-dev \
	php5-fpm \
	php5-intl \
	php5-mcrypt \
	php5-memcache \
	php5-mysql \
	php5-sqlite \
	php5-mongo \
	php5-gd \
	git \
	phpunit

[ -d /var/www ] || mkdir -p /var/www

INSTALL="ln -sfbn"

#${INSTALL} -t /etc/nginx                                /vagrant/data/conf/nginx/{nginx.conf,mime.types}
${INSTALL} -t /etc/nginx/sites-enabled                  /vagrant/conf/nginx/sites-enabled/*
#${INSTALL} -T /vagrant/data/conf/fpm/fpm-guru-dev.conf  /etc/php5/fpm/php-fpm.conf
#${INSTALL} -T /vagrant                                  /var/www/guru

service php5-fpm restart
service nginx restart
