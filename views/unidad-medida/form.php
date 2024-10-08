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
                             <input hidden type="text" id="unidad_id" name="unidad_id" class="form-control"
                                 placeholder="unidad_id" aria-describedby="unidad_id" />
                             <div class="invalid-feedback">
                                 Por favor ingresar nombre
                             </div>
                         </div>
                     </div>


                     <div class="mb-3">
                         <label for="nombre" class="form-label">Unidad de medida</label>
                         <div class="input-group has-validation">
                             <!--<span class="input-group-d" id="nombre">@</span>--->
                             <input type="text" id="nombre" name="nombre" class="form-control"
                                 placeholder="Ingresar unidad de medida" aria-describedby="nombre" />
                             <div id="nombre_error" class="invalid-feedback">
                                 Por favor ingresar nombre
                             </div>
                         </div>
                     </div>

                     <div class="mb-3">
                         <label for="abreviatura" class="form-label">Abreviatura</label>
                         <div class="input-group has-validation">
                             <input type="text" id="abreviatura" name="abreviatura" class="form-control"
                                 placeholder="Ingresar abreviatura" aria-describedby="abreviatura" />
                             <div id="abreviatura_error" class="invalid-feedback">
                                 Muy bien
                             </div>
                         </div>
                     </div> 

                     <div class="mb-3">
                         <label for="descripcion" class="form-label">Descripción</label>
                         <div class="input-group has-validation">
                             <input type="text" id="descripcion" name="descripcion" class="form-control"
                                 placeholder="Ingresar descripcion" aria-describedby="descripcion" />
                             <div id="descripcion_error" class="invalid-feedback">
                                 Muy bien
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