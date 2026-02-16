<?php
ob_start(); // Inicia el buffer de salida
require __DIR__ . '/../controllers/auth.php';
include __DIR__ . '/../includes/formulario.php';
include __DIR__ . '/../includes/logic.php';
include __DIR__ . '/../includes/footer.php';
ob_end_flush(); // Envía la salida al navegador
?>