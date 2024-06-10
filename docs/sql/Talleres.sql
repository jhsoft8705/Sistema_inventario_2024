 /*TODO: SP Listar talleres*/
DELIMITER //
CREATE PROCEDURE listar_talleres()
BEGIN
    SELECT * FROM Talleres
    WHERE Estado IN ('Activo', 'Inactivo');
END //
DELIMITER ;


/*TODO: SP Listar taller por ID*/
DELIMITER //
CREATE PROCEDURE listar_taller_id(IN taller_id INT)
BEGIN
    SELECT * FROM Talleres  
    WHERE Id = taller_id;
END //
DELIMITER ;


/*TODO: SP Registrar taller*/ 
DELIMITER //
CREATE PROCEDURE registrar_taller(
    IN p_nombre VARCHAR(100),
    IN p_descripcion VARCHAR(255)
)
BEGIN
    INSERT INTO Talleres (
        T_Nombre, 
        T_Descripcion
    )
    VALUES (
        p_nombre, 
        p_descripcion
    );
END //
DELIMITER ;


/*TODO: SP Actualizar taller*/  
DELIMITER //
CREATE PROCEDURE actualizar_taller(
    IN taller_id INT, 
    IN p_nombre VARCHAR(100),
    IN p_descripcion VARCHAR(255)
)
BEGIN
    UPDATE Talleres
    SET
        T_Nombre = p_nombre,
        T_Descripcion = p_descripcion, 
        FechaActualizacion = CURRENT_TIMESTAMP
    WHERE Id = taller_id;
END //
DELIMITER ;


/*TODO: SP Eliminar taller*/   
DELIMITER //
CREATE PROCEDURE eliminar_taller(IN taller_id INT)
BEGIN
    UPDATE Talleres 
    SET Estado = 'Eliminado' 
    WHERE Id = taller_id;
END // 
DELIMITER ;
