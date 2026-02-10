# Proyecto Aquasoluciones

Sistema web desarrollado en PHP para la gestión y difusión de los servicios de Aquasoluciones. Incluye páginas informativas, autenticación básica, registro de usuarios (p. ej., administradores y supervisores), y un esquema SQL para inicializar la base de datos.

Inspirado en el estilo y estructura del README de “DesarrolloWeb-Django”, adaptado al stack y componentes de este proyecto.

## Características principales

1. Arquitectura clara
   - Separación entre páginas públicas (HTML/CSS/JS), lógica de autenticación (PHP) y conexión a base de datos (MySQL/MariaDB).
   - Estructura orientada a escalabilidad y mantenimiento.

2. Autenticación y roles
   - Inicio de sesión con control de acceso según rol.
   - Redirección automática ante accesos no autorizados.

3. CRUD básico de usuarios
   - Formularios para registro de administradores y supervisores.
   - Validaciones mínimas del lado del servidor.

4. Frontend responsivo
   - HTML, CSS y JS para una experiencia amigable.
   - Recursos estáticos centralizados en `assets/`.

5. Despliegue con Docker (base)
   - Dockerfile para construir una imagen del proyecto.
   - Variables de entorno para configurar la base de datos en contenedores.

---

## Estructura del proyecto

```text
Proyecto-Aquasoluciones/
├── index.html                 # Landing principal
├── servicios.html             # Página de servicios
├── acerca.html                # Página "Acerca de"
├── desautorizado.html         # Vista para accesos no autorizados
├── iniciar_sesion.php         # Inicio de sesión
├── registroadmin.php          # Registro de administradores
├── registrosuperv.php         # Registro de supervisores
├── aquasoluciones.sql         # Esquema de base de datos (MySQL/MariaDB)
├── conexionBD/
│   └── conexion.php           # Conexión a la base de datos
├── controller/                # Controladores / lógica en PHP (si aplica)
├── includes/                  # Includes / fragmentos compartidos (si aplica)
├── assets/                    # Recursos estáticos (imágenes, estilos, JS)
├── composer.json              # Dependencias PHP (Composer)
├── composer.lock              # Bloqueo de dependencias
└── Dockerfile                 # Imagen Docker para despliegue
```

