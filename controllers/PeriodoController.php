<?php 
require_once("../config/conexion.php");
require_once("../models/Periodo.php");

$periodo = new Periodo();

switch($_GET['endpoint']) {
    // Listar periodos
    case 'list_periodos':
        $datos = $periodo->list_periodos();
        $data = array();
        foreach($datos as $filas) {
            $sub_array = array();
            $sub_array[] = $filas["Nombre"];
            $sub_array[] = $filas["Fecha_Inicio"];
            $sub_array[] = $filas["Fecha_Fin"];
            $sub_array[] = $filas["Descripcion"];
            if($filas["Estado"] == 'Activo') {
                $sub_array[] = '<span class="badge bg-success">' . $filas["Estado"] . '</span>';
            }else {
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

    // Listar periodo por ID
    case 'list_periodo_id':
        $datos = $periodo->list_periodo_id($_POST["periodo_id"]);
        if(is_array($datos) && count($datos) > 0) {  
            foreach($datos as $row) {
                $output["id"] = $row["Id"];
                $output["nombre"] = $row["Nombre"];
                $output["fecha_inicio"] = $row["Fecha_Inicio"];
                $output["fecha_fin"] = $row["Fecha_Fin"];
                $output["descripcion"] = $row["Descripcion"];
            }
            echo json_encode($output); 
        }
    break;

    // Guardar y actualizar periodos
    case 'save_and_update_periodos':
        if(empty($_POST["periodo_id"])) { // Insertar
            $periodo->insert_periodo(
                $_POST["nombre"],
                $_POST["fecha_inicio"],
                $_POST["fecha_fin"],
                $_POST["descripcion"]
            );  
        } else { // Actualizar
            $periodo->update_periodo(
                $_POST["periodo_id"],   
                $_POST["nombre"],
                $_POST["fecha_inicio"],
                $_POST["fecha_fin"],
                $_POST["descripcion"]
            );  
        }       
    break;
    
    // Eliminar periodo
    case 'delete': 
        $periodo->delete_periodo($_POST["periodo_id"]);     
    break;

    // Obtener periodos para combobox
    case 'get_periodo_combobox':
        $datos = $periodo->list_periodos();
        if (is_array($datos) && count($datos) > 0) {
            $html = "<option value=''>Seleccionar</option>";
            foreach ($datos as $row) {
                if($row["Estado"] == 'Activo') {
                    $html .= "<option value='" . $row['Id'] . "'>" . $row['Nombre'] . "</option>";
                }
            }
            echo $html;
        }
    break;
}
?>
