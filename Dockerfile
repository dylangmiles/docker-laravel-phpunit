FROM debian:jessie

MAINTAINER "Dylan Miles" <dylan.g.miles@gmail.com>

WORKDIR /tmp

RUN apt-get update -y \
    && apt-get install -y \
    php5-cli \
    php5-mongo \
    php5-mssql \
    php5-mysqlnd \
    php5-pgsql \
    php5-redis \
    php5-sqlite \
    php5-gd \
    php5-mcrypt \
    php5-tidy \
    php5-curl \
    wget && \
    wget https://phar.phpunit.de/phpunit.phar && \
    apt-get remove -y wget && \
    rm -rf /var/lib/apt/lists/* && \
    chmod +x phpunit.phar && \
    mv phpunit.phar /usr/local/bin/phpunit

RUN mkdir -p /data/www
VOLUME ["/data"]
WORKDIR /data/www

ENTRYPOINT ["phpunit"]
