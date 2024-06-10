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
                             <!--<span class="input-group-d" id="nombre">@</span>--->
                             <input hidden type="text" id="taller_id" name="taller_id" class="form-control"
                                 placeholder="taller_id" aria-describedby="taller_id" />
                             <div class="invalid-feedback">
                                 Por favor ingresar
                             </div>
                         </div>
                     </div>


                     <div class="mb-3">
                         <label for="nombre" class="form-label">Taller</label>
                         <div class="input-group has-validation">
                             <!--<span class="input-group-d" id="nombre">@</span>--->
                             <input type="text" id="nombre" name="nombre" class="form-control"
                                 placeholder="Ingresar taller" aria-describedby="nombre" />
                             <div id="nombre_error" class="invalid-feedback">
                                 Por favor ingresar nombre
                             </div>
                         </div>
                     </div>

                     <div class="mb-3">
                         <label for="descripcion" class="form-label">Descripción</label>
                         <textarea class="form-control" id="descripcion" name="descripcion" rows="3"
                             placeholder="Ingresar descripción"></textarea>
                         <div id="descripcion_error" class="invalid-feedback">
                             Message
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