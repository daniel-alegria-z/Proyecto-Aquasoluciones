<?php
session_start();
session_destroy();
header("Location: /app/iniciar_sesion.php?cerrar=ok");
exit();
?>