FROM debian:12

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y apt-transport-https lsb-release ca-certificates curl gnupg

RUN curl -fsSLo /usr/share/keyrings/deb.sury.org-php.gpg https://packages.sury.org/php/apt.gpg
RUN echo "deb [signed-by=/usr/share/keyrings/deb.sury.org-php.gpg] https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list

RUN curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | gpg --dearmor -o /usr/share/keyrings/nodesource.gpg
RUN echo "deb [signed-by=/usr/share/keyrings/nodesource.gpg] https://deb.nodesource.com/node_16.x nodistro main" > /etc/apt/sources.list.d/nodesource.list


RUN apt-get update
RUN apt-get install curl
RUN apt-get install -y cron 
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y \
    build-essential \
    git \
    nodejs \
    npm \
    php8.2 \
    php8.2-common \
    php8.2-curl \
    php8.2-ds \
    php8.2-gd \
    php8.2-intl \
    php8.2-mbstring \
    php8.2-mysql \
    php8.2-opcache \
    php8.2-pgsql \
    php8.2-redis \
    php8.2-sqlite3 \
    php8.2-tokenizer \
    php8.2-xml \
    php8.2-zip \
    php-pear \
    php8.2-redis \
    php8.2-dev \ 
    zip 

RUN pecl install swoole-5.1.2 && echo "extension=swoole.so" > /etc/php/8.2/cli/conf.d/20-swoole.ini 
RUN npm install -g yarn
# FROM lutfika/nevertary:php8.2-node16
RUN ln -fs /usr/share/zoneinfo/Asia/Jakarta /etc/localtime && \
dpkg-reconfigure -f noninteractive tzdata
RUN echo "openssl_conf = openssl_init\n\n[openssl_init]\nssl_conf = ssl_sect\n\n[ssl_sect]\nsystem_default = system_default_sect\n\n[system_default_sect]\nOptions = UnsafeLegacyServerConnect" | tee -a /etc/ssl/openssl.cnf

RUN curl -L "https://getcomposer.org/download/latest-2.x/composer.phar" > /usr/local/bin/composer && chmod 755 /usr/local/bin/composer

