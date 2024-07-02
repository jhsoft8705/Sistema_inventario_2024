<?php  
require_once("../../config/conexion.php"); 
/*TODO:Validar si la sesión exite , si no location al Login*/
if(isset($_SESSION['usuario_id'])){ 
        
?>
<!doctype html>
<html lang="en" data-layout="vertical" data-topbar="light" data-sidebar="dark" data-sidebar-size="lg"
    data-sidebar-image="none">

<head>
    <title>Asignaciones | InvenTechPE</title>
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
                                <h4 class="mb-sm-0">Asignaciones</h4>

                                <div class="page-title-right">
                                    <ol class="breadcrumb m-0">
                                        <li class="breadcrumb-item"><a href="../home/">Home</a></li>
                                        <li class="breadcrumb-item active">Asignaciones</li>
                                    </ol>
                                </div>


                            </div>
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-header border-0 rounded">
                            <div class="row g-2">
                                <div class="col-xl-3">
                                    <div class="search-box">
                                        <input type="text" id="buscador" class="form-control search"
                                            placeholder="Buscar.."> <i class="ri-search-line search-icon"></i>
                                    </div>
                                </div>
                                <!--end col-->
                                <div class="col-xl-2 ms-auto">
                                    <div>
                                        <div data-type="select-one" tabindex="0" role="listbox" aria-haspopup="true"
                                            aria-expanded="false">
                                            <div class="input-group has-validation">
                                                <select class="form-control" name="periodo_id" id="periodo_id"
                                                    aria-describedby="periodo_id">
                                                    <option value="">Seleccionar periodo</option>

                                                </select>
                                                <div id="taller_error" class="invalid-feedback">
                                                    Por favor seleccionar taller
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!--end col-->
                                <div class="col-lg-auto">
                                    <div class="hstack gap-2">
                                        <button type="button" id="btn_filtrarr" class="btn btn-danger"><i
                                                class="ri-equalizer-fill me-1 align-bottom"></i> Filtrar</button>
                                        <button type="button" class="btn btn-success" onclick="location.reload();">
                                            <i class="ri-loader-3-line me-1 align-bottom"></i> Cargar todo
                                        </button>

                                        <button class="btn btn-primary"
                                            onclick="window.location.href='../new-asignacion/'"><i
                                                class="ri-add-fill me-1 align-bottom"></i>
                                            Nuevo registro</button>
                                    </div>
                                </div>
                                <!--end col-->
                            </div>
                            <!--end row-->
                        </div>
                    </div>
                    <div class="row mt-2" id="contenido_asignados">
                        <!--Contenido-->

                        <!--Controller-->

                        <!--End Contenido-->
                        <!--backup
                        <div class="col-xl-3 col-lg-6">
                            <div class="card ribbon-box right overflow-hidden">
                                <div class="card-body text-center p-4">
                                    <div class="ribbon ribbon-info ribbon-shape trending-ribbon"><i
                                            class="ri-flashlight-fill text-white align-bottom"></i> <span
                                            class="trending-ribbon-text">Julio 2024</span></div>
                                    <img src="../../assets/images/companies/img-8.png" alt="" height="45">
                                    <h5 class="mb-1 mt-4"><a href="apps-ecommerce-seller-details.html"
                                            class="link-primary">Computación e Informática</a></h5>
                                    <p class="text-muted mb-4">Jose Flores</p>
                                    <div class="row mt-4">
                                        <div class="col-lg-7 border-end-dashed border-end">
                                            <span class="text-muted">Herramientas</span>
                                            <h5>100</h5>
                                        </div>
                                        <div class="col-lg-5 border-end-dashed border-end">
                                            <span class="text-muted">Equipos</span>
                                            <h5>20</h5>
                                        </div>
                                        <div class="col-lg-6">
                                            <span class="text-muted">Insumos</span>
                                            <h5>20,933</h5>
                                        </div>
                                        <div class="col-lg-6">
                                            <span class="text-muted">Inversión</span>
                                            <h5>$1500</h5>
                                        </div>
                                    </div>
                                    <div class="mt-4">
                                        <a href="apps-ecommerce-seller-details.html" class="btn btn-light w-100">Ver</a>
                                    </div> 
                                    <div class="mt-1">
                                        <a href="apps-ecommerce-seller-details.html" class="btn btn-light w-100">Realizar inventaro</a>
                                    </div> 
                                </div>
                            </div>
                        </div>-->
                    </div>
                    <div class="row g-0 text-center text-sm-start align-items-center mb-3">
                        <div class="col-sm-6">
                            <div>
                                <p class="mb-sm-0">Showing 1 to 8 of 12 entries</p>
                            </div>
                        </div> <!-- end col -->
                        <div class="col-sm-6">
                            <ul
                                class="pagination pagination-separated justify-content-center justify-content-sm-end mb-sm-0">
                                <li class="page-item disabled"> <a href="#" class="page-link"><i
                                            class="mdi mdi-chevron-left"></i></a> </li>
                                <li class="page-item active"> <a href="#" class="page-link">1</a> </li>
                                <li class="page-item"> <a href="#" class="page-link"><i
                                            class="mdi mdi-chevron-right"></i></a> </li>
                            </ul>
                        </div><!-- end col -->
                    </div>
                </div>
            </div>
        </div>
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
    <script src="asignacions.js"></script>

</body>

</html>
<?php }else{
    header("location:".Conectar::ruta());

}?>