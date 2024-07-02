<?php
class Asignacion extends Conectar
 
{
    /*TODO===============ASIGNACIONES====================================*/

     public function create_asignacion_temportal($user_id){
        try {
            $conectar = parent::Conexion();
            $sql="CALL create_temporary_asignacion(?)";  
            $query = $conectar->prepare($sql);
            $query->bindValue(1, $user_id);  
            $query->execute();
            return $query->fetchAll(PDO::FETCH_ASSOC);
        } catch (PDOException $e) {
             echo "Error en la consulta: " . $e->getMessage();
             return ["error" => "Ocurrió un error al ejecutar consulta"]; 
        }
    } 
    public function create_asignacion( $asignacion_id,$taller_id,$periodo_id,$user_id,$descripcion){
        try {
            $conectar = parent::Conexion();
            $sql="CALL registrar_asignacion(?,?,?,?,?)";  
            $query = $conectar->prepare($sql);
            $query->bindValue(1, $asignacion_id); 
            $query->bindValue(2, $taller_id);   
            $query->bindValue(3, $periodo_id);  
            $query->bindValue(4, $user_id); 
            $query->bindValue(5, $descripcion);  
            $query->execute(); 
        } catch (PDOException $e) {
             echo "Error en la consulta: " . $e->getMessage();
             return ["error" => "Ocurrió un error al ejecutar consulta"]; 
        }
    } 

    public function listar_asignacion($input_research,$periodo) {
        try {
            $conectar = parent::Conexion();
            $sql = "CALL listar_asignaciones(?,?)";  
            $query = $conectar->prepare($sql);
            $query->bindValue(1, $input_research);  
            $query->bindValue(2, $periodo);  
            $query->execute();
            return $query->fetchAll(PDO::FETCH_ASSOC);
        } catch (PDOException $e) {
            echo "Error en la consulta: " . $e->getMessage();
            return ["error" => "Ocurrió un error al ejecutar consulta"]; 
        }
    }
    
    //Listar asignacion x id
    public function listar_asignacion_x_id($asignacion_id) {
        try {
            $conectar = parent::Conexion();
            $sql = "CALL listar_asignaciones_id(?)";   
            $query = $conectar->prepare($sql);
            $query->bindValue(1, $asignacion_id);  
            $query->execute();
            return $query->fetchAll(PDO::FETCH_ASSOC);
        } catch (PDOException $e) {
            echo "Error en la consulta: " . $e->getMessage();
            return ["error" => "Ocurrió un error al ejecutar consulta"]; 
        }
    }
    
    /*TODO===============EQUIPOS====================================*/
    public function list_detalle_equipo_x_asignacion($asignacion_id){
        try {
            $conectar = parent::Conexion();
            $sql="CALL list_detalle_equipos_x_orden_id(?)";  
            $query = $conectar->prepare($sql);
            $query->bindValue(1, $asignacion_id);  
            $query->execute();
            return $query->fetchAll(PDO::FETCH_ASSOC);
        } catch (PDOException $e) {
             echo "Error en la consulta: " . $e->getMessage();
             return ["error" => "Ocurrió un error al ejecutar consulta"]; 
        }
    } 
    
    public function register_detalle_equipo($equipo_id,$asignacion_id,$cantidad,$precio_unitario){
        try {
            $conectar = parent::Conexion();
            $sql="CALL registrar_detalle_equipo (?,?,?,?)";  
            $query = $conectar->prepare($sql);
            $query->bindValue(1, $equipo_id); 
            $query->bindValue(2, $asignacion_id);
            $query->bindValue(3, $cantidad); 
            $query->bindValue(4, $precio_unitario);  
            $query->execute();
            return "registro con éxito."; 
         } catch (PDOException $e) {
             echo "Error en la consulta: " . $e->getMessage();
             return ["error" => "Ocurrió un error al ejecutar consulta"]; 
        }
    }

