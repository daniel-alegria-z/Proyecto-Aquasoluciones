<?php
class ConexionBD {
    function conexionBD() {
        $databaseUrl = getenv("DATABASE_URL");
        
        if (!$databaseUrl) {
            die("ERROR: Variable DATABASE_URL no configurada.");
        }

        try {
            $dbopts = parse_url($databaseUrl);
            
            // 1. Host completo
            $host = $dbopts['host'];
            
            // 2. Extraer el Endpoint ID tal cual viene en el host (SIN quitar -pooler)
            // Para: ep-fragrant-fog-aencuuhf-pooler.c-2...
            // Resultado: ep-fragrant-fog-aencuuhf-pooler
            $endpointId = explode('.', $host)[0];

            $user = $dbopts['user'];
            $pass = $dbopts['pass'];
            
            // Limpiar nombre de la BD
            $path = ltrim($dbopts['path'], '/');
            $dbname = explode('?', $path)[0];

            // 3. Construir DSN: El endpoint DEBE coincidir con el SNI (el host)
            $dsn = "pgsql:host=$host;port=5432;dbname=$dbname;sslmode=require;options='-c endpoint=$endpointId'";

            $conn = new PDO($dsn, $user, $pass, [
                PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
                PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
                PDO::ATTR_TIMEOUT => 10
            ]);

            return $conn;

        } catch(PDOException $e) {
            // Si falla, detenemos y mostramos el error real
            die("FALLO DE CONEXIÓN A NEON: " . $e->getMessage());
        }
    }
}