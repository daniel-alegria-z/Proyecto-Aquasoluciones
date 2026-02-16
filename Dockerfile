FROM php:8.2-apache-bullseye

# Habilitar mod_rewrite
RUN a2enmod rewrite

# Instalar dependencias del sistema
RUN apt-get update && apt-get install -y \
    libpq-dev \
    unzip \
    git \
    curl \
    libc-client-dev \
    libssl-dev \
    libkrb5-dev

# Instalar extensiones PHP
RUN docker-php-ext-configure imap --with-kerberos --with-imap-ssl \
    && docker-php-ext-install -j$(nproc) \
        imap \
        pdo \
        pdo_pgsql \
        pgsql

# Renovar php.ini si es necesario
RUN echo "extension=pdo_pgsql.so" > /usr/local/etc/php/conf.d/pdo_pgsql.ini

# Instalar Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Copiar archivos del proyecto
COPY . /var/www/html/

# Cambiar permisos
RUN chown -R www-data:www-data /var/www/html

# Establecer directorio de trabajo y ejecutar Composer
WORKDIR /var/www/html
RUN composer install --no-dev --optimize-autoloader

# Exponer el puerto 80 para Apache
EXPOSE 80