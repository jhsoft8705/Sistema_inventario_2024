<div class="modal fade" id="modal_mantenimiento" tabindex="-1" aria-labelledby="label_title" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg">
        <!-- Agrega la clase modal-lg aquí -->
        <div class="modal-content">
            <div class="modal-header bg-light p-3">
                <h5 class="modal-title" id="label_title"></h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"
                    id="close-modal"></button>
            </div>
            <form id="form_mantenimiento" class="row g-3 needs-validation" method="post">
                <div class="modal-body">
                    <div class="row">

                    <input hidden type="number" id="proveedor_id" name="proveedor_id" class="form-control"  />

                        <div class="col-md-6">
                            <div class="mb-3"> 
                                <label for="tipo" class="form-label">Tipo Documento</label>
                                <div class="input-group has-validation">
                                    <select class="form-control" name="tipo" id="tipo" aria-describedby="tipo">
                                        <option value="">Seleccionar</option>
                                        <option value="Dni">Dni</option>
                                        <option value="Ruc">Ruc</option>
                                        <option value="Pasaporte">Pasaporte</option>
                                        <option value="otro">Otro</option> 
                                    </select>
                                    <div id="tipo_error" class="invalid-feedback">
                                        Muy mal
                                    </div>
                                </div>
                            </div>

                        </div>

                        <div class="col-md-6">
                            <div class="mb-3">

                                <label for="documento" class="form-label">Número Documento</label>
                                <div class="input-group has-validation">
                                    <input type="number" id="documento" name="documento" class="form-control"
                                        placeholder="Ingresar número de documento" aria-describedby="documento" />
                                    <div id="documento_error" class="invalid-feedback">
                                        Por favor ingresar tipo de documento
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>


                    <div class="row">
                        <div class="col-md-6">
                            <div class="mb-3">

                                <label for="nombre" class="form-label">Nombres</label>
                                <div class="input-group has-validation">
                                    <input type="text" id="nombre" name="nombre" class="form-control"
                                        placeholder="Ingresar nombres" aria-describedby="nombre" />
                                    <div id="nombre_error" class="invalid-feedback">
                                        Message
                                    </div>
                                </div>
                            </div>

                        </div>

                        <div class="col-md-6">
                            <div class="mb-3">

                                <label for="apellido" class="form-label">Apellidos</label>
                                <div class="input-group has-validation">
                                    <input type="text" id="apellido" name="apellido" class="form-control"
                                        placeholder="Ingresar apellidos" aria-describedby="apellido" />
                                    <div id="tipo_error" class="invalid-feedback">
                                        Message
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>

                    <div class="row">
                        <div class="col-md-6">
                            <div class="mb-3">

                                <label for="telefono" class="form-label">Teléfono</label>
                                <div class="input-group has-validation">
                                    <input type="number" id="telefono" name="telefono" class="form-control"
                                        placeholder="Ingresar teléfono" aria-describedby="telefono" />
                                    <div id="telefono_error" class="invalid-feedback">
                                        Message
                                    </div>
                                </div>
                            </div>

                        </div>

                        <div class="col-md-6">
                            <div class="mb-3">

                                <label for="direccion" class="form-label">Dirección</label>
                                <div class="input-group has-validation">
                                    <input type="text" id="direccion" name="direccion" class="form-control"
                                        placeholder="Ingresar dirección" aria-describedby="direccion" />
                                    <div id="tipo_error" class="invalid-feedback">
                                        Message
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>



                    <div class="row">
                        <div class="col-md-6">
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
                                        message
                                    </div>
                                </div>

                            </div>
                        </div>

                        <div class="col-md-6">

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