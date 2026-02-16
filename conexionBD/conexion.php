<?php
class ConexionBD {
    function conexionBD() {
        // Obtenemos la URL de Render
        $databaseUrl = getenv("DATABASE_URL");
        
        if ($databaseUrl) {
            try {
                // 1. Desglosar la URL
                $dbopts = parse_url($databaseUrl);
                
                $host = $dbopts['host'];
                $user = $dbopts['user'];
                $pass = $dbopts['pass'];
                $port = $dbopts['port'] ?? 5432;
                
                // Limpiar el nombre de la BD de parámetros extras (?sslmode=...)
                $path = ltrim($dbopts['path'], '/');
                $dbname = explode('?', $path)[0];

                // 2. Extraer el ID del Endpoint de Neon
                // Si el host es 'ep-light-fire-a5v.us-east-2.aws.neon.tech'
                // El endpoint es 'ep-light-fire-a5v'
                $endpointId = explode('.', $host)[0];
                
                // NOTA: Si el host tiene '-pooler', Neon prefiere el ID sin esa palabra
                $endpointId = str_replace('-pooler', '', $endpointId);

                // 3. Construir DSN (Data Source Name)
                // Usamos sslmode=require y pasamos el endpoint en las options
                $dsn = "pgsql:host=$host;port=$port;dbname=$dbname;sslmode=require;options='-c endpoint=$endpointId'";

                $conn = new PDO($dsn, $user, $pass, [
                    PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
                    PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
                    PDO::ATTR_TIMEOUT => 10
                ]);

                return $conn;

            } catch(PDOException $e) {
                // Logueamos el error para verlo en el panel de Render
                error_log("Fallo conexión Neon: " . $e->getMessage());
                // En desarrollo, puedes descomentar la siguiente línea para ver el error en pantalla
                // die("Error de BD: " . $e->getMessage());
                return null;
            }
        } else {
            // Fallback para desarrollo local (Variables en tu .env local)
            try {
                $host = getenv("PGHOST") ?: 'localhost';
                $db   = getenv("PGDATABASE");
                $user = getenv("PGUSER");
                $pass = getenv("PGPASSWORD");

                $dsn = "pgsql:host=$host;dbname=$db";
                $conn = new PDO($dsn, $user, $pass);
                $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
                return $conn;
            } catch(PDOException $e) {
                return null;
            }
        }
    }
}