 <div class="modal fade" id="modal_mantenimiento" tabindex="-1" aria-labelledby="label_title" aria-hidden="true">
     <div class="modal-dialog modal-dialog-centered">
         <div class="modal-content">
             <div class="modal-header bg-light p-3">
                 <h5 class="modal-title" id="label_title"></h5>
                 <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"
                     id="close-modal"></button>
             </div>
             <form id="form_mantenimiento" class="row g-3 needs-validation" method="post">
                 <div class="modal-body">

                     <div class="mb-3">
                         <div class="input-group has-validation">
                             <!--<span class="input-group-d" id="nombres">@</span>--->
                             <input hidden type="text" id="id_user" name="id_user" class="form-control"
                                 placeholder="id_user" aria-describedby="id_user" />
                             <div class="invalid-feedback">
                                 Por favor ingresar nombre
                             </div>
                         </div>
                     </div>


                     <div class="mb-3">
                         <label for="nombres" class="form-label">Nombres del usuario</label>
                         <div class="input-group has-validation">
                             <!--<span class="input-group-d" id="nombres">@</span>--->
                             <input type="text" id="nombres" name="nombres" class="form-control"
                                 placeholder="Ingresar nombres" aria-describedby="nombres" />
                             <div id="nombres_error" class="invalid-feedback">
                                 Por favor ingresar nombre
                             </div>
                         </div>
                     </div>

                     <div class="mb-3">
                         <label for="apellidos" class="form-label">Apellidos del usuario</label>
                         <div class="input-group has-validation">
                             <input type="text" id="apellidos" name="apellidos" class="form-control"
                                 placeholder="Ingresar Apellidos" aria-describedby="apellidos" />
                             <div id="apellidos_error" class="invalid-feedback">
                                 Muy bien
                             </div>
                         </div>
                     </div>

                     <div class="mb-3">
                         <label for="documento" class="form-label">Documento del usuario</label>
                         <div class="input-group has-validation">
                             <input type="number" id="documento" name="documento" class="form-control"
                                 placeholder="Ingresar N° documento" aria-describedby="documento" />
                             <div id="documento_error" class="invalid-feedback">
                                 Muy bien
                             </div>
                         </div>
                     </div>


                     <div class="mb-3">
                         <label for="correo" class="form-label">Email del usuario</label>
                         <div class="input-group has-validation">
                             <input type="email" id="correo" name="correo" class="form-control"
                                 placeholder="Ingresar Email" aria-describedby="correo" />
                             <div id="correo_error" class="invalid-feedback">
                             </div>
                         </div>
                     </div>


                     <div class="mb-3"> 
                         <label class="form-label" for="pass">Contraseña</label>
                         <div class="position-relative auth-pass-inputgroup mb-3">
                             <input type="password" class="form-control pe-5" placeholder="Ingresar contraseña"
                             id="pass" name="pass">
                             <button class="btn btn-link position-absolute end-0 top-0 text-decoration-none text-muted"
                                 type="button" id="view_pass"><i class="ri-eye-fill align-middle"></i></button>
                              <div id="pass_error" class="invalid-feedback">
                                 Muy mal
                             </div>
                         </div>
                     </div>
 

                     <div class="mb-3">
                         <label for="rol_id" class="form-label">Rol del usuario</label>
                         <div class="input-group has-validation">
                             <select class="form-control" name="rol_id"id="rol_id"
                                 aria-describedby="rol_id">
                                 <option value="">Status</option>
                                 <option value="Active">Active</option>
                             </select>
                             <div id="rol_id_error" class="invalid-feedback">
                                 Muy mal
                             </div>
                         </div>
                     </div>

                     <div class="mb-3">
                         <label for="estado" class="form-label">Estado del usuario</label>
                         <div class="input-group has-validation">
                             <select class="form-control" data-trigger name="estado" id="estado"
                                 aria-describedby="estado">
                                 <option value="">Seleccionar</option>
                                 <option value="Activo">Activo</option>
                                 <option value="Inactivo">Inactivo</option>
                             </select>
                             <div id="estado_error" class="invalid-feedback">
                                 Muy mal
                             </div>
                         </div>
                     </div>
                 </div>
                 <div class="modal-footer">
                     <div class="hstack gap-2 justify-content-end">
                         <button type="button" class="btn btn-light" data-bs-dismiss="modal">Close</button>
                         <button type="submit" class="btn btn-success" id="labelbtn">Add Customer</button>
                     </div>
                 </div>
             </form>
         </div>
     </div>
 </div>