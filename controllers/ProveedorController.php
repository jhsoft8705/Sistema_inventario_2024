<?php 
require_once("../config/conexion.php");
require_once("../models/Proveedor.php");

$proveedor = new Proveedor();

switch($_GET['endpoint']) { 
    case 'list_proveedores':
        $datos = $proveedor->list_proveedores();
        $data = array(); 
        foreach($datos as $filas) {
            $sub_array = array();
            $sub_array[] = $filas["Tipo_Documento"];
            $sub_array[] = $filas["NumeroDocumento"];
            $sub_array[] = $filas["P_Nombres"];
            $sub_array[] = $filas["P_Apellidos"];
            $sub_array[] = $filas["Telefono"];
            $sub_array[] = $filas["Direccion"];
            $sub_array[] = $filas["NombresCategoria"];
            $sub_array[] = $filas["Notas"];
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

    // Listar proveedor por ID
    case 'list_proveedor_id':
        $datos = $proveedor->list_proveedor_id($_POST["proveedor_id"]);
        if(is_array($datos) && count($datos) > 0) {  
            foreach($datos as $row) {
                $output["id"] = $row["Id"];
                $output["tipo_documento"] = $row["Tipo_Documento"];
                $output["numero_documento"] = $row["NumeroDocumento"];
                $output["nombres"] = $row["P_Nombres"];
                $output["apellidos"] = $row["P_Apellidos"];
                $output["telefono"] = $row["Telefono"];
                $output["direccion"] = $row["Direccion"];
                $output["id_cate"] = $row["Id_Cate"];
                $output["cate_nombre"] = $row["NombresCategoria"];
                $output["notas"] = $row["Notas"];
            }
            echo json_encode($output); 
        }
    break;

    // Guardar y actualizar proveedores
    case 'save_and_update_proveedores':
        if(empty($_POST["proveedor_id"])) { // Insertar
            $proveedor->insert_proveedor(
                $_POST["tipo"],
                $_POST["documento"],
                $_POST["nombre"],
                $_POST["apellido"],
                $_POST["telefono"],
                $_POST["direccion"],
                $_POST["categoria_id"],
                $_POST["nota"]
            );  
        } else { // Actualizar
            $proveedor->update_proveedor(
                $_POST["proveedor_id"],   
                $_POST["tipo"],
                $_POST["documento"],
                $_POST["nombre"],
                $_POST["apellido"],
                $_POST["telefono"],
                $_POST["direccion"],
                $_POST["categoria_id"],
                $_POST["nota"]
            );  
        }       
    break;
    
    // Eliminar proveedor
    case 'delete': 
        $proveedor->delete_proveedor($_POST["proveedor_id"]);     
    break;
    
    case 'get_provider_jcombox':
    $datos=$proveedor->list_proveedores();
    if (is_array($datos) == true and count($datos) > 0) {
        $html = "<option value=''>Seleccionar</option>";
        foreach ($datos as $row) {
          $html .= "<option value='" . $row['Id'] . "'>" . $row['NumeroDocumento'] .' ' .$row['P_Nombres'].' '. $row['P_Apellidos']."</option>";
        }
        echo $html;
    }
    break;

    
}
?>
