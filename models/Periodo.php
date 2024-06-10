<?php
class Periodo extends Conectar
{
    public function list_periodos() {
        try {
            $conectar = parent::Conexion();
            $sql = "CALL listar_periodos()";
            $query = $conectar->prepare($sql);
            $query->execute();
            return $query->fetchAll(PDO::FETCH_ASSOC);
        } catch (PDOException $e) {
            echo "Error en la consulta: " . $e->getMessage();
            return ["error" => "Ocurrió un error al ejecutar consulta"];
        }
    }

    public function insert_periodo($nombre, $fecha_inicio, $fecha_fin, $descripcion) {
        try {
            $conectar = parent::Conexion();
            $sql = "CALL registrar_periodo(?, ?, ?, ?)";
            $query = $conectar->prepare($sql);
            $query->bindValue(1, $nombre);
            $query->bindValue(2, $fecha_inicio);
            $query->bindValue(3, $fecha_fin);
            $query->bindValue(4, $descripcion);
            $query->execute();
            return "El periodo se ha registrado con éxito.";
        } catch (PDOException $e) {
            echo "Error en la consulta: " . $e->getMessage();
            return ["error" => "Ocurrió un error al ejecutar consulta"];
        }
    }

    public function list_periodo_id($periodo_id) {
        try {
            $conectar = parent::Conexion();
            $sql = "CALL listar_periodo_id(?)";
            $query = $conectar->prepare($sql);
            $query->bindValue(1, $periodo_id);
            $query->execute();
            return $query->fetchAll(PDO::FETCH_ASSOC);
        } catch (PDOException $e) {
            echo "Error en la consulta: " . $e->getMessage();
            return ["error" => "Ocurrió un error al ejecutar consulta"];
        }
    }

    public function update_periodo($id, $nombre, $fecha_inicio, $fecha_fin, $descripcion) {
        try {
            $conectar = parent::Conexion();
            $sql = "CALL actualizar_periodo(?, ?, ?, ?, ?)";
            $query = $conectar->prepare($sql);
            $query->bindValue(1, $id);
            $query->bindValue(2, $nombre);
            $query->bindValue(3, $fecha_inicio);
            $query->bindValue(4, $fecha_fin);
            $query->bindValue(5, $descripcion);
            $query->execute();
            return "El periodo se ha actualizado con éxito.";
        } catch (PDOException $e) {
            echo "Error en la consulta: " . $e->getMessage();
            return ["error" => "Ocurrió un error al ejecutar consulta"];
        }
    }

    public function delete_periodo($periodo_id) {
        try {
            $conectar = parent::Conexion();
            $sql = "CALL eliminar_periodo(?)";
            $query = $conectar->prepare($sql);
            $query->bindValue(1, $periodo_id);
            $query->execute();
            return "El periodo se ha eliminado con éxito.";
        } catch (PDOException $e) {
            echo "Error en la consulta: " . $e->getMessage();
            return ["error" => "Ocurrió un error al ejecutar consulta"];
        }
    }
}
?>
