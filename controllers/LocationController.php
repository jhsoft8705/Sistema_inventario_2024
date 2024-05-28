<?php 
require_once("../config/conexion.php");
require_once("../models/Ubicacion.php");

$ubicacion = new Ubicacion();

switch($_GET['endpoint']) {
    // Listar ubicaciones de medida
    case 'list_ubicaciones':
        $datos = $ubicacion->list_ubicacion();
        $data = array();
        foreach($datos as $filas) {
            $sub_array = array();
            $sub_array[] = $filas["NombresUnd"];
            $sub_array[] = $filas["AbreviaturaUnd"];
            $sub_array[] = $filas["DescripcionUnd"]; 
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
        $results = array(
            "SEcho" => 1,
            "iTotalRecords" => count($data),
            "iTotalDisplayRecords" => count($data),
            "aaData" => $data,
        );
        // Imprimimos JSON
        echo json_encode($results);
    break;

    // Listar ubicacion de medida por ID
    case 'list_ubicacion_id':
        $datos = $ubicacion->list_ubicacion_id($_POST["ubicacion_id"]);
        if(is_array($datos) && count($datos) > 0) {  
            foreach($datos as $row) {
                $output["id"] = $row["Id"];
                $output["nombre"] = $row["NombresUnd"];
                $output["abreviatura"] = $row["AbreviaturaUnd"];
                $output["descripcion"] = $row["DescripcionUnd"];
            }
            echo json_encode($output); 
        }
    break;

    // Guardar y actualizar ubicaciones de medida
    case 'save_and_update_ubicaciones':
        if(empty($_POST["ubicacion_id"])) { // Insertar
            $ubicacion->insert_ubicacion(
                $_POST["nombre"],
                $_POST["abreviatura"],
                $_POST["descripcion"]
            );  
        } else { // Actualizar
            $ubicacion->update_ubicacion(
                $_POST["ubicacion_id"],   
                $_POST["nombre"],
                $_POST["abreviatura"],
                $_POST["descripcion"]
            );  
        }       
    break;
    
    // Eliminar ubicacion de medida
    case 'delete': 
        $ubicacion->delete_ubicacion($_POST["ubicacion_id"]);     
    break;

    case 'get_ubicacion_jcombox':
    $datos=$ubicacion->list_ubicacion();
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
