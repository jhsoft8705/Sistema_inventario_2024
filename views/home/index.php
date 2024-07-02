<?php  
require_once("../../config/conexion.php"); 

require_once("../../models/Equipo.php");
$equipo=new Equipo();
$list_equipos=$equipo->list_equipos();
 
require_once("../../models/Herramienta.php");
$herramienta=new Herramienta();
$list_herramientas=$herramienta->list_herramientas();
 

require_once("../../models/Insumo.php");
$insumo=new Insumo();
$list_insumos=$insumo->list_insumos();

require_once("../../models/Usuario.php");
$user=new Usuario();
$list_users=$user->List_User();



/*TODO:Validar si la sesión exite , si no location al Login*/
if(isset($_SESSION['usuario_id'])){ 
        
?>
<!doctype html>
<html lang="en" data-layout="vertical" data-topbar="light" data-sidebar="dark" data-sidebar-size="lg"
    data-sidebar-image="none">

<head>
    <title>Home | InvenTechPE</title>
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
                                <h4 class="mb-sm-0">Dashboard</h4>

                                <div class="page-title-right">
                                    <ol class="breadcrumb m-0">
                                        <li class="breadcrumb-item"><a href="javascript: void(0);">Dashboard</a></li>
                                        <li class="breadcrumb-item active">Home</li>
                                    </ol>
                                </div>


                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-xl-12">
                            <div class="card crm-widget">
                                <div class="card-body p-0">
                                    <div class="row row-cols-xxl-5 row-cols-md-4 row-cols-1 g-0">
                                        <div class="col">
                                            <div class="py-4 px-3">
                                                <h5 class="text-muted text-uppercase fs-13">Cant. Equipos<i
                                                        class="ri-arrow-up-circle-line text-success fs-18 float-end align-middle"></i>
                                                </h5>
                                                <div class="d-flex align-items-center">
                                                    <div class="flex-shrink-0">
                                                        <i class=" ri-computer-line display-6 text-muted"></i>
                                                    </div>
                                                    <div class="flex-grow-1 ms-3">
                                                        <h2 class="mb-0"><span class="counter-value"
                                                                data-target="<?php echo count($list_equipos)?>"><?php echo count($list_equipos)?></span>
                                                        </h2>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col">
                                            <div class="py-4 px-3">
                                                <h5 class="text-muted text-uppercase fs-13">Cant. Herramientas<i
                                                        class="ri-arrow-up-circle-line text-success fs-18 float-end align-middle"></i>
                                                </h5>
                                                <div class="d-flex align-items-center">
                                                    <div class="flex-shrink-0">
                                                        <i class=" ri-tools-line display-6 text-muted"></i>
                                                    </div>
                                                    <div class="flex-grow-1 ms-3">
                                                        <h2 class="mb-0"><span class="counter-value"
                                                                data-target="<?php echo count($list_herramientas)?>"><?php echo count($list_herramientas)?></span>
                                                        </h2>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col">
                                            <div class="py-4 px-3">
                                                <h5 class="text-muted text-uppercase fs-13">Cant. Insumos<i
                                                        class="ri-arrow-up-circle-line text-success fs-18 float-end align-middle"></i>
                                                </h5>
                                                <div class="d-flex align-items-center">
                                                    <div class="flex-shrink-0">
                                                        <i class=" ri-shopping-bag-2-line display-6 text-muted"></i>
                                                    </div>
                                                    <div class="flex-grow-1 ms-3">
                                                        <h2 class="mb-0"><span class="counter-value"
                                                                data-target="<?php echo count($list_insumos)?>"><?php echo count($list_insumos)?></span>
                                                        </h2>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col">
                                            <div class="py-4 px-3">
                                                <h5 class="text-muted text-uppercase fs-13">Usuarios del sistema<i
                                                        class="ri-arrow-up-circle-line text-success fs-18 float-end align-middle"></i>
                                                </h5>
                                                <div class="d-flex align-items-center">
                                                    <div class="flex-shrink-0">
                                                        <i class=" ri-user-line display-6 text-muted"></i>
                                                    </div>
                                                    <div class="flex-grow-1 ms-3">
                                                        <h2 class="mb-0"><span class="counter-value"
                                                                data-target="<?php echo count($list_users)?>"><?php echo count($list_users)?></span>
                                                        </h2>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div><!-- end card body -->
                            </div><!-- end card -->
                        </div><!-- end col -->
                    </div>


                    <!--Charts-->
                    <div class="row">
                        <div class="col-xl-6">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="card-title mb-0">Cant Asignaciones X Taller</h4>
                                </div>
                                <div class="card-body">
                                    <div id="chart-pie2"
                                        data-colors='["--vz-primary", "--vz-success", "--vz-warning", "--vz-danger", "--vz-info"]'
                                        class="e-charts"></div>
                                </div>
                            </div>
                            <!-- end card -->
                        </div>
                        <!-- end col -->
                        <div class="col-xl-6">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="card-title mb-0">Cant de Talleres Asignados X Usuario</h4>
                                </div>
                                <div class="card-body">
                                    <div id="chart-doughnut1"
                                        data-colors='["--vz-warning", "--vz-success", "--vz-primary", "--vz-danger", "--vz-info"]'
                                        class="e-charts"></div>
                                </div>
                            </div>
                            <!-- end card -->
                        </div>
                        <!-- end col -->
                    </div>
                    <!-- end page title -->


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

    <!-- echarts js -->
    <script src="../../assets/libs/echarts/echarts.min.js"></script>

    <!-- echarts init -->
 
    <script src="home.js"></script>

</body>

</html>
<?php }else{
    header("location:".Conectar::ruta());

}?>