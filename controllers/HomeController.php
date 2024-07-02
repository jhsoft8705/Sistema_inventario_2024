<?php 
require_once("../config/conexion.php");
require_once("../models/Home.php");

$home=new Home();

switch($_GET['endpoint']){
 
 
    /*TODO:Listar_Grafico_dona*/ 
    case 'get_asignaciones_x_taller_dona':
    $datos=$home->get_asignaciones_x_taller_dona();
         if(is_array($datos)==true and count($datos)>0){  
            foreach($datos as $row){
                $data[]=$row;  
            }
            echo json_encode($data); 
        }
    break;  
 
    /*TODO:Listar_Grafico_dona*/ 
    case 'get_usuarios_xtaller_dona':
    $datos=$home->get_usuarios_xtaller_dona();
         if(is_array($datos)==true and count($datos)>0){  
            foreach($datos as $row){
                $data[]=$row;  
            }
            echo json_encode($data); 
        }
    break; 
  
    

    case 'delete': 
    $home->delete_home($_POST["home_id"]);     
    break;
    

}

?>