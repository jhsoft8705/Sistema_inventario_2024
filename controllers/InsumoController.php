<?php 
require_once("../config/conexion.php");
require_once("../models/Insumo.php");

$insumo = new Insumo();

switch($_GET['endpoint']) {
   // Listar insumos
    case 'list_insumos':
    $datos = $insumo->list_insumos();
    $data = array();
    foreach($datos as $filas) {
        $sub_array = array();
        $sub_array[] = $filas["Codigo"];  
        $sub_array[] = $filas["Co_Modular"]; 
        $sub_array[] = $filas["Nombre"];
        $sub_array[] = $filas["Descripcion"];
        $sub_array[] = $filas["Categoria"];
        $sub_array[] = $filas["ProveedorNombre"] . ' ' . $filas["ProveedorApellido"];
        $sub_array[] = $filas["Marca"]; 
        $sub_array[] = $filas["UnidadMedida"];
        $sub_array[] = $filas["Medida"];
        $sub_array[] = $filas["Cantidad"];
        $sub_array[] = $filas["Precio_Unitario"];
        $sub_array[] = $filas["Total"];
        $sub_array[] = $filas["Fecha_Adquision"];
        $sub_array[] = $filas["Estado_Insumo"];
        $sub_array[] = $filas["Nota"];
        /*if($filas["Estado"] == 'Activo') {
            $sub_array[] = '<span class="badge bg-success">' . $filas["Estado"] . '</span>';
        } else {
            $sub_array[] = '<span class="badge bg-danger">' . $filas["Estado"] . '</span>';
        }*/
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
    
    // Listar insumo por ID
    case 'list_insumo_id':
        $datos = $insumo->list_insumo_id($_POST["insumo_id"]);
        if(is_array($datos) && count($datos) > 0) {  
            foreach($datos as $row) {
                $output["id"] = $row["Id"];
                $output["co_modular"] = $row["Co_Modular"];
                $output["nombre"] = $row["Nombre"];
                $output["descripcion"] = $row["Descripcion"];
                $output["categoria_id"] = $row["Categoria_id"];
                $output["proveedor_id"] = $row["Proveedor_id"];
                $output["marca"] = $row["Marca"]; 
                $output["unidadmedida_id"] = $row["UnidadMedida_id"];
                $output["medida"] = $row["Medida"];
                $output["cantidad"] = $row["Cantidad"];
                $output["precio_unitario"] = $row["Precio_Unitario"];
                $output["fecha_adquisicion"] = $row["Fecha_Adquision"];
                $output["estado_insumo"] = $row["Estado_Insumo"];
                $output["nota"] = $row["Nota"];
            }
            echo json_encode($output); 
        }
    break;

    // Guardar y actualizar insumos
    case 'save_and_update_insumos':
    if(empty($_POST["insumo_id"])) { // Insertar
        $insumo->insert_insumo( 
            $_POST["p_co_modular"],
            $_POST["p_nombre"],
            $_POST["p_descripcion"],
            $_POST["p_categoria_id"],
            $_POST["p_proveedor_id"],
            $_POST["p_marca"],
            $_POST["p_unidadmedida_id"],
            $_POST["p_medida"],
            $_POST["p_cantidad"],
            $_POST["p_precio_unitario"],
            $_POST["p_fecha_adquisicion"],
            $_POST["p_estado_insumo"],
            $_POST["p_nota"]
        );  
    } else { // Actualizar
        $insumo->update_insumo(
            $_POST["insumo_id"],
            $_POST["p_co_modular"],
            $_POST["p_nombre"],
            $_POST["p_descripcion"],
            $_POST["p_categoria_id"],
            $_POST["p_proveedor_id"],
            $_POST["p_marca"],
            $_POST["p_unidadmedida_id"],
            $_POST["p_medida"],
            $_POST["p_cantidad"],
            $_POST["p_precio_unitario"],
            $_POST["p_fecha_adquisicion"],
            $_POST["p_estado_insumo"],
            $_POST["p_nota"]
        );  
    }       
break; 
    // Eliminar insumo
    case 'delete': 
        $insumo->delete_insumo($_POST["insumo_id"]);     
    break;

    // Obtener insumos para combobox
    case 'get_insumo_jcombox':
        $datos = $insumo->list_insumos();
        if (is_array($datos) && count($datos) > 0) {
            $html = "<option value=''>Seleccionar</option>";
            foreach ($datos as $row) {
                if($row["Estado"]=='Activo'){
                    $html .= "<option value='" . $row['Id'] . "'>" . $row['Nombre'] . "</option>";
                }
            }
            echo $html;
        }
    break;
}
?>
