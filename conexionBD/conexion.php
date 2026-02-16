<?php
class ConexionBD {
    function conexionBD() {
        // Intentar conectar con DATABASE_URL (Neon/Producción)
        $databaseUrl = getenv("DATABASE_URL");
        
        if ($databaseUrl) {
            try {
                $conn = new PDO($databaseUrl);
                $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
                return $conn;
            } catch(PDOException $e) {
                echo "No se pudo conectar a la base de datos (Neon): " . $e->getMessage();
                return null;
            }
        } else {
            // Fallback a variables tradicionales (desarrollo local con Docker)
            $host = getenv("PGHOST");
            $bdname = getenv("PGDATABASE");
            $username = getenv("PGUSER");
            $pasword = getenv("PGPASSWORD");
            $port = getenv("PGPORT");

            try {
                $conn = new PDO("pgsql:host=$host;port=$port;dbname=$bdname", $username, $pasword);
                $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
                return $conn;
            } catch(PDOException $e) {
                echo "No se pudo conectar a la base de datos: " . $e->getMessage();
                return null;
            }
        }
    }
}
?>