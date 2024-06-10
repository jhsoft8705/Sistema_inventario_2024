<div class="modal fade" id="modal_mantenimiento" tabindex="-1" aria-labelledby="label_title" aria-hidden="true"
    data-bs-backdrop="static" data-bs-keyboard="false">
    <div class="modal-dialog modal-dialog-centered modal-xl">
        <!-- Agrega la clase modal-lg aquí -->
        <div class="modal-content">
            <div class="modal-header bg-light p-3">
                <h5 class="modal-title" id="label_title"></h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"
                    id="close-modal"></button>
            </div>
            <form id="form_mantenimiento" class="row g-3 needs-validation" method="post" enctype="multipart/form-data">
                <div class="modal-body">
                    <div class="row">


                        <input hidden type="number" id="almacen_id" name="almacen_id" class="form-control" />

                        <div class="col-md-6">
                            <div class="mb-3">
                                <label for="codigo" class="form-label">Código</label>
                                <div class="input-group has-validation">
                                    <input type="text" id="codigo" name="codigo" class="form-control"
                                        placeholder="Ingresar código" aria-describedby="codigo" />
                                    <div id="codigo_error" class="invalid-feedback">
                                        Por favor ingresar código
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="mb-3">
                                <label for="nombre" class="form-label">Nombre</label>
                                <div class="input-group has-validation">
                                    <input type="text" id="nombre" name="nombre" class="form-control"
                                        placeholder="Ingresar nombre" aria-describedby="nombre" />
                                    <div id="nombre_error" class="invalid-feedback">
                                        Por favor ingresar nombre
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-8">
                            <div class="mb-3">
                                <label for="descripcion" class="form-label">Descripción</label>
                                <div class="input-group has-validation">
                                    <input type="text" id="descripcion" name="descripcion" class="form-control"
                                        placeholder="Ingresar descripción" aria-describedby="descripcion" />
                                    <div id="descripcion_error" class="invalid-feedback">
                                        Por favor ingresar descripción
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-4">
                            <div class="mb-3">
                                <label for="tipo" class="form-label">Tipo</label>
                                <div class="input-group has-validation">
                                <select class="form-control" name="tipo" id="tipo"
                                        aria-describedby="tipo">
                                        <option value="">Seleccionar</option>
                                        <option value="Equipos">Equipos</option>
                                        <option value="Herramientas">Herramientas</option>
                                    </select>
                                    <div id="tipo_error" class="invalid-feedback">
                                        Por favor ingresar tipo
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-lg-3 col-md-4">
                            <div class="mb-3">
                                <label for="ubicacion_id" class="form-label">Ubicación</label>
                                <div class="input-group has-validation">
                                <select class="form-control" name="ubicacion_id" id="ubicacion_id"
                                        aria-describedby="ubicacion_id">
                                        <option value="">Seleccionar</option> 
                                    </select>
                                    <div id="ubicacion_error" class="invalid-feedback">
                                        Por favor ingresar ubicación
                                    </div>
                                </div>
                            </div>
                        </div>
                        

                        <div class="col-lg-4 col-md-4">
                            <div class="mb-3">
                                <label for="categoria_id" class="form-label">Categoría</label>
                                <div class="input-group has-validation">
                                    <select class="form-control" name="categoria_id" id="categoria_id"
                                        aria-describedby="categoria_id">
                                        <option value="">Seleccionar</option>
                                        <option value="1">Alimentos</option>
                                        <option value="2">Otro</option>
                                    </select>
                                    <div id="categoria_error" class="invalid-feedback">
                                        Por favor seleccionar categoría
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-5 col-md-4">
                            <div class="mb-3">
                                <label for="proveedor_id" class="form-label">Proveedor</label>
                                <div class="input-group has-validation">

                                    <select class="form-control" name="proveedor_id" id="proveedor_id"
                                        aria-describedby="proveedor_id" class="form-control"
                                        placeholder="Ingresar proveedor">
                                        <option value="">Seleccionar</option>
                                        <option value="1">Alimentos</option>
                                        <option value="2">Otro</option>
                                    </select>

                                    <div id="proveedor_error" class="invalid-feedback">
                                        Por favor ingresar proveedor
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-lg-3 col-md-4">
                            <div class="mb-3">
                                <label for="marca" class="form-label">Marca</label>
                                <div class="input-group has-validation">
                                    <input type="text" id="marca" name="marca" class="form-control"
                                        placeholder="Ingresar marca" aria-describedby="marca" />
                                    <div id="marca_error" class="invalid-feedback">
                                        Por favor ingresar marca
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-3 col-md-4">
                            <div class="mb-3">
                                <label for="modelo" class="form-label">Modelo</label>
                                <div class="input-group has-validation">
                                    <input type="text" id="modelo" name="modelo" class="form-control"
                                        placeholder="Ingresar modelo" aria-describedby="modelo" />
                                    <div id="modelo_error" class="invalid-feedback">
                                        Por favor ingresar modelo
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-3 col-md-4">
                            <div class="mb-3">
                                <label for="serie" class="form-label">Serie</label>
                                <div class="input-group has-validation">
                                    <input type="text" id="serie" name="serie" class="form-control"
                                        placeholder="Ingresar serie" aria-describedby="serie" />
                                    <div id="serie_error" class="invalid-feedback">
                                        Por favor ingresar serie
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-4">
                            <div class="mb-3">
                                <label for="color" class="form-label">Color</label>
                                <div class="input-group has-validation">
                                    <input type="text" id="color" name="color" class="form-control"
                                        placeholder="Ingresar color" aria-describedby="color" />
                                    <div id="color_error" class="invalid-feedback">
                                        Por favor ingresar color
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>


                    <div class="row">
                        <div class="col-lg-3 col-md-4">
                            <div class="mb-3">
                                <label for="unidad_medida_id" class="form-label">Unidad de Medida</label>
                                <div class="input-group has-validation">
                                    <select class="form-control" name="unidad_medida_id" id="unidad_medida_id"
                                        aria-describedby="unidad_medida_id">
                                        <option value="">Seleccionar</option>
                                        <option value="1">Alimentos</option>
                                        <option value="2">Otro</option>
                                    </select>
                                    <div id="unidad_medida_error" class="invalid-feedback">
                                        Por favor ingresar unidad de medida
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-3 col-md-4">
                            <div class="mb-3">
                                <label for="medida" class="form-label">Medida</label>
                                <div class="input-group has-validation">
                                    <input type="text" id="medida" name="medida" class="form-control"
                                        placeholder="Ingresar medida" aria-describedby="medida" />
                                    <div id="medida_error" class="invalid-feedback">
                                        Por favor ingresar medida
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-3 col-md-4">
                            <div class="mb-3">
                                <label for="cantidad" class="form-label">Cantidad</label>
                                <div class="input-group has-validation">
                                    <input type="number" id="cantidad" name="cantidad" class="form-control"
                                        placeholder="Ingresar cantidad" aria-describedby="cantidad" />
                                    <div id="cantidad_error" class="invalid-feedback">
                                        Por favor ingresar cantidad
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-4">
                            <div class="mb-3">
                                <label for="precio_unitario" class="form-label">Precio Unitario</label>
                                <div class="input-group has-validation">
                                    <input type="text" id="precio_unitario" name="precio_unitario" class="form-control"
                                        placeholder="Ingresar precio unit" aria-describedby="precio_unitario" />
                                    <div id="precio_unitario_error" class="invalid-feedback">
                                        Por favor ingresar precio unitario
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>



                    <div class="row">
                        <div class="col-lg-2 col-md-4">
                            <div class="mb-3">
                                <label for="fecha_adquisicion" class="form-label">Fecha de Adquisición</label>
                                <div class="input-group has-validation">
                                    <input type="date" id="fecha_adquisicion" name="fecha_adquisicion"
                                        class="form-control" aria-describedby="fecha_adquisicion" />
                                    <div id="fecha_adquisicion_error" class="invalid-feedback">
                                        Por favor ingresar fecha de adquisición
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-4 col-md-4">
                            <div class="mb-3">
                                <label for="adjunto" class="form-label">Adjunto</label>
                                <div class="input-group has-validation">
                                    <input type="file" id="adjunto" name="adjunto" class="form-control"
                                        aria-describedby="adjunto" />
                                    <div id="adjunto_error" class="invalid-feedback">
                                        Por favor adjuntar archivo
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-2 col-md-4">
                            <div class="mb-3">
                                <label for="estado_equipo" class="form-label">Estado</label>
                                <div class="input-group has-validation">
                                    <select class="form-control" name="estado_equipo" id="estado_equipo"
                                        aria-describedby="estado_equipo">
                                        <option value="">Seleccionar</option>
                                        <option value="Nuevo">Nuevo</option> 
                                        <option value="Regular">Regular</option>  
                                    </select>
                                    <div id="estado_equipo_error" class="invalid-feedback">
                                        Por favor ingresar estado del equipo
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-4 col-md-4">
                            <div class="mb-3">
                                <label for="nota" class="form-label">Nota</label>
                                <textarea class="form-control" id="nota" name="nota" rows="3"
                                    placeholder="Ingresar nota"></textarea>
                                <div id="nota_error" class="invalid-feedback">
                                    Message
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <div class="hstack gap-2 justify-content-end">
                        <button type="button" class="btn btn-light" data-bs-dismiss="modal">Salir</button>
                        <button type="submit" class="btn btn-success" id="labelbtn">Add Customer</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>