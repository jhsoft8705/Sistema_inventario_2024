<?php 
require_once("../config/conexion.php");
require_once("../models/Usuario.php");

$usuario=new Usuario();

switch($_GET['enpoint']){
   /*TODO:Listar Users*/
    case 'list_user':
    $datos=$usuario->List_User();
    $data=Array();
    foreach($datos as $filas){
        $sub_array=array();
        $sub_array[]=$filas["NombresUsuario"];
         $sub_array[]=$filas["ApellidosUsuario"];    
        $sub_array[]=$filas["CorreoElectronico"];
        $sub_array[]=$filas["Contrasena"];
        $sub_array[]=$filas["NombreRol"]; 
        if($filas["Estado"]=="Inactivo"){
          $sub_array[] = '<span class="badge bg-danger">' . $filas["Estado"] . '</span>';   
        }else{
          $sub_array[] = '<span class="badge bg-success">' . $filas["Estado"] . '</span>';  

        }
        $sub_array[] = '
        <td> <div class="d-flex gap-2">
                <div class="edit">
                    <button class="btn btn-sm btn-success edit-item-btn" onClick="editar(' . $filas["Id"] . ')" id="' . $filas["Id"] . '">
                        <i class="ri-edit-2-line"></i> Editar
                    </button>
                </div>
                <div class="remove">
                    <button class="btn btn-sm btn-danger remove-item-btn"  onClick="eliminar(' . $filas["Id"] . ')" id="' . $filas["Id"] . '">
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



    case 'list_user_id':
    $datos=$usuario->list_user_id($_POST["usuario_id"]);
         if(is_array($datos)==true and count($datos)>0){  
            foreach($datos as $row){
                $output["id"]=$row["Id"];   
                $output["nombre"] = $row["NombresUsuario"];
                $output["apellido"] = $row["ApellidosUsuario"]; 
                $output["numero_documento"] = $row["NumeroDocumento"];
                $output["telefono"] = $row["Telefono"];
                $output["correo"] = $row["CorreoElectronico"];
                $output["pass"] = $row["Contrasena"];
                $output["rol_id"] = $row["Id_rol"];
                $output["nombre_rol"] = $row["NombreRol"];
                $output["descripcion_rol"] = $row["Descripcion"];
                $output["direccion"] = $row["Direccion"];
                $output["genero"] = $row["Genero"];
                $output["notificacion"] = $row["Notificaciones"]; 
                $output["estado"] = $row["Estado"];
                $output["fecha_registro"] = $row["FechaRegistro"];
            }
            echo json_encode($output); 
        }
    break; 
 
    case 'update_profile':
        $usuario->update_perfil(
        $_POST["usuario_id"], 
        $_POST["nombres"],
        $_POST["documento"],
        $_POST["telefono"],
        $_POST["direccion"] );  
        $_SESSION["nombre_user"] = $_POST["nombres"];  
        $_SESSION["telefono"] = $_POST["documento"];
        $_SESSION["documento"] = $_POST["telefono"];   
        $_SESSION["direccion"] = $_POST["direccion"];  
 
    break;

    case 'change_password':
        $result=$usuario->update_change_password(
        $_POST["user_id"], 
        $_POST["password"], 
        $_POST["new_password"]  
      );
      echo json_encode(["Mensaje" => $result]);
      break;
    break;
     

    /*TODO:Cambiar Imagen*/ 
    case 'Change_image_profile':
    $usuario->Cambiar_imagen( $_POST["usuario_id"], $_POST["url_img"],  );  
    $_SESSION["foto_perfil"] = $_POST["url_img"];
    break;

    case 'save_and_update_user':
    /* TODO: Guardar cuando el ID este vacio y actualizar cuando venga ID*/
    if(empty($_POST["id_user"])){ //insertar
      $usuario->insert_user(
        $_POST["nombres"],
        $_POST["apellidos"],
        $_POST["documento"],
        $_POST["correo"],
        $_POST["pass"],
        $_POST["rol_id"],
        $_POST["estado"]);    
      }else{
        $usuario->update_user(        
          $_POST["id_user"],    
          $_POST["nombres"],
          $_POST["apellidos"],
          $_POST["documento"],
          $_POST["correo"],
          $_POST["pass"],
          $_POST["rol_id"],
          $_POST["estado"]);   
     }
    break;
    
    case 'delete': 
    $usuario->delete_user($_POST["usuario_id"]);     
    break;

    // Obtener usuario para combobox
    case 'get_usuario_jcombox':
    $datos = $usuario->List_User();
    if (is_array($datos) && count($datos) > 0) {
        $html = "<option value=''>Seleccionar</option>";
        foreach ($datos as $row) {
            if($row["Estado"]=='Activo'){
                $html .= "<option value='" . $row['Id'] . "'>" . $row['NombresUsuario'] .' '. $row['ApellidosUsuario'] .' - '. $row["NombreRol"]. "</option>";
            }
        }
        echo $html;
    }
   break; 
}

?>