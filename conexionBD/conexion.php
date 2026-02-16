<?php
class ConexionBD {
    function conexionBD() {
        $databaseUrl = getenv("DATABASE_URL");
        
        if ($databaseUrl) {
            try {
                $dbopts = parse_url($databaseUrl);
                
                $host = $dbopts['host'];
                $user = $dbopts['user'];
                $pass = $dbopts['pass'];
                $port = $dbopts['port'] ?? 5432;
                
                $path = ltrim($dbopts['path'], '/');
                $dbname = explode('?', $path)[0];

                // Extraemos el Endpoint ID (ej: ep-fragrant-fog-aencuuhf-pooler)
                $endpointId = explode('.', $host)[0];

                // MÉTODO DE PREFIJO: Unimos el endpoint al usuario con '$'
                // Esto es lo más compatible con Neon y evita el error de 'unsupported options'
                $userWithEndpoint = $endpointId . '$' . $user;

                // DSN simplificado (Sin el parámetro options que está dando error)
                $dsn = "pgsql:host=$host;port=$port;dbname=$dbname;sslmode=require";

                $conn = new PDO($dsn, $userWithEndpoint, $pass, [
                    PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
                    PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
                    PDO::ATTR_TIMEOUT => 10
                ]);

                return $conn;

            } catch(PDOException $e) {
                error_log("FALLO DE CONEXIÓN A NEON: " . $e->getMessage());
                return null;
            }
        } else {
            // Fallback variables de entorno
            try {
                $host = getenv("PGHOST") ?: 'localhost';
                $port = getenv("PGPORT") ?: '5432';
                $db   = getenv("PGDATABASE") ?: 'tu_bd_local';
                $user = getenv("PGUSER") ?: 'postgres';
                $pass = getenv("PGPASSWORD") ?: '';

                $dsn = "pgsql:host=$host;port=$port;dbname=$db";
                return new PDO($dsn, $user, $pass, [
                    PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION
                ]);
            } catch(PDOException $e) {
                return null;
            }
        }
    }
}