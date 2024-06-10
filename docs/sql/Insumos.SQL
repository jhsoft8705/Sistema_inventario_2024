

/*Cod Autoincrementable*/
DELIMITER // 
CREATE TRIGGER antes_insert_insumos
BEFORE INSERT ON Insumos
FOR EACH ROW
BEGIN
    DECLARE last_id INT;
    DECLARE new_code VARCHAR(200);

    -- Obtenemos el último Id insertado
    SELECT IFNULL(MAX(Id), 0) INTO last_id FROM Insumos;

    -- Generamos el nuevo código basado en el último Id
    SET new_code = CONCAT('I-', LPAD(last_id + 1, 5, '0'));

    -- Asignamos el nuevo código al campo Codigo del nuevo registro
    SET NEW.Codigo = new_code;
END// 
DELIMITER ;


DELIMITER // 
CREATE PROCEDURE listar_insumos ()
BEGIN
    SELECT 
        i.Id,
        i.Codigo,
        i.Co_Modular,
        i.Nombre,
        i.Descripcion,
        c.NombresCategoria AS Categoria,
        p.P_Nombres AS ProveedorNombre,
        p.P_Apellidos AS ProveedorApellido,
        i.Marca, 
        u.NombresUnd AS UnidadMedida,
        i.Medida,
        i.Cantidad,
        i.Precio_Unitario,
        i.Total,
        i.Fecha_Adquision,
        i.Estado_Insumo,
        i.Nota,
        i.Estado,
        i.FechaRegistro,
        i.FechaActualizacion
    FROM 
        Insumos i
    JOIN 
        Categorias c ON i.Categoria_id = c.Id
    JOIN 
        Proveedores p ON i.Proveedor_id = p.Id
    JOIN 
        UnidadMedida u ON i.UnidadMedida_id = u.Id
    WHERE 
        i.Estado IN ('Activo');
END //

DELIMITER //

CREATE PROCEDURE listar_insumo_id(IN insumo_id INT)
BEGIN
    SELECT * FROM Insumos  
    WHERE Id = insumo_id;
END //

DELIMITER //

CREATE PROCEDURE registrar_Insumo( 
    IN p_co_modular VARCHAR(200), 
    IN p_nombre VARCHAR(150),
    IN p_descripcion VARCHAR(250),
    IN p_categoria_id INT,
    IN p_proveedor_id INT,
    IN p_marca VARCHAR(50), 
    IN p_unidadmedida_id INT,
    IN p_medida VARCHAR(50),
    IN p_cantidad INT,
    IN p_precio_unitario DECIMAL(10, 2),
    IN p_fecha_adquisicion DATE,
    IN p_estado_insumo VARCHAR(50),
    IN p_nota VARCHAR(250)
)
BEGIN
    INSERT INTO Insumos ( 
        Co_Modular,
        Nombre, 
        Descripcion,
        Categoria_id,
        Proveedor_id,
        Marca, 
        UnidadMedida_id,
        Medida,
        Cantidad,
        Precio_Unitario,
        Total,
        Fecha_Adquision,
        Estado_Insumo,
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
        p_unidadmedida_id,
        p_medida,
        p_cantidad,
        p_precio_unitario,
        p_cantidad * p_precio_unitario,
        p_fecha_adquisicion,
        p_estado_insumo,
        p_nota,
        NOW()
    );
END //

DELIMITER //

CREATE PROCEDURE actualizar_insumo(
    IN insumo_id INT, 
    IN p_co_modular VARCHAR(200), 
    IN p_nombre VARCHAR(150),
    IN p_descripcion VARCHAR(250),
    IN p_categoria_id INT,
    IN p_proveedor_id INT,
    IN p_marca VARCHAR(50), 
    IN p_unidadmedida_id INT,
    IN p_medida VARCHAR(50),
    IN p_cantidad INT,
    IN p_precio_unitario DECIMAL(10, 2),
    IN p_fecha_adquisicion DATE,
    IN p_estado_insumo VARCHAR(50),
    IN p_nota VARCHAR(250)
)
BEGIN
    UPDATE Insumos
    SET
        Co_Modular = p_co_modular,
        Nombre = p_nombre, 
        Descripcion = p_descripcion,
        Categoria_id = p_categoria_id,
        Proveedor_id = p_proveedor_id,
        Marca = p_marca, 
        UnidadMedida_id = p_unidadmedida_id,
        Medida = p_medida,
        Cantidad = p_cantidad,
        Precio_Unitario = p_precio_unitario,
        Total = p_cantidad * p_precio_unitario,
        Fecha_Adquision = p_fecha_adquisicion,
        Estado_Insumo = p_estado_insumo,
        Nota = p_nota,
        FechaActualizacion = CURRENT_TIMESTAMP
    WHERE Id = insumo_id;
END //

DELIMITER //

CREATE PROCEDURE eliminar_insumo(IN insumo_id INT)
BEGIN
    UPDATE Insumos 
    SET Estado = 'Eliminado' 
    WHERE Id = insumo_id;
END // 

DELIMITER ;
