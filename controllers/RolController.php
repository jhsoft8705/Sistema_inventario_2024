<?php 
require_once("../config/conexion.php");
require_once("../models/Rol.php");

$rol=new Rol();

switch($_GET['enpoint']){
   /*TODO:Listar roles */
    case 'list_roles':
    $datos=$rol->list_rol();
    $data=Array();
    foreach($datos as $filas){
        $sub_array=array();
        $sub_array[]=$filas["NombreRol"];  
        $sub_array[]=$filas["Descripcion"];  
        $sub_array[] = '<span class="badge bg-success">' . $filas["Estado"] . '</span>';  
        $sub_array[]='<button type="button" onClick="show_roles('.$filas["Id"].')" id="'.$filas["Id"].'" class="btn color_reportes btn-icon waves-effect waves-light"><i class="ri-settings-2-line"></i></button>';

        $sub_array[]='<button type="button" onClick="editar('.$filas["Id"].')" id="'.$filas["Id"].'" class="btn btn-warning btn-icon waves-effect waves-light"><i class="ri-edit-2-line"></i></button>';
        $sub_array[]='<button type="button" onClick="eliminar('.$filas["Id"].')" id="'.$filas["Id"].'" class="btn btn-danger btn-icon waves-effect waves-light"><i class="ri-delete-bin-5-line"></i></button>';
        $data[] = $sub_array;
    }
    $results=array(
        "SEcho"=>1,
        "iTotalrecords"=>count($data),
        "iTotaldisplayRecords"=>count($data),
        "aaData"=>$data,);
       //Imprimimos JSON
       echo json_encode($results); 
    break;  

    case 'get_role_jcombox':
    $datos=$rol->list_rol();
    if (is_array($datos) == true and count($datos) > 0) {
        $html = "<option value=''>Seleccionar</option>";
        foreach ($datos as $row) {
          $html .= "<option value='" . $row['Id'] . "'>" . $row['NombreRol'] . "</option>";
        }
        echo $html;
    }
    break;

    /*TODO:Listar Permisos en roles*/
    case 'listar_permisos_x_rol_id':
    $datos=$rol->List_permiso_x_rol_id($_POST["id_role"]);
    $data=Array();
    foreach($datos as $filas){
        $sub_array=array();
        $sub_array[]=$filas["Nombre"];  
        if($filas["Permiso"]=="si"){ 
          $sub_array[]='<button type="button" onClick="Desabilitar_permiso('.$filas["Id_Detalle_Menu_rol"].')" id="'.$filas["Id_Detalle_Menu_rol"].'" class=" btn color_permisos"><i class=" ri-checkbox-circle-line label-icon align-middle fs-16 me-2"></i>Si</button>';
        }else{
          $sub_array[]='<button type="button" onClick="Habilitar_permiso('.$filas["Id_Detalle_Menu_rol"].')" id="'.$filas["Id_Detalle_Menu_rol"].'" class=" btn color_permisos_no"><i class=" ri-close-circle-line label-icon align-middle fs-16 me-2"></i>No</button>';

        } 
          $data[] = $sub_array;
    }
    $results=array(
        "SEcho"=>1,
        "iTotalrecords"=>count($data),
        "iTotaldisplayRecords"=>count($data),
        "aaData"=>$data,);
       //Imprimimos JSON
       echo json_encode($results); 
    break;  
    
    /*TODO:habilitar permiso*/
    case 'Habilitar_permiso': 
    $rol->Habilitar_permiso($_POST["detalle_menu_id"]);     
    break;

  /*TODO:desabilitar permiso*/
    case 'Desabilitar_permiso': 
    $rol->Desabilitar_permiso($_POST["detalle_menu_id"]);     
    break; 

    /*TODO:Crear automatico la lista de permisos segun el id de rol*/
    case 'create_automatico_list_permiso_x_rol':  
    $rol->Create_new_list_permisos($_POST["rol_id"]);     
    break; 
    
 
    /*TODO:Listar rol x Id*/ 
    case 'list_rol_id':
    $datos=$rol->list_rol_id($_POST["id_rol"]);
         if(is_array($datos)==true and count($datos)>0){  
            foreach($datos as $row){
              $output["id"]=$row["Id"]; 
                $output["nombre"]=$row["NombreRol"];  
                $output["descripcion"]=$row["Descripcion"]; 
            }
            echo json_encode($output); 
        }
    break; 
 
    case 'save_and_update_roles':
    /* TODO: Guardar cuando el ID este vacio y actualizar cuando venga ID*/
    if(empty($_POST["id_rol"])){ //insertar
        $rol->insert_rol(
        $_POST["nombre"],
        $_POST["descripcion"]);  
      }else{
        $rol->update_rol(        
        $_POST["id_rol"],   
        $_POST["nombre"], 
        $_POST["descripcion"]);  
     }       
    break;
    
    case 'delete': 
    $rol->delete_rol($_POST["id_rol"]);     
    break;
    

}

?>