 
<?php
    Session_start();
    /* TODO: Inicio de Session */
    class Conectar{
        protected $dbh;

        protected function Conexion(){
            $dbname = "u270537271_db_inventory";  
            $dbuser = "u270537271_inventariouser";  
            $dbpass = "9c3[h5f^U";  
            try{
                /* TODO: Cadena de Conexion */
                $conectar = $this->dbh=new PDO("mysql:host=localhost;dbname=$dbname", $dbuser, $dbpass);  
                return $conectar;
            }catch (Exception $e){
                /* TODO: En caso de error mostrar mensaje */
                print "Error Conexion BD". $e->getMessage() ."<br/>";
                die();
            }
          
        } 
        public static function ruta(){

            return "http://localhost/Sistema_inventario_2024/"; 
        }
    }
?>




