<?php
require '/var/www/html/conexionBD/conexion.php';

// Obtener los parámetros enviados por AJAX
$id = isset($_POST['id']) ? $_POST['id'] : null;
$campo = isset($_POST['campo']) ? $_POST['campo'] : null;
$tabla = isset($_POST['tabla']) ? $_POST['tabla'] : null; // Nuevo: tabla seleccionada
$columna_id = isset($_POST['columna_id']) ? $_POST['columna_id'] : 'id'; // Columna identificadora predeterminada

// Validar que los parámetros sean válidos
if (!$tabla || $campo === 'selec' || !$id || $id === "selec" || !$campo || !$columna_id) {
    echo "Datos incompletos o inválidos.";
    exit;
}

// Crear una instancia de la clase ConexionBD
$conexionBD = new ConexionBD();
$dbconn = $conexionBD->conexionBD(); // Obtener la conexión

if (!$dbconn) {
    echo "ERROR, NO SE PUDO CONECTAR A LA BASE DE DATOS";
    exit;
}

// Construir la consulta según la tabla y columna seleccionadas
$sql = "SELECT $campo FROM $tabla WHERE $columna_id = :id";
$stmt = $dbconn->prepare($sql); // Preparar la consulta

// Vincular el parámetro
$stmt->bindParam(':id', $id, PDO::PARAM_INT);

// Ejecutar la consulta
if ($stmt->execute() && $stmt->rowCount() > 0) {
    $row = $stmt->fetch(PDO::FETCH_ASSOC);
    echo $row[$campo]; // Devolver el valor del campo
} else {
    echo "No se encontró el registro.";
}
?>