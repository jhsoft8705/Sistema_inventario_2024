<?php
//require_once("Institucion.php");
 
class Usuario extends Conectar 
{  
    /*private $institucion;
    public function __construct() {
        $this->institucion = new Institucion();
    } 
    private function getInstitucion() {
        $datos = $this->institucion->listar_info_institucion();
        $logo = $datos[0]['Link_logo_menu'];//isset($datos[0]['Link_logo_menu']) ? $datos[0]['Link_logo_menu'] : '';
        $nombre =$datos[0]['Nombre_Sistema']; //isset($datos[0]['Nombre_Sistema']) ? $datos[0]['Nombre_Sistema'] : '';
        return array('logo' => $logo, 'nombre' => $nombre);
    }*/
    public function List_User(){
        try {
            $conectar = parent::Conexion();
            $sql="CALL listar_usuarios ()";  
            $query = $conectar->prepare($sql);
            $query->execute();
            return $query->fetchAll(PDO::FETCH_ASSOC);
        } catch (PDOException $e) {
             echo "Error en la consulta: " . $e->getMessage();
             return ["error" => "Ocurrió un error al ejecutar consulta"]; 
        }
    }
 
 
    public function insert_user($nombre, $apellidos, $doc, $correo, $pass, $id_rol, $estado) {
        try {
            $conectar = parent::Conexion();
            $sql = "CALL registrar_usuario(?, ?, ?, ?, ?, ?, ?)";
            $query = $conectar->prepare($sql);
            $query->bindValue(1, $nombre);
            $query->bindValue(2, $apellidos);
            $query->bindValue(3, $doc);
            $query->bindValue(4, $correo);    
            $query->bindValue(5, $pass);
            $query->bindValue(6, $id_rol);
            $query->bindValue(7, $estado);
            $query->execute();
            return "El usuario se ha registrado con éxito."; 
        } catch (PDOException $e) {
            echo "Error en la consulta: " . $e->getMessage();
            return ["error" => "Ocurrió un error al ejecutar consulta"]; 
        }
    }
    
    
    public function list_user_id($usuario_id){
        try {
            $conectar = parent::Conexion();
            $sql="CALL listar_user_id (?)";  
            $query = $conectar->prepare($sql);
            $query->bindValue(1, $usuario_id); 
            $query->execute();
            return $query->fetchAll(PDO::FETCH_ASSOC);
        } catch (PDOException $e) {
             echo "Error en la consulta: " . $e->getMessage();
             return ["error" => "Ocurrió un error al ejecutar consulta"]; 
        }
    }
 
    public function update_user($id,$nombre, $apellidos, $doc, $correo, $pass, $id_rol, $estado) {
        try {
            $conectar = parent::Conexion();
            $sql = "CALL update_user(?,?, ?, ?, ?, ?, ?, ?)";
            $query = $conectar->prepare($sql);
            $query->bindValue(1, $id); 
            $query->bindValue(2, $nombre);
            $query->bindValue(3, $apellidos);
            $query->bindValue(4, $doc);
            $query->bindValue(5, $correo);    
            $query->bindValue(6, $pass);
            $query->bindValue(7, $id_rol);
            $query->bindValue(8, $estado);
            $query->execute(); 
            echo "El usuario se ha actualizado con éxito."; 
         } catch (PDOException $e) {
             echo "Error en la consulta: " . $e->getMessage();
             return ["error" => "Ocurrió un error al ejecutar consulta"]; 
        }
    } 
 
    public function delete_user($usuario_id){
        try {
            $conectar = parent::Conexion();
            $sql="CALL eliminar_user(?)";  
            $query = $conectar->prepare($sql);
            $query->bindValue(1, $usuario_id); 
            $query->execute();
            return "El usuario se ha ELIMINADO con éxito."; 
         } catch (PDOException $e) {
             echo "Error en la consulta: " . $e->getMessage();
             return ["error" => "Ocurrió un error al ejecutar consulta"]; 
        }
    }

 
    /*TODO:Mostrar foto en perfil*/
    public function Cambiar_imagen($id_usuario,$url_img){
        try {
            $conectar = parent::Conexion();
            $sql="SP_CHANGE_PHOTO ?,?";  
            $query = $conectar->prepare($sql);
            $query->bindValue(1, $id_usuario); 
            $query->bindValue(2, $url_img);  
            $query->execute(); 
             echo "Foto cambiada con exito"; 
         } catch (PDOException $e) {
             echo "Error en la consulta: " . $e->getMessage();
             return ["error" => "Ocurrió un error al ejecutar consulta"]; 
        }
    } 

    
    
