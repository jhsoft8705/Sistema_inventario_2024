

/*Cod Autoincrementable*/
DELIMITER // 
CREATE TRIGGER antes_insert_equipos
BEFORE INSERT ON Equipos
FOR EACH ROW
BEGIN
    DECLARE last_id INT;
    DECLARE new_code VARCHAR(200);

    -- Obtenemos el último Id insertado
    SELECT IFNULL(MAX(Id), 0) INTO last_id FROM Equipos;

    -- Generamos el nuevo código basado en el último Id
    SET new_code = CONCAT('EQ-', LPAD(last_id + 1, 5, '0'));

    -- Asignamos el nuevo código al campo Codigo del nuevo registro
    SET NEW.Codigo = new_code;
END// 
DELIMITER ;

DELIMITER //
CREATE PROCEDURE listar_equipos()
BEGIN
    SELECT 
        e.Id,
        e.Codigo,
        e.Co_Modular,
        e.Nombre,
        e.Descripcion,
        c.NombresCategoria AS Categoria,
        p.P_Nombres AS ProveedorNombre,
        p.P_Apellidos AS ProveedorApellido,
        e.Marca,
        e.Modelo,
        e.Serie,
        e.Color,
        u.NombresUnd AS UnidadMedida,
        e.Medida,
        e.Cantidad,
        e.Precio_Unitario,
        e.Total,
        e.Fecha_Adquision,
        e.Estado_Equipo,
        e.Nota,
        e.Estado,
        e.FechaRegistro,
        e.FechaActualizacion
    FROM 
        Equipos e
    JOIN 
        Categorias c ON e.Categoria_id = c.Id
    JOIN 
        Proveedores p ON e.Proveedor_id = p.Id
    JOIN 
        UnidadMedida u ON e.UnidadMedida_id = u.Id
    WHERE 
        e.Estado IN ('Activo');
END //
DELIMITER ;


/*TODO: SP Listar equipo por ID*/
DELIMITER //
CREATE PROCEDURE listar_equipo_id(IN equipo_id INT)
BEGIN
    SELECT * FROM Equipos  
    WHERE Id = equipo_id;
END //
DELIMITER ;

 /*TODO: SP Registrar equipo*/ 
DELIMITER //
CREATE PROCEDURE registrar_equipo( 
    IN p_co_modular VARCHAR(200), 
    IN p_nombre VARCHAR(150),
    IN p_descripcion VARCHAR(250),
    IN p_categoria_id INT,
    IN p_proveedor_id INT,
    IN p_marca VARCHAR(50),
    IN p_modelo VARCHAR(50),
    IN p_serie VARCHAR(100),
    IN p_color VARCHAR(30),
    IN p_unidadmedida_id INT,
    IN p_medida VARCHAR(50),
    IN p_cantidad INT,
    IN p_precio_unitario DECIMAL(10, 2),
    IN p_fecha_adquisicion DATE,
    IN p_estado_equipo ENUM('Nuevo', 'Regular', 'Viejo'),
    IN p_nota VARCHAR(250)
)
BEGIN
    INSERT INTO Equipos ( 
        Co_Modular,
        Nombre, 
        Descripcion,
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
        Estado_Equipo,
        Nota,
        FechaRegistro
    )
    VALUES (
        p_co_modular,
        p_nombre, 
        p_descripcion,
        p_categoria_id,
        p_proveedor_id,
        p_marca,
        p_modelo,
        p_serie,
        p_color,
        p_unidadmedida_id,
        p_medida,
        p_cantidad,
        p_precio_unitario,
        p_cantidad * p_precio_unitario,
        p_fecha_adquisicion,
        p_estado_equipo,
        p_nota,
        NOW()
    );
END //
DELIMITER ;

/*TODO: SP Actualizar equipo*/  
DELIMITER //
CREATE PROCEDURE actualizar_equipo(
    IN equipo_id INT, 
    IN p_co_modular VARCHAR(200), 
    IN p_nombre VARCHAR(150),
    IN p_descripcion VARCHAR(250),
    IN p_categoria_id INT,
    IN p_proveedor_id INT,
    IN p_marca VARCHAR(50),
    IN p_modelo VARCHAR(50),
    IN p_serie VARCHAR(100),
    IN p_color VARCHAR(30),
    IN p_unidadmedida_id INT,
    IN p_medida VARCHAR(50),
    IN p_cantidad INT,
    IN p_precio_unitario DECIMAL(10, 2),
    IN p_fecha_adquisicion DATE,
    IN p_estado_equipo ENUM('Nuevo', 'Regular', 'Viejo'),
    IN p_nota VARCHAR(250)
)
BEGIN
    UPDATE Equipos
    SET
        Co_Modular = p_co_modular,
        Nombre = p_nombre, 
        Descripcion = p_descripcion,
        Categoria_id = p_categoria_id,
        Proveedor_id = p_proveedor_id,
        Marca = p_marca,
        Modelo = p_modelo,
        Serie = p_serie,
        Color = p_color,
        UnidadMedida_id = p_unidadmedida_id,
        Medida = p_medida,
        Cantidad = p_cantidad,
        Precio_Unitario = p_precio_unitario,
        Total = p_cantidad * p_precio_unitario,
        Fecha_Adquision = p_fecha_adquisicion,
        Estado_Equipo = p_estado_equipo,
        Nota = p_nota,
        FechaActualizacion = CURRENT_TIMESTAMP
    WHERE Id = equipo_id;
END //
DELIMITER ;


/*TODO: SP Eliminar equipo*/   
DELIMITER //
CREATE PROCEDURE eliminar_equipo(IN equipo_id INT)
BEGIN
    UPDATE Equipos 
    SET Estado = 'Eliminado' 
    WHERE Id = equipo_id;
END // 
DELIMITER ;
