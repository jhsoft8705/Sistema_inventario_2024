<?php 
class Proveedor extends Conectar 
{  
    public function list_proveedores() {
        try {
            $conectar = parent::Conexion();
            $sql = "CALL listar_proveedores()";  
            $query = $conectar->prepare($sql);
            $query->execute();
            return $query->fetchAll(PDO::FETCH_ASSOC);
        } catch (PDOException $e) {
            echo "Error en la consulta: " . $e->getMessage();
            return ["error" => "Ocurrió un error al ejecutar consulta"]; 
        }
    }

    public function insert_proveedor($tipo_documento, $numero_documento, $nombres, $apellidos, $telefono, $direccion, $id_cate, $notas) {
        try {
            $conectar = parent::Conexion();
            $sql = "CALL registrar_proveedor(?, ?, ?, ?, ?, ?, ?, ?)";
            $query = $conectar->prepare($sql);
            $query->bindValue(1, $tipo_documento);
            $query->bindValue(2, $numero_documento);
            $query->bindValue(3, $nombres);
            $query->bindValue(4, $apellidos);
            $query->bindValue(5, $telefono);
            $query->bindValue(6, $direccion);
            $query->bindValue(7, $id_cate);
            $query->bindValue(8, $notas);
            $query->execute();
            return "El proveedor se ha registrado con éxito."; 
        } catch (PDOException $e) {
            echo "Error en la consulta: " . $e->getMessage();
            return ["error" => "Ocurrió un error al ejecutar consulta"]; 
        }
    }
    
    public function list_proveedor_id($proveedor_id) {
        try {
            $conectar = parent::Conexion();
            $sql = "CALL listar_proveedor_id(?)";  
            $query = $conectar->prepare($sql);
            $query->bindValue(1, $proveedor_id); 
            $query->execute();
            return $query->fetchAll(PDO::FETCH_ASSOC);
        } catch (PDOException $e) {
            echo "Error en la consulta: " . $e->getMessage();
            return ["error" => "Ocurrió un error al ejecutar consulta"]; 
        }
    }
 
    public function update_proveedor($id, $tipo_documento, $numero_documento, $nombres, $apellidos, $telefono, $direccion, $id_cate, $notas) {
        try {
            $conectar = parent::Conexion();
            $sql = "CALL actualizar_proveedor(?, ?, ?, ?, ?, ?, ?, ?, ?)";
            $query = $conectar->prepare($sql);
            $query->bindValue(1, $id);
            $query->bindValue(2, $tipo_documento);
            $query->bindValue(3, $numero_documento);
            $query->bindValue(4, $nombres);
            $query->bindValue(5, $apellidos);
            $query->bindValue(6, $telefono);
            $query->bindValue(7, $direccion);
            $query->bindValue(8, $id_cate);
            $query->bindValue(9, $notas);
            $query->execute();
            return "El proveedor se ha actualizado con éxito."; 
        } catch (PDOException $e) {
            echo "Error en la consulta: " . $e->getMessage();
            return ["error" => "Ocurrió un error al ejecutar consulta"]; 
        }
    }

    public function delete_proveedor($proveedor_id) {
        try {
            $conectar = parent::Conexion();
            $sql = "CALL eliminar_proveedor(?)";  
            $query = $conectar->prepare($sql);
            $query->bindValue(1, $proveedor_id); 
            $query->execute();
            return "El proveedor se ha eliminado con éxito."; 
        } catch (PDOException $e) {
            echo "Error en la consulta: " . $e->getMessage();
            return ["error" => "Ocurrió un error al ejecutar consulta"]; 
        }
    }
}
?>