    public function eliminar_detalle_equipo($detale_id){
        try {
            $conectar = parent::Conexion();
            $sql="CALL eliminar_detalle_equipo (?)";  
            $query = $conectar->prepare($sql);
            $query->bindValue(1, $detale_id); 
            $query->execute();
            return "Registro eliminado con éxito."; 
         } catch (PDOException $e) {
             echo "Error en la consulta: " . $e->getMessage();
             return ["error" => "Ocurrió un error al ejecutar consulta"]; 
        }
    }
    /*TODO===============HERRAMIENTAS====================================*/
    public function list_detalle_herramienta_x_asignacion($asignacion_id) {
        try {
            $conectar = parent::Conexion();
            $sql = "CALL list_detalle_herramientas_x_orden_id(?)";  
            $query = $conectar->prepare($sql);
            $query->bindValue(1, $asignacion_id);  
            $query->execute();
            return $query->fetchAll(PDO::FETCH_ASSOC);
        } catch (PDOException $e) {
            echo "Error en la consulta: " . $e->getMessage();
            return ["error" => "Ocurrió un error al ejecutar consulta"]; 
        }
    } 

    public function register_detalle_herramienta($herramienta_id, $asignacion_id, $cantidad,$precio_unitario) {
        try {
            $conectar = parent::Conexion();
            $sql = "CALL registrar_detalle_herramienta (?,?,?,?)";  
            $query = $conectar->prepare($sql);
            $query->bindValue(1, $herramienta_id); 
            $query->bindValue(2, $asignacion_id);
            $query->bindValue(3, $cantidad);
            $query->bindValue(4, $precio_unitario);
            $query->execute();
            return "Registro con éxito."; 
        } catch (PDOException $e) {
            echo "Error en la consulta: " . $e->getMessage();
            return ["error" => "Ocurrió un error al ejecutar consulta"]; 
        }
    }

    public function eliminar_detalle_herramienta($detalle_id) {
        try {
            $conectar = parent::Conexion();
            $sql = "CALL eliminar_detalle_herramienta (?)";  
            $query = $conectar->prepare($sql);
            $query->bindValue(1, $detalle_id); 
            $query->execute();
            return "Registro eliminado con éxito."; 
        } catch (PDOException $e) {
            echo "Error en la consulta: " . $e->getMessage();
            return ["error" => "Ocurrió un error al ejecutar consulta"]; 
        }
    }

    /*TODO===============INSUMOS====================================*/
    public function list_detalle_insumo_x_asignacion($asignacion_id) {
        try {
            $conectar = parent::Conexion();
            $sql = "CALL list_detalle_insumos_x_orden_id(?)";  
            $query = $conectar->prepare($sql);
            $query->bindValue(1, $asignacion_id);  
            $query->execute();
            return $query->fetchAll(PDO::FETCH_ASSOC);
        } catch (PDOException $e) {
            echo "Error en la consulta: " . $e->getMessage();
            return ["error" => "Ocurrió un error al ejecutar consulta"]; 
        }
    } 

    public function register_detalle_insumo($insumo_id, $asignacion_id, $cantidad,$precio_unitario) {
        try {
            $conectar = parent::Conexion();
            $sql = "CALL registrar_detalle_insumo (?,?,?,?)";  
            $query = $conectar->prepare($sql);
            $query->bindValue(1, $insumo_id); 
            $query->bindValue(2, $asignacion_id);
            $query->bindValue(3, $cantidad); 
            $query->bindValue(4, $precio_unitario);

            $query->execute();
            return "Registro con éxito."; 
        } catch (PDOException $e) {
            echo "Error en la consulta: " . $e->getMessage();
            return ["error" => "Ocurrió un error al ejecutar consulta"]; 
        }
    }

    public function eliminar_detalle_insumo($detalle_id) {
        try {
            $conectar = parent::Conexion();
            $sql = "CALL eliminar_detalle_insumo (?)";  
            $query = $conectar->prepare($sql);
            $query->bindValue(1, $detalle_id); 
            $query->execute();
            return "Registro eliminado con éxito."; 
        } catch (PDOException $e) {
            echo "Error en la consulta: " . $e->getMessage();
            return ["error" => "Ocurrió un error al ejecutar consulta"]; 
        }
    }


