<?php 
require_once("../../config/conexion.php");
header("Location:".Conectar::ruta());
session_destroy();
exit();
?>