<?php
class ConexionBD {
    function conexionBD() {
        $databaseUrl = getenv("DATABASE_URL");
        
        if ($databaseUrl) {
            try {
                // 1. Parsear la URL de Neon
                $dbopts = parse_url($databaseUrl);
                
                // 2. Extraer el Endpoint ID (es la primera parte del host)
                // Ejemplo: ep-fragrant-fog-aencuuhf
                $endpointId = explode('.', $dbopts['host'])[0];

                // 3. Construir el DSN con las opciones requeridas por Neon
                $dsn = sprintf(
                    "pgsql:host=%s;port=%s;dbname=%s;sslmode=require;options='--endpoint=%s'",
                    $dbopts['host'],
                    $dbopts['port'] ?? 5432,
                    ltrim($dbopts['path'], '/'),
                    $endpointId
                );

                $conn = new PDO($dsn, $dbopts['user'], $dbopts['pass'], [
                    PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
                    PDO::ATTR_TIMEOUT => 5
                ]);

                return $conn;
            } catch(PDOException $e) {
                error_log("Error de conexión Neon: " . $e->getMessage());
                // Importante: No imprimas $e->getMessage() en producción porque puede exponer datos
                return null;
            }
        } else {
            // Fallback local
            $host = getenv("PGHOST");
            $bdname = getenv("PGDATABASE");
            $username = getenv("PGUSER");
            $pasword = getenv("PGPASSWORD");
            $port = getenv("PGPORT") ?: '5432';

            try {
                $conn = new PDO("pgsql:host=$host;port=$port;dbname=$bdname", $username, $pasword);
                $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
                return $conn;
            } catch(PDOException $e) {
                error_log("DB Error (Local): " . $e->getMessage());
                return null;
            }
        }
    }
}
?>