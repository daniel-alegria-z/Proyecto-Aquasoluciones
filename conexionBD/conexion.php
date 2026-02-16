<?php
class ConexionBD {
    function conexionBD() {
        $databaseUrl = getenv("DATABASE_URL");
        
        if ($databaseUrl) {
            try {
                // 1. Extraer componentes de la URL de Neon
                $dbopts = parse_url($databaseUrl);
                
                $host = $dbopts['host'];
                $port = $dbopts['port'] ?? 5432;
                $user = $dbopts['user'];
                $pass = $dbopts['pass'];
                $dbname = ltrim($dbopts['path'], '/');
                
                // 2. Extraer el Endpoint ID (necesario para el proxy de Neon)
                // Esto toma 'ep-fragrant-fog-aencuuhf' del host
                $endpointId = explode('.', $host)[0];

                // 3. Construir DSN con SSL y Endpoint explícito
                // IMPORTANTE: fíjate en las comillas simples dentro del string de options
                $dsn = "pgsql:host=$host;port=$port;dbname=$dbname;sslmode=require;options='--endpoint=$endpointId'";

                $conn = new PDO($dsn, $user, $pass, [
                    PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
                    PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
                    PDO::ATTR_TIMEOUT => 10
                ]);
                
                return $conn;

            } catch(PDOException $e) {
                // Esto imprimirá el error real si algo falla (solo para debug)
                error_log("Error de conexión Neon: " . $e->getMessage());
                echo ""; 
                return null;
            }
        } else {
            // Fallback local (asegúrate de que estas variables existan en tu docker-compose o entorno local)
            try {
                $host = getenv("PGHOST") ?: 'localhost';
                $port = getenv("PGPORT") ?: '5432';
                $db   = getenv("PGDATABASE");
                $user = getenv("PGUSER");
                $pass = getenv("PGPASSWORD");

                $dsn = "pgsql:host=$host;port=$port;dbname=$db";
                $conn = new PDO($dsn, $user, $pass);
                $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
                return $conn;
            } catch(PDOException $e) {
                return null;
            }
        }
    }
}