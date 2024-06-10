DELIMITER //

-- Procedimiento para listar ubicaciones activas e inactivas
CREATE PROCEDURE listar_ubicaciones()
BEGIN
    SELECT * FROM Ubicaciones
    WHERE Estado IN ('Activo', 'Inactivo');
END //
DELIMITER ;

DELIMITER //

-- Procedimiento para listar una ubicación por su ID
CREATE PROCEDURE listar_ubicacion_id(IN ubicacion_id INT)
BEGIN
    SELECT * FROM Ubicaciones
    WHERE Id = ubicacion_id;
END //
DELIMITER ;

DELIMITER //

-- Procedimiento para registrar una nueva ubicación
CREATE PROCEDURE registrar_ubicacion(
    IN u_nombre VARCHAR(100),
    IN u_descripcion VARCHAR(255)
)
BEGIN
    INSERT INTO Ubicaciones (
        U_Nombre, 
        U_Descripcion
    )
    VALUES (
        u_nombre, 
        u_descripcion
    );
END //
DELIMITER ;

DELIMITER //

-- Procedimiento para actualizar una ubicación existente
CREATE PROCEDURE actualizar_ubicacion(
    IN ubicacion_id INT, 
    IN u_nombre VARCHAR(100),
    IN u_descripcion VARCHAR(255)
)
BEGIN
    UPDATE Ubicaciones
    SET
        U_Nombre = u_nombre,
        U_Descripcion = u_descripcion,
        FechaActualizacion = CURRENT_TIMESTAMP
    WHERE Id = ubicacion_id;
END //
DELIMITER ;

DELIMITER //

-- Procedimiento para eliminar una ubicación (cambiar su estado a 'Eliminado')
CREATE PROCEDURE eliminar_ubicacion(IN ubicacion_id INT)
BEGIN
    UPDATE Ubicaciones 
    SET Estado = 'Eliminado'
    WHERE Id = ubicacion_id;
END //
DELIMITER ;
