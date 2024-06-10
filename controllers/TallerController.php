<?php 
require_once("../config/conexion.php");
require_once("../models/Taller.php");

$taller = new Taller();

switch($_GET['endpoint']) {
    // Listar talleres
    case 'list_talleres':
        $datos = $taller->list_talleres();
        $data = array();
        foreach($datos as $filas) {
            $sub_array = array();
            $sub_array[] = $filas["T_Nombre"];
            $sub_array[] = $filas["T_Descripcion"];
            if($filas["Estado"]=='Activo') {
                $sub_array[] = '<span class="badge bg-success">' . $filas["Estado"] . '</span>';
            }else{
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

    // Listar taller por ID
    case 'list_taller_id':
        $datos = $taller->list_taller_id($_POST["taller_id"]);
        if(is_array($datos) && count($datos) > 0) {  
            foreach($datos as $row) {
                $output["id"] = $row["Id"];
                $output["nombre"] = $row["T_Nombre"];
                $output["descripcion"] = $row["T_Descripcion"];
            }
            echo json_encode($output); 
        }
    break;

    // Guardar y actualizar talleres
    case 'save_and_update_talleres':
        if(empty($_POST["taller_id"])) { // Insertar
            $taller->insert_taller(
                $_POST["nombre"],
                $_POST["descripcion"]
            );  
        } else { // Actualizar
            $taller->update_taller(
                $_POST["taller_id"],   
                $_POST["nombre"],
                $_POST["descripcion"]
            );  
        }       
    break;
    
    // Eliminar taller
    case 'delete': 
        $taller->delete_taller($_POST["taller_id"]);     
    break;

    // Obtener talleres para combobox
    case 'get_taller_jcombox':
        $datos = $taller->list_talleres();
        if (is_array($datos) && count($datos) > 0) {
            $html = "<option value=''>Seleccionar</option>";
            foreach ($datos as $row) {
                if($row["Estado"]=='Activo'){
                    $html .= "<option value='" . $row['Id'] . "'>" . $row['T_Nombre'] . "</option>";
                }
            }
            echo $html;
        }
    break;
}
?>