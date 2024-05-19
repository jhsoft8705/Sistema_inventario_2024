<?php 
require_once("../config/conexion.php");
require_once("../models/Unidad.php");

$unidad = new Unidad();

switch($_GET['endpoint']) {
    // Listar unidades de medida
    case 'list_unidades':
        $datos = $unidad->list_unidad();
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

    // Listar unidad de medida por ID
    case 'list_unidad_id':
        $datos = $unidad->list_unidad_id($_POST["unidad_id"]);
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

    // Guardar y actualizar unidades de medida
    case 'save_and_update_unidades':
        if(empty($_POST["unidad_id"])) { // Insertar
            $unidad->insert_unidad(
                $_POST["nombre"],
                $_POST["abreviatura"],
                $_POST["descripcion"]
            );  
        } else { // Actualizar
            $unidad->update_unidad(
                $_POST["unidad_id"],   
                $_POST["nombre"],
                $_POST["abreviatura"],
                $_POST["descripcion"]
            );  
        }       
    break;
    
    // Eliminar unidad de medida
    case 'delete': 
        $unidad->delete_unidad($_POST["unidad_id"]);     
    break;
}
?>
