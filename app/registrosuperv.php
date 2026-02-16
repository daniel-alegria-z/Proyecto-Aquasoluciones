<?php
ob_start(); // Inicia el buffer de salida
require __DIR__ . '/../controllers/auth.php';
include __DIR__ . '/../includes/formularioS.php';
include __DIR__ . '/../includes/logicS.php';
include __DIR__ . '/../includes/footerS.php';
ob_end_flush(); // Envía la salida al navegador
?>