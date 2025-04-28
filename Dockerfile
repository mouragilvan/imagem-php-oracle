FROM php:8.2-fpm-alpine

ENV LD_LIBRARY_PATH="/opt/oracle/instantclient_21_12"
ENV PATH="$PATH:$LD_LIBRARY_PATH"

COPY --from=composer/composer:latest-bin /composer /usr/bin/composer

RUN apk update && \
    apk upgrade && \
    apk add --no-cache \
    apache2 apache2-proxy \
    php82-fpm php82-session php82-gd \
    libjpeg-turbo-dev \
    libpng-dev \
    libwebp-dev \
    libzip-dev \
    freetype-dev \
    libaio \
    gcompat \
    libnsl \
    libc6-compat \ 
    autoconf \ 
    g++ \ 
    make \ 
    supervisor && \
    ln -s /usr/lib/libnsl.so.2 /usr/lib/libnsl.so.1 && \
    ln -s /lib/libc.so.6 /usr/lib/libresolv.so.2 

ADD docker/oracle/instantclient_21_12_basic.tar.gz /opt/oracle
ADD docker/oracle/instantclient_21_12_sdk.tar.gz /opt/oracle
ADD docker/oracle/instantclient_21_12_sqlplus.tar.gz /opt/oracle

RUN docker-php-ext-install zip && \
    docker-php-ext-configure gd --with-freetype --with-jpeg && \ 
    docker-php-ext-install gd && \
    docker-php-ext-configure oci8 --with-oci8="instantclient,$LD_LIBRARY_PATH" && \
    docker-php-ext-install oci8 && \
    docker-php-ext-configure pdo_oci --with-pdo_oci="instantclient,$LD_LIBRARY_PATH" && \
    docker-php-ext-install pdo_oci

COPY supervisord.conf /etc/supervisord.conf
COPY apache.conf /etc/apache2/conf.d/apache.conf

WORKDIR /var/www/html

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]

EXPOSE 80