#!/bin/sh

if [ "${PHP_XDEBUG_ENABLED}" = 0 ]; then
  sed -i 's/zend_extension/;zend_extension/' /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
elif [ "${PHP_XDEBUG_ENABLED}" = 1 ]; then
  sed -i 's/;zend_extension/zend_extension/' /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
fi

if [ "${PHP_PCOV_ENABLED}" = 0 ]; then
  sed -i 's/extension/;extension/' /usr/local/etc/php/conf.d/docker-php-ext-pcov.ini
elif [ "${PHP_PCOV_ENABLED}" = 1 ]; then
  sed -i 's/;extension/extension/' /usr/local/etc/php/conf.d/docker-php-ext-pcov.ini
fi
