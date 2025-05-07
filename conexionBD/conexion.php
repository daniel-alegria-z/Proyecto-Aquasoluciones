<?php
    class ConexionBD {
        function conexionBD() {
            $host = "host.docker.internal";
            $bdname = "aquasoluciones";
            $username = "postgres";
            $pasword = "1234";

            try {
                $conn = new PDO("pgsql:host=$host;dbname=$bdname", $username, $pasword);
            } catch(PDOException $e) {
                echo ("No se pudo conectar a la base de datos" . $e);
            }
       
        return $conn;
        }
    }

?>