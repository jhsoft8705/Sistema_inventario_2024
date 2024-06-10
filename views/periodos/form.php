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
                             <input hidden type="text" id="periodo_id" name="periodo_id" class="form-control"
                                 placeholder="periodo_id" aria-describedby="periodo_id" />
                             <div class="invalid-feedback">
                                 Por favor ingresar
                             </div>
                         </div>
                     </div>

                     <div class="mb-3">
                         <label for="nombre" class="form-label">Nombre del Periodo</label>
                         <div class="input-group has-validation">
                             <input type="text" id="nombre" name="nombre" class="form-control"
                                 placeholder="Ingresar nombre del periodo" aria-describedby="nombre" />
                             <div id="nombre_error" class="invalid-feedback">
                                 Por favor ingresar nombre del periodo
                             </div>
                         </div>
                     </div>

                     <div class="mb-3">
                         <label for="fecha_inicio" class="form-label">Fecha de Inicio</label>
                         <div class="input-group has-validation">
                             <input type="date" id="fecha_inicio" name="fecha_inicio" class="form-control"
                                 placeholder="Ingresar fecha de inicio" aria-describedby="fecha_inicio" />
                             <div id="fecha_inicio_error" class="invalid-feedback">
                                 Por favor ingresar fecha de inicio
                             </div>
                         </div>
                     </div>

                     <div class="mb-3">
                         <label for="fecha_fin" class="form-label">Fecha de Fin</label>
                         <div class="input-group has-validation">
                             <input type="date" id="fecha_fin" name="fecha_fin" class="form-control"
                                 placeholder="Ingresar fecha de fin" aria-describedby="fecha_fin" />
                             <div id="fecha_fin_error" class="invalid-feedback">
                                 Por favor ingresar fecha de fin
                             </div>
                         </div>
                     </div>

                     <div class="mb-3">
                         <label for="descripcion" class="form-label">Descripción</label>
                         <textarea class="form-control" id="descripcion" name="descripcion" rows="3"
                             placeholder="Ingresar descripción"></textarea>
                         <div id="descripcion_error" class="invalid-feedback">
                             Por favor ingresar descripción
                         </div>
                     </div>

                 </div>
                 <div class="modal-footer">
                     <div class="hstack gap-2 justify-content-end">
                         <button type="button" class="btn btn-light" data-bs-dismiss="modal">Close</button>
                         <button type="submit" class="btn btn-success" id="labelbtn">Guardar Periodo</button>
                     </div>
                 </div>
             </form>

         </div>
     </div>
 </div>