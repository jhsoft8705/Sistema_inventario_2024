SELECT*FROM Roles

DELIMITER //

CREATE PROCEDURE listar_roles ()
BEGIN
     SELECT * FROM roles WHERE Estado = 'Activo';
END //

DELIMITER ;





CREATE PROCEDURE SP_LISTAR_ROL_ID 
@Id_rol INT
AS
	BEGIN 
	SELECT*FROM Roles WHERE Id=@Id_rol
	END


ALTER PROCEDURE SP_REGISTRAR_ROL
@nombre VARCHAR(50),
@descripcion VARCHAR(50) 
 AS
	BEGIN 
	INSERT INTO Roles (NombreRol,Descripcion,Estado,FechaRegistro)VALUES(@nombre,@descripcion,'Activo',GETDATE())
	END
  
CREATE PROCEDURE SP_ACTUALIZAR_ROL
@Id_rol INT,
@nombre VARCHAR(50),
@descripcion VARCHAR(50) 
AS
	BEGIN 
	UPDATE Roles SET NombreRol=@nombre,Descripcion=@descripcion,FechaActualizacion=GETDATE()	
	WHERE Id=@Id_rol
	END

ALTER PROCEDURE SP_ELIMINAR_ROL
@Id_rol INT
AS
	BEGIN 
	UPDATE Roles SET Estado='Eliminado' WHERE Id=@Id_rol
	END


ALTER PROCEDURE SP_CARGAR_PERMISOS_X_ROL_ID   1
@Rol_id INT
AS
BEGIN
	SELECT
	Menu_Detalle.Id as Id_Detalle_Menu_rol,
	Menu_Detalle.Id_Menu, 
	Menu.Nombre,
	Menu.Cabecera,
	Menu.rutaHref,  
	Menu.ClassIcon,
	Menu.Rutacompleta1,
	Menu.Rutacompleta2,
	Menu.Rutacompleta3,
	Menu_Detalle.Id_rol, 
	Menu_Detalle.Permiso,
	Menu_Detalle.Estado
	FROM Menu INNER JOIN
	Menu_Detalle ON Menu.Id = Menu_Detalle.Id_Menu
	WHERE Menu.Estado='Activo' AND Menu_Detalle.Estado='Activo'
	AND Id_rol=@Rol_id
END


CREATE PROCEDURE SP_DESABILITAR_PERMISO 1
@Id_detalleMenu INT
AS
BEGIN
	UPDATE Menu_Detalle SET Permiso='no' WHERE Id=@Id_detalleMenu
END

 CREATE PROCEDURE SP_HABILITAR_PERMISO  
@Id_detalleMenu INT
AS
BEGIN
	UPDATE Menu_Detalle SET Permiso='si' WHERE Id=@Id_detalleMenu
END


ALTER PROCEDURE SP_CREATE_NEW_LIST_PERMISOS
    @Id_rol INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Verificar si ya existen registros para el rol dado en Menu_Detalle
    IF NOT EXISTS (SELECT 1 FROM Menu_Detalle WHERE Id_rol = @Id_rol)
    BEGIN
        -- Insertar los registros de la tabla Menu en la tabla Menu_Detalle para el rol dado
        INSERT INTO Menu_Detalle (Id_Menu, Id_rol, Permiso, Estado, Fecha_Crea)
        SELECT Id, @Id_rol, 'no', 'Activo', GETDATE()
        FROM Menu;
    END
END


SELECT* FROM Menu
 


SP_VALIDAR_ACCESO_URLS 1 ,'dashboard'


--TODO: Validar rutas x URL
ALTER PROCEDURE SP_VALIDAR_ACCESO_URLS  
@Rol_id INT,
@Identificador VARCHAR(100)

AS
BEGIN
	SELECT
	Menu_Detalle.Id as Id_Detalle_Menu_rol,
	Menu_Detalle.Id_Menu, 
	Menu.Nombre,
	Menu.Cabecera,
	Menu.rutaHref,  
	Menu.ClassIcon,  
	Menu_Detalle.Id_rol, 
	Menu_Detalle.Permiso,
	Menu_Detalle.Estado
	FROM Menu INNER JOIN
	Menu_Detalle ON Menu.Id = Menu_Detalle.Id_Menu
	WHERE Menu.Estado='Activo' AND Menu_Detalle.Estado='Activo'
	AND Id_rol=@Rol_id AND Permiso='si' AND Identificador=@Identificador
END

SELECT*FROM Menu_Detalle
select*from Menu
 