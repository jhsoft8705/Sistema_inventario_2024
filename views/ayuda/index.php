<?php  
require_once("../../config/conexion.php"); 

 



/*TODO:Validar si la sesión exite , si no location al Login*/
if(isset($_SESSION['usuario_id'])){ 
        
?>
<!doctype html>
<html lang="en" data-layout="vertical" data-topbar="light" data-sidebar="dark" data-sidebar-size="lg"
    data-sidebar-image="none">

<head>
    <title>Ayuda | InvenTechPE</title>
    <?php require_once("../components/head.php") ?>

</head>

<body>

    <!-- Begin page -->
    <div id="layout-wrapper">
        <!-- ==========Siderbar========== -->
        <?php require_once("../components/topbar.php") ?>
        <!-- ==========End Siderbar========== -->
        <!-- ==========Siderbar========== -->
        <?php require_once("../components/siderbar.php") ?>
        <!-- ==========End Siderbar========== -->

        <!-- Vertical Overlay-->
        <div class="vertical-overlay"></div>

        <!-- ============================================================== -->
        <!-- Start Main content -->
        <div class="main-content">
            <div class="page-content">
                <div class="container-fluid">

                    <!-- start page title -->
                    <div class="row">
                        <div class="col-12">
                            <div class="page-title-box d-sm-flex align-items-center justify-content-between">
                                <h4 class="mb-sm-0">Ayuda</h4>

                                <div class="page-title-right">
                                    <ol class="breadcrumb m-0">
                                        <li class="breadcrumb-item"><a href="../home/">Dashboard</a></li>
                                        <li class="breadcrumb-item active">Perfil</li>
                                    </ol>
                                </div>
                            </div>
                        </div>  
                    </div>

                    <div class="row">
                            <div class="col-xxl-5">
                                <div class="card mb-2">
                                    <div class="card-body pt-0 mt-2">
                                        <ul class="list-group list-group-flush border-dashed">
                                            <li class="list-group-item ps-0">
                                                <div class="row align-items-center g-3">
                                                    <div class="col-auto">
                                                        <div class="avatar-sm p-1 py-2 h-auto bg-light rounded-3">
                                                            <div class="text-center">
                                                                <h5 class="mb-0">01</h5>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col">
                                                        <h5 class="text-muted mt-0 mb-1  ">Iniciar sesión</h5>
                                                        <a href="#" class="text-reset   mb-0">En el siguiente documento
                                                            se
                                                            muestra el manual de como iniciar sesión</a>
                                                    </div>
                                                    <div class="col-sm-auto">
                                                        <div class="avatar">
                                                            <div class="avatar-group-item">
                                                                <a href="../../assets/pdf_manual/acceso_sistema.pdf"
                                                                    target="_bank" class="d-inline-block"
                                                                    data-bs-toggle="tooltip" data-bs-placement="top"
                                                                    title="" data-bs-original-title="Ver documento">
                                                                    <img src="../../assets/images/pdf.jpg" alt=""
                                                                        class=" avatar-xxs">
                                                                </a>
                                                            </div>
                                                        </div>
                                                    </div>

                                                </div>
                                                <!-- end row -->
                                            </li><!-- end -->
                                        </ul><!-- end -->
                                    </div><!-- end card body -->
                                </div><!-- end card -->
 
                            </div>
                        </div>
 

                </div>
                <!-- container-fluid -->
            </div>
            <!-- End Page-content -->

            <!--Footer-->
            <?php require_once("../components/footer.php") ?>
            <!---End Footer-->
        </div>
        <!-- end main content-->
        <!-- ============================================================== -->


    </div>
    <!-- END layout-wrapper -->



    <!--start back-to-top-->
    <button onclick="topFunction()" class="btn btn-danger btn-icon" id="back-to-top">
        <i class="ri-arrow-up-line"></i>
    </button>
    <!--end back-to-top-->

    <div class="customizer-setting d-none d-md-block">
        <div class="btn-info btn-rounded shadow-lg btn btn-icon btn-lg p-2" data-bs-toggle="offcanvas"
            data-bs-target="#theme-settings-offcanvas" aria-controls="theme-settings-offcanvas">
            <i class='mdi mdi-spin mdi-cog-outline fs-22'></i>
        </div>
    </div>

    <!-- ==========config theme========== -->
    <?php require_once("../components/config_theme.php") ?>
    <!-- ==========config theme========== -->



    <!-- JAVASCRIPT -->
    <?php require_once ("../components/js.php") ?>

    <!-- App js -->


    <!-- echarts init -->

    <script src="perfil.js"></script>

</body>

</html>
<?php }else{
    header("location:".Conectar::ruta());

}?>