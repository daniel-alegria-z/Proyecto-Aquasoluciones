<?php
require '../conexionBD/conexion.php';
session_start();
try {
    // Validar datos de entrada
    if (empty($_POST['correo']) || empty($_POST['passwd'])) {
        throw new Exception("Todos los campos son obligatorios.");
    }

    $correo = $_POST['correo'];
    $pasword = $_POST['passwd'];

    // Crear conexión
    $conn = new ConexionBD();
    $pdo = $conn->conexionBD();

    // Verificar credenciales
    $query = "SELECT * FROM usuarios WHERE correo = :correo AND contrasena = :passwd";
    $stmt = $pdo->prepare($query);
    $stmt->bindParam(':correo', $correo);
    $stmt->bindParam(':passwd', $pasword);
    $stmt->execute();

    if ($stmt->rowCount() > 0) {
        $_SESSION['correo'] = $correo;
        $_SESSION['usuario'] = $stmt->fetch(PDO::FETCH_ASSOC)['usuario']; // Asignar el nombre de usuario a la sesión    
        header("Location: ../registroadmin.php");
        exit();
    } else {
        header("Location: ../iniciar_sesion.html?contraseña=incorrecta");
        exit();
    }
} catch (Exception $e) {
    echo "Error: " . $e->getMessage();
}
?>