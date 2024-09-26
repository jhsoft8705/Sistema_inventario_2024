 
<?php
    Session_start();
    /* TODO: Inicio de Session */
    class Conectar{
        protected $dbh;
        protected function Conexion(){
            try{
                /* TODO: Cadena de Conexion */
                $conectar = $this->dbh=new PDO("mysql:host=localhost;dbname=u270537271_db_inventory","u270537271_inventoryuser","4b@Oj[G=QUc");
                return $conectar;
            }catch (Exception $e){
                /* TODO: En caso de error mostrar mensaje */
                print "Error Conexion BD". $e->getMessage() ."<br/>";
                die();
            }
          
        } 
        public static function ruta(){

            return "http://jhonalexvillaflores.website/"; 
        }
    }
?>




