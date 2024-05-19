<?php
    session_start();
    /* TODO: Inicio de Session */
    class Conectar{
        protected $dbh;
        protected function Conexion(){
            try{
                /* TODO: Cadena de Conexion */
                $conectar = $this->dbh=new 
                PDO("sqlsrv:Server=DESKTOP-18L73MT\SQLEXPRESS;Database=bd_sys_library","sa","123");
                 return $conectar;
            }catch (Exception $e){
                /* TODO: En caso de error mostrar mensaje */
                print "Error Conexion BD". $e->getMessage() ."<br/>";
                die();
            }
        } 
        public static function ruta(){ 
             return "http://localhost/Sistema_biblioteca_2023/";  
        }

        public static function ruta_Base_menu(){ 
            return "/Sistema_biblioteca_2023/";  
       }
    }
?>