/*TODO:SP Listar almacen*/
DELIMITER //
CREATE PROCEDURE listar_almacen()
BEGIN
    SELECT 
        e.Id,
        e.Codigo,
        e.Nombre,
        e.Descripcion,
        e.Tipo,
        u.U_Nombre AS Ubicacion,
        c.NombresCategoria AS Categoria,
        p.P_Nombres AS Proveedor,
        e.Marca,
        e.Modelo,
        e.Serie,
        e.Color,
        um.NombresUnd AS UnidadMedida, 
        e.Medida,
        e.Cantidad,
        e.Precio_Unitario,
        e.Total,
        e.Fecha_Adquision,
        e.Adjunto,
        e.Nota,
        e.Fase,
        e.EstadoEquipo,
        e.Estado,
        e.FechaRegistro,
        e.FechaActualizacion
    FROM 
        Almacen e
    INNER JOIN 
        Ubicaciones u ON e.Ubicacion_id = u.Id
    INNER JOIN 
        Categorias c ON e.Categoria_id = c.Id
    INNER JOIN 
        Proveedores p ON e.Proveedor_id = p.Id
    INNER JOIN 
        UnidadMedida um ON e.UnidadMedida_id = um.Id
    WHERE 
        e.Estado IN ('Activo', 'Inactivo');
END //
DELIMITER ;

/*TODO:SP Listar almacen x id*/
DELIMITER //
CREATE PROCEDURE listar_almacen_id(IN almacen_id INT)
BEGIN
    SELECT 
        e.Id,
        e.Codigo,
        e.Nombre,
        e.Descripcion,
        e.Tipo,
        u.Id AS Id_ubicacion,
        u.U_Nombre AS Ubicacion,
        c.Id AS Id_Categoria,
        c.NombresCategoria AS Categoria,
        p.Id AS Id_Proveedor,
        p.P_Nombres AS Proveedor,
        e.Marca,
        e.Modelo,
        e.Serie,
        e.Color,
        um.Id AS Id_Unidad,
        um.NombresUnd AS UnidadMedida,
        e.Medida,
        e.Cantidad,
        e.Precio_Unitario,
        e.Total,
        e.Fecha_Adquision,
        e.Adjunto,
        e.Nota,
        e.Fase,
        e.EstadoEquipo,
        e.Estado,
        e.FechaRegistro,
        e.FechaActualizacion
    FROM 
        Almacen e
    INNER JOIN 
        Ubicaciones u ON e.Ubicacion_id = u.Id
    INNER JOIN 
        Categorias c ON e.Categoria_id = c.Id
    INNER JOIN 
        Proveedores p ON e.Proveedor_id = p.Id
    INNER JOIN 
        UnidadMedida um ON e.UnidadMedida_id = um.Id
    WHERE 
        e.Id = almacen_id;
END //
DELIMITER ;


/*TODO:SP Registrar almacen*/ 
DELIMITER //
CREATE PROCEDURE registrar_almacen(
    IN p_codigo VARCHAR(200),
    IN p_nombre VARCHAR(150),
    IN p_descripcion VARCHAR(250),
    IN p_tipo VARCHAR(20),
    IN p_ubicacion_id INT,
    IN p_categoria_id INT,
    IN p_proveedor_id INT,
    IN p_marca VARCHAR(50),
    IN p_modelo VARCHAR(50),
    IN p_serie VARCHAR(100),
    IN p_color VARCHAR(30),
    IN p_unidad_medida_id INT,
    IN p_medida VARCHAR(50),
    IN p_cantidad INT,
    IN p_precio_unitario DECIMAL(10, 2),
    IN p_fecha_adquisicion DATE,
    IN p_adjunto VARCHAR(250),
    IN p_estado_equipo VARCHAR(15), 
    IN p_nota VARCHAR(250)
)
BEGIN
    INSERT INTO Almacen (
        Codigo, 
        Nombre, 
        Descripcion, 
        Tipo,
        Ubicacion_id, 
        Categoria_id, 
        Proveedor_id, 
        Marca, 
        Modelo, 
        Serie, 
        Color, 
        UnidadMedida_id, 
        Medida, 
        Cantidad, 
        Precio_Unitario, 
        Total, 
        Fecha_Adquision, 
        Adjunto,  
        EstadoEquipo, 
        Nota
    ) 
    VALUES (
        p_codigo, 
        p_nombre, 
        p_descripcion, 
        p_tipo,
        p_ubicacion_id, 
        p_categoria_id, 
        p_proveedor_id, 
        p_marca, 
        p_modelo, 
        p_serie, 
        p_color, 
        p_unidad_medida_id, 
        p_medida, 
        p_cantidad, 
        p_precio_unitario, 
        p_cantidad * p_precio_unitario, 
        p_fecha_adquisicion, 
        p_adjunto,  
        p_estado_equipo,
        p_nota
    );
END // 
DELIMITER ;




/*TODO:SP Actualizar almacen*/  
DELIMITER //
CREATE PROCEDURE actualizar_almacen(
    IN almacen_id INT, 
    IN p_codigo VARCHAR(200),
    IN p_nombre VARCHAR(150),
    IN p_descripcion VARCHAR(250),
    IN p_tipo VARCHAR(20),
    IN p_ubicacion_id INT,
    IN p_categoria_id INT,
    IN p_proveedor_id INT,
    IN p_marca VARCHAR(50),
    IN p_modelo VARCHAR(50),
    IN p_serie VARCHAR(100),
    IN p_color VARCHAR(30),
    IN p_unidad_medida_id INT,
    IN p_medida VARCHAR(50),
    IN p_cantidad INT,
    IN p_precio_unitario DECIMAL(10, 2),
    IN p_fecha_adquisicion DATE,
    IN p_adjunto VARCHAR(250),
    IN p_estado_equipo VARCHAR(15), 
    IN p_nota VARCHAR(250)
 )
BEGIN
    UPDATE Almacen
    SET
        Codigo = p_codigo, 
        Nombre = p_nombre, 
        Descripcion = p_descripcion, 
        Tipo = p_tipo,
        Ubicacion_id = p_ubicacion_id, 
        Categoria_id = p_categoria_id, 
        Proveedor_id = p_proveedor_id, 
        Marca = p_marca, 
        Modelo = p_modelo, 
        Serie = p_serie, 
        Color = p_color, 
        UnidadMedida_id = p_unidad_medida_id, 
        Medida = p_medida, 
        Cantidad = p_cantidad, 
        Precio_Unitario = p_precio_unitario, 
        Total = p_cantidad * p_precio_unitario, 
        Fecha_Adquision = p_fecha_adquisicion, 
        Adjunto = p_adjunto, 
        EstadoEquipo = p_estado_equipo,  
        Nota = p_nota, 
        FechaActualizacion = CURRENT_TIMESTAMP
    WHERE Id = almacen_id;
END //
DELIMITER ;
