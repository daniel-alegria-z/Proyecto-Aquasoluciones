<?php
class ConexionBD {
    function conexionBD() {
        $databaseUrl = getenv("DATABASE_URL");
        
        if ($databaseUrl) {
            // --- ENTORNO: PRODUCCIÓN (RENDER / NEON) ---
            try {
                $dbopts = parse_url($databaseUrl);
                
                // 1. Limpiamos el Host: Eliminamos '-pooler' si existe
                // Esto hace que el SNI coincida exactamente con el Project ID de Neon
                $host = str_replace('-pooler', '', $dbopts['host']);
                
                $user = $dbopts['user'];
                $pass = $dbopts['pass'];
                $port = $dbopts['port'] ?? 5432;
                
                // 2. Limpiamos el nombre de la BD
                $path = ltrim($dbopts['path'], '/');
                $dbname = explode('?', $path)[0];

                // 3. DSN Estándar (Sin prefijos raros ni opciones conflictivas)
                $dsn = "pgsql:host=$host;port=$port;dbname=$dbname;sslmode=require";

                $conn = new PDO($dsn, $user, $pass, [
                    PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
                    PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
                    PDO::ATTR_TIMEOUT => 10
                ]);

                return $conn;

            } catch(PDOException $e) {
                // Logueamos para los logs de Render
                error_log("FALLO DE CONEXIÓN A NEON: " . $e->getMessage());
                // Importante: No imprimimos el error en la interfaz por seguridad,
                // solo retornamos null para que el controlador lo maneje.
                return null;
            }
        } else {
            // --- ENTORNO: LOCAL ---
            try {
                $host = getenv("PGHOST") ?: 'localhost';
                $port = getenv("PGPORT") ?: '5432';
                $db   = getenv("PGDATABASE") ?: 'tu_bd_local';
                $user = getenv("PGUSER") ?: 'postgres';
                $pass = getenv("PGPASSWORD") ?: '';

                $dsn = "pgsql:host=$host;port=$port;dbname=$db";
                $conn = new PDO($dsn, $user, $pass, [
                    PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION
                ]);
                return $conn;
            } catch(PDOException $e) {
                error_log("FALLO DE CONEXIÓN LOCAL: " . $e->getMessage());
                return null;
            }
        }
    }
}