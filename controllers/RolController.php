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
        
        $sub_array[] = '
        <td> 
            <div class="d-flex gap-2">
                <div class="edit">
                    <button class="btn btn-sm btn-success edit-item-btn" onClick="editar(' . $filas["Id"] . ')" id="' . $filas["Id"] . '">
                        <i class="ri-edit-2-line"></i> Editar
                    </button>
                </div>
                <div class="remove">
                    <button class="btn btn-sm btn-danger remove-item-btn" onClick="eliminar(' . $filas["Id"] . ')" id="' . $filas["Id"] . '">
                        <i class="ri-delete-bin-5-line"></i> Eliminar
                    </button>
                </div>
            </div>
        </td>';
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
  
 
    /*TODO:Listar rol x Id*/ 
    case 'list_rol_id':
    $datos=$rol->list_rol_id($_POST["rol_id"]);
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
    if(empty($_POST["rol_id"])){ //insertar
        $rol->insert_rol(
        $_POST["nombre"],
        $_POST["descripcion"]);  
      }else{
        $rol->update_rol(        
        $_POST["rol_id"],   
        $_POST["nombre"], 
        $_POST["descripcion"]);  
     }       
    break;
    
    case 'delete': 
    $rol->delete_rol($_POST["rol_id"]);     
    break;
    

}

?>