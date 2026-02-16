<?php
class ConexionBD {
    function conexionBD() {
        $databaseUrl = getenv("DATABASE_URL");
        
        if (!$databaseUrl) {
            // Fallback a variables locales
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
                error_log("DB Error: " . $e->getMessage());
                return null;
            }
        }
        
        try {
            $conn = new PDO($databaseUrl);
            $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            return $conn;
        } catch(PDOException $e) {
            error_log("DB Error (Neon): " . $e->getMessage());
            return null;
        }
    }
}
?>