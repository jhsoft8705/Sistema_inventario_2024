<?php  
require_once("../../config/conexion.php"); 
/*TODO:Validar si la sesión exite , si no location al Login*/
if(isset($_SESSION['usuario_id'])){ 
    
    
    // Recoger el parámetro id_asignacion de la URL  
    if (isset($_GET['id_asignacion'])) {
        $asignacion_id = $_GET['id_asignacion'];  
    }

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
                    <div class="row">
                        <div class="col-12">
                            <div class="page-title-box d-sm-flex align-items-center justify-content-between">
                                <h4 class="mb-sm-0">Vista Asignación de Recursos </h4>

                                <div class="page-title-right">
                                    <ol class="breadcrumb m-0">
                                        <li class="breadcrumb-item"><a href="../asignaciones">Asignaciones</a></li>
                                        <li class="breadcrumb-item active">Detalle de Taller</li>
                                    </ol>
                                </div>
                            </div>
                        </div>

                        <!--TODO:Filtros y botones--->
                        <div class="col-12 ">
                            <div class="col">
                                <div class="d-flex justify-content-between  ">
                                    <h5 class="card-title mb-0">
                                        </h4>
                                        <div class="col-sm-auto  ">
                                            <div>
                                                <button type="button" onclick="window.location.href='../asignaciones'"
                                                    class="btn btn-primary add-btn mt-n4" id="btn_nuevo_registro">
                                                    <i class="ri-arrow-go-back-line align-bottom me-1"></i>
                                                    Volver
                                                    <!--<button class="btn btn-soft-danger" onclick="deleteMultiple()"><i
                                                            class="ri-delete-bin-2-line"></i></button>-->
                                            </div>
                                        </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--TODO:Tabla & cuerpo--->
                    <div class="row mt-1">
                        <div class="col-lg-12">
                            <div class="card">
                                <div class="card-header">
                                    <h5 class="card-title mb-0">Datos de la Asignación</h5>
                                </div>
                                <div class="card-body">
                                    <div class="modal-body">
                                        <div class="row">
                                            <input   type="text"  hidden value=<?php  echo $asignacion_id ?> id="asigacion_id" name="asigacion_id" />

                                            <div class="col-lg-6 col-md-6">
                                                <div class="mb-3">
                                                    <label for="taller_nombre" class="form-label">Taller Asignado</label>
                                                    <div class="input-group has-validation">
                                                        <input type="text" id="taller_nombre"  name="taller_nombre"
                                                            class="form-control" aria-describedby="taller_nombre"
                                                            readonly />
                                                        <div id="taller_nombre" class="invalid-feedback">
                                                            Por favor ingresar taller_nombre
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-lg-6 col-md-6">
                                                <div class="mb-3">
                                                    <label for="usuario_nombre" class="form-label">Usuario Responsable</label>
                                                    <div class="input-group has-validation">
                                                        <input type="text" id="usuario_nombre" name="usuario_nombre"
                                                            class="form-control" aria-describedby="usuario" readonly />
                                                        <div id="usuario_nombre" class="invalid-feedback">
                                                            Por favor ingresar usuario_nombre
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-4 col-md-4">
                                                <div class="mb-3">
                                                    <label for="periodo" class="form-label">Periodo</label>
                                                    <div class="input-group has-validation">
                                                        <input type="text" id="periodo" name="periodo"
                                                            class="form-control" aria-describedby="periodo" readonly />
                                                        <div id="periodo" class="invalid-feedback">
                                                            Por favor ingresar periodo
                                                        </div>
                                                    </div>
                                                </div>
                                            </div> 

                                            <div class="col-lg-4 col-md-4">
                                                <div class="mb-3">
                                                    <label for="fechai_periodo" class="form-label">Fech Inicio</label>
                                                    <div class="input-group has-validation">
                                                        <input type="date" id="fechai_periodo" name="fechai_periodo"
                                                            class="form-control" aria-describedby="fechai_periodo"
                                                            readonly />
                                                        <div id="fechai_periodo" class="invalid-feedback">
                                                            Por favor ingresar fechai_periodo
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-4 col-md-4">
                                                <div class="mb-3">
                                                    <label for="fechaf_periodo" class="form-label">Fech Fin</label>
                                                    <div class="input-group has-validation">
                                                        <input type="date" id="fechaf_periodo" name="fechaf_periodo"
                                                            class="form-control" aria-describedby="fechaf_periodo"
                                                            readonly />
                                                        <div id="fechaf_periodo_error" class="invalid-feedback">
                                                            Por favor ingresar fechaf_periodo
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!--TODO:Equipos--->
                            <div class="card">
                                <div class="card-header">
                                    <h5 class="card-title mb-0">Equipos o Maquinaria asignados</h5>
                                </div>
                                <div class="card-body">
                                    <div class="modal-body">
  
                                        <!--T<h5 class="card-title mb-0">Lista de equipos asignados</h5>--->

                                        <!--TODO:Tabla herramienta--->
                                        <div id="buttons_table" class="dataTables_wrapper dt-bootstrap5 no-footer mt-2">
                                            <table id="table_det_equipos"
                                                class="display table table-bordered dataTable no-footer"
                                                style="width: 100%;" aria-describedby="buttons-datatables_info">
                                                <thead>
                                                    <tr>
                                                        <th class="sorting sorting_asc" tabindex="0"
                                                            aria-controls="buttons-datatables" rowspan="1" colspan="1"
                                                            aria-sort="ascending"
                                                            aria-label="Name: activate to sort column descending"
                                                            style="width: 124.4px;">Codigo</th>

                                                        <th class="sorting" tabindex="0"
                                                            aria-controls="buttons-datatables" rowspan="1" colspan="1"
                                                            aria-label="Position: activate to sort column ascending"
                                                            style="width: 195.4px;">Nombre</th>

                                                        <th class="sorting" tabindex="0"
                                                            aria-controls="buttons-datatables" rowspan="1" colspan="1"
                                                            aria-label="Position: activate to sort column ascending"
                                                            style="width: 195.4px;">Descripción</th>
                                                        <th class="sorting" tabindex="0"
                                                            aria-controls="buttons-datatables" rowspan="1" colspan="1"
                                                            aria-label="Position: activate to sort column ascending"
                                                            style="width: 195.4px;">Cantidad</th>
                                                        <th class="sorting" tabindex="0"
                                                            aria-controls="buttons-datatables" rowspan="1" colspan="1"
                                                            aria-label="Salary: activate to sort column ascending"
                                                            style="width: 55.4px;">Estado</th>
                                                        <th class="sorting" tabindex="0"
                                                            aria-controls="buttons-datatables" rowspan="1" colspan="1"
                                                            aria-label="Start date: activate to sort column ascending"
                                                            style="width: 82.4px;">Acciones</th>
                                                    </tr>
                                                </thead>
                                                <tbody>

                                                </tbody>
                                            </table>

                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!--TODO:Herramientas--->
                            <div class="card">
                                <div class="card-header">
                                   <h5 class="card-title mb-0">Herramientas o Muebles Asignados</h5>
                                </div>

                                <div class="card-body">
                                    <div class="modal-body"> 
                                         <!---<h5 class="card-title mb-0">Lista de Herramientas en detalle</h5>--->

                                        <!--TODO:Tabla herramienta--->
                                        <div id="buttons_table" class="dataTables_wrapper dt-bootstrap5 no-footer mt-2">
                                            <table id="table_det_herramienta"
                                                class="display table table-bordered dataTable no-footer"
                                                style="width: 100%;" aria-describedby="buttons-datatables_info">
                                                <thead>
                                                    <tr>
                                                        <th class="sorting sorting_asc" tabindex="0"
                                                            aria-controls="buttons-datatables" rowspan="1" colspan="1"
                                                            aria-sort="ascending"
                                                            aria-label="Name: activate to sort column descending"
                                                            style="width: 124.4px;">Nombre</th>

                                                        <th class="sorting" tabindex="0"
                                                            aria-controls="buttons-datatables" rowspan="1" colspan="1"
                                                            aria-label="Position: activate to sort column ascending"
                                                            style="width: 195.4px;">Abreviatura</th>

                                                        <th class="sorting" tabindex="0"
                                                            aria-controls="buttons-datatables" rowspan="1" colspan="1"
                                                            aria-label="Position: activate to sort column ascending"
                                                            style="width: 195.4px;">Descripción</th>
                                                        <th class="sorting" tabindex="0"
                                                            aria-controls="buttons-datatables" rowspan="1" colspan="1"
                                                            aria-label="Salary: activate to sort column ascending"
                                                            style="width: 55.4px;">Cantidad</th>
                                                        <th class="sorting" tabindex="0"
                                                            aria-controls="buttons-datatables" rowspan="1" colspan="1"
                                                            aria-label="Salary: activate to sort column ascending"
                                                            style="width: 55.4px;">Estado</th>
                                                        <th class="sorting" tabindex="0"
                                                            aria-controls="buttons-datatables" rowspan="1" colspan="1"
                                                            aria-label="Start date: activate to sort column ascending"
                                                            style="width: 82.4px;">Acciones</th>
                                                    </tr>
                                                </thead>
                                                <tbody>

                                                </tbody>
                                            </table>

                                        </div>

                                    </div>
                                </div>
                            </div>
                            <!--TODO:Insumos--->
                            <div class="card">
                                <div class="card-header">
                                    <h5 class="card-title mb-0"> Insumos Asignados</h5>
                                </div>

                                <div class="card-body">
                                    <div class="modal-body">
                                
                                        <h5 class="card-title mb-0">Lista de Insumos Asignados</h5> 
                                        <!--TODO:Tabla insumos--->
                                        <div id="buttons_table" class="dataTables_wrapper dt-bootstrap5 no-footer mt-2">
                                            <table id="table_det_insumo"
                                                class="display table table-bordered dataTable no-footer"
                                                style="width: 100%;" aria-describedby="buttons-datatables_info">
                                                <thead>
                                                    <tr>
                                                        <th class="sorting sorting_asc" tabindex="0"
                                                            aria-controls="buttons-datatables" rowspan="1" colspan="1"
                                                            aria-sort="ascending"
                                                            aria-label="Name: activate to sort column descending"
                                                            style="width: 124.4px;">Nombre</th>

                                                        <th class="sorting" tabindex="0"
                                                            aria-controls="buttons-datatables" rowspan="1" colspan="1"
                                                            aria-label="Position: activate to sort column ascending"
                                                            style="width: 195.4px;">Abreviatura</th>

                                                        <th class="sorting" tabindex="0"
                                                            aria-controls="buttons-datatables" rowspan="1" colspan="1"
                                                            aria-label="Position: activate to sort column ascending"
                                                            style="width: 195.4px;">Descripción</th>
                                                        <th class="sorting" tabindex="0"
                                                            aria-controls="buttons-datatables" rowspan="1" colspan="1"
                                                            aria-label="Salary: activate to sort column ascending"
                                                            style="width: 55.4px;">Cantidad</th>
                                                        <th class="sorting" tabindex="0"
                                                            aria-controls="buttons-datatables" rowspan="1" colspan="1"
                                                            aria-label="Salary: activate to sort column ascending"
                                                            style="width: 55.4px;">Estado</th>
                                                        <th class="sorting" tabindex="0"
                                                            aria-controls="buttons-datatables" rowspan="1" colspan="1"
                                                            aria-label="Start date: activate to sort column ascending"
                                                            style="width: 82.4px;">Acciones</th>
                                                    </tr>
                                                </thead>
                                                <tbody>

                                                </tbody>
                                            </table>

                                        </div>

                                        <!--TODO:Descripcion--->
                                        <div class="row">
                                            <div class="mb-3">
                                                <label for="descripcion" class="form-label">Descripción</label>
                                                <div class="input-group has-validation">
                                                    <textarea readonly id="descripcion" name="descripcion"
                                                        class="form-control custom-textarea"
                                                        placeholder="Ingresar descripción"
                                                        aria-describedby="descripcion" rows="2"></textarea>
                                                    <div id="descripcion_error" class="invalid-feedback">
                                                        Muy bien
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                    <div class="modal-footer">
                                        <div class="hstack gap-2 justify-content-end">
                                            <button type="button" class="btn btn-light"
                                                onclick="window.location.href='../asignaciones/'">Salir</button>
                                            <button type="submit" class="btn btn-primary"
                                                id="btn_registrar_asignacion_g">Exportar Reporte</button>
                                        </div>
                                    </div>
                                </div>
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

        <!-- App js
    <script src="../../assets/js/app.js"></script> -->
        <script src="view-asignacion.js"></script>



</body>

</html>
<?php }else{ 
    header("location:".Conectar::ruta());
}

?>