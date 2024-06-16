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
                        <div class="col-12">
                            <div class="page-title-box d-sm-flex align-items-center justify-content-between">
                                <h4 class="mb-sm-0">Asignación de equipos </h4>

                                <div class="page-title-right">
                                    <ol class="breadcrumb m-0">
                                        <li class="breadcrumb-item"><a href="../asignaciones">Asignaciones</a></li>
                                        <li class="breadcrumb-item active">New Asignación</li>
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
                                    <h5 class="card-title mb-0">Asignar Taller y agregar responsable</h5>
                                </div>
                                <div class="card-body">
                                    <div class="modal-body">
                                        <div class="row">
                                            <input hidden type="text" id="asigacion_id" name="asigacion_id" />

                                            <div class="col-lg-6 col-md-6">
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
                                            <div class="col-lg-6 col-md-6">
                                                <div class="mb-3">
                                                    <label for="usuario_id" class="form-label">Seleccionar
                                                        Usuario</label>
                                                    <div class="input-group has-validation">

                                                        <select class="form-control" name="usuario_id" id="usuario_id"
                                                            aria-describedby="usuario_id" class="form-control"
                                                            placeholder="Ingresar proveedor">
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
                                        <div class="row"> 
                                            <div class="col-lg-4 col-md-4">
                                                <div class="mb-3">
                                                    <label for="periodo_id" class="form-label">Seleccionar
                                                        Periodo</label>
                                                    <div class="input-group has-validation">

                                                        <select class="form-control" name="periodo_id" id="periodo_id"
                                                            aria-describedby="periodo_id" class="form-control"
                                                            placeholder="Ingresar periodo_id">
                                                            <option value="">Seleccionar</option>
                                                            <option value="2">Otro</option>
                                                        </select>

                                                        <div id="usuario_error" class="invalid-feedback">
                                                            Por favor ingresar usuario
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
                                    <h5 class="card-title mb-0">Agregar Equipos o Maquinaria</h5>
                                </div>
                                <div class="card-body">
                                    <div class="modal-body">

                                        <div class="row">
                                            <div class="col-lg-12 col-md-12">
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
                                                            Por favor seleccionar equipo_id
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-2 col-md-4">
                                                <div class="mb-3">
                                                    <label for="codigo_m_e" class="form-label">cod
                                                        Modular</label>
                                                    <div class="input-group has-validation">
                                                        <input type="text" id="codigo_m_e" name="codigo_m_e"
                                                            class="form-control" aria-describedby="codigo_m_e"
                                                            readonly />
                                                        <div id="codigo_m_e_error" class="invalid-feedback">
                                                            Por favor ingresar codigo_m
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-2 col-md-4">
                                                <div class="mb-3">
                                                    <label for="marcae" class="form-label">Marca</label>
                                                    <div class="input-group has-validation">
                                                        <input type="text" id="marcae" name="marcae"
                                                            class="form-control" readonly />
                                                        <div id="marcae_error" class="invalid-feedback">
                                                            Por favor ingresar marcae
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-lg-2 col-md-4">
                                                <div class="mb-3">
                                                    <label for="cantidad_d_e" class="form-label">Cant
                                                        Disponible</label>
                                                    <div class="input-group has-validation">
                                                        <input type="text" id="cantidad_d_e" class="form-control"
                                                            readonly />
                                                        <div id="cantidad_d_e_error" class="invalid-feedback">
                                                            Por favor ingresar modelo
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-2 col-md-4">
                                                <div class="mb-3">
                                                    <label for="precio_uni_e" class="form-label">Precio
                                                        Unitario</label>
                                                    <div class="input-group has-validation">
                                                        <input type="text" id="precio_uni_e" class="form-control"
                                                            readonly />
                                                        <div id="precio_uni_e_error" class="invalid-feedback">
                                                            Por favor ingresar modelo
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-2 col-md-4">
                                                <div class="mb-3">
                                                    <label for="total_e" class="form-label">Total
                                                    </label>
                                                    <div class="input-group has-validation">
                                                        <input type="text" id="total_e" class="form-control" readonly />
                                                        <div id="total_e_error" class="invalid-feedback">
                                                            Por favor ingresar modelo
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-2 col-md-4">
                                                <div class="mb-3">
                                                    <label for="cantidad_e" class="form-label">Cantidad</label>
                                                    <div class="input-group has-validation">
                                                        <input type="number" id="cantidad_e" name="cantidad_e"
                                                            class="form-control" placeholder="Ingresar cantidad"
                                                            aria-describedby="cantidad_e" />
                                                        <div id="cantidad_e_error" class="invalid-feedback">
                                                            Por favor ingresar cantidad_e
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
                                                        <button type="button" class="btn btn-warning add-btn mt-n4"
                                                            id="clear_equipo"><i
                                                                class="ri-add-line align-bottom me-1"></i>
                                                            Limpiar
                                                        </button>
                                                        <button type="button" class="btn btn-success add-btn mt-n4"
                                                            id="btn_nuevo_equipo"><i
                                                                class="ri-add-line align-bottom me-1"></i>
                                                            Agregar
                                                        </button>
                                                    </div>
                                                </div>

                                        </div>

                                        <h5 class="card-title mb-0">Lista de equipos en detalle</h5>

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
                                    <h5 class="card-title mb-0">Agregar Herramientas o Muebles</h5>
                                </div>

                                <div class="card-body">
                                    <div class="modal-body">
                                        <!---TODO:campos herramientas---->
                                        <div class="row">
                                            <div class="col-lg-12 col-md-12">
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
                                                            Por favor seleccionar herramienta_id
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-2 col-md-4">
                                                <div class="mb-3">
                                                    <label for="codigo_m_h" class="form-label">cod
                                                        Modular</label>
                                                    <div class="input-group has-validation">
                                                        <input type="text" id="codigo_m_h" name="codigo_m_h"
                                                            class="form-control" aria-describedby="codigo_m_h"
                                                            readonly />
                                                        <div id="codigo_m_h_error" class="invalid-feedback">
                                                            Por favor ingresar codigo_m
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-2 col-md-4">
                                                <div class="mb-3">
                                                    <label for="marcah" class="form-label">Marca</label>
                                                    <div class="input-group has-validation">
                                                        <input type="text" id="marcah" name="marcah"
                                                            class="form-control" readonly />
                                                        <div id="marcah_error" class="invalid-feedback">
                                                            Por favor ingresar marcah
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-lg-2 col-md-4">
                                                <div class="mb-3">
                                                    <label for="cantidad_d_h" class="form-label">Cant
                                                        Disponible</label>
                                                    <div class="input-group has-validation">
                                                        <input type="text" id="cantidad_d_h" class="form-control"
                                                            readonly />
                                                        <div id="cantidad_d_h_error" class="invalid-feedback">
                                                            Por favor ingresar modelo
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-2 col-md-4">
                                                <div class="mb-3">
                                                    <label for="precio_uni_h" class="form-label">Precio
                                                        Unitario</label>
                                                    <div class="input-group has-validation">
                                                        <input type="text" id="precio_uni_h" class="form-control"
                                                            readonly />
                                                        <div id="precio_uni_h_error" class="invalid-feedback">
                                                            Por favor ingresar precio_uni_h
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-2 col-md-4">
                                                <div class="mb-3">
                                                    <label for="total_h" class="form-label">Total
                                                    </label>
                                                    <div class="input-group has-validation">
                                                        <input type="text" id="total_h" class="form-control" readonly />
                                                        <div id="total_h_error" class="invalid-feedback">
                                                            Por favor ingresar total_h
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-2 col-md-4">
                                                <div class="mb-3">
                                                    <label for="cantidad_h" class="form-label">Cantidad</label>
                                                    <div class="input-group has-validation">
                                                        <input type="text" id="cantidad_h" name="cantidad_h"
                                                            class="form-control" placeholder="Ingresar cantidad"
                                                            aria-describedby="cantidad_h" />
                                                        <div id="cantidad_h_error" class="invalid-feedback">
                                                            Por favor ingresar cantidad_h
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
                                                        <button type="button" class="btn btn-warning add-btn mt-n4"
                                                            id="clear_herramienta"><i
                                                                class="ri-add-line align-bottom me-1"></i>
                                                            Limpiar
                                                        </button>
                                                        <button type="button" class="btn btn-success add-btn mt-n4"
                                                            id="btn_nuevo_tools"><i
                                                                class="ri-add-line align-bottom me-1"></i>
                                                            Agregar
                                                        </button>
                                                    </div>
                                                </div>

                                        </div>

                                        <h5 class="card-title mb-0">Lista de Herramientas en detalle</h5>

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
                                    <h5 class="card-title mb-0">Agregar Insumos</h5>
                                </div>

                                <div class="card-body">
                                    <div class="modal-body">
                                        <!---TODO:campos insumos---->
                                        <div class="row">
                                            <div class="col-lg-12 col-md-12">
                                                <div class="mb-3">
                                                    <label for="insumo_id" class="form-label">Seleccionar
                                                        Insumos</label>
                                                    <div class="input-group has-validation">
                                                        <select class="form-control" name="insumo_id" id="insumo_id"
                                                            aria-describedby="insumo_id">
                                                            <option value="">Seleccionar</option>
                                                            <option value="2">Otro</option>
                                                        </select>
                                                        <div id="insumo_id_error" class="invalid-feedback">
                                                            Por favor seleccionar insumo_id
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-2 col-md-4">
                                                <div class="mb-3">
                                                    <label for="codigo_m_i" class="form-label">cod
                                                        Modular</label>
                                                    <div class="input-group has-validation">
                                                        <input type="text" id="codigo_m_i" name="codigo_m_i"
                                                            class="form-control" aria-describedby="codigo_m_i"
                                                            readonly />
                                                        <div id="codigo_m_i_error" class="invalid-feedback">
                                                            Por favor ingresar codigo_m
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-2 col-md-4">
                                                <div class="mb-3">
                                                    <label for="marcai" class="form-label">Marca</label>
                                                    <div class="input-group has-validation">
                                                        <input type="text" id="marcai" name="marcai"
                                                            class="form-control" readonly />
                                                        <div id="marcai_error" class="invalid-feedback">
                                                            Por favor ingresar marcai
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-lg-2 col-md-4">
                                                <div class="mb-3">
                                                    <label for="cantidad_d_i" class="form-label">Cant
                                                        Disponible</label>
                                                    <div class="input-group has-validation">
                                                        <input type="text" id="cantidad_d_i" class="form-control"
                                                            readonly />
                                                        <div id="cantidad_d_i_error" class="invalid-feedback">
                                                            Por favor ingresar cantidad_d_i
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-2 col-md-4">
                                                <div class="mb-3">
                                                    <label for="precio_uni_i" class="form-label">Precio
                                                        Unitario</label>
                                                    <div class="input-group has-validation">
                                                        <input type="text" id="precio_uni_i" class="form-control"
                                                            readonly />
                                                        <div id="precio_uni_i_error" class="invalid-feedback">
                                                            Por favor ingresar modelo
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-2 col-md-4">
                                                <div class="mb-3">
                                                    <label for="total_i" class="form-label">Total
                                                    </label>
                                                    <div class="input-group has-validation">
                                                        <input type="text" id="total_i" class="form-control" readonly />
                                                        <div id="total_i_error" class="invalid-feedback">
                                                            Por favor ingresar total_i
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-2 col-md-4">
                                                <div class="mb-3">
                                                    <label for="cantidad_i" class="form-label">Cantidad</label>
                                                    <div class="input-group has-validation">
                                                        <input type="text" id="cantidad_i" name="cantidad_i"
                                                            class="form-control" placeholder="Ingresar cantidad"
                                                            aria-describedby="cantidad_i" />
                                                        <div id="ccantidad_i_error" class="invalid-feedback">
                                                            Por favor ingresar cantidad_i
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!--TODO:Boton add Insumos-->
                                        <div class="d-flex justify-content-between mt-4">
                                            <h5 class="card-title mb-0">
                                                </h4>
                                                <div class="col-sm-auto  ">
                                                    <div>
                                                        <button type="button" class="btn btn-warning add-btn mt-n4"
                                                            id="clear_insumo"><i
                                                                class="ri-add-line align-bottom me-1"></i>
                                                            Limpiar
                                                        </button>
                                                        <button type="button" class="btn btn-success add-btn mt-n4"
                                                            id="btn_nuevo_insumo"><i
                                                                class="ri-add-line align-bottom me-1"></i>
                                                            Agregar
                                                        </button>
                                                    </div>
                                                </div>

                                        </div>

                                        <h5 class="card-title mb-0">Lista de Insumos en detalle</h5>

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
                                                    <textarea id="descripcion" name="descripcion"
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
                                            <button type="button" class="btn btn-light" onclick="window.location.href='../asignaciones/'">Cancelar</button>
                                            <button type="submit" class="btn btn-primary"
                                                id="btn_registrar_asignacion_g">Registrar</button>
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
        <script src="asignacion.js"></script>



</body>

</html>
<?php }else{ 
    header("location:".Conectar::ruta());
}

?>