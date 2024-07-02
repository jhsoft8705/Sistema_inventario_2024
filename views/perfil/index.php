<?php  
require_once("../../config/conexion.php"); 

 



/*TODO:Validar si la sesión exite , si no location al Login*/
if(isset($_SESSION['usuario_id'])){ 
        
?>
<!doctype html>
<html lang="en" data-layout="vertical" data-topbar="light" data-sidebar="dark" data-sidebar-size="lg"
    data-sidebar-image="none">

<head>
    <title>Perfil | InvenTechPE</title>
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
                                <h4 class="mb-sm-0">PERFIL</h4>

                                <div class="page-title-right">
                                    <ol class="breadcrumb m-0">
                                        <li class="breadcrumb-item"><a href="../home/">Dashboard</a></li>
                                        <li class="breadcrumb-item active">Perfil</li>
                                    </ol>
                                </div>
                            </div>

                            <div class="profile-foreground position-relative mx-n4 mt-n4">
                                <div class="profile-wid-bg">
                                    <img src="../../assets/images/users/avatar-1.png" alt="" class="profile-wid-img">
                                </div>
                            </div>

                            <div class="pt-4 mb-4 mb-lg-3 pb-lg-4">
                                <div class="row g-4">
                                    <div class="col-auto">
                                        <div class="avatar-lg">
                                            <img src="../../assets/images/users/avatar-1.png" alt="user-img"
                                                class="img-thumbnail rounded-circle">
                                        </div>
                                    </div>
                                    <!--end col-->
                                    <div class="col">
                                        <div class="p-2">
                                            <h3 class="text-white mb-1" id="name_ape">Anna Adame</h3>
                                            <p class="text-white-75" id="nombre_rol">Admin</p>
                                            <div class="hstack text-white-50 gap-1">
                                                <div class="me-2" id="descripcion_rol">  </div>
                                     
                                            </div>
                                        </div>



                                    </div>
                                    <!--end col-->
                                    <div class="col-12 col-lg-auto order-last order-lg-0">
                                        <div class="row text text-white-50 text-center">
                                            <div class="col-lg-6 col-4">
                                                <div class="p-2">
                                                    <h4 class="text-white mb-1" id="estado"> </h4>
                                                    <p class="fs-14 mb-0">Estado</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!--end col-->

                            </div>
                            <!--end row-->
                        </div>

                        <div class="row">
                            <div class="col-lg-12">
                                <div>
                                    <div class="d-flex">
                                        <!-- Nav tabs -->
                                        <ul class="nav nav-pills animation-nav profile-nav gap-2 gap-lg-3 flex-grow-1"
                                            role="tablist">
                                            <li class="nav-item">
                                                <a class="nav-link fs-14 active" data-bs-toggle="tab"
                                                    href="#overview-tab" role="tab">
                                                    <i class="ri-airplay-fill d-inline-block d-md-none"></i> <span
                                                        class="d-none d-md-inline-block">Vista previa</span>
                                                </a>
                                            </li>
                                        </ul>
                                        <div class="flex-shrink-0">
                                            <!--<a href="pages-profile-settings.html" class="btn btn-success"><i
                                                        class="ri-edit-box-line align-bottom"></i> Edit Profile</a>--->
                                        </div>
                                    </div>
                                    <!-- Tab panes -->
                                    <div class="tab-content pt-4 text-muted">
                                        <div class="tab-pane active" id="overview-tab" role="tabpanel">
                                            <div class="row">
                                                <div class="col-xxl-3">


                                                    <div class="card">
                                                        <div class="card-body">
                                                            <h5 class="card-title mb-3">Info</h5>
                                                            <div class="table-responsive">
                                                                <table class="table table-borderless mb-0">
                                                                    <tbody>
                                                                        <tr>
                                                                            <th class="ps-0" scope="row">Nombre :
                                                                            </th>
                                                                            <td class="text-muted"  id="nombre">Anna Adame</td>
                                                                        </tr>
                                                                        <tr>
                                                                            <th class="ps-0" scope="row"  >Apellido :
                                                                            </th>
                                                                            <td class="text-muted" id="apellido">Anna Adame</td>
                                                                        </tr>
                                                                        <tr>
                                                                            <th class="ps-0" scope="row">Num
                                                                                Documento :
                                                                            </th>
                                                                            <td class="text-muted" id="numero_documento">52855252
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <th class="ps-0" scope="row">Teléfono:
                                                                            </th>
                                                                            <td class="text-muted" id="telefono">52855252
                                                                            </td>
                                                                        </tr>

                                                                        <tr>
                                                                            <th class="ps-0" scope="row">Email:
                                                                            </th>
                                                                            <td class="text-muted" id="correo">52855252
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <th class="ps-0" scope="row">Dirección :
                                                                            </th>
                                                                            <td class="text-muted" id="direccion">
                                                                                Lima peru</td>
                                                                        </tr>
                                                                    </tbody>
                                                                </table>
                                                            </div>
                                                        </div><!-- end card body -->
                                                    </div><!-- end card -->

                                                    <!--end card-->
                                                </div>

                                                <!--end col-->
                                            </div>
                                            <!--end row-->
                                        </div>

                                        <!--end tab-pane-->
                                    </div>
                                    <!--end tab-content-->
                                </div>
                            </div>
                            <!--end col-->
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

    <!-- App js -->


    <!-- echarts init -->

    <script src="perfil.js"></script>

</body>

</html>
<?php }else{
    header("location:".Conectar::ruta());

}?>