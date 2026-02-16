<?php
class ConexionBD {
    function conexionBD() {
        $databaseUrl = getenv("DATABASE_URL");
        
        // DEBUG: Verificamos si la variable existe
        if (!$databaseUrl) {
            die("ERROR CRÍTICO: La variable DATABASE_URL no existe en el entorno de Render.");
        }

        try {
            $dbopts = parse_url($databaseUrl);
            
            // Validar que el parseo fue correcto
            if (!isset($dbopts['host'])) {
                die("ERROR: La DATABASE_URL tiene un formato inválido.");
            }

            $host = $dbopts['host'];
            $endpointId = explode('.', $host)[0];
            $dbname = ltrim($dbopts['path'], '/');
            $user = $dbopts['user'];
            $pass = $dbopts['pass'];

            // DSN exacto para Neon
            $dsn = "pgsql:host=$host;port=5432;dbname=$dbname;sslmode=require;options='--endpoint=$endpointId'";

            return new PDO($dsn, $user, $pass, [
                PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
                PDO::ATTR_TIMEOUT => 10
            ]);

        } catch(PDOException $e) {
            // AQUÍ: Forzamos que nos diga el error real de la base de datos
            die("FALLO DE CONEXIÓN A NEON: " . $e->getMessage());
        }
    }
}