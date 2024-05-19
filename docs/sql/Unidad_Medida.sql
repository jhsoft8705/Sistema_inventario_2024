/*TODO: SP Listar unidades de medida*/
DELIMITER //
CREATE PROCEDURE listar_unidades_medida()
BEGIN
    SELECT * FROM UnidadMedida 
    WHERE Estado IN ('Activo', 'Inactivo');
END //
DELIMITER ;


/*TODO: SP Listar unidad de medida por ID*/
DELIMITER //
CREATE PROCEDURE listar_unidad_medida_id(IN unidad_id INT)
BEGIN
    SELECT * FROM UnidadMedida  
    WHERE Id = unidad_id;
END //
DELIMITER ;


/*TODO: SP Registrar unidad de medida*/ 
DELIMITER //
CREATE PROCEDURE registrar_unidad_medida(
    IN p_nombres VARCHAR(100),
    IN p_abreviatura VARCHAR(10),
    IN p_descripcion VARCHAR(100)
)
BEGIN
    INSERT INTO UnidadMedida (
        NombresUnd, 
        AbreviaturaUnd,
        DescripcionUnd
    )
    VALUES (
        p_nombres, 
        p_abreviatura,
        p_descripcion
    );
END //
DELIMITER ;


/*TODO: SP Actualizar unidad de medida*/  
DELIMITER //
CREATE PROCEDURE actualizar_unidad_medida(
    IN unidad_id INT, 
    IN p_nombres VARCHAR(100),
    IN p_abreviatura VARCHAR(10),
    IN p_descripcion VARCHAR(100) 
)
BEGIN
    UPDATE UnidadMedida
    SET
        NombresUnd = p_nombres,
        AbreviaturaUnd = p_abreviatura,
        DescripcionUnd = p_descripcion, 
        FechaActualizacion = CURRENT_TIMESTAMP
    WHERE Id = unidad_id;
END //
DELIMITER ;


/*TODO: SP Eliminar unidad de medida*/   
DELIMITER //
CREATE PROCEDURE eliminar_unidad_medida(IN unidad_id INT)
 BEGIN
    UPDATE UnidadMedida SET Estado = 'Eliminado' WHERE Id = unidad_id;
END // 
DELIMITER ;
