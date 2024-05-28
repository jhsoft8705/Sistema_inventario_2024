<?php 
require_once("../config/conexion.php");
require_once("../models/Categoria.php");

$categoria = new Categoria();

switch($_GET['endpoint']) {
    // Listar categorías
    case 'list_categorias':
        $datos = $categoria->list_category();
        $data = array();
        foreach($datos as $filas) {
            $sub_array = array();
            $sub_array[] = $filas["NombresCategoria"];
            $sub_array[] = $filas["DescripcionCategoria"]; 
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

    // Listar categoría por ID
    case 'list_categoria_id':
        $datos = $categoria->list_categoria_id($_POST["categoria_id"]);
        if(is_array($datos) && count($datos) > 0) {  
            foreach($datos as $row) {
                $output["id"] = $row["Id"];
                $output["nombre"] = $row["NombresCategoria"];
                $output["descripcion"] = $row["DescripcionCategoria"];
            }
            echo json_encode($output); 
        }
    break;

    // Guardar y actualizar categorías
    case 'save_and_update_categorias':
        if(empty($_POST["categoria_id"])) { // Insertar
            $categoria->insert_category(
                $_POST["nombre"],
                $_POST["descripcion"]
            );  
        } else { // Actualizar
            $categoria->update_category(
                $_POST["categoria_id"],   
                $_POST["nombre"], 
                $_POST["descripcion"]
            );  
        }       
    break;
    
    // Eliminar categoría
    case 'delete': 
        $categoria->delete_category($_POST["categoria_id"]);     
    break;

    
    case 'get_category_jcombox':
    $datos=$categoria->list_category();
    if (is_array($datos) == true and count($datos) > 0) {
        $html = "<option value=''>Seleccionar</option>";
        foreach ($datos as $row) {
          $html .= "<option value='" . $row['Id'] . "'>" . $row['NombresCategoria'] . "</option>";
        }
        echo $html;
    }
    break;
}
?>