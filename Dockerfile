# Usamos la imagen oficial de PHP con Apache
FROM php:8.2-apache-bullseye

# 1. Habilitar mod_rewrite para Apache (común en apps PHP/Laravel/Slim)
RUN a2enmod rewrite

# 2. Instalar dependencias del sistema y limpiar caché de apt para reducir tamaño
RUN apt-get update && apt-get install -y \
    libpq-dev \
    unzip \
    git \
    curl \
    libssl-dev \
    libc-client-dev \
    libkrb5-dev \
    && rm -rf /var/lib/apt/lists/*

# 3. Configurar e instalar extensiones de PHP
# docker-php-ext-install crea automáticamente los archivos .ini necesarios
RUN docker-php-ext-configure imap --with-kerberos --with-imap-ssl \
    && docker-php-ext-install -j$(nproc) \
    imap \
    pdo \
    pdo_pgsql \
    pgsql

# 4. Instalar Composer de forma global
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# 5. Configurar el directorio de trabajo
WORKDIR /var/www/html

# 6. Copiar los archivos del proyecto al contenedor
COPY . /var/www/html/

# 7. Ejecutar Composer para instalar dependencias de PHP (si tienes un composer.json)
# Se usa --no-dev para producción y se optimiza el autoload
RUN if [ -f "composer.json" ]; then \
    composer install --no-dev --optimize-autoloader; \
    fi

# 8. Ajustar permisos para que Apache pueda leer/escribir correctamente
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html

# 9. Exponer el puerto 80 (puerto por defecto de Apache)
EXPOSE 80

# Apache se inicia automáticamente por la imagen base