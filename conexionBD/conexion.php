<?php
class ConexionBD {
    function conexionBD() {
        $databaseUrl = getenv("DATABASE_URL");
        
        if ($databaseUrl) {
            try {
                $conn = new PDO($databaseUrl, null, null, [
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