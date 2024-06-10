<?php 
class Equipo extends Conectar 
{  
    public function list_equipos() {
        try {
            $conectar = parent::Conexion();
            $sql = "CALL listar_equipos()";  
            $query = $conectar->prepare($sql);
            $query->execute();
            return $query->fetchAll(PDO::FETCH_ASSOC);
        } catch (PDOException $e) {
            echo "Error en la consulta: " . $e->getMessage();
            return ["error" => "Ocurrió un error al ejecutar consulta"]; 
        }
    }

    public function insert_equipo($co_modular, $nombre, $descripcion, $categoria_id, $proveedor_id, $marca, $modelo, $serie, $color, $unidadmedida_id, $medida, $cantidad, $precio_unitario, $fecha_adquisicion, $estado_equipo, $nota) {
        try {
            $conectar = parent::Conexion();
            $sql = "CALL registrar_equipo(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            $query = $conectar->prepare($sql);
            $query->bindValue(1, $co_modular);
            $query->bindValue(2, $nombre);
            $query->bindValue(3, $descripcion);
            $query->bindValue(4, $categoria_id);
            $query->bindValue(5, $proveedor_id);
            $query->bindValue(6, $marca);
            $query->bindValue(7, $modelo);
            $query->bindValue(8, $serie);
            $query->bindValue(9, $color);
            $query->bindValue(10, $unidadmedida_id);
            $query->bindValue(11, $medida);
            $query->bindValue(12, $cantidad);
            $query->bindValue(13, $precio_unitario);
            $query->bindValue(14, $fecha_adquisicion);
            $query->bindValue(15, $estado_equipo);
            $query->bindValue(16, $nota);
            $query->execute();
            return "El equipo se ha registrado con éxito."; 
        } catch (PDOException $e) {
            echo "Error en la consulta: " . $e->getMessage();
            return ["error" => "Ocurrió un error al ejecutar consulta"]; 
        }
    }
    
    public function list_equipo_id($equipo_id) {
        try {
            $conectar = parent::Conexion();
            $sql = "CALL listar_equipo_id(?)";  
            $query = $conectar->prepare($sql);
            $query->bindValue(1, $equipo_id); 
            $query->execute();
            return $query->fetchAll(PDO::FETCH_ASSOC);
        } catch (PDOException $e) {
            echo "Error en la consulta: " . $e->getMessage();
            return ["error" => "Ocurrió un error al ejecutar consulta"]; 
        }
    }
 
    public function update_equipo($id, $co_modular, $nombre, $descripcion, $categoria_id, $proveedor_id, $marca, $modelo, $serie, $color, $unidadmedida_id, $medida, $cantidad, $precio_unitario, $fecha_adquisicion, $estado_equipo, $nota) {
        try {
            $conectar = parent::Conexion();
            $sql = "CALL actualizar_equipo(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            $query = $conectar->prepare($sql);
            $query->bindValue(1, $id);
            $query->bindValue(2, $co_modular);
            $query->bindValue(3, $nombre);
            $query->bindValue(4, $descripcion);
            $query->bindValue(5, $categoria_id);
            $query->bindValue(6, $proveedor_id);
            $query->bindValue(7, $marca);
            $query->bindValue(8, $modelo);
            $query->bindValue(9, $serie);
            $query->bindValue(10, $color);
            $query->bindValue(11, $unidadmedida_id);
            $query->bindValue(12, $medida);
            $query->bindValue(13, $cantidad);
            $query->bindValue(14, $precio_unitario);
            $query->bindValue(15, $fecha_adquisicion);
            $query->bindValue(16, $estado_equipo);
            $query->bindValue(17, $nota);
            $query->execute();
            return "El equipo se ha actualizado con éxito."; 
        } catch (PDOException $e) {
            echo "Error en la consulta: " . $e->getMessage();
            return ["error" => "Ocurrió un error al ejecutar consulta"]; 
        }
    }

    public function delete_equipo($equipo_id) {
        try {
            $conectar = parent::Conexion();
            $sql = "CALL eliminar_equipo(?)";  
            $query = $conectar->prepare($sql);
            $query->bindValue(1, $equipo_id); 
            $query->execute();
            return "El equipo se ha eliminado con éxito."; 
        } catch (PDOException $e) {
            echo "Error en la consulta: " . $e->getMessage();
            return ["error" => "Ocurrió un error al ejecutar consulta"]; 
        }
    }
}
?>
