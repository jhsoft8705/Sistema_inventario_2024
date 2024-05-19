 <!--TODO:MODAL CREATE-->
 <div class="modal fade" id="modal_mantenimiento" tabindex="-1">
     <div class="modal-dialog ">
         <div class="modal-content">
             <div class="modal-header">
                 <h5 class="modal-title" id="lbltitulo"></h5>
                 <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
             </div>
             <div class="modal-body">
                 <form id="form_mantenimiento" method="post">
                     <div class="row mb-3">
                         <div class="row align-items-center -3g">


                             <!-- Input oculto para el id_rol -->
                             <input hidden type="text" id="id_rol" name="id_rol" class="form-control">



                             <div class="col-lg-6">
                                 <label for="nombre" class="form-label">Rol</label>
                                 <input type="text" class="form-control" id="nombre" name="nombre"
                                     placeholder="Nombre de Rol" />
                                 <div id="nombre-error" class="invalid-feedback"></div>
                             </div>


                             <div class="col-lg-6">
                                 <label for="descripcion" class="form-label">Descripción</label>

                                 <!-- Cambiado de input a textarea -->
                                 <textarea class="form-control" id="descripcion" name="descripcion"
                                     placeholder="Descripción" style="height: 20px"></textarea>
                                 <div id="descripcion-error" class="invalid-feedback"></div>
                             </div>


                         </div>
                     </div>

                     <div class="modal-footer">
                         <button type="reset" class="btn btn-secondary botones_secundario"
                             data-bs-dismiss="modal">Cancelar</button>
                         <button type="submit" name="action" value="add" id="lblbtn"
                             class="btn btn-primary botones"></button>
                     </div>
                 </form>

             </div>
         </div>
     </div>
 </div><!-- End Large Modal-->


<!-- Scrollable Modal -->
 
 <!--TODO:Accesos rutas-->
 <div class="modal fade" id="modal_setting_roles" tabindex="-1">
     <div class="modal-dialog modal-dialog-scrollable ">
         <div class="modal-content">
             <div class="modal-header">
                 <button type="button" class="btn btn-lg" data-bs-toggle="tooltip" data-bs-placement="top"
                     title="Al Seleccionar 'Si', Quiere decir que el rol tiene acceso a tal opción y 'No', indica que no tiene acceso">
                     <span class="ri-information-fill"></span>
                 </button>

                 <h5 class="modal-title" id="lbltitulo_config"></h5>
                 <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
             </div>
             <div class="modal-body">
                 <!--- Cuerpo -->
                 <table id="tabla_permisos" class="table table-striped table-bordered display" width="100%">
                     <thead>
                         <tr>
                             <th scope="col">Nombre</th>
                             <th scope="col">Permiso</th>
                         </tr>
                     </thead>
                     <tbody>
                     </tbody>
                 </table>
                 <!--End Cuerpo-->
                 <div class="modal-footer">
                     <button type="reset" class="btn btn-secondary botones" data-bs-dismiss="modal">Salir</button>

                 </div>
             </div>
         </div>
     </div>
 </div><!-- End  