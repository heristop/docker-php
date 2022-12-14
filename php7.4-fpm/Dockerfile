FROM php:7.4-fpm

# Install minimum configuration
RUN apt update -y && \
    apt-get autoremove -y && \
    apt-get install --no-install-recommends -y \
    apt-utils \
    git \
    gnupg \
    autoconf \
    openssl \
	zip unzip \
    libzip-dev libpq-dev libfreetype6-dev libjpeg62-turbo-dev libpng-dev libicu-dev libfontconfig1 libxrender1 libssh2-1-dev libssh2-1 libonig-dev zlib1g-dev libzip-dev libcurl3-openssl-dev libxml2-dev && \
    rm -rf /var/lib/apt/lists/* && \
    # Install PHP extensions
    docker-php-ext-install pdo pdo_pgsql pdo_mysql && \
    docker-php-ext-configure gd --with-freetype=/usr/include/ --with-jpeg=/usr/include/ && \
    docker-php-ext-install -j$(nproc) gd && \
    docker-php-ext-install bcmath calendar exif gettext intl mbstring mysqli pcntl pgsql shmop soap sockets zip && \
    pecl install apcu pcov xdebug-3.1.4 && \
    docker-php-ext-enable apcu pcov xdebug && \
    docker-php-ext-install opcache && \
    docker-php-source delete && \
    # Install Composer
    curl -sS https://getcomposer.org/installer | php && \
    mv composer.phar /usr/local/bin/composer && \
	# Fix Permissions
    usermod -u 1000 www-data

# Copy extension configs
COPY xdebug.ini /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
COPY pcov.ini /usr/local/etc/php/conf.d/docker-php-ext-pcov.ini
COPY opcache.ini /usr/local/etc/php/conf.d/docker-php-ext-opcache.ini

WORKDIR /var/www/apps

COPY entrypoint.sh /entrypoint
RUN chmod +x /entrypoint