Archivos y directorios principales:
- [index.html](https://github.com/daniel-alegria-z/Proyecto-Aquasoluciones/blob/main/index.html)
- [servicios.html](https://github.com/daniel-alegria-z/Proyecto-Aquasoluciones/blob/main/servicios.html)
- [acerca.html](https://github.com/daniel-alegria-z/Proyecto-Aquasoluciones/blob/main/acerca.html)
- [desautorizado.html](https://github.com/daniel-alegria-z/Proyecto-Aquasoluciones/blob/main/desautorizado.html)
- [iniciar_sesion.php](https://github.com/daniel-alegria-z/Proyecto-Aquasoluciones/blob/main/iniciar_sesion.php)
- [registroadmin.php](https://github.com/daniel-alegria-z/Proyecto-Aquasoluciones/blob/main/registroadmin.php)
- [registrosuperv.php](https://github.com/daniel-alegria-z/Proyecto-Aquasoluciones/blob/main/registrosuperv.php)
- [aquasoluciones.sql](https://github.com/daniel-alegria-z/Proyecto-Aquasoluciones/blob/main/aquasoluciones.sql)
- [conexionBD/conexion.php](https://github.com/daniel-alegria-z/Proyecto-Aquasoluciones/blob/main/conexionBD/conexion.php)
- [assets/](https://github.com/daniel-alegria-z/Proyecto-Aquasoluciones/tree/main/assets)
- [controller/](https://github.com/daniel-alegria-z/Proyecto-Aquasoluciones/tree/main/controller)
- [includes/](https://github.com/daniel-alegria-z/Proyecto-Aquasoluciones/tree/main/includes)
- [Dockerfile](https://github.com/daniel-alegria-z/Proyecto-Aquasoluciones/blob/main/Dockerfile)
- [composer.json](https://github.com/daniel-alegria-z/Proyecto-Aquasoluciones/blob/main/composer.json)
- [composer.lock](https://github.com/daniel-alegria-z/Proyecto-Aquasoluciones/blob/main/composer.lock)

---

## Instalación y configuración

### 1. Clonar el repositorio
```bash
git clone https://github.com/daniel-alegria-z/Proyecto-Aquasoluciones.git
cd Proyecto-Aquasoluciones
```

### 2. Instalar dependencias (Composer)
Si el proyecto requiere paquetes PHP, instala:
```bash
composer install
```

### 3. Configurar la base de datos (MySQL/MariaDB)
1. Crea una base de datos, por ejemplo:
   ```sql
   CREATE DATABASE aquasoluciones CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
   ```
2. Importa el esquema:
   ```bash
   mysql -u TU_USUARIO -p aquasoluciones < aquasoluciones.sql
   ```
3. Actualiza credenciales en `conexionBD/conexion.php` (host, usuario, contraseña y nombre de BD). Si usas variables de entorno, configúralas y léelas desde PHP.

Ejemplo de parámetros (ajústalos a tu entorno):
```php
$host = 'localhost';
$user = 'usuario';
$pass = 'contraseña';
$db   = 'aquasoluciones';
```

---

## Ejecución

### Ejecución local (PHP embebido)
```bash
php -S localhost:8000 -t .
```
Visita `http://localhost:8000`.

Con Apache/Nginx, configura el DocumentRoot al directorio del proyecto y habilita PHP.

### Ejecución con Docker
Construye la imagen:
```bash
docker build -t aquasoluciones:latest .
```

Ejecuta el contenedor (ajusta puertos y variables):
```bash
docker run --name aquasoluciones \
  -p 8080:80 \
  -e DB_HOST=tu_host \
  -e DB_USER=tu_usuario \
  -e DB_PASS=tu_contraseña \
  -e DB_NAME=aquasoluciones \
  aquasoluciones:latest
```

---

## Apartados principales

1. Inicio
   - Página principal del sitio: información general y navegación.

2. Servicios
   - Descripción de los servicios que ofrece Aquasoluciones.

3. Autenticación
   - Inicio de sesión de usuarios.
   - Control de acceso por roles.

4. Registro de usuarios
   - Formularios para alta de administradores y supervisores.

5. Accesos no autorizados
   - Vista dedicada para intentos de acceso sin permisos.

---

## Tecnologías utilizadas

- Backend: PHP
- Base de datos: MySQL/MariaDB
- Frontend: HTML, CSS, JavaScript
- Dependencias: Composer
- Contenedores: Docker (Dockerfile)

Composición aproximada del código:
- PHP ~73.5%
- CSS ~15.7%
- HTML ~7.3%
- JavaScript ~3.2%
- Dockerfile ~0.3%

---

## Buenas prácticas implementadas

1. Separación de responsabilidades
   - Páginas públicas, lógica de autenticación y conexión a BD en módulos claros.

2. Seguridad básica
   - Control de acceso basado en roles.
   - Redirección en caso de acceso no autorizado.

3. Recursos estáticos centralizados
   - `assets/` para estilos, imágenes y scripts.

4. Configuración externa
   - Posibilidad de variables de entorno para credenciales y parámetros de despliegue.

---

## Contribución

1. Haz un fork del repositorio.
2. Crea una rama de feature: `git checkout -b feature/nueva-funcionalidad`.
3. Implementa cambios y, si aplica, añade pruebas.
4. Abre un Pull Request describiendo objetivo, alcance e impacto.

---

## Licencia

Este proyecto no declara una licencia por defecto. Considera agregar una licencia (por ejemplo, MIT) en `LICENSE`.

---

## Autor

- Daniel Esteban Alegría Zamora — [Perfil](https://github.com/daniel-alegria-z)
