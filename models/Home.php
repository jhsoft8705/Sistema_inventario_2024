<?php
class Home extends Conectar
 
{
     public function get_asignaciones_x_taller_dona(){
        try {
            $conectar = parent::Conexion();
            $sql="CALL grafico_echart_dona()";  
            $query = $conectar->prepare($sql);
            $query->execute();
            return $query->fetchAll(PDO::FETCH_ASSOC);
        } catch (PDOException $e) {
             echo "Error en la consulta: " . $e->getMessage();
             return ["error" => "Ocurrió un error al ejecutar consulta"]; 
        }
    }  

    public function get_usuarios_xtaller_dona(){
        try {
            $conectar = parent::Conexion();
            $sql="CALL grafico_usuario_taller_dona()";  
            $query = $conectar->prepare($sql);
            $query->execute();
            return $query->fetchAll(PDO::FETCH_ASSOC);
        } catch (PDOException $e) {
             echo "Error en la consulta: " . $e->getMessage();
             return ["error" => "Ocurrió un error al ejecutar consulta"]; 
        }
    }  
    
}

?>