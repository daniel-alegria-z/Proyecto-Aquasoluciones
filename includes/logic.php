<?php
require __DIR__ . '/../controllers/auth.php'; // Asegúrate de que no haya salida antes de esta línea
?>

<?php
if ($_SERVER && isset($_SERVER['REQUEST_METHOD']) && $_SERVER['REQUEST_METHOD'] === 'POST') {
    $opcion = isset($_POST['combobox']) ? $_POST['combobox'] : null;

    if (isset($_POST['registrar']) || isset($_POST['insertar1']) || isset($_POST['insertar2']) || isset($_POST['insertar3']) || isset($_POST['insertar4']) || isset($_POST['insertar5']) || isset($_POST['insertar6']) || isset($_POST['insertar7']) || isset($_POST['insertar8']) || isset($_POST['insertar9'])) {
        include __DIR__ . '/../controllers/registro.php';
    } 
    
    elseif (isset($_POST['modificar']) || isset($_POST['modificar1']) || isset($_POST['modificar2']) || isset($_POST['modificar3']) || isset($_POST['modificar4']) || isset($_POST['modificar5']) || isset($_POST['modificar6']) || isset($_POST['modificar7']) || isset($_POST['modificar8']) || isset($_POST['modificar9'])) {
        include __DIR__ . '/../controllers/modificar.php';
    } 
    
    elseif (isset($_POST['consultar']) || isset($_POST['consultar1']) || isset($_POST['consultar2']) || isset($_POST['consultar3']) || isset($_POST['consultar4']) || isset($_POST['consultar5']) || isset($_POST['consultar6']) || isset($_POST['consultar7']) || isset($_POST['consultar8']) || isset($_POST['consultar9'])) {
        include __DIR__ . '/../controllers/consultar.php';
    } 
    
    elseif (isset($_POST['eliminar']) || isset($_POST['eliminar1']) || isset($_POST['eliminar2']) || isset($_POST['eliminar3']) || isset($_POST['eliminar4']) || isset($_POST['eliminar5']) || isset($_POST['eliminar6']) || isset($_POST['eliminar7']) || isset($_POST['eliminar8']) || isset($_POST['eliminar9'])) {
        include __DIR__ . '/../controllers/eliminar.php';
    } 
    
    elseif (isset($_POST['listar'])) {
        include __DIR__ . '/../controllers/listar.php';
    }
}
?>