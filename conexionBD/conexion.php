<?php
echo "HOST: " . getenv("PGHOST") . "<br>";
echo "PORT: " . getenv("PGPORT") . "<br>";
echo "DB: " . getenv("PGDATABASE") . "<br>";
echo "USER: " . getenv("PGUSER") . "<br>";
echo "PASS: " . getenv("PGPASSWORD") . "<br>";
class ConexionBD {
    function conexionBD() {
        $host     = getenv("PGHOST");
        $port     = getenv("PGPORT");
        $bdname   = getenv("PGDATABASE");
        $username = getenv("PGUSER");
        $pasword  = getenv("PGPASSWORD");

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
