<?php 
require_once("../config/conexion.php");
require_once("../models/Almacen.php");

$almacen = new Almacen();

switch($_GET['endpoint']) {
    // Listar almacenes
    case 'list_almacen':
        $datos = $almacen->listar_almacen();
        $data = array();
        foreach($datos as $filas) {
            $sub_array = array();
            $sub_array[] = $filas["Codigo"];
            $sub_array[] = $filas["Nombre"];
            $sub_array[] = $filas["Descripcion"];
            $sub_array[] = $filas["Tipo"];
            $sub_array[] = $filas["Ubicacion"];
            $sub_array[] = $filas["Categoria"];
            $sub_array[] = $filas["Proveedor"];
            $sub_array[] = $filas["Marca"];
            $sub_array[] = $filas["Modelo"];
            $sub_array[] = $filas["Serie"];
            $sub_array[] = $filas["Color"];
            $sub_array[] = $filas["UnidadMedida"];
            $sub_array[] = $filas["Medida"];
            $sub_array[] = $filas["Cantidad"];
            $sub_array[] = $filas["Precio_Unitario"];
            $sub_array[] = $filas["Total"];
            $sub_array[] = $filas["Fecha_Adquision"];
            $sub_array[] = $filas["Adjunto"];
            $sub_array[] = $filas["Nota"];
            //$sub_array[] = $filas["Fase"];
            $sub_array[] = $filas["EstadoEquipo"];
            //$sub_array[] = '<span class="badge bg-success">' . $filas["Estado"] . '</span>';
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

    // Listar almacén por ID
    case 'list_almacen_id':
        $datos = $almacen->listar_almacen_id($_POST["almacen_id"]);
        if(is_array($datos) && count($datos) > 0) {  
            $output = array();
            foreach($datos as $row) {
                $output["id"] = $row["Id"];
                $output["codigo"] = $row["Codigo"];
                $output["nombre"] = $row["Nombre"];
                $output["descripcion"] = $row["Descripcion"];
                $output["tipo"] = $row["Tipo"];
                $output["ubicacion_id"] = $row["Id_ubicacion"];
                $output["categoria_id"] = $row["Id_Categoria"];
                $output["proveedor_id"] = $row["Id_Proveedor"];
                $output["marca"] = $row["Marca"];
                $output["modelo"] = $row["Modelo"];
                $output["serie"] = $row["Serie"];
                $output["color"] = $row["Color"];
                $output["unidad_medida_id"] = $row["Id_Unidad"];
                $output["medida"] = $row["Medida"];
                $output["cantidad"] = $row["Cantidad"];
                $output["precio_unitario"] = $row["Precio_Unitario"];
                $output["total"] = $row["Total"];
                $output["fecha_adquisicion"] = $row["Fecha_Adquision"];
                $output["adjunto"] = $row["Adjunto"];
                $output["nota"] = $row["Nota"];
                $output["fase"] = $row["Fase"];
                $output["estado_equipo"] = $row["EstadoEquipo"];
                $output["estado"] = $row["Estado"];
                $output["fecha_registro"] = $row["FechaRegistro"];
                $output["fecha_actualizacion"] = $row["FechaActualizacion"];
            }
            echo json_encode($output); 
        }
    break;

    // Guardar y actualizar almacén
    case 'save_and_update_almacen':
    $uploadDir = '../../assets/docs/';
    $adjuntoUrl = '';

    // Check if the file was uploaded without errors
    if (isset($_FILES['adjunto']) && $_FILES['adjunto']['error'] === UPLOAD_ERR_OK) {
        $fileTmpPath = $_FILES['adjunto']['tmp_name'];
        $fileName = $_FILES['adjunto']['name'];
        $fileSize = $_FILES['adjunto']['size'];
        $fileType = $_FILES['adjunto']['type'];
        $fileNameCmps = explode(".", $fileName);
        $fileExtension = strtolower(end($fileNameCmps));

        // Sanitize file name
        $newFileName = md5(time() . $fileName) . '.' . $fileExtension;

        // Check if the directory exists, if not, create it
        if (!is_dir($uploadDir)) {
            mkdir($uploadDir, 0777, true);
        }

        // Move the file to the specified directory
        $dest_path = $uploadDir . $newFileName;
        if (move_uploaded_file($fileTmpPath, $dest_path)) {
            $adjuntoUrl = 'assets/docs/' . $newFileName;
        } else {
            echo "There was an error moving the uploaded file.";
            exit;
        }
    } 
    // Debugging: Print POST data
    echo "almacen_id: " . $_POST["almacen_id"] . "\n";
    echo "codigo: " . $_POST["codigo"] . "\n";
    echo "nombre: " . $_POST["nombre"] . "\n";
    echo "descripcion: " . $_POST["descripcion"] . "\n";
    echo "tipo: " . $_POST["tipo"] . "\n";
    echo "ubicacion_id: " . $_POST["ubicacion_id"] . "\n";
    echo "categoria_id: " . $_POST["categoria_id"] . "\n";
    echo "proveedor_id: " . $_POST["proveedor_id"] . "\n";
    echo "marca: " . $_POST["marca"] . "\n";
    echo "modelo: " . $_POST["modelo"] . "\n";
    echo "serie: " . $_POST["serie"] . "\n";
    echo "color: " . $_POST["color"] . "\n";
    echo "unidad_medida_id: " . $_POST["unidad_medida_id"] . "\n";
    echo "medida: " . $_POST["medida"] . "\n";
    echo "cantidad: " . $_POST["cantidad"] . "\n";
    echo "precio_unitario: " . $_POST["precio_unitario"] . "\n";
    echo "fecha_adquisicion: " . $_POST["fecha_adquisicion"] . "\n";
    echo "adjunto: " . $adjuntoUrl . "\n";
    echo "estado_equipo: " . $_POST["estado_equipo"] . "\n";
    echo "nota: " . $_POST["nota"] . "\n";
        if(empty($_POST["almacen_id"])) { // Insertar
            $almacen->registrar_almacen(
                $_POST["codigo"],
                $_POST["nombre"],
                $_POST["descripcion"],
                $_POST["tipo"],
                $_POST["ubicacion_id"],
                $_POST["categoria_id"],
                $_POST["proveedor_id"],
                $_POST["marca"],
                $_POST["modelo"],
                $_POST["serie"],
                $_POST["color"],
                $_POST["unidad_medida_id"],
                $_POST["medida"],
                $_POST["cantidad"],
                $_POST["precio_unitario"],
                $_POST["fecha_adquisicion"],
                $adjuntoUrl, 
                $_POST["estado_equipo"] ,
                $_POST["nota"]
            );  
        } else { // Actualizar
            $almacen->actualizar_almacen(
                $_POST["almacen_id"],
                $_POST["codigo"],
                $_POST["nombre"],
                $_POST["descripcion"],
                $_POST["tipo"],
                $_POST["ubicacion_id"],
                $_POST["categoria_id"],
                $_POST["proveedor_id"],
                $_POST["marca"],
                $_POST["modelo"],
                $_POST["serie"],
                $_POST["color"],
                $_POST["unidad_medida_id"],
                $_POST["medida"],
                $_POST["cantidad"],
                $_POST["precio_unitario"],
                $_POST["fecha_adquisicion"],
                $adjuntoUrl,
                $_POST["estado_equipo"] ,
                $_POST["nota"]
            );  
        }  
    break;
    
    // Eliminar almacén
    case 'delete': 
        $almacen->eliminar_almacen($_POST["almacen_id"]);     
    break;

    // Obtener categorías para un combo box (opcional, si es necesario)
    case 'get_category_jcombox':
        $datos = $almacen->listar_almacen();
        if (is_array($datos) && count($datos) > 0) {
            $html = "<option value=''>Seleccionar</option>";
            foreach ($datos as $row) {
                $html .= "<option value='" . $row['Id'] . "'>" . $row['Nombre'] . "</option>";
            }
            echo $html;
        }
    break;
}

function subir_archivo($nombre_archivo, $carpeta_destino) {
    $nombre_original = $_FILES[$nombre_archivo]['name'];
    $ext = pathinfo($nombre_original, PATHINFO_EXTENSION);
    $nombre_final = uniqid() . "." . $ext;
    $ruta_destino = $carpeta_destino . $nombre_final;

    if (move_uploaded_file($_FILES[$nombre_archivo]['tmp_name'], $ruta_destino)) {
        return $ruta_destino;
    } else {
        return false;
    }
}

?>