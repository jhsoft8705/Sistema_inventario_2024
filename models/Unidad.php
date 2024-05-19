<?php 
class Unidad extends Conectar 
{  
    public function list_unidad() {
        try {
            $conectar = parent::Conexion();
            $sql = "CALL listar_unidades_medida()";  
            $query = $conectar->prepare($sql);
            $query->execute();
            return $query->fetchAll(PDO::FETCH_ASSOC);
        } catch (PDOException $e) {
            echo "Error en la consulta: " . $e->getMessage();
            return ["error" => "Ocurrió un error al ejecutar consulta"]; 
        }
    }

    public function insert_unidad($nombre, $abreviatura, $descripcion) {
        try {
            $conectar = parent::Conexion();
            $sql = "CALL registrar_unidad_medida(?, ?, ?)";
            $query = $conectar->prepare($sql);
            $query->bindValue(1, $nombre);
            $query->bindValue(2, $abreviatura);
            $query->bindValue(3, $descripcion);
            $query->execute();
            return "La unidad de medida se ha registrado con éxito."; 
        } catch (PDOException $e) {
            echo "Error en la consulta: " . $e->getMessage();
            return ["error" => "Ocurrió un error al ejecutar consulta"]; 
        }
    }
    
    public function list_unidad_id($unidad_id) {
        try {
            $conectar = parent::Conexion();
            $sql = "CALL listar_unidad_medida_id(?)";  
            $query = $conectar->prepare($sql);
            $query->bindValue(1, $unidad_id); 
            $query->execute();
            return $query->fetchAll(PDO::FETCH_ASSOC);
        } catch (PDOException $e) {
            echo "Error en la consulta: " . $e->getMessage();
            return ["error" => "Ocurrió un error al ejecutar consulta"]; 
        }
    }
 
    public function update_unidad($id, $nombre, $abreviatura, $descripcion) {
        try {
            $conectar = parent::Conexion();
            $sql = "CALL actualizar_unidad_medida(?, ?, ?, ?)";
            $query = $conectar->prepare($sql);
            $query->bindValue(1, $id);
            $query->bindValue(2, $nombre);
            $query->bindValue(3, $abreviatura);
            $query->bindValue(4, $descripcion);
            $query->execute();
            return "La unidad de medida se ha actualizado con éxito."; 
        } catch (PDOException $e) {
            echo "Error en la consulta: " . $e->getMessage();
            return ["error" => "Ocurrió un error al ejecutar consulta"]; 
        }
    }

    public function delete_unidad($unidad_id) {
        try {
            $conectar = parent::Conexion();
            $sql = "CALL eliminar_unidad_medida(?)";  
            $query = $conectar->prepare($sql);
            $query->bindValue(1, $unidad_id); 
            $query->execute();
            return "La unidad de medida se ha eliminado con éxito."; 
        } catch (PDOException $e) {
            echo "Error en la consulta: " . $e->getMessage();
            return ["error" => "Ocurrió un error al ejecutar consulta"]; 
        }
    }
}
?>
