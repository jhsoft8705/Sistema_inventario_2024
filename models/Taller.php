<?php 
class Taller extends Conectar 
{  
    public function list_talleres() {
        try {
            $conectar = parent::Conexion();
            $sql = "CALL listar_talleres()";  
            $query = $conectar->prepare($sql);
            $query->execute();
            return $query->fetchAll(PDO::FETCH_ASSOC);
        } catch (PDOException $e) {
            echo "Error en la consulta: " . $e->getMessage();
            return ["error" => "Ocurrió un error al ejecutar consulta"]; 
        }
    }

    public function insert_taller($nombre, $descripcion) {
        try {
            $conectar = parent::Conexion();
            $sql = "CALL registrar_taller(?, ?)";
            $query = $conectar->prepare($sql);
            $query->bindValue(1, $nombre);
            $query->bindValue(2, $descripcion);
            $query->execute();
            return "El taller se ha registrado con éxito."; 
        } catch (PDOException $e) {
            echo "Error en la consulta: " . $e->getMessage();
            return ["error" => "Ocurrió un error al ejecutar consulta"]; 
        }
    }
    
    public function list_taller_id($taller_id) {
        try {
            $conectar = parent::Conexion();
            $sql = "CALL listar_taller_id(?)";  
            $query = $conectar->prepare($sql);
            $query->bindValue(1, $taller_id); 
            $query->execute();
            return $query->fetchAll(PDO::FETCH_ASSOC);
        } catch (PDOException $e) {
            echo "Error en la consulta: " . $e->getMessage();
            return ["error" => "Ocurrió un error al ejecutar consulta"]; 
        }
    }
 
    public function update_taller($id, $nombre, $descripcion) {
        try {
            $conectar = parent::Conexion();
            $sql = "CALL actualizar_taller(?, ?, ?)";
            $query = $conectar->prepare($sql);
            $query->bindValue(1, $id);
            $query->bindValue(2, $nombre);
            $query->bindValue(3, $descripcion);
            $query->execute();
            return "El taller se ha actualizado con éxito."; 
        } catch (PDOException $e) {
            echo "Error en la consulta: " . $e->getMessage();
            return ["error" => "Ocurrió un error al ejecutar consulta"]; 
        }
    }

    public function delete_taller($taller_id) {
        try {
            $conectar = parent::Conexion();
            $sql = "CALL eliminar_taller(?)";  
            $query = $conectar->prepare($sql);
            $query->bindValue(1, $taller_id); 
            $query->execute();
            return "El taller se ha eliminado con éxito."; 
        } catch (PDOException $e) {
            echo "Error en la consulta: " . $e->getMessage();
            return ["error" => "Ocurrió un error al ejecutar consulta"]; 
        }
    }
}
?>
