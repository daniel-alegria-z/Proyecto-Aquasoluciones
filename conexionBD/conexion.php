<?php
class ConexionBD {
    function conexionBD() {
        $host = "postgres.railway.internal";
        $bdname = "railway";
        $username = "postgres";
        $pasword = "CCCqUGwkjnhnYsnUsYVHApiiYwYfdeSf";
        $port = "5432"

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
?>
