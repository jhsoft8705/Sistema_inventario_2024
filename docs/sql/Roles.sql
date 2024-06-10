SELECT*FROM Roles

DELIMITER //

CREATE PROCEDURE listar_roles ()
BEGIN
     SELECT * FROM roles WHERE Estado = 'Activo';
END //

DELIMITER ;


DELIMITER //
CREATE PROCEDURE listar_rol_id(IN Id_rol INT)
BEGIN
    SELECT * FROM Roles WHERE Id = Id_rol;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE registrar_rol(IN nombre VARCHAR(50), IN descripcion VARCHAR(50))
BEGIN
    INSERT INTO Roles (NombreRol, Descripcion, Estado, FechaRegistro)
    VALUES (nombre, descripcion, 'Activo', NOW());
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE actualizar_rol(IN Id_rol INT, IN nombre VARCHAR(50), IN descripcion VARCHAR(50))
BEGIN
    UPDATE Roles 
    SET NombreRol = nombre, Descripcion = descripcion, FechaActualizacion = NOW()
    WHERE Id = Id_rol;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE eliminar_rol(IN Id_rol INT)
BEGIN
    UPDATE Roles SET Estado = 'Eliminado' WHERE Id = Id_rol;
END //
DELIMITER ;
