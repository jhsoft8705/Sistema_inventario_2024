<?php
class Rol extends Conectar
 
{
     public function list_rol(){
        try {
            $conectar = parent::Conexion();
            $sql="CALL listar_roles()";  
            $query = $conectar->prepare($sql);
            $query->execute();
            return $query->fetchAll(PDO::FETCH_ASSOC);
        } catch (PDOException $e) {
             echo "Error en la consulta: " . $e->getMessage();
             return ["error" => "Ocurrió un error al ejecutar consulta"]; 
        }
    } 


    
    public function insert_rol($nombre,$descrip){
        try {
            $conectar = parent::Conexion();
            $sql="SP_REGISTRAR_ROL ?,?";  
            $query = $conectar->prepare($sql);
            $query->bindValue(1, $nombre); 
            $query->bindValue(2, $descrip);
            $query->execute();
            return "La Categoria se ha registrado con éxito."; 
         } catch (PDOException $e) {
             echo "Error en la consulta: " . $e->getMessage();
             return ["error" => "Ocurrió un error al ejecutar consulta"]; 
        }
    }
    public function list_rol_id($rol_id){
        try {
            $conectar = parent::Conexion();
            $sql="SP_LISTAR_ROL_ID ?";  
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
            $sql="SP_ACTUALIZAR_ROL ?,?,?";  
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
    public function delete_rol($rol_id){
        try {
            $conectar = parent::Conexion();
            $sql="SP_ELIMINAR_ROL ?";  
            $query = $conectar->prepare($sql);
            $query->bindValue(1, $rol_id); 
            $query->execute();
            return "El rol se ha ELIMINADO con éxito."; 
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