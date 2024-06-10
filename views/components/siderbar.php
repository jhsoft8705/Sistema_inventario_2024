<div class="app-menu navbar-menu">
    <!-- LOGO -->
    <div class="navbar-brand-box">
        <!-- Dark Logo-->
        <a href="../home" class="logo logo-dark">
            <span class="logo-sm">
                <img src="../../assets/images/logo-sm.png" alt="" height="22">
            </span>
            <span class="logo-lg">
                <img src="../../assets/images/logo-dark.png" alt="" height="17">
            </span>
        </a>
        <!-- Light Logo-->
        <a href="../home" class="logo logo-light">
            <span class="logo-sm">
                <img src="../../assets/images/logo-sm.png" alt="" height="22">
            </span>
            <span class="logo-lg">
                <img src="../../assets/images/logo-light.png" alt="" height="17">
            </span>
        </a>
        <button type="button" class="btn btn-sm p-0 fs-20 header-item float-end btn-vertical-sm-hover"
            id="vertical-hover">
            <i class="ri-record-circle-line"></i>
        </button>
    </div>

    <div id="scrollbar">
        <div class="container-fluid">

            <div id="two-column-menu">
            </div>
            <ul class="navbar-nav" id="navbar-nav">
                <li class="menu-title"><span data-key="t-Dashboard">Menu</span></li>

                <li class="nav-item">
                    <a class="nav-link menu-link" href="../home">
                        <i class="ri-dashboard-2-line"></i> <span data-key="t-Dashboard">Dashboard</span>
                    </a>
                </li>



                <li class="menu-title"><i class="ri-more-fill"></i> <span data-key="t-components">Almacen</span></li>



                <!--Inventario--->
                <li class="nav-item">
                    <a class="nav-link menu-link" href="#sidebar_suministros" data-bs-toggle="collapse" role="button"
                        aria-expanded="false" aria-controls="sidebar_suministros">
                        <i class=" ri-tools-line"></i> <span data-key="t-sidebar_suministros">Almacen</span>
                    </a>
                    <div class="collapse menu-dropdown" id="sidebar_suministros">
                        <ul class="nav nav-sm flex-column">

                        
                            <li class="nav-item">
                                <a href="../equipos" class="nav-link" data-key="t-Equipos">
                                    Equipos
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="../herramientas" class="nav-link" data-key="t-Herramientas">
                                    Herramientas
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="../insumos" class="nav-link" data-key="t-Insumos">
                                    Insumos
                                </a>
                            </li>
                        </ul>
                    </div>
                </li>

                <!--Asiganciones-->
                <li class="nav-item">
                    <a class="nav-link menu-link" href="#sidebar_inventario" data-bs-toggle="collapse" role="button"
                        aria-expanded="false" aria-controls="sidebar_inventario">
                        <i class="  ri-pages-line"></i> <span data-key="t-inventario">Inventarios</span>
                    </a>
                    <div class="collapse menu-dropdown" id="sidebar_inventario">
                        <ul class="nav nav-sm flex-column">

                            <li class="nav-item">
                                <a href="../new-asignacion" class="nav-link" data-key="t-Nuevo-asignacion">
                                    Asignar Taller
                                </a>
                            </li>

                            <li class="nav-item">
                                <a href="../asignaciones" class="nav-link" data-key="t-Lista de Asignaciones">
                                Lista de Asignaciones
                                </a>
                            </li>

                            <li class="nav-item">
                                <a href="../talleres" class="nav-link" data-key="t-Talleres">
                                Talleres
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="../periodos" class="nav-link" data-key="t-Periodos">
                                    Periodos
                                </a>
                            </li>

                        </ul>
                    </div>
                </li>


                <li class="menu-title"><i class="ri-more-fill"></i> <span data-key="t-pages">Mantenimiento</span></li>

                <li class="nav-item">
                    <a class="nav-link menu-link" href="../categorias">
                        <i class=" ri-shopping-bag-2-fill"></i> <span data-key="t-unidad">Categorias</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link menu-link" href="../unidad-medida">
                        <i class=" ri-ruler-2-line"></i> <span data-key="t-unidad">Unidad de Medida</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link menu-link" href="../ubicaciones">
                        <i class=" bx bxs-edit-location"></i> <span data-key="t-ubicaciones">Ubicaciones</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link menu-link" href="../proveedores">
                        <i class=" ri-account-box-fill"></i> <span data-key="t-proveedores">Proveedores</span>
                    </a>
                </li>

                <!---
                <li class="nav-item">
                    <a class="nav-link menu-link" href="#sidebarPages" data-bs-toggle="collapse" role="button"
                        aria-expanded="false" aria-controls="sidebarPages">
                        <i class="ri-pages-line"></i> <span data-key="t-pages">Pages</span>
                    </a>
                    <div class="collapse menu-dropdown" id="sidebarPages">
                        <ul class="nav nav-sm flex-column">
                            <li class="nav-item">
                                <a href="pages-starter.html" class="nav-link" data-key="t-starter"> Starter </a>
                            </li>
                            <li class="nav-item">
                                <a href="#sidebarProfile" class="nav-link" data-bs-toggle="collapse" role="button"
                                    aria-expanded="false" aria-controls="sidebarProfile" data-key="t-profile"> Profile
                                </a>
                                <div class="collapse menu-dropdown" id="sidebarProfile">
                                    <ul class="nav nav-sm flex-column">
                                        <li class="nav-item">
                                            <a href="pages-profile.html" class="nav-link" data-key="t-simple-page">
                                                Simple Page </a>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                        </ul>
                    </div>
                </li>-->

                <li class="menu-title"><i class="ri-more-fill"></i> <span data-key="t-components">Seguridad</span></li>


                <li class="nav-item">
                    <a class="nav-link menu-link" href="#sidebarConfig" data-bs-toggle="collapse" role="button"
                        aria-expanded="false" aria-controls="sidebarConfig">
                        <i class=" ri-admin-fill"></i> <span data-key="t-Config">Configuración</span>
                    </a>
                    <div class="collapse menu-dropdown" id="sidebarConfig">
                        <ul class="nav nav-sm flex-column">

                            <li class="nav-item">
                                <a href="../usuarios" class="nav-link" data-key="t-Usuarios">
                                    Usuarios
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="../roles" class="nav-link" data-key="t-Roles">
                                    Roles
                                </a>
                            </li>
                        </ul>
                    </div>
                </li>

            </ul>
        </div>
        <!-- Sidebar -->
    </div>

    <div class="sidebar-background"></div>
</div>