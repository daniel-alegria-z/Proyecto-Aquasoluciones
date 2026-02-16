<?php
require __DIR__ . '/../conexionBD/conexion.php';
require __DIR__ . '/mail_config.php';
require __DIR__ . '/../vendor/autoload.php'; // Ajusta si cambia tu estructura

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['correo'])) {
    $correo = $_POST['correo'];

    $conn = new ConexionBD();
    $pdo = $conn->conexionBD();

    if (!$pdo) {
          // Esto te dirá el último error de PHP antes de morir
          die("La conexión devolvió NULL inesperadamente.");
      } else {
        // Verifica si el correo existe y obtiene el nombre del usuario
        $stmt = $pdo->prepare("SELECT usuario, nombre_completo FROM usuarios WHERE correo = :correo");
        $stmt->bindParam(':correo', $correo);
        $stmt->execute();

        if ($stmt->rowCount() > 0) {
            $usuarioData = $stmt->fetch(PDO::FETCH_ASSOC);
            $nombreUsuario = $usuarioData['nombre_completo'];

            // Genera un token único
            $token = bin2hex(random_bytes(32));
            $stmt2 = $pdo->prepare("UPDATE usuarios SET token_recuperacion = :token WHERE correo = :correo");
            $stmt2->bindParam(':token', $token);
            $stmt2->bindParam(':correo', $correo);
            $stmt2->execute();

            // Define el enlace dependiendo del entorno
            $enlace = "http://localhost:8080/includes/recuperar_form.php?token=$token";
            if (MAIL_ENV !== 'local') {
                $enlace = "https://aquasoluciones.onrender.com/includes/recuperar_form.php?token=$token";
            }

            $asunto = "🔐 Recupera tu contraseña";

            $mensaje = "
            <html>
            <head>
              <style>
                body {
                  font-family: Arial, sans-serif;
                  background-color: #f4f4f4;
                  padding: 20px;
                }
                .container {
                  background-color: #ffffff;
                  padding: 30px;
                  border-radius: 8px;
                  box-shadow: 0 0 10px rgba(0,0,0,0.1);
                  max-width: 600px;
                  margin: auto;
                }
                h2 {
                  color: #333;
                }
                p {
                  color: #555;
                }
                .button {
                  background-color: #007BFF;
                  color: white;
                  padding: 12px 20px;
                  text-decoration: none;
                  border-radius: 5px;
                  display: inline-block;
                  margin-top: 20px;
                }
                .footer {
                  font-size: 12px;
                  color: #999;
                  margin-top: 30px;
                }
              </style>
            </head>
            <body>
              <div class='container'>
                <h2>Hola, $nombreUsuario 👋</h2>
                <p>Hemos recibido una solicitud para restablecer tu contraseña.</p>
                <p>Para continuar, haz clic en el siguiente botón:</p>
                <a href='$enlace' class='button'>Restablecer contraseña</a>
                <p class='footer'>Si tú no solicitaste este cambio, ignora este mensaje.</p>
                <p class='footer'>AquaSoluciones - Tu seguridad es nuestra prioridad</p>
              </div>
            </body>
            </html>";

            $mail = new PHPMailer(true);
            try {
              // Log para depuración en Render
                error_log("DEBUG: Entorno detectado: " . MAIL_ENV);
                error_log("DEBUG: Intentando conectar a " . MAIL_HOST . " en puerto " . MAIL_PORT);
                $mail->SMTPDebug = 2;
                $mail->isSMTP();
                // Forzamos IPv4 para evitar el error 101 anterior
                $mail->Host = gethostbyname(MAIL_HOST); 
                $mail->Port = MAIL_PORT;
                $mail->SMTPAuth = true;
                $mail->Username = MAIL_USERNAME;
                $mail->Password = MAIL_PASSWORD;
                $mail->SMTPSecure = MAIL_SMTP_SECURE; // Ahora será 'ssl'
                
                // El timeout de 10 segundos es prudente para entornos cloud
                $mail->Timeout = 10;

                $mail->SMTPOptions = array(
                    'ssl' => array(
                        'verify_peer' => false,
                        'verify_peer_name' => false,
                        'allow_self_signed' => true
                    )
                );

                $mail->setFrom(MAIL_FROM, MAIL_FROM_NAME);
                $mail->addAddress($correo);
                $mail->CharSet = 'UTF-8';
                $mail->isHTML(true);
                $mail->Subject = $asunto;
                $mail->Body = $mensaje;

                $mail->send();

                echo "<script>alert('Se ha enviado un enlace de recuperación a tu correo.');window.location.href='/app/iniciar_sesion.php';</script>";
            } catch (Exception $e) {
                echo "<script>alert('Error al enviar el correo: {$mail->ErrorInfo}');window.location.href='/app/iniciar_sesion.php';</script>";
            }
        } else {
            echo "<script>alert('El correo no existe en nuestra base de datos.');window.location.href='/app/iniciar_sesion.php';</script>";
        }
    }
}
?>
