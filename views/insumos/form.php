 <div class="modal fade" id="modal_mantenimiento" tabindex="-1" aria-labelledby="label_title" aria-hidden="true">
     <div class="modal-dialog modal-dialog-centered modal-xl">
         <div class="modal-content">
             <div class="modal-header bg-light p-3">
                 <h5 class="modal-title" id="label_title"></h5>
                 <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"
                     id="close-modal"></button>
             </div>
             <form id="form_mantenimiento" class="row g-3 needs-validation" method="post">
                 <div class="modal-body">
                     <input hidden type="number" id="insumo_id" name="insumo_id" class="form-control" />
                     <div class="row">
                         <div class="col-lg-4 col-md-4">
                             <div class="mb-3">
                                 <label for="codigo" class="form-label">Código Modular</label>
                                 <div class="input-group has-validation">
                                     <input type="text" id="codigo" name="p_co_modular" class="form-control"
                                         placeholder="Ingresar cód modular" aria-describedby="codigo" required />
                                     <div id="codigo_error" class="invalid-feedback">
                                         Por favor ingresar código modular
                                     </div>
                                 </div>
                             </div>
                         </div>
                         <div class="col-lg-4 col-md-4">
                             <div class="mb-3">
                                 <label for="nombre" class="form-label">Nombre</label>
                                 <div class="input-group has-validation">
                                     <input type="text" id="nombre" name="p_nombre" class="form-control"
                                         placeholder="Ingresar nombre" aria-describedby="nombre" required />
                                     <div id="nombre_error" class="invalid-feedback">
                                         Por favor ingresar nombre
                                     </div>
                                 </div>
                             </div>
                         </div>
                         <div class="col-lg-4 col-md-4">
                             <div class="mb-3">
                                 <label for="descripcion" class="form-label">Descripción</label>
                                 <div class="input-group has-validation">
                                     <input type="text" id="descripcion" name="p_descripcion" class="form-control"
                                         placeholder="Ingresar descripción" aria-describedby="descripcion" required />
                                     <div id="descripcion_error" class="invalid-feedback">
                                         Por favor ingresar descripción
                                     </div>
                                 </div>
                             </div>
                         </div>
                     </div>
                     <div class="row">
                         <div class="col-lg-4 col-md-4">
                             <div class="mb-3">
                                 <label for="categoria_id" class="form-label">Categoría</label>
                                 <div class="input-group has-validation">
                                     <select class="form-control" name="p_categoria_id" id="categoria_id"
                                         aria-describedby="categoria_id" required>
                                         <option value="">Seleccionar</option>
                                         <!-- Options will be dynamically populated -->
                                     </select>
                                     <div id="categoria_error" class="invalid-feedback">
                                         Por favor seleccionar categoría
                                     </div>
                                 </div>
                             </div>
                         </div>
                         <div class="col-lg-4 col-md-4">
                             <div class="mb-3">
                                 <label for="proveedor_id" class="form-label">Proveedor</label>
                                 <div class="input-group has-validation">
                                     <select class="form-control" name="p_proveedor_id" id="proveedor_id"
                                         aria-describedby="proveedor_id" required>
                                         <option value="">Seleccionar</option>
                                         <!-- Options will be dynamically populated -->
                                     </select>
                                     <div id="proveedor_error" class="invalid-feedback">
                                         Por favor ingresar proveedor
                                     </div>
                                 </div>
                             </div>
                         </div>
                         <div class="col-lg-4 col-md-4">
                             <div class="mb-3">
                                 <label for="marca" class="form-label">Marca</label>
                                 <div class="input-group has-validation">
                                     <input type="text" id="marca" name="p_marca" class="form-control"
                                         placeholder="Ingresar marca" aria-describedby="marca" required />
                                     <div id="marca_error" class="invalid-feedback">
                                         Por favor ingresar marca
                                     </div>
                                 </div>
                             </div>
                         </div>
                     </div>
                     <div class="row"> 
                         <div class="col-lg-4 col-md-4">
                             <div class="mb-3">
                                 <label for="unidad_medida_id" class="form-label">Unidad de Medida</label>
                                 <div class="input-group has-validation">
                                     <select class="form-control" name="p_unidadmedida_id" id="unidad_medida_id"
                                         aria-describedby="unidad_medida_id" required>
                                         <option value="">Seleccionar</option>
                                         <!-- Options will be dynamically populated -->
                                     </select>
                                     <div id="unidad_medida_error" class="invalid-feedback">
                                         Por favor ingresar unidad de medida
                                     </div>
                                 </div>
                             </div>
                         </div>
                         <div class="col-lg-4 col-md-4">
                             <div class="mb-3">
                                 <label for="medida" class="form-label">Medida</label>
                                 <div class="input-group has-validation">
                                     <input type="text" id="medida" name="p_medida" class="form-control"
                                         placeholder="Ingresar medida" aria-describedby="medida" required />
                                     <div id="medida_error" class="invalid-feedback">
                                         Por favor ingresar medida
                                     </div>
                                 </div>
                             </div>
                         </div>
                         <div class="col-lg-4 col-md-4">
                             <div class="mb-3">
                                 <label for="cantidad" class="form-label">Cantidad</label>
                                 <div class="input-group has-validation">
                                     <input type="number" id="cantidad" name="p_cantidad" class="form-control"
                                         placeholder="Ingresar cantidad" aria-describedby="cantidad" required />
                                     <div id="cantidad_error" class="invalid-feedback">
                                         Por favor ingresar cantidad
                                     </div>
                                 </div>
                             </div>
                         </div>
                         <div class="col-lg-4 col-md-4">
                             <div class="mb-3">
                                 <label for="precio_unitario" class="form-label">Precio Unitario</label>
                                 <div class="input-group has-validation">
                                     <input type="text" id="precio_unitario" name="p_precio_unitario"
                                         class="form-control" placeholder="Ingresar precio unitario"
                                         aria-describedby="precio_unitario" required />
                                     <div id="precio_unitario_error" class="invalid-feedback">
                                         Por favor ingresar precio unitario
                                     </div>
                                 </div>
                             </div>
                         </div>
                         <div class="col-lg-4 col-md-6">
                             <div class="mb-3">
                                 <label for="fecha_adquisicion" class="form-label">Fecha de Adquisición</label>
                                 <div class="input-group has-validation">
                                     <input type="date" id="fecha_adquisicion" name="p_fecha_adquisicion"
                                         class="form-control" aria-describedby="fecha_adquisicion" required />
                                     <div id="fecha_adquisicion_error" class="invalid-feedback">
                                         Por favor ingresar fecha de adquisición
                                     </div>
                                 </div>
                             </div>
                         </div>
                         <div class="col-lg-4 col-md-6">
                             <div class="mb-3">
                                 <label for="estado_insumo" class="form-label">Estado del Insumo</label>
                                 <div class="input-group has-validation">
                                     <select class="form-control" name="p_estado_insumo" id="estado_insumo"
                                         aria-describedby="estado_insumo" required>
                                         <option value="">Seleccionar</option>
                                         <option value="Nuevo">Nuevo</option>
                                         <option value="Regular">Regular</option>
                                         <option value="Viejo">Viejo</option>
                                     </select>
                                     <div id="estado_insumo_error" class="invalid-feedback">
                                         Por favor ingresar estado del insumo
                                     </div>
                                 </div>
                             </div>
                         </div>
                     </div>
                     <div class="row">
                         <div class="col-md-12">
                             <div class="mb-3">
                                 <label for="nota" class="form-label">Observación</label>
                                 <div class="input-group has-validation">
                                     <textarea id="nota" name="p_nota" class="form-control" placeholder="Ingresar nota"
                                         aria-describedby="nota"></textarea>
                                     <div id="nota_error" class="invalid-feedback">
                                         Por favor ingresar nota
                                     </div>
                                 </div>
                             </div>
                         </div>
                     </div>
                     <div class="modal-footer">
                         <div class="hstack gap-2 justify-content-end">
                             <button type="button" class="btn btn-light" data-bs-dismiss="modal">Close</button>
                             <button type="submit" class="btn btn-success" id="labelbtn">Add Insumo</button>
                         </div>
                     </div>
                 </div>
             </form> 
         </div>
     </div>
 </div>