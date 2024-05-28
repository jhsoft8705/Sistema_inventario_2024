<?php 
class Almacen extends Conectar 
{  
    // Listar todos los registros del almacén
    public function listar_almacen() {
        try {
            $conectar = parent::Conexion();
            $sql = "CALL listar_almacen()";  
            $query = $conectar->prepare($sql);
            $query->execute();
            return $query->fetchAll(PDO::FETCH_ASSOC);
        } catch (PDOException $e) {
            echo "Error en la consulta: " . $e->getMessage();
            return ["error" => "Ocurrió un error al ejecutar consulta"]; 
        }
    }

    // Listar un registro del almacén por ID
    public function listar_almacen_id($almacen_id) {
        try {
            $conectar = parent::Conexion();
            $sql = "CALL listar_almacen_id(?)";  
            $query = $conectar->prepare($sql);
            $query->bindValue(1, $almacen_id); 
            $query->execute();
            return $query->fetch(PDO::FETCH_ASSOC);
        } catch (PDOException $e) {
            echo "Error en la consulta: " . $e->getMessage();
            return ["error" => "Ocurrió un error al ejecutar consulta"]; 
        }
    }

    // Insertar un nuevo registro en el almacén
    public function registrar_almacen($codigo, $nombre, $descripcion, $tipo, $ubicacion_id, $categoria_id, $proveedor_id, $marca, $modelo, $serie, $color, $unidad_medida_id, $medida, $cantidad, $precio_unitario, $fecha_adquisicion, $adjunto,$estado_equipo,$nota, ) {
        try {
            $conectar = parent::Conexion();
            $sql = "CALL registrar_almacen(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? )";
            $query = $conectar->prepare($sql);
            $query->bindValue(1, $codigo);
            $query->bindValue(2, $nombre);
            $query->bindValue(3, $descripcion);
            $query->bindValue(4, $tipo);
            $query->bindValue(5, $ubicacion_id);
            $query->bindValue(6, $categoria_id);
            $query->bindValue(7, $proveedor_id);
            $query->bindValue(8, $marca);
            $query->bindValue(9, $modelo);
            $query->bindValue(10, $serie);
            $query->bindValue(11, $color);
            $query->bindValue(12, $unidad_medida_id);
            $query->bindValue(13, $medida);
            $query->bindValue(14, $cantidad);
            $query->bindValue(15, $precio_unitario);
            $query->bindValue(16, $fecha_adquisicion);
            $query->bindValue(17, $adjunto); 
            $query->bindValue(18, $estado_equipo); 
            $query->bindValue(19, $nota); 
            $query->execute();
            return "El registro se ha almacenado con éxito."; 
        } catch (PDOException $e) {
            echo "Error en la consulta: " . $e->getMessage();
            return ["error" => "Ocurrió un error al ejecutar consulta"]; 
        }
    }

    // Actualizar un registro del almacén
    public function actualizar_almacen($almacen_id, $codigo, $nombre, $descripcion, $tipo, $ubicacion_id, $categoria_id, $proveedor_id, $marca, $modelo, $serie, $color, $unidad_medida_id, $medida, $cantidad, $precio_unitario, $fecha_adquisicion, $adjunto, $nota,  $estado_equipo ) {
        try {
            $conectar = parent::Conexion();
            $sql = "CALL actualizar_almacen(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            $query = $conectar->prepare($sql);
            $query->bindValue(1, $almacen_id);
            $query->bindValue(2, $codigo);
            $query->bindValue(3, $nombre);
            $query->bindValue(4, $descripcion);
            $query->bindValue(5, $tipo);
            $query->bindValue(6, $ubicacion_id);
            $query->bindValue(7, $categoria_id);
            $query->bindValue(8, $proveedor_id);
            $query->bindValue(9, $marca);
            $query->bindValue(10, $modelo);
            $query->bindValue(11, $serie);
            $query->bindValue(12, $color);
            $query->bindValue(13, $unidad_medida_id);
            $query->bindValue(14, $medida);
            $query->bindValue(15, $cantidad);
            $query->bindValue(16, $precio_unitario);
            $query->bindValue(17, $fecha_adquisicion);
            $query->bindValue(18, $adjunto);
            $query->bindValue(19, $nota); 
            $query->bindValue(21, $estado_equipo); 
            $query->execute();
            return "El registro se ha actualizado con éxito."; 
        } catch (PDOException $e) {
            echo "Error en la consulta: " . $e->getMessage();
            return ["error" => "Ocurrió un error al ejecutar consulta"]; 
        }
    }

    // Eliminar un registro del almacén
    public function eliminar_almacen($almacen_id) {
        try {
            $conectar = parent::Conexion();
            $sql = "CALL eliminar_almacen(?)";  
            $query = $conectar->prepare($sql);
            $query->bindValue(1, $almacen_id); 
            $query->execute();
            return "El registro se ha eliminado con éxito."; 
        } catch (PDOException $e) {
            echo "Error en la consulta: " . $e->getMessage();
            return ["error" => "Ocurrió un error al ejecutar consulta"]; 
        }
    }
}
?>
