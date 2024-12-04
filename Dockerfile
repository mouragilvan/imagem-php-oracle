FROM php:8.2-apache

# Adiciona o Oracle Instant Client
ADD /docker/oracle/instantclient-basic-linux.x64-11.2.0.4.0.tar.gz /usr/local
ADD /docker/oracle/instantclient-sdk-linux.x64-11.2.0.4.0.tar.gz /usr/local
ADD /docker/oracle/instantclient-sqlplus-linux.x64-11.2.0.4.0.tar.gz /usr/local

# Cria links simbólicos necessários
RUN ln -s /usr/local/instantclient_11_2 /usr/local/instantclient \
    && ln -s /usr/local/instantclient/libclntsh.so.* /usr/local/instantclient/libclntsh.so \
    && ln -s /usr/local/instantclient/lib* /usr/lib \
    # && ln -s /usr/local/instantclient/sqlplus /usr/bin/sqlplus \
    # && ln -s /usr/local/instantclient/sqlplus /usr/bin/sqlplus \
    && chmod 755 -R /usr/local/instantclient

# Instalação da biblioteca libaio /// 
RUN apt-get update \
    && apt-get install -y libaio1 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* 
    
RUN apt-get update \
    && apt-get install -y zip unzip libzip4 

RUN apt-get update && apt-get install -y iputils-ping

RUN apt update
RUN apt install git -y

# Configura a extensão OCI8
RUN docker-php-ext-configure oci8 --with-oci8=instantclient,/usr/local/instantclient
RUN docker-php-ext-install oci8

# Configura a extensão PDO OCI
RUN docker-php-ext-configure pdo_oci --with-pdo_oci=instantclient,/usr/local/instantclient
RUN docker-php-ext-install pdo_oci

WORKDIR /var/www/html

ENV COMPOSER_ALLOW_SUPERUSER=1

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer 

# Define as permissões adequadas para o Apache
RUN chown -R www-data:www-data /var/www/html