    public function list_rol_id($rol_id){
        try {
            $conectar = parent::Conexion();
            $sql="CALL listar_rol_id (?)";  
            $query = $conectar->prepare($sql);
            $query->bindValue(1, $rol_id); 
            $query->execute();
            return $query->fetchAll(PDO::FETCH_ASSOC);
        } catch (PDOException $e) {
             echo "Error en la consulta: " . $e->getMessage();
             return ["error" => "Ocurrió un error al ejecutar consulta"]; 
        }
    }
 
    public function update_rol($id,$nombre,$descrip){
        try {
            $conectar = parent::Conexion();
            $sql="CALL actualizar_rol (?,?,?)";  
            $query = $conectar->prepare($sql);
            $query->bindValue(1, $id);
            $query->bindValue(2, $nombre); 
            $query->bindValue(3, $descrip);
            $query->execute(); 
            return $query->fetchAll(PDO::FETCH_ASSOC); 
            echo "El rol se ha actualizado con éxito."; 
         } catch (PDOException $e) {
             echo "Error en la consulta: " . $e->getMessage();
             return ["error" => "Ocurrió un error al ejecutar consulta"]; 
        }
    } 

 
    /*TODO:Asignación de permisos en roles*/
    public function List_permiso_x_rol_id($rol_id){
        try {
            $conectar = parent::Conexion();
            $sql="EXEC SP_CARGAR_PERMISOS_X_ROL_ID ?";  
            $query = $conectar->prepare($sql);
            $query->bindvalue(1,$rol_id);
            $query->execute();
            return $query->fetchAll(PDO::FETCH_ASSOC);
        } catch (PDOException $e) {
             echo "Error en la consulta: " . $e->getMessage();
             return ["error" => "Ocurrió un error al ejecutar consulta"]; 
        }
    } 

    /*TODO:Habilitar permiso*/
    public function Habilitar_permiso($detalle_menu_id){
        try {
            $conectar = parent::Conexion();
            $sql="SP_HABILITAR_PERMISO ?";  
            $query = $conectar->prepare($sql);
            $query->bindValue(1, $detalle_menu_id); 
            $query->execute();
            return "Operación ejecutada con exito - Hbailitar permiso."; 
         } catch (PDOException $e) {
             echo "Error en la consulta: " . $e->getMessage();
             return ["error" => "Ocurrió un error al ejecutar consulta"]; 
        }
    }
        /*TODO:Desabilitar permiso*/
    public function Desabilitar_permiso($detalle_menu_id){
        try {
            $conectar = parent::Conexion();
            $sql="SP_DESABILITAR_PERMISO ?";  
            $query = $conectar->prepare($sql);
            $query->bindValue(1, $detalle_menu_id); 
            $query->execute();
            return "Operación ejecutada con exito - Desabilitar permiso."; 
         } catch (PDOException $e) {
             echo "Error en la consulta: " . $e->getMessage();
             return ["error" => "Ocurrió un error al ejecutar consulta"]; 
        }
    }

    /*TODO:Crear nuevos registros de detalle menu segun el ROL - lista roles*/
    public function Create_new_list_permisos($rol_id){
        try {
            $conectar = parent::Conexion();
            $sql="SP_CREATE_NEW_LIST_PERMISOS ?";  
            $query = $conectar->prepare($sql);
            $query->bindValue(1, $rol_id); 
            $query->execute();
            return "Operación ejecutada con exito - Desabilitar permiso."; 
         } catch (PDOException $e) {
             echo "Error en la consulta: " . $e->getMessage();
             return ["error" => "Ocurrió un error al ejecutar consulta"]; 
        }
    }

       /*TODO:Crear nuevos registros de detalle menu segun el ROL - lista roles*/
       public function validar_acceso_rutas($user_id,$identificador){
        try {
            $conectar = parent::Conexion();
            $sql="SP_VALIDAR_ACCESO_URLS ?,?";  
            $query = $conectar->prepare($sql);
            $query->bindValue(1, $user_id); 
            $query->bindValue(2, $identificador);  
            $query->execute(); 
            return $query->fetchAll(PDO::FETCH_ASSOC); 
             return "Operación ejecutada con exito - Validar acceso."; 
         } catch (PDOException $e) {
             echo "Error en la consulta: " . $e->getMessage();
             return ["error" => "Ocurrió un error al ejecutar consulta"]; 
        }
    }
    
}

?>