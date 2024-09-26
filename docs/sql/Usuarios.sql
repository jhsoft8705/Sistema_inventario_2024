 

 /*TODO:SP Listar usuarios*/
DELIMITER //
CREATE PROCEDURE listar_usuarios()
BEGIN
    SELECT 
    U.Id, 
    U.NombresUsuario,
    U.ApellidosUsuario,
    U.NumeroDocumento,
    R.NombreRol,
    U.Telefono,
    U.CorreoElectronico,
 	REPEAT('*', LENGTH(U.Contrasena)) AS Contrasena,
    U.Direccion,
    U.Estado 
    FROM Usuarios AS U INNER JOIN
    Roles AS R ON R.Id=U.Id_rol
    WHERE U.Estado IN ('Activo','Inactivo') ;
END //
DELIMITER ;


 
                
/*TODO:SP Listar usuarios x id*/
DELIMITER //
CREATE PROCEDURE listar_user_id(IN user_id INT)
BEGIN
    SELECT 
    U.Id, 
    U.NombresUsuario,
    U.ApellidosUsuario,
    U.NumeroDocumento,
    U.Telefono,
    U.CorreoElectronico,
	U.Contrasena, 
 	U.Id_rol, 
    R.NombreRol,
	R.Descripcion,
    U.Direccion,
	U.Genero,
	U.Notificaciones,
    U.Estado,
	U.FechaRegistro 
    FROM Usuarios AS U INNER JOIN
    Roles AS R ON R.Id=U.Id_rol 
    WHERE U.Id=user_id ;
END //
DELIMITER ;


/*TODO:SP Registrar usuario*/ 
DELIMITER
    //
CREATE PROCEDURE registrar_usuario(
    IN nombres VARCHAR(100),
    IN apellidos VARCHAR(100),
    IN doc VARCHAR(20),
    IN email VARCHAR(40),
    IN pass VARCHAR(100),
    IN rol_id INT,
    IN estado VARCHAR(10)
)
BEGIN
    INSERT INTO Usuarios(
        NombresUsuario,
        ApellidosUsuario,
        NumeroDocumento,
        CorreoElectronico,
        Contrasena,
        Id_rol,
        Estado
    )
VALUES( nombres,  apellidos, doc,   email,  pass, rol_id,  estado ) ;

END //
DELIMITER ;


/*TODO:SP Actualizar usuario*/  
DELIMITER // 
CREATE PROCEDURE update_user(
    IN user_id INT,
    IN nombres VARCHAR(100),
    IN apellidos VARCHAR(100),
    IN doc VARCHAR(20),
    IN email VARCHAR(40),
    IN pass VARCHAR(100),
    IN rol_id INT,
    IN estado VARCHAR(10)
)
BEGIN
    UPDATE Usuarios
    SET
        NombresUsuario = nombres,
        ApellidosUsuario = apellidos,
        NumeroDocumento = doc,
        CorreoElectronico = email,
        Contrasena = pass,
        Id_rol = rol_id,
        Estado = estado
    WHERE Id = user_id;
END //

DELIMITER ;

 
 
/*TODO:SP Eliminar usuario*/   
DELIMITER //
CREATE PROCEDURE eliminar_user(IN user_id INT)
 BEGIN
	UPDATE Usuarios SET Estado='Eliminado' WHERE Id=user_id ;
END // 
DELIMITER ; 

 
  
/*TODO:SP Login usuario*/
 DELIMITER //
CREATE PROCEDURE sp_login(
    IN user VARCHAR(50),
    IN pass VARCHAR(30)
)
BEGIN
    DECLARE u VARCHAR(50);
    DECLARE c VARCHAR(30);
    DECLARE e VARCHAR(50);

    SELECT CorreoElectronico, Contrasena, Estado
    INTO u, c, e
    FROM Usuarios
    WHERE CorreoElectronico = user;

    IF (u IS NOT NULL) THEN
        IF (c = pass) THEN
            IF (e != 'Activo') THEN
                SELECT 'USER_INACTIVE' AS LoginStatus;
            ELSE
                SELECT 'SUCCESS' AS LoginStatus,
                       U.Id,
                       U.NombresUsuario,
                       U.ApellidosUsuario,
                       U.CorreoElectronico,
                       U.Contrasena,
                       U.Id_rol,
                       Roles.NombreRol,
                       U.Telefono,
                       U.Direccion,
                       U.NumeroDocumento,
                       Roles.Descripcion,
                       U.Notificaciones,
                       U.Url_foto,
                       U.Estado,
                       U.FechaRegistro
                FROM Roles
                INNER JOIN Usuarios AS U ON Roles.Id = U.Id_rol
                WHERE U.CorreoElectronico = user;
            END IF;
        ELSE
            SELECT 'PASSWORD_ERROR' AS LoginStatus;
        END IF;
    ELSE
        SELECT 'USER_NOT_FOUND' AS LoginStatus;
    END IF;
END //
DELIMITER ;  
   
 