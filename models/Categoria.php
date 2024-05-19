<?php 
class Categoria extends Conectar 
{  
    public function list_category() {
        try {
            $conectar = parent::Conexion();
            $sql = "CALL listar_categorias()";  
            $query = $conectar->prepare($sql);
            $query->execute();
            return $query->fetchAll(PDO::FETCH_ASSOC);
        } catch (PDOException $e) {
            echo "Error en la consulta: " . $e->getMessage();
            return ["error" => "Ocurrió un error al ejecutar consulta"]; 
        }
    }

    public function insert_category($nombre, $descripcion) {
        try {
            $conectar = parent::Conexion();
            $sql = "CALL registrar_categoria(?, ?)";
            $query = $conectar->prepare($sql);
            $query->bindValue(1, $nombre);
            $query->bindValue(2, $descripcion);
            $query->execute();
            return "La categoría se ha registrado con éxito."; 
        } catch (PDOException $e) {
            echo "Error en la consulta: " . $e->getMessage();
            return ["error" => "Ocurrió un error al ejecutar consulta"]; 
        }
    }
    
    public function list_categoria_id($categoria_id) {
        try {
            $conectar = parent::Conexion();
            $sql = "CALL listar_categoria_id(?)";  
            $query = $conectar->prepare($sql);
            $query->bindValue(1, $categoria_id); 
            $query->execute();
            return $query->fetchAll(PDO::FETCH_ASSOC);
        } catch (PDOException $e) {
            echo "Error en la consulta: " . $e->getMessage();
            return ["error" => "Ocurrió un error al ejecutar consulta"]; 
        }
    }
 
    public function update_category($id, $nombre, $descripcion) {
        try {
            $conectar = parent::Conexion();
            $sql = "CALL update_categoria(?, ?, ?)";
            $query = $conectar->prepare($sql);
            $query->bindValue(1, $id);
            $query->bindValue(2, $nombre);
            $query->bindValue(3, $descripcion);
            $query->execute();
            return "La categoría se ha actualizado con éxito."; 
        } catch (PDOException $e) {
            echo "Error en la consulta: " . $e->getMessage();
            return ["error" => "Ocurrió un error al ejecutar consulta"]; 
        }
    }

    public function delete_category($categoria_id) {
        try {
            $conectar = parent::Conexion();
            $sql = "CALL eliminar_categoria(?)";  
            $query = $conectar->prepare($sql);
            $query->bindValue(1, $categoria_id); 
            $query->execute();
            return "La categoría se ha eliminado con éxito."; 
        } catch (PDOException $e) {
            echo "Error en la consulta: " . $e->getMessage();
            return ["error" => "Ocurrió un error al ejecutar consulta"]; 
        }
    }
}
?>
