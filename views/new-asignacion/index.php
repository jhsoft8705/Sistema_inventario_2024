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

                    <div class="row">
                        <!---Header--->
                        <div class="col-12 mb-1">
                            <div class="page-title-box d-sm-flex align-items-center justify-content-between">
                                <h4 class="mb-sm-0">Asignación de equipos y materiales</h4>

                                <div class="page-title-right">
                                    <ol class="breadcrumb m-0">
                                        <li class="breadcrumb-item"><a href="../inventarios">Inventarios</a></li>
                                        <li class="breadcrumb-item active">Asignaciones</li>
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
                                                        class=" ri-arrow-go-back-line align-bottom me-1"></i> Volver</button>
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
                                    <h5 class="card-title mb-0">Asignar Taller y agregar responsable</h5>
                                </div>
                                <div class="card-body">
                                    <form id="form_mantenimiento" class="row g-3 needs-validation" method="post">
                                        <div class="modal-body">
                                            <div class="row">
                                                <div class="col-lg-6 col-md-4">
                                                    <div class="mb-3">
                                                        <label for="taller_id" class="form-label">Seleccionar
                                                            Taller</label>
                                                        <div class="input-group has-validation">
                                                            <select class="form-control" name="taller_id" id="taller_id"
                                                                aria-describedby="taller_id">
                                                                <option value="">Seleccionar</option>
                                                                <option value="2">Otro</option>
                                                            </select>
                                                            <div id="taller_error" class="invalid-feedback">
                                                                Por favor seleccionar taller
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-6 col-md-4">
                                                    <div class="mb-3">
                                                        <label for="usuario_id" class="form-label">Seleccionar
                                                            Usuario</label>
                                                        <div class="input-group has-validation">

                                                            <select class="form-control" name="usuario_id"
                                                                id="usuario_id" aria-describedby="usuario_id"
                                                                class="form-control" placeholder="Ingresar proveedor">
                                                                <option value="">Seleccionar</option>
                                                                <option value="2">Otro</option>
                                                            </select>

                                                            <div id="usuario_error" class="invalid-feedback">
                                                                Por favor ingresar usuario
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>

                            <!--TODO:Equipos--->
                            <div class="card">
                                <div class="card-header">
                                    <h5 class="card-title mb-0">Agregar Equipos</h5>
                                </div>
                                <div class="card-body">
                                    <form id="form_mantenimiento" class="row g-3 needs-validation" method="post">
                                        <div class="modal-body">

                                            <div class="row">
                                                <div class="col-lg-12 col-md-4">
                                                    <div class="mb-3">
                                                        <label for="equipo_id" class="form-label">Seleccionar
                                                            Equipo</label>
                                                        <div class="input-group has-validation">
                                                            <select class="form-control" name="equipo_id" id="equipo_id"
                                                                aria-describedby="equipo_id">
                                                                <option value="">Seleccionar</option>
                                                                <option value="2">Otro</option>
                                                            </select>
                                                            <div id="equipo_id_error" class="invalid-feedback">
                                                                Por favor seleccionar taller
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-lg-3 col-md-4">
                                                    <div class="mb-3">
                                                        <label for="marca" class="form-label">Marca</label>
                                                        <div class="input-group has-validation">
                                                            <input type="text" id="marca" name="marca"
                                                                class="form-control" placeholder="Ingresar marca"
                                                                aria-describedby="marca" />
                                                            <div id="marca_error" class="invalid-feedback">
                                                                Por favor ingresar marca
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="col-lg-3 col-md-4">
                                                    <div class="mb-3">
                                                        <label for="modelo" class="form-label">Modelo</label>
                                                        <div class="input-group has-validation">
                                                            <input type="text" id="modelo" name="modelo"
                                                                class="form-control" placeholder="Ingresar modelo"
                                                                aria-describedby="modelo" />
                                                            <div id="modelo_error" class="invalid-feedback">
                                                                Por favor ingresar modelo
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="col-lg-3 col-md-4">
                                                    <div class="mb-3">
                                                        <label for="serie" class="form-label">Serie</label>
                                                        <div class="input-group has-validation">
                                                            <input type="text" id="serie" name="serie"
                                                                class="form-control" placeholder="Ingresar serie"
                                                                aria-describedby="serie" />
                                                            <div id="serie_error" class="invalid-feedback">
                                                                Por favor ingresar serie
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-3 col-md-4">
                                                    <div class="mb-3">
                                                        <label for="color" class="form-label">Color</label>
                                                        <div class="input-group has-validation">
                                                            <input type="text" id="color" name="color"
                                                                class="form-control" placeholder="Ingresar color"
                                                                aria-describedby="color" />
                                                            <div id="color_error" class="invalid-feedback">
                                                                Por favor ingresar color
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <!--TODO:Boton add equipos-->
                                            <div class="d-flex justify-content-between mt-4">
                                                <h5 class="card-title mb-0">
                                                    </h4>
                                                    <div class="col-sm-auto  ">
                                                        <div>
                                                            <button type="button" class="btn btn-success add-btn mt-n4"
                                                                id="btn_nuevo_equipo"><i
                                                                    class="ri-add-line align-bottom me-1"></i> Agregar
                                                            </button>
                                                        </div>
                                                    </div>
                                            </div>

                                            <h5 class="card-title mb-0">Lista de equipos en detalle</h5>

                                            <!--TODO:Tabla herramienta--->
                                            <div id="buttons_table"
                                                class="dataTables_wrapper dt-bootstrap5 no-footer mt-2">
                                                <table id="table_unidad"
                                                    class="display table table-bordered dataTable no-footer"
                                                    style="width: 100%;" aria-describedby="buttons-datatables_info">
                                                    <thead>
                                                        <tr>
                                                            <th class="sorting sorting_asc" tabindex="0"
                                                                aria-controls="buttons-datatables" rowspan="1"
                                                                colspan="1" aria-sort="ascending"
                                                                aria-label="Name: activate to sort column descending"
                                                                style="width: 124.4px;">Nombre</th>

                                                            <th class="sorting" tabindex="0"
                                                                aria-controls="buttons-datatables" rowspan="1"
                                                                colspan="1"
                                                                aria-label="Position: activate to sort column ascending"
                                                                style="width: 195.4px;">Abreviatura</th>

                                                            <th class="sorting" tabindex="0"
                                                                aria-controls="buttons-datatables" rowspan="1"
                                                                colspan="1"
                                                                aria-label="Position: activate to sort column ascending"
                                                                style="width: 195.4px;">Descripción</th>
                                                            <th class="sorting" tabindex="0"
                                                                aria-controls="buttons-datatables" rowspan="1"
                                                                colspan="1"
                                                                aria-label="Salary: activate to sort column ascending"
                                                                style="width: 55.4px;">Estado</th>
                                                            <th class="sorting" tabindex="0"
                                                                aria-controls="buttons-datatables" rowspan="1"
                                                                colspan="1"
                                                                aria-label="Start date: activate to sort column ascending"
                                                                style="width: 82.4px;">Acciones</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>

                                                    </tbody>
                                                </table>

                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <!--TODO:Herramientas--->
                            <div class="card">
                                <div class="card-header">
                                    <h5 class="card-title mb-0">Agregar herramientas</h5>
                                </div>

                                <div class="card-body">
                                    <form id="form_mantenimiento" class="row g-3 needs-validation" method="post">
                                        <div class="modal-body">
                                            <!---TODO:campos herramientas---->
                                            <div class="row">
                                                <div class="col-lg-12 col-md-4">
                                                    <div class="mb-3">
                                                        <label for="herramienta_id" class="form-label">Seleccionar
                                                            Herramienta</label>
                                                        <div class="input-group has-validation">
                                                            <select class="form-control" name="herramienta_id"
                                                                id="herramienta_id" aria-describedby="herramienta_id">
                                                                <option value="">Seleccionar</option>
                                                                <option value="2">Otro</option>
                                                            </select>
                                                            <div id="herramienta_id_error" class="invalid-feedback">
                                                                Por favor seleccionar herramienta
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-lg-3 col-md-4">
                                                    <div class="mb-3">
                                                        <label for="marca" class="form-label">Marca</label>
                                                        <div class="input-group has-validation">
                                                            <input type="text" id="marca" name="marca"
                                                                class="form-control" placeholder="Ingresar marca"
                                                                aria-describedby="marca" />
                                                            <div id="marca_error" class="invalid-feedback">
                                                                Por favor ingresar marca
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="col-lg-3 col-md-4">
                                                    <div class="mb-3">
                                                        <label for="modelo" class="form-label">Modelo</label>
                                                        <div class="input-group has-validation">
                                                            <input type="text" id="modelo" name="modelo"
                                                                class="form-control" placeholder="Ingresar modelo"
                                                                aria-describedby="modelo" />
                                                            <div id="modelo_error" class="invalid-feedback">
                                                                Por favor ingresar modelo
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="col-lg-3 col-md-4">
                                                    <div class="mb-3">
                                                        <label for="serie" class="form-label">Serie</label>
                                                        <div class="input-group has-validation">
                                                            <input type="text" id="serie" name="serie"
                                                                class="form-control" placeholder="Ingresar serie"
                                                                aria-describedby="serie" />
                                                            <div id="serie_error" class="invalid-feedback">
                                                                Por favor ingresar serie
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-3 col-md-4">
                                                    <div class="mb-3">
                                                        <label for="color" class="form-label">Color</label>
                                                        <div class="input-group has-validation">
                                                            <input type="text" id="color" name="color"
                                                                class="form-control" placeholder="Ingresar color"
                                                                aria-describedby="color" />
                                                            <div id="color_error" class="invalid-feedback">
                                                                Por favor ingresar color
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <!--TODO:Boton add herramientas-->
                                            <div class="d-flex justify-content-between mt-4">
                                                <h5 class="card-title mb-0">
                                                    </h4>
                                                    <div class="col-sm-auto  ">
                                                        <div>
                                                            <button type="button" class="btn btn-success add-btn mt-n4"
                                                                id="btn_nuevo_equipo"><i
                                                                    class="ri-add-line align-bottom me-1"></i> Agregar
                                                            </button>
                                                        </div>
                                                    </div>
                                            </div>

                                            <h5 class="card-title mb-0">Lista de Herramientas en detalle</h5>

                                            <!--TODO:Tabla herramienta--->
                                            <div id="buttons_table"
                                                class="dataTables_wrapper dt-bootstrap5 no-footer mt-2">
                                                <table id="table_unidad"
                                                    class="display table table-bordered dataTable no-footer"
                                                    style="width: 100%;" aria-describedby="buttons-datatables_info">
                                                    <thead>
                                                        <tr>
                                                            <th class="sorting sorting_asc" tabindex="0"
                                                                aria-controls="buttons-datatables" rowspan="1"
                                                                colspan="1" aria-sort="ascending"
                                                                aria-label="Name: activate to sort column descending"
                                                                style="width: 124.4px;">Nombre</th>

                                                            <th class="sorting" tabindex="0"
                                                                aria-controls="buttons-datatables" rowspan="1"
                                                                colspan="1"
                                                                aria-label="Position: activate to sort column ascending"
                                                                style="width: 195.4px;">Abreviatura</th>

                                                            <th class="sorting" tabindex="0"
                                                                aria-controls="buttons-datatables" rowspan="1"
                                                                colspan="1"
                                                                aria-label="Position: activate to sort column ascending"
                                                                style="width: 195.4px;">Descripción</th>
                                                            <th class="sorting" tabindex="0"
                                                                aria-controls="buttons-datatables" rowspan="1"
                                                                colspan="1"
                                                                aria-label="Salary: activate to sort column ascending"
                                                                style="width: 55.4px;">Estado</th>
                                                            <th class="sorting" tabindex="0"
                                                                aria-controls="buttons-datatables" rowspan="1"
                                                                colspan="1"
                                                                aria-label="Start date: activate to sort column ascending"
                                                                style="width: 82.4px;">Acciones</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>

                                                    </tbody>
                                                </table>

                                            </div>

                                        </div> 
                                    </form>
                                </div>
                            </div>
                            <!--TODO:Insumos--->
                            <div class="card">
                                <div class="card-header">
                                    <h5 class="card-title mb-0">Agregar Insumos</h5>
                                </div>

                                <div class="card-body">
                                    <form id="form_mantenimiento" class="row g-3 needs-validation" method="post">
                                        <div class="modal-body">
                                            <!---TODO:campos insumos---->
                                            <div class="row">
                                                <div class="col-lg-12 col-md-4">
                                                    <div class="mb-3">
                                                        <label for="insumos_id" class="form-label">Seleccionar
                                                            Insumos</label>
                                                        <div class="input-group has-validation">
                                                            <select class="form-control" name="insumos_id"
                                                                id="insumos_id" aria-describedby="insumos_id">
                                                                <option value="">Seleccionar</option>
                                                                <option value="2">Otro</option>
                                                            </select>
                                                            <div id="insumos_id_error" class="invalid-feedback">
                                                                Por favor seleccionar insumos
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-lg-3 col-md-4">
                                                    <div class="mb-3">
                                                        <label for="marca" class="form-label">Marca</label>
                                                        <div class="input-group has-validation">
                                                            <input type="text" id="marca" name="marca"
                                                                class="form-control" placeholder="Ingresar marca"
                                                                aria-describedby="marca" />
                                                            <div id="marca_error" class="invalid-feedback">
                                                                Por favor ingresar marca
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="col-lg-3 col-md-4">
                                                    <div class="mb-3">
                                                        <label for="modelo" class="form-label">Modelo</label>
                                                        <div class="input-group has-validation">
                                                            <input type="text" id="modelo" name="modelo"
                                                                class="form-control" placeholder="Ingresar modelo"
                                                                aria-describedby="modelo" />
                                                            <div id="modelo_error" class="invalid-feedback">
                                                                Por favor ingresar modelo
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="col-lg-3 col-md-4">
                                                    <div class="mb-3">
                                                        <label for="serie" class="form-label">Serie</label>
                                                        <div class="input-group has-validation">
                                                            <input type="text" id="serie" name="serie"
                                                                class="form-control" placeholder="Ingresar serie"
                                                                aria-describedby="serie" />
                                                            <div id="serie_error" class="invalid-feedback">
                                                                Por favor ingresar serie
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-3 col-md-4">
                                                    <div class="mb-3">
                                                        <label for="color" class="form-label">Color</label>
                                                        <div class="input-group has-validation">
                                                            <input type="text" id="color" name="color"
                                                                class="form-control" placeholder="Ingresar color"
                                                                aria-describedby="color" />
                                                            <div id="color_error" class="invalid-feedback">
                                                                Por favor ingresar color
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <!--TODO:Boton add insumos-->
                                            <div class="d-flex justify-content-between mt-4">
                                                <h5 class="card-title mb-0">
                                                    </h4>
                                                    <div class="col-sm-auto  ">
                                                        <div>
                                                            <button type="button" class="btn btn-success add-btn mt-n4"
                                                                id="btn_nuevo_equipo"><i
                                                                    class="ri-add-line align-bottom me-1"></i> Agregar
                                                            </button>
                                                        </div>
                                                    </div>
                                            </div>

                                            <h5 class="card-title mb-0">Lista de Insumos en detalle</h5>

                                            <!--TODO:Tabla insumos--->
                                            <div id="buttons_table"
                                                class="dataTables_wrapper dt-bootstrap5 no-footer mt-2">
                                                <table id="table_insumos"  class="display table table-bordered dataTable no-footer"
                                                    style="width: 100%;" aria-describedby="buttons-datatables_info">
                                                    <thead>
                                                        <tr>
                                                            <th class="sorting sorting_asc" tabindex="0"
                                                                aria-controls="buttons-datatables" rowspan="1"
                                                                colspan="1" aria-sort="ascending"
                                                                aria-label="Name: activate to sort column descending"
                                                                style="width: 124.4px;">Nombre</th>

                                                            <th class="sorting" tabindex="0"
                                                                aria-controls="buttons-datatables" rowspan="1"
                                                                colspan="1"
                                                                aria-label="Position: activate to sort column ascending"
                                                                style="width: 195.4px;">Abreviatura</th>

                                                            <th class="sorting" tabindex="0"
                                                                aria-controls="buttons-datatables" rowspan="1"
                                                                colspan="1"
                                                                aria-label="Position: activate to sort column ascending"
                                                                style="width: 195.4px;">Descripción</th>
                                                            <th class="sorting" tabindex="0"
                                                                aria-controls="buttons-datatables" rowspan="1"
                                                                colspan="1"
                                                                aria-label="Salary: activate to sort column ascending"
                                                                style="width: 55.4px;">Estado</th>
                                                            <th class="sorting" tabindex="0"
                                                                aria-controls="buttons-datatables" rowspan="1"
                                                                colspan="1"
                                                                aria-label="Start date: activate to sort column ascending"
                                                                style="width: 82.4px;">Acciones</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>

                                                    </tbody>
                                                </table>

                                            </div>

                                        </div>
                                        <div class="modal-footer">
                                            <div class="hstack gap-2 justify-content-end">
                                                <button type="button" class="btn btn-light"
                                                    data-bs-dismiss="modal">Cancelar</button>
                                                <button type="submit" class="btn btn-primary"
                                                    id="labelbtn">Registrar</button>
                                            </div>
                                        </div>
                                    </form>
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
    <script src="taller.js"></script>



</body>

</html>
<?php }else{ 
    header("location:".Conectar::ruta());
}

?>