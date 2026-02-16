<?php
require __DIR__ . '/../controllers/auth.php'; // Asegúrate de que no haya salida antes de esta línea
?>

<?php
if ($_SERVER && isset($_SERVER['REQUEST_METHOD']) && $_SERVER['REQUEST_METHOD'] === 'POST') {
    $opcion = isset($_POST['combobox']) ? $_POST['combobox'] : null;

    if (isset($_POST['consultar']) || isset($_POST['consultar1']) || isset($_POST['consultar2']) || isset($_POST['consultar9'])) {
        include __DIR__ . '/../controllers/consultarS.php';
    } 
    
    elseif (isset($_POST['listar'])) {
        include __DIR__ . '/../controllers/listarS.php';
    }
}
?>