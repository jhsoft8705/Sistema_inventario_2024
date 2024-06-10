DELIMITER //
CREATE PROCEDURE listar_periodos()
BEGIN
    SELECT * FROM Periodos
    WHERE Estado IN ('Activo', 'Inactivo');
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE listar_periodo_id(IN periodo_id INT)
BEGIN
    SELECT * FROM Periodos
    WHERE Id = periodo_id;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE registrar_periodo(
    IN p_nombre VARCHAR(100),
    IN p_fecha_inicio DATE,
    IN p_fecha_fin DATE,
    IN p_descripcion VARCHAR(255)
)
BEGIN
    INSERT INTO Periodos (
        Nombre, 
        Fecha_Inicio,
        Fecha_Fin,
        Descripcion
    )
    VALUES (
        p_nombre, 
        p_fecha_inicio,
        p_fecha_fin,
        p_descripcion
    );
END //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE actualizar_periodo(
    IN periodo_id INT, 
    IN p_nombre VARCHAR(100),
    IN p_fecha_inicio DATE,
    IN p_fecha_fin DATE,
    IN p_descripcion VARCHAR(255)
)
BEGIN
    UPDATE Periodos
    SET
        Nombre = p_nombre,
        Fecha_Inicio = p_fecha_inicio,
        Fecha_Fin = p_fecha_fin,
        Descripcion = p_descripcion,
        FechaActualizacion = CURRENT_TIMESTAMP
    WHERE Id = periodo_id;
END //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE eliminar_periodo(IN periodo_id INT)
BEGIN
    UPDATE Periodos 
    SET Estado = 'Eliminado'
    WHERE Id = periodo_id;
END //
DELIMITER ;
