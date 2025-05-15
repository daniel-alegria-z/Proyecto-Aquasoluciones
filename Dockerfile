FROM php:8.2-apache

# Instalar dependencias necesarias para PostgreSQL
RUN apt-get update && apt-get install -y \
    libpq-dev unzip git curl \
    && docker-php-ext-install pgsql pdo_pgsql

# Instalar Composer manualmente
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Copiar archivos al directorio del servidor web
COPY . /var/www/html/

# Dar permisos a los archivos
RUN chown -R www-data:www-data /var/www/html

# Ejecutar Composer
WORKDIR /var/www/html
RUN composer install --no-dev --optimize-autoloader

# Exponer el puerto
EXPOSE 80
