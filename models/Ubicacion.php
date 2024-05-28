<?php 
class Ubicacion extends Conectar 
{  
    public function list_ubicacion() {
        try {
            $conectar = parent::Conexion();
            $sql = "CALL listar_ubicacion()";  
            $query = $conectar->prepare($sql);
            $query->execute();
            return $query->fetchAll(PDO::FETCH_ASSOC);
        } catch (PDOException $e) {
            echo "Error en la consulta: " . $e->getMessage();
            return ["error" => "Ocurrió un error al ejecutar consulta"]; 
        }
    }

    public function insert_ubicacion($nombre, $abreviatura, $descripcion) {
        try {
            $conectar = parent::Conexion();
            $sql = "CALL registrar_ubicacion_medida(?, ?, ?)";
            $query = $conectar->prepare($sql);
            $query->bindValue(1, $nombre);
            $query->bindValue(2, $abreviatura);
            $query->bindValue(3, $descripcion);
            $query->execute();
            return "La ubicacion de medida se ha registrado con éxito."; 
        } catch (PDOException $e) {
            echo "Error en la consulta: " . $e->getMessage();
            return ["error" => "Ocurrió un error al ejecutar consulta"]; 
        }
    }
    
    public function list_ubicacion_id($ubicacion_id) {
        try {
            $conectar = parent::Conexion();
            $sql = "CALL listar_ubicacion_medida_id(?)";  
            $query = $conectar->prepare($sql);
            $query->bindValue(1, $ubicacion_id); 
            $query->execute();
            return $query->fetchAll(PDO::FETCH_ASSOC);
        } catch (PDOException $e) {
            echo "Error en la consulta: " . $e->getMessage();
            return ["error" => "Ocurrió un error al ejecutar consulta"]; 
        }
    }
 
    public function update_ubicacion($id, $nombre, $abreviatura, $descripcion) {
        try {
            $conectar = parent::Conexion();
            $sql = "CALL actualizar_ubicacion_medida(?, ?, ?, ?)";
            $query = $conectar->prepare($sql);
            $query->bindValue(1, $id);
            $query->bindValue(2, $nombre);
            $query->bindValue(3, $abreviatura);
            $query->bindValue(4, $descripcion);
            $query->execute();
            return "La ubicacion de medida se ha actualizado con éxito."; 
        } catch (PDOException $e) {
            echo "Error en la consulta: " . $e->getMessage();
            return ["error" => "Ocurrió un error al ejecutar consulta"]; 
        }
    }

    public function delete_ubicacion($ubicacion_id) {
        try {
            $conectar = parent::Conexion();
            $sql = "CALL eliminar_ubicacion_medida(?)";  
            $query = $conectar->prepare($sql);
            $query->bindValue(1, $ubicacion_id); 
            $query->execute();
            return "La ubicacion de medida se ha eliminado con éxito."; 
        } catch (PDOException $e) {
            echo "Error en la consulta: " . $e->getMessage();
            return ["error" => "Ocurrió un error al ejecutar consulta"]; 
        }
    }
}
?>
