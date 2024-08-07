<?php 
require_once("../config/conexion.php");
require_once("../models/Ubicacion.php");

$ubicacion = new Ubicacion();

switch($_GET['endpoint']) {
    // Listar ubicaciones
    case 'list_ubicaciones':
        $datos = $ubicacion->list_ubicaciones();
        $data = array();
        foreach($datos as $filas) {
            $sub_array = array();
            $sub_array[] = $filas["U_Nombre"];
            $sub_array[] = $filas["U_Descripcion"];
            if($filas["Estado"] == 'Activo') {
                $sub_array[] = '<span class="badge bg-success">' . $filas["Estado"] . '</span>';
            } else {
                $sub_array[] = '<span class="badge bg-danger">' . $filas["Estado"] . '</span>';
            }
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
        $results = array(
            "SEcho" => 1,
            "iTotalRecords" => count($data),
            "iTotalDisplayRecords" => count($data),
            "aaData" => $data,
        );
        // Imprimimos JSON
        echo json_encode($results);
    break;

    // Listar ubicación por ID
    case 'list_ubicacion_id':
        $datos = $ubicacion->list_ubicacion_id($_POST["ubicacion_id"]);
        if(is_array($datos) && count($datos) > 0) {  
            foreach($datos as $row) {
                $output["id"] = $row["Id"];
                $output["nombre"] = $row["U_Nombre"]; 
                $output["descripcion"] = $row["U_Descripcion"];
            }
            echo json_encode($output); 
        }
    break;

    // Guardar y actualizar ubicaciones
    case 'save_and_update_ubicaciones':
        if(empty($_POST["ubicacion_id"])) { // Insertar
            $ubicacion->insert_ubicacion(
                $_POST["nombre"],
                $_POST["descripcion"]
            );  
        } else { // Actualizar
            $ubicacion->update_ubicacion(
                $_POST["ubicacion_id"],   
                $_POST["nombre"],
                $_POST["descripcion"]
            );  
        }       
    break;
    
    // Eliminar ubicación
    case 'delete': 
        $ubicacion->delete_ubicacion($_POST["ubicacion_id"]);     
    break;

    // Obtener ubicaciones para combobox
    case 'get_ubicacion_jcombox':
    $datos=$ubicacion->list_ubicaciones();
    if (is_array($datos) == true and count($datos) > 0) {
        $html = "<option value=''>Seleccionar</option>";
        foreach ($datos as $row) {
          $html .= "<option value='" . $row['Id'] . "'>" . $row['U_Nombre'] ."</option>";
        }
        echo $html;
    }
    break;
}
?>