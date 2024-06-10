<?php  
require_once("../../config/conexion.php"); 
/*TODO:Validar si la sesión exite , si no location al Login*/
if(isset($_SESSION['usuario_id'])){ 
        
?>


<!doctype html>
<html lang="en" data-layout="vertical" data-topbar="light" data-sidebar="dark" data-sidebar-size="lg"
    data-sidebar-image="none">

<head>
    <title>Insumos | InvenTechPE</title>
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
                    <div class="row">
                        <!---Header--->
                        <div class="col-12 mb-1">
                            <div class="page-title-box d-sm-flex align-items-center justify-content-between">
                                <h4 class="mb-sm-0">Productos & Insumos</h4>

                                <div class="page-title-right">
                                    <ol class="breadcrumb m-0">
                                        <li class="breadcrumb-item"><a href="../home">Dashboard</a></li>
                                        <li class="breadcrumb-item active">Insumos</li>
                                    </ol>
                                </div>
                            </div>
                        </div>

                        <!--TODO:Filtros y botones--->
                        <div class="col-lg-12 ">
                            <div class="col">
                                <div class="d-flex justify-content-between  ">
                                    <h5 class="card-title mb-0">
                                        </h4>
                                        <div class="col-sm-auto  ">
                                            <div>
                                                <button type="button" class="btn btn-primary add-btn mt-n4"
                                                    id="btn_nuevo_registro"><i
                                                        class="ri-add-line align-bottom me-1"></i> Nuevo
                                                    Registro</button>
                                                <!--<button class="btn btn-soft-danger" onclick="deleteMultiple()"><i
                                                            class="ri-delete-bin-2-line"></i></button>-->
                                            </div>
                                        </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!--TODO:Cuerpo &table--->
                    <div class="row mt-1">
                        <div class="col-lg-12">
                            <div class="card">
                                <div class="card-header">
                                    <h5 class="card-title mb-0">Lista de Insumos</h5>
                                </div>

                                <div class="card-body">
                                    <!--<div id="buttons-datatables_wrapper"
                                        class="dataTables_wrapper dt-bootstrap5 no-footer">-->

                                    <div id="buttons_table" class="dataTables_wrapper dt-bootstrap5 no-footer">
                                        <table id="table_insumos"
                                            class="display table table-bordered dataTable no-footer"
                                            style="width: 100%;" aria-describedby="buttons-datatables_info">
                                            <thead>
                                                <tr>
                                                    <th class="sorting sorting_asc" tabindex="0"
                                                        aria-controls="buttons-datatables" rowspan="1" colspan="1"
                                                        aria-sort="ascending"
                                                        aria-label="Código: activate to sort column descending">Código
                                                    </th>
                                                    <th class="sorting" tabindex="0" aria-controls="buttons-datatables"
                                                        rowspan="1" colspan="1"
                                                        aria-label="Co Modular: activate to sort column ascending">Cod
                                                        Modular</th>
                                                    <th class="sorting" tabindex="0" aria-controls="buttons-datatables"
                                                        rowspan="1" colspan="1"
                                                        aria-label="Nombre: activate to sort column ascending">Nombre
                                                    </th>
                                                    <th class="sorting" tabindex="0" aria-controls="buttons-datatables"
                                                        rowspan="1" colspan="1"
                                                        aria-label="Descripción: activate to sort column ascending">
                                                        Descripción</th>
                                                    <th class="sorting" tabindex="0" aria-controls="buttons-datatables"
                                                        rowspan="1" colspan="1"
                                                        aria-label="Categoría: activate to sort column ascending">
                                                        Categoría</th>
                                                    <th class="sorting" tabindex="0" aria-controls="buttons-datatables"
                                                        rowspan="1" colspan="1"
                                                        aria-label="Proveedor: activate to sort column ascending">
                                                        Proveedor</th>
                                                    <th class="sorting" tabindex="0" aria-controls="buttons-datatables"
                                                        rowspan="1" colspan="1"
                                                        aria-label="Marca: activate to sort column ascending">Marca</th>
                                                 
                                                    <th class="sorting" tabindex="0" aria-controls="buttons-datatables"
                                                        rowspan="1" colspan="1"
                                                        aria-label="Unidad de Medida: activate to sort column ascending">
                                                        Unidad de Medida</th>
                                                    <th class="sorting" tabindex="0" aria-controls="buttons-datatables"
                                                        rowspan="1" colspan="1"
                                                        aria-label="Medida: activate to sort column ascending">Medida
                                                    </th>
                                                    <th class="sorting" tabindex="0" aria-controls="buttons-datatables"
                                                        rowspan="1" colspan="1"
                                                        aria-label="Cantidad: activate to sort column ascending">
                                                        Cantidad</th>
                                                    <th class="sorting" tabindex="0" aria-controls="buttons-datatables"
                                                        rowspan="1" colspan="1"
                                                        aria-label="Precio Unitario: activate to sort column ascending">
                                                        Precio Unitario</th>
                                                    <th class="sorting" tabindex="0" aria-controls="buttons-datatables"
                                                        rowspan="1" colspan="1"
                                                        aria-label="Total: activate to sort column ascending">Total</th>
                                                    <th class="sorting" tabindex="0" aria-controls="buttons-datatables"
                                                        rowspan="1" colspan="1"
                                                        aria-label="Fecha Adquisición: activate to sort column ascending">
                                                        Fecha Adquisición</th>
                                                    <th class="sorting" tabindex="0" aria-controls="buttons-datatables"
                                                        rowspan="1" colspan="1"
                                                        aria-label="Estado Equipo: activate to sort column ascending">
                                                        Estado Equipo</th>
                                                    <th class="sorting" tabindex="0" aria-controls="buttons-datatables"
                                                        rowspan="1" colspan="1"
                                                        aria-label="Nota: activate to sort column ascending">Nota</th>
                                                 
                                                    <th class="sorting" tabindex="0" aria-controls="buttons-datatables"
                                                        rowspan="1" colspan="1"
                                                        aria-label="Acciones: activate to sort column ascending">
                                                        Acciones</th>
                                                </tr>
                                            </thead>

                                            <tbody>

                                            </tbody>
                                        </table>

                                    </div>


                                </div>
                            </div>
                        </div>
                    </div>
                    <?php require_once("form.php") ?>

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

    <!-- App js
    <script src="../../assets/js/app.js"></script> -->
    <script src="insumos.js"></script>



</body>

</html>

<?php }else{ 
    header("location:".Conectar::ruta());
}

?>