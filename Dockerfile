FROM php:8.2-apache-bookworm

# Habilitar mod_rewrite
RUN a2enmod rewrite

# Instalar dependencias del sistema 
RUN apt-get update && apt-get install -y \
    libpq-dev \
    unzip \
    git \
    curl \
    libssl-dev \
    libc-client-dev \
    libkrb5-dev \
    && rm -rf /var/lib/apt/lists/*

# Instalar extensiones PHP
RUN docker-php-ext-configure imap --with-kerberos --with-imap-ssl \
    && docker-php-ext-install -j$(nproc) \
    imap \
    pdo \
    pdo_pgsql \
    pgsql

# Instalar Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Directorio de trabajo
WORKDIR /var/www/html

# Copiar archivos y ejecutar composer si existe
COPY . /var/www/html/
RUN if [ -f "composer.json" ]; then composer install --no-dev --optimize-autoloader; fi

# Permisos correctos
RUN chown -R www-data:www-data /var/www/html

EXPOSE 80