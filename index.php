<?php
require_once ("config/conexion.php"); 

   /*TODO_:Acess system*/
   if (isset($_POST["enviar"]) and $_POST["enviar"]=="si"){
    require_once("models/Usuario.php");
    $usuario = new Usuario();
    $usuario->Login();

}

?>

<!doctype html>
<html lang="en" data-layout="vertical" data-topbar="light" data-sidebar="dark" data-sidebar-size="lg"
    data-sidebar-image="none">

<head>

    <meta charset="utf-8" />
    <title>Login | InvenTechPE</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta content="Sistema para inventario" name="description" />
    <meta content="Jhon A Villa Flores" name="author" />
    <!-- App favicon -->
    <link rel="shortcut icon" href="assets/images/favicon.ico">

    <!-- Layout config Js -->
    <script src="assets/js/layout.js"></script>
    <!-- Bootstrap Css -->
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <!-- Icons Css -->
    <link href="assets/css/icons.min.css" rel="stylesheet" type="text/css" />
    <!-- App Css-->
    <link href="assets/css/app.min.css" rel="stylesheet" type="text/css" />
    <!-- custom Css-->
    <link href="assets/css/custom.min.css" rel="stylesheet" type="text/css" />




</head>

<body>

    <div class="auth-page-wrapper pt-5">
        <!-- auth page bg -->
        <div class="auth-one-bg-position auth-one-bg" id="auth-particles">
            <div class="bg-overlay"></div>

            <div class="shape">
                <svg xmlns="http://www.w3.org/2000/svg" version="1.1" xmlns:xlink="http://www.w3.org/1999/xlink"
                    viewBox="0 0 1440 120">
                    <path d="M 0,36 C 144,53.6 432,123.2 720,124 C 1008,124.8 1296,56.8 1440,40L1440 140L0 140z"></path>
                </svg>
            </div>
        </div>

        <!-- auth page content -->
        <div class="auth-page-content">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="text-center mt-sm-5 mb-4 text-white-50">
                            <div>
                                <a href="" class="d-inline-block auth-logo">
                                    <img src="assets/images/logo-light.png" alt="" height="20">
                                </a>
                            </div>
                            <p class="mt-3 fs-15 fw-medium">InvenTechPE</p>
                        </div>
                    </div>
                </div>
                <!-- end row -->

                <div class="row justify-content-center">
                    <div class="col-md-8 col-lg-6 col-xl-5">
                        <div class="card mt-4">

                            <div class="card-body p-4">
                                <div class="text-center mt-2">
                                    <h5 class="text-primary">Bienvenido de nuevo !</h5>
                                    <p class="text-muted">Inicia sesión para continuar</p>
                                </div>
                                <div class="col-12">
                                    <?php
                                         if (isset($_SESSION['passErrorMessage']) && !empty($_SESSION['passErrorMessage'])) {
                                         echo '<div class="alert alert-danger ancho" role="alert">' . $_SESSION['passErrorMessage'] . '</div>';
                                         $_SESSION['passErrorMessage'] = ''; // Limpiar la variable de sesión
                                        } elseif (isset($_SESSION['genericErrorMessage']) && !empty($_SESSION['genericErrorMessage'])) {
                                         echo '<div class="alert alert-danger ancho" role="alert">' . $_SESSION['genericErrorMessage'] . '</div>';
                                         $_SESSION['genericErrorMessage'] = ''; // Limpiar la variable de sesión
                                         }
                                        ?>
                                </div>
                                <div class="p-2 mt-4">
                                    <form id="loginForm" class="row g-3 needs-validation" method="post">
                                        <div class="mb-3">
                                            <label for="txt_user" class="form-label">Usuario</label>
                                            <input type="email" class="form-control" name="txt_user" id="txt_user"
                                                placeholder="Ingresar usuario">
                                            <div id="txt_user_error" class="invalid-feedback"> </div>
                                        </div>

                                        <div class="mb-3">
                                            <div class="float-end">
                                                <a href="#" class="text-muted">Olvidaste tu contraseña?</a>
                                            </div>
                                            <label class="form-label" for="txt_pass">Contraseña</label>
                                            <div class="position-relative auth-pass-inputgroup mb-3">
                                                <input type="password" class="form-control pe-5"
                                                    placeholder="Ingresar contraseña" name="txt_pass" id="txt_pass">
                                                <button
                                                    class="btn btn-link position-absolute end-0 top-0 text-decoration-none text-muted"
                                                    type="button" id="view_pass"><i
                                                        class="ri-eye-fill align-middle"></i></button>
                                                <div id="txt_pass_error" class="invalid-feedback"> </div>
                                            </div>
                                        </div>

                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" value=""
                                                id="auth-remember-check">
                                            <label class="form-check-label" for="auth-remember-check">Acuérdate de
                                                mí</label>
                                        </div>

                                        <div class="mt-4">
                                            <input type="hidden" name="enviar" class="form-control" value="si">
                                            <button id="btn_login_init" class="btn btn-success w-100"
                                                type="submit">Iniciar Sesión</button>
                                        </div>

                                    </form>
                                </div>
                            </div>
                            <!-- end card body -->
                        </div>
                        <!-- end card 

                        <div class="mt-4 text-center">
                            <p class="mb-0">Don't have an account ? <a href="auth-signup-basic.html"
                                    class="fw-semibold text-primary text-decoration-underline"> Signup </a> </p>
                        </div>-->

                    </div>
                </div>
                <!-- end row -->
            </div>
            <!-- end container -->
        </div>
        <!-- end auth page content -->

        <!-- footer -->
        <footer class="footer">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="text-center">
                            <p class="mb-0 text-muted">&copy;
                                <script>
                                document.write(new Date().getFullYear())
                                </script> InvenTechPE <i class="mdi mdi-heart text-danger"></i> by InvenTechPE
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
        <!-- end Footer -->
    </div>
    <!-- end auth-page-wrapper -->

    <!-- JAVASCRIPT -->
    <script src="assets/libs/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="assets/libs/simplebar/simplebar.min.js"></script>
    <script src="assets/libs/node-waves/waves.min.js"></script>
    <script src="assets/libs/feather-icons/feather.min.js"></script>
    <script src="assets/js/pages/plugins/lord-icon-2.1.0.js"></script>
    <script src="assets/js/plugins.js"></script>

    <!-- particles js -->
    <script src="assets/libs/particles.js/particles.js"></script>
    <!-- particles app js -->
    <script src="assets/js/pages/particles.app.js"></script>
    <!-- password-addon init -->
    <script src="assets/js/pages/password-addon.init.js"></script>
    <script src="log_in.js"></script>




    <script src="https://code.jquery.com/jquery-3.6.0.min.js"
        integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>



</body>

</html>