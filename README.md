# Proyecto Aquasoluciones

Sistema web en PHP para la gestion y difusion de los servicios de Aquasoluciones. Incluye paginas informativas, autenticacion con roles, registro de usuarios y un esquema SQL para inicializar la base de datos.

## Caracteristicas principales

1. Estructura ordenada
   - Separacion entre paginas publicas, logica PHP y recursos estaticos.
   - Directorios pensados para crecer sin mezclar responsabilidades.

2. Autenticacion y roles
   - Inicio de sesion con control de acceso por rol.
   - Redireccion ante accesos no autorizados.

3. CRUD basico
   - Formularios para registro de administradores y supervisores.
   - Validaciones minimas del lado del servidor.

4. Frontend responsivo
   - HTML, CSS y JS con recursos centralizados en `assets/`.

5. Despliegue con Docker
   - Dockerfile listo para construir la imagen del proyecto.

---

## Estructura del proyecto

```text
PHP-Docker/
├── app/                    # Vistas PHP de acceso protegido
│   ├── iniciar_sesion.php
│   ├── registroadmin.php
│   └── registrosuperv.php
├── pages/                  # Paginas publicas (HTML)
│   ├── index.html
│   ├── acerca.html
│   ├── servicios.html
│   └── desautorizado.html
├── controllers/            # Logica PHP (auth, CRUD, etc.)
├── includes/               # Fragmentos compartidos (forms, footer, etc.)
├── conexionBD/             # Conexion a base de datos
│   └── conexion.php
├── db/                     # Esquemas SQL
│   └── aquasoluciones.sql
├── assets/                 # CSS, JS e imagenes
├── composer.json
├── composer.lock
└── Dockerfile
```

---

## Instalacion y configuracion

### 1. Clonar el repositorio
```bash
git clone https://github.com/daniel-alegria-z/Proyecto-Aquasoluciones.git
cd Proyecto-Aquasoluciones
```

### 2. Instalar dependencias (Composer)
```bash
composer install
```

### 3. Configurar base de datos (MySQL/MariaDB)
1. Crea la base de datos:
   ```sql
   CREATE DATABASE aquasoluciones CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
   ```
2. Importa el esquema:
   ```bash
   mysql -u TU_USUARIO -p aquasoluciones < db/aquasoluciones.sql
   ```
3. Ajusta credenciales en `conexionBD/conexion.php` o usa variables de entorno.

Ejemplo de parametros (ajusta a tu entorno):
```php
$host = 'localhost';
$user = 'usuario';
$pass = 'contrasena';
$db   = 'aquasoluciones';
```

---

## Ejecucion

### Local con PHP embebido
```bash
php -S localhost:8000 -t .
```
Luego abre `http://localhost:8000/pages/index.html`.

### Con Docker
```bash
docker build -t aquasoluciones:latest .
```

```bash
docker run --name aquasoluciones \
  -p 8080:80 \
  -e DB_HOST=tu_host \
  -e DB_USER=tu_usuario \
  -e DB_PASS=tu_contrasena \
  -e DB_NAME=aquasoluciones \
  aquasoluciones:latest
```

---

## Rutas principales

- Paginas publicas: `/pages/index.html`, `/pages/acerca.html`, `/pages/servicios.html`
- Inicio de sesion: `/app/iniciar_sesion.php`
- Acceso denegado: `/pages/desautorizado.html`

---

## Tecnologias utilizadas

- Backend: PHP
- Base de datos: MySQL/MariaDB
- Frontend: HTML, CSS, JavaScript
- Dependencias: Composer
- Contenedores: Docker

---

## Buenas practicas

1. Separacion de responsabilidades
   - Publico, protegido y logica en carpetas distintas.

2. Control de acceso
   - Roles con redireccion automatica.

3. Recursos estaticos centralizados
   - `assets/` para estilos, imagenes y scripts.

---

## Contribucion

1. Haz un fork del repositorio.
2. Crea una rama: `git checkout -b feature/nueva-funcionalidad`.
3. Implementa cambios y, si aplica, agrega pruebas.
4. Abre un Pull Request con objetivo, alcance e impacto.

---

## Licencia

Este proyecto no declara licencia por defecto. Considera agregar un archivo `LICENSE`.

---

## Autor

- Daniel Esteban Alegria Zamora — https://github.com/daniel-alegria-z
