/*TODO: SP Listar proveedores*/
DELIMITER //
CREATE PROCEDURE listar_proveedores()
BEGIN
    SELECT 
        P.Id,
        P.Tipo_Documento,
        P.NumeroDocumento,
        P.P_Nombres,
        P.P_Apellidos,
        P.Telefono,
        P.Direccion,
        C.Id AS Id_Cate,
        C.NombresCategoria,
        P.Notas,
        P.Estado,
        P.FechaRegistro,
        P.FechaActualizacion
    FROM 
        Proveedores AS P
    INNER JOIN 
        Categorias AS C ON C.Id = P.Id_Cate
    WHERE 
        P.Estado IN ('Activo');
END //
DELIMITER ;


/*TODO: SP Listar proveedor por ID*/
DELIMITER //
CREATE PROCEDURE listar_proveedor_id(IN proveedor_id INT)
BEGIN
    SELECT 
        P.Id,
        P.Tipo_Documento,
        P.NumeroDocumento,
        P.P_Nombres,
        P.P_Apellidos,
        P.Telefono,
        P.Direccion,
        C.Id AS Id_Cate,
        C.NombresCategoria,
        P.Notas,
        P.Estado,
        P.FechaRegistro,
        P.FechaActualizacion
    FROM 
        Proveedores AS P
    INNER JOIN 
        Categorias AS C ON C.Id = P.Id_Cate
    WHERE 
        P.Id = proveedor_id;
END //
DELIMITER ;


/*TODO: SP Registrar proveedor*/ 
DELIMITER //
CREATE PROCEDURE registrar_proveedor(
    IN p_tipo_documento ENUM('Dni', 'Ruc', 'Pasaporte'),
    IN p_numero_documento VARCHAR(20),
    IN p_nombres VARCHAR(100),
    IN p_apellidos VARCHAR(100),
    IN p_telefono VARCHAR(15),
    IN p_direccion VARCHAR(100),
    IN p_id_cate INT,
    IN p_notas VARCHAR(250)
)
BEGIN
    INSERT INTO Proveedores (
        Tipo_Documento, 
        NumeroDocumento,
        P_Nombres,
        P_Apellidos,
        Telefono,
        Direccion,
        Id_Cate,
        Notas
    )
    VALUES (
        p_tipo_documento, 
        p_numero_documento,
        p_nombres,
        p_apellidos,
        p_telefono,
        p_direccion,
        p_id_cate,
        p_notas
    );
END //
DELIMITER ;

/*TODO: SP Actualizar proveedor*/  
DELIMITER //
CREATE PROCEDURE actualizar_proveedor(
    IN proveedor_id INT, 
    IN p_tipo_documento ENUM('Dni', 'Ruc', 'Pasaporte'),
    IN p_numero_documento VARCHAR(20),
    IN p_nombres VARCHAR(100),
    IN p_apellidos VARCHAR(100),
    IN p_telefono VARCHAR(15),
    IN p_direccion VARCHAR(100),
    IN p_id_cate INT,
    IN p_notas VARCHAR(250) 
)
BEGIN
    UPDATE Proveedores
    SET
        Tipo_Documento = p_tipo_documento,
        NumeroDocumento = p_numero_documento,
        P_Nombres = p_nombres,
        P_Apellidos = p_apellidos,
        Telefono = p_telefono,
        Direccion = p_direccion,
        Id_Cate = p_id_cate,
        Notas = p_notas, 
        FechaActualizacion = CURRENT_TIMESTAMP
    WHERE Id = proveedor_id;
END //
DELIMITER ;

/*TODO: SP Eliminar proveedor*/   
DELIMITER //
CREATE PROCEDURE eliminar_proveedor(IN proveedor_id INT)
BEGIN
    UPDATE Proveedores SET Estado = 'Eliminado' WHERE Id = proveedor_id;
END // 
DELIMITER ;
