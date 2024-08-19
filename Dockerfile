FROM debian:12

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y apt-transport-https lsb-release ca-certificates curl gnupg

RUN curl -fsSLo /usr/share/keyrings/deb.sury.org-php.gpg https://packages.sury.org/php/apt.gpg
RUN echo "deb [signed-by=/usr/share/keyrings/deb.sury.org-php.gpg] https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list

RUN curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | gpg --dearmor -o /usr/share/keyrings/nodesource.gpg
RUN echo "deb [signed-by=/usr/share/keyrings/nodesource.gpg] https://deb.nodesource.com/node_16.x nodistro main" > /etc/apt/sources.list.d/nodesource.list


RUN apt-get update
RUN apt-get install curl
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y \
    build-essential \
    git \
    nodejs \
    npm \
    php8.1 \
    php8.1-common \
    php8.1-curl \
    php8.1-ds \
    php8.1-gd \
    php8.1-intl \
    php8.1-mbstring \
    php8.1-mysql \
    php8.1-opcache \
    php8.1-pgsql \
    php8.1-redis \
    php8.1-sqlite3 \
    php8.1-tokenizer \
    php8.1-xml \
    php8.1-zip \
    php-pear \
    php8.1-redis \
    php8.1-dev \ 
    zip

RUN pecl install swoole-5.1.2 && echo "extension=swoole.so" > /etc/php/8.1/cli/conf.d/20-swoole.ini 
RUN npm install -g yarn

RUN curl -L "https://getcomposer.org/download/latest-2.x/composer.phar" > /usr/local/bin/composer && chmod 755 /usr/local/bin/composer

