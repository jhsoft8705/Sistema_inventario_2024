<?php
class Ubicacion extends Conectar
{
    // Listar ubicaciones
    public function list_ubicaciones() {
        try {
            $conectar = parent::Conexion();
            $sql = "CALL listar_ubicaciones()";
            $query = $conectar->prepare($sql);
            $query->execute();
            return $query->fetchAll(PDO::FETCH_ASSOC);
        } catch (PDOException $e) {
            echo "Error en la consulta: " . $e->getMessage();
            return ["error" => "Ocurrió un error al ejecutar consulta"];
        }
    }

    // Insertar nueva ubicación
    public function insert_ubicacion($nombre, $descripcion) {
        try {
            $conectar = parent::Conexion();
            $sql = "CALL registrar_ubicacion(?, ?)";
            $query = $conectar->prepare($sql);
            $query->bindValue(1, $nombre);
            $query->bindValue(2, $descripcion);
            $query->execute();
            return "La ubicación se ha registrado con éxito.";
        } catch (PDOException $e) {
            echo "Error en la consulta: " . $e->getMessage();
            return ["error" => "Ocurrió un error al ejecutar consulta"];
        }
    }

    // Listar ubicación por ID
    public function list_ubicacion_id($ubicacion_id) {
        try {
            $conectar = parent::Conexion();
            $sql = "CALL listar_ubicacion_id(?)";
            $query = $conectar->prepare($sql);
            $query->bindValue(1, $ubicacion_id);
            $query->execute();
            return $query->fetchAll(PDO::FETCH_ASSOC);
        } catch (PDOException $e) {
            echo "Error en la consulta: " . $e->getMessage();
            return ["error" => "Ocurrió un error al ejecutar consulta"];
        }
    }

    // Actualizar ubicación existente
    public function update_ubicacion($id, $nombre, $descripcion) {
        try {
            $conectar = parent::Conexion();
            $sql = "CALL actualizar_ubicacion(?, ?, ?)";
            $query = $conectar->prepare($sql);
            $query->bindValue(1, $id);
            $query->bindValue(2, $nombre);
            $query->bindValue(3, $descripcion);
            $query->execute();
            return "La ubicación se ha actualizado con éxito.";
        } catch (PDOException $e) {
            echo "Error en la consulta: " . $e->getMessage();
            return ["error" => "Ocurrió un error al ejecutar consulta"];
        }
    }

    // Eliminar ubicación (cambiar estado a 'Eliminado')
    public function delete_ubicacion($ubicacion_id) {
        try {
            $conectar = parent::Conexion();
            $sql = "CALL eliminar_ubicacion(?)";
            $query = $conectar->prepare($sql);
            $query->bindValue(1, $ubicacion_id);
            $query->execute();
            return "La ubicación se ha eliminado con éxito.";
        } catch (PDOException $e) {
            echo "Error en la consulta: " . $e->getMessage();
            return ["error" => "Ocurrió un error al ejecutar consulta"];
        }
    }
}
?>
