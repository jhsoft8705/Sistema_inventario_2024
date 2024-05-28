DELIMITER //
CREATE PROCEDURE listar_ubicacion()
BEGIN
SELECT*FROM ubicaciones WHERE Estado='Activo';
END //
DELIMITER ;