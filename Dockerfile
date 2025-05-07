FROM php:8.2-apache

# Instalar dependencias necesarias para PostgreSQL
RUN apt-get update && apt-get install -y \
    libpq-dev \
    && docker-php-ext-install pgsql pdo_pgsql

# Copiar archivos al directorio del servidor web
COPY . /var/www/html/

# Dar permisos a los archivos (opcional pero recomendable)
RUN chown -R www-data:www-data /var/www/html

# Exponer el puerto
EXPOSE 80
