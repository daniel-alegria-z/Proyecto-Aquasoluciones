<?php
class ConexionBD {
    function conexionBD() {
        $databaseUrl = getenv("DATABASE_URL");
        
        if ($databaseUrl) {
            try {
                // Parseamos la URL de Neon
                $dbopts = parse_url($databaseUrl);
                
                // Construimos el DSN compatible con PHP
                $dsn = sprintf("pgsql:host=%s;port=%s;dbname=%s;options='--endpoint=%s'", 
                    $dbopts['host'],
                    $dbopts['port'] ?? 5432,
                    ltrim($dbopts['path'], '/'),
                    // Neon a veces requiere el endpoint en las options si usas el pooler
                    explode('.', $dbopts['host'])[0] 
                );

                $conn = new PDO($dsn, $dbopts['user'], $dbopts['pass'], [
                    PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
                    PDO::ATTR_TIMEOUT => 10
                ]);
                return $conn;
            } catch(PDOException $e) {
                error_log("DB Error (Neon): " . $e->getMessage());
                echo "Error BD: " . htmlspecialchars($e->getMessage());
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