<?php 
class Insumo extends Conectar 
{  
    public function list_insumos() {
        try {
            $conectar = parent::Conexion();
            $sql = "CALL listar_insumos()";  
            $query = $conectar->prepare($sql);
            $query->execute();
            return $query->fetchAll(PDO::FETCH_ASSOC);
        } catch (PDOException $e) {
            echo "Error en la consulta: " . $e->getMessage();
            return ["error" => "Ocurrió un error al ejecutar consulta"]; 
        }
    }

    public function insert_insumo($co_modular, $nombre, $descripcion, $categoria_id, $proveedor_id, $marca, $unidadmedida_id, $medida, $cantidad, $precio_unitario, $fecha_adquisicion, $estado_insumo, $nota) {
        try {
            $conectar = parent::Conexion();
            $sql = "CALL registrar_Insumo(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            $query = $conectar->prepare($sql);
            $query->bindValue(1, $co_modular);
            $query->bindValue(2, $nombre);
            $query->bindValue(3, $descripcion);
            $query->bindValue(4, $categoria_id);
            $query->bindValue(5, $proveedor_id);
            $query->bindValue(6, $marca); 
            $query->bindValue(7, $unidadmedida_id);
            $query->bindValue(8, $medida);
            $query->bindValue(9, $cantidad);
            $query->bindValue(10, $precio_unitario);
            $query->bindValue(11, $fecha_adquisicion);
            $query->bindValue(12, $estado_insumo);
            $query->bindValue(13, $nota);
            $query->execute();
            return "El insumo se ha registrado con éxito."; 
        } catch (PDOException $e) {
            echo "Error en la consulta: " . $e->getMessage();
            return ["error" => "Ocurrió un error al ejecutar consulta"]; 
        }
    }
    
    public function list_insumo_id($insumo_id) {
        try {
            $conectar = parent::Conexion();
            $sql = "CALL listar_insumo_id(?)";  
            $query = $conectar->prepare($sql);
            $query->bindValue(1, $insumo_id); 
            $query->execute();
            return $query->fetchAll(PDO::FETCH_ASSOC);
        } catch (PDOException $e) {
            echo "Error en la consulta: " . $e->getMessage();
            return ["error" => "Ocurrió un error al ejecutar consulta"]; 
        }
    }
 
    public function update_insumo($id, $co_modular, $nombre, $descripcion, $categoria_id, $proveedor_id, $marca, $unidadmedida_id, $medida, $cantidad, $precio_unitario, $fecha_adquisicion, $estado_insumo, $nota) {
        try {
            $conectar = parent::Conexion();
            $sql = "CALL actualizar_insumo(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            $query = $conectar->prepare($sql);
            $query->bindValue(1, $id);
            $query->bindValue(2, $co_modular);
            $query->bindValue(3, $nombre);
            $query->bindValue(4, $descripcion);
            $query->bindValue(5, $categoria_id);
            $query->bindValue(6, $proveedor_id);
            $query->bindValue(7, $marca);
            $query->bindValue(8, $unidadmedida_id);
            $query->bindValue(9, $medida);
            $query->bindValue(10, $cantidad);
            $query->bindValue(11, $precio_unitario);
            $query->bindValue(12, $fecha_adquisicion);
            $query->bindValue(13, $estado_insumo);
            $query->bindValue(14, $nota);
            $query->execute();
            return "El insumo se ha actualizado con éxito."; 
        } catch (PDOException $e) {
            echo "Error en la consulta: " . $e->getMessage();
            return ["error" => "Ocurrió un error al ejecutar consulta"]; 
        }
    }

    public function delete_insumo($insumo_id) {
        try {
            $conectar = parent::Conexion();
            $sql = "CALL eliminar_insumo(?)";  
            $query = $conectar->prepare($sql);
            $query->bindValue(1, $insumo_id); 
            $query->execute();
            return "El insumo se ha eliminado con éxito."; 
        } catch (PDOException $e) {
            echo "Error en la consulta: " . $e->getMessage();
            return ["error" => "Ocurrió un error al ejecutar consulta"]; 
        }
    }
}
?>