    public function update_change_password($user_id, $password, $new_password) {
        try {
            $conectar = parent::Conexion();
            $sql = "SP_CHANGE_PASSWORD ?, ?, ?";  
            $query = $conectar->prepare($sql);
            $query->bindValue(1, $user_id);
            $query->bindValue(2, $password);
            $query->bindValue(3, $new_password);
            $query->execute(); 
            $mensaje = $query->fetch(PDO::FETCH_ASSOC);
        return $mensaje ? $mensaje['Mensaje'] : "No se ha devuelto ningún mensaje.";
        } catch (PDOException $e) {
            return "Error en la consulta: " . $e->getMessage();
        }
    } 

 
     /* TODO: Funcion acceso al sistema */
    public function Login() { 
        $conectar = parent::Conexion(); 
        if (isset($_POST["enviar"])) {
            $user = $_POST["txt_user"];
            $pass = $_POST["txt_pass"]; 
            
            try {
                $sql = "CALL sp_login (?,?)";
                $query = $conectar->prepare($sql);
                $query->bindValue(1, $user);
                $query->bindValue(2, $pass);
                $query->execute();
                $messages = $query->fetch(PDO::FETCH_ASSOC);

                if ($messages['LoginStatus'] === 'SUCCESS') {
                    if (is_array($messages) && count($messages) > 0) {
                        // Guardamos los datos del usuario en la sesión
                        $_SESSION["usuario_id"] = $messages["Id"];
                        $_SESSION["nombre_user"] = $messages["NombresUsuario"]; 
                        $_SESSION["apellido_user"] = $messages["ApellidosUsuario"];  
                        $_SESSION["correo_user"] = $messages["CorreoElectronico"]; 
                        $_SESSION["telefono"] = $messages["Telefono"];
                        $_SESSION["documento"] = $messages["NumeroDocumento"];   
                        $_SESSION["direccion"] = $messages["Direccion"];    
                        $_SESSION["rol_id"] = $messages["Id_rol"]; 
                        $_SESSION["nombre_rol"] = $messages["NombreRol"]; 
                        $_SESSION["descripcion_rol"] = $messages["Descripcion"];    
                        $_SESSION["permiso_noti"] = $messages["Notificaciones"];   
                        $_SESSION["foto_perfil"] = $messages["Url_foto"];  
                        $_SESSION["estado"] = $messages["Estado"];    
                        $_SESSION["fecha_registro"] = $messages["FechaRegistro"];     
                        // Redirigimos al usuario a la vista de inicio
                        header("Location: views/home/");
                        exit();
                    }else{
                        $_SESSION["mensaje"] = "Error: ecredenciales incorrectas";
                        //header("Location: index.php");
                        header("Location:".conectar::ruta());
                        exit();
                    } 
                } else {
                    // Si hay errores, almacenarlos en variables de sesión
                    $_SESSION['passErrorMessage'] = '';
                    $_SESSION['genericErrorMessage'] = '';

                    if ($messages['LoginStatus'] === 'PASSWORD_ERROR') {
                        $_SESSION['passErrorMessage'] = 'Contraseña incorrecta';
                    } elseif ($messages['LoginStatus'] === 'USER_NOT_FOUND') {
                        $_SESSION['passErrorMessage'] = 'Usuario no encontrado';
                    } elseif ($messages['LoginStatus'] === 'USER_INACTIVE') {
                        $_SESSION['passErrorMessage'] = 'Su cuenta se ecuentra Inactiva';
                    } else {
                        $_SESSION['genericErrorMessage'] = 'Inicio de sesión fallido: ' . $messages['LoginStatus'];
                    }

                    // Redirigir de nuevo al index.php
                    header("Location:".conectar::ruta()); 
                    exit();  
                }
            } catch (PDOException $e) {
                // Almacena el mensaje de error en una variable de sesión
                $_SESSION['genericErrorMessage'] = 'Error en la consulta: ' . $e->getMessage();

                // Redirigir de nuevo al index.php
                //header("Location: index.php");
                header("Location:".conectar::ruta());
                exit(); // Agrega esta línea para detener la ejecución después de la redirección
            }
        }
    } 
    
}

?>