<?php 
    require_once("../../config/conexion.php"); 

    require_once("../../models/Rol.php");
    $rol=new Rol(); 
    $datos=$rol->validar_acceso_rutas($_SESSION["rol_id"],"roles");
    /*TODO:Validar si la sesión exite , si no location al Login*/
    if(isset($_SESSION['usuario_id'])){ 
        /*TODO:Validar si la ruta tiene acceso*/ 
        if(is_array($datos) && count($datos) > 0) {
 ?>
 
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <title>Roles de Usuario - library system</title>

    <?php 
    include_once("../componentes/head.php");
    ?>
</head>

<body>

    <!-- ======= Header ======= -->
    <header id="header" class="header fixed-top d-flex align-items-center"> 
     <?php 
    include_once("../componentes/navbar.php");
    ?>
    </header>
    <!-- =======End Header =======-->

    <!-- ======= Sidebar =======-->

    <?php 
  include_once("../componentes/sidebar.php");
  ?>

    <!-- ======= End Sidebar =======-->
    <main id="main" class="main"> 
        <div class="row">
            <div class="col-lg-9 col-sm">
                <div class="pagetitle">
                    <h1>Roles de Usuario</h1>
                    <nav>
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="../home">Home</a></li>
                            <li class="breadcrumb-item active">Roles</li>
                        </ol>
                    </nav>
                </div>
            </div>
            <div class="col-lg-3 col-sm">
                <div class="pagetitle">
                    <div class="col-md-12 text-center">
                        <button id="btn_nuevo_registro" class="botones" type="button">Nuevo
                            Rol</button>
                    </div>
                    
                </div>
            </div>
            <!-- ======= Content ======= -->
            <section class="section">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-body waves-effect waves-light mt-2">
                                <table id="tabla_roles" class="table table-striped table-bordered display"
                                    width="100%">
                                    <thead>
                                        <tr>
                                            <th scope="col">Nombre del Rol</th>
                                            <th scope="col">Descripcion</th> 
                                             <th scope="col">Estado</th>
                                             <th scope="col"></th>

                                            <th scope="col"></th>
                                            <th scope="col"></th> 
                                        </tr>
                                    </thead>
                                    <tbody>
                                    </tbody>
                                </table>
                                <!-- End Table with stripped rows -->
                            </div>
                        </div>

                    </div>
                </div>
            </section>
        </div>
        <?php 
            include_once("form.php");
            include_once("../componentes/modal_noti.php");  
        ?>
        <!-- ======= End Content ======= -->
    </main>
    <!-- End #main -->
    <!-- ======= Footer ======= -->
    <?php 
    include_once("../componentes/footer.php");
    ?>
    <!-- =======End Footer=======- -->

    <!-- JS-->
    <?php 
    include_once("../componentes/js.php");
    ?>
    <script src="roles.js"></script>
    <script src="../componentes/complementos.js"></script>

    <!-- EN JS-->
</body>

<?php

}else{
    header("location:".Conectar::ruta()."views/404/");

    }
}else{ 
    header("location:".Conectar::ruta());
}
?>
</html>