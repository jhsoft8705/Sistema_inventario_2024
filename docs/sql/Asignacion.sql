
/*TODO:Tempory*/
DELIMITER //

CREATE PROCEDURE create_temporary_asignacion(IN id_usuario INT)
BEGIN
    DECLARE preactivo_count INT;
    
    -- Verificar si existe un registro con Estado 'PreActivo'
    SELECT COUNT(*) INTO preactivo_count FROM Asignacion WHERE Estado = 'PreActivo';
    
    IF preactivo_count > 0 THEN
        -- Si existe un registro 'PreActivo', devolver ese registro
        SELECT * FROM Asignacion WHERE Estado = 'PreActivo';
    ELSE
        -- Si no existe un registro 'PreActivo', insertar uno nuevo y devolverlo
        INSERT INTO Asignacion (Usuario_Id) VALUES (id_usuario);
        SELECT * FROM Asignacion WHERE Id = LAST_INSERT_ID();
    END IF;
END //

DELIMITER ;
//*TODO:==============EQUIPOS=====================*/ 

//*TODO:Lista equipos x id asignacion*/ 
DELIMITER //
CREATE PROCEDURE list_detalle_equipos_x_orden_id (IN asignacion_id INT)
BEGIN 
	SELECT
    A.Id As Id_Asignacion,
    E.Codigo,
    E.Co_Modular,
    E.Nombre,
    E.Descripcion,
    E.Marca,
    DAH.Id,
    DAH.Equipo_Id, 
    DAH.Cantidad,
    DAH.Precio_Unitario,
    DAH.Total,
    DAH.EstadoDetalle,
    DAH.Estado
    FROM detalle_asignacion_equipos AS DAH
    INNER JOIN Asignacion AS A ON A.Id=DAH.Asignacion_Id
    INNER JOIN Equipos AS E ON E.Id=DAH.Equipo_Id 
    WHERE DAH.Asignacion_Id=asignacion_id AND DAH.Estado IN('Activo');
END //
DELIMITER ;

/*TODO:Registrar detalle equipos */  
DELIMITER //
CREATE PROCEDURE registrar_detalle_equipo( 
    IN equipo_id INT,
    IN asignacion_id INT,
    IN cantidad INT,
    IN precio_unitario DECIMAL(10,2)	
)
BEGIN
    INSERT INTO detalle_asignacion_equipos(Equipo_Id,  Asignacion_Id, Cantidad, Precio_Unitario,Total )
     VALUES( equipo_id,asignacion_id, cantidad, precio_unitario,cantidad*precio_unitario);
END //

DELIMITER ;

/*TODO:Eliminar detalle equipos */  
DELIMITER //
CREATE PROCEDURE eliminar_detalle_equipo( 
    IN detalle_e_id INT 
)
BEGIN
    UPDATE detalle_asignacion_equipos SET Estado='Eliminado' WHERE Id=detalle_e_id;
END //

DELIMITER ;

//*TODO:==============HERRAMIENTAS=====================*/  
//*TODO:Lista herramientas x id asignacion*/ 
DELIMITER //
CREATE PROCEDURE list_detalle_herramientas_x_orden_id (IN asignacion_id INT)
BEGIN 
    SELECT
        A.Id As Id_Asignacion,
        H.Codigo,
        H.Co_Modular,
        H.Nombre,
        H.Descripcion,
        H.Marca,
        DAH.Id,
        DAH.Herramienta_Id, 
        DAH.Cantidad,
        DAH.Precio_Unitario,
        DAH.Total,
        DAH.EstadoDetalle,
        DAH.Estado
    FROM detalle_asignacion_herramientas AS DAH
    INNER JOIN Asignacion AS A ON A.Id=DAH.Asignacion_Id
    INNER JOIN Herramientas AS H ON H.Id=DAH.Herramienta_Id 
    WHERE DAH.Asignacion_Id = asignacion_id AND DAH.Estado IN('Activo');
END //
DELIMITER ;

/*TODO:Registrar detalle herramientas */  
DELIMITER //
CREATE PROCEDURE registrar_detalle_herramienta( 
    IN herramienta_id INT,
    IN asignacion_id INT,
    IN cantidad INT,
    IN precio_unitario DECIMAL(10,2)	

)
BEGIN
    INSERT INTO detalle_asignacion_herramientas(Herramienta_Id, Asignacion_Id, Cantidad, Precio_Unitario,Total) 
    VALUES(herramienta_id, asignacion_id, cantidad, precio_unitario,cantidad*precio_unitario);
END // 

DELIMITER ;


/*TODO:Eliminar detalle herramientas */  
DELIMITER //
CREATE PROCEDURE eliminar_detalle_herramienta( 
    IN detalle_h_id INT 
)
BEGIN
    UPDATE detalle_asignacion_herramientas SET Estado = 'Eliminado' WHERE Id = detalle_h_id;
END //

DELIMITER ;


/*TODO:==============INSUMOS=====================*/ 
/*TODO:Lista insumos x id asignacion*/  
DELIMITER //  
CREATE PROCEDURE list_detalle_insumos_x_orden_id (IN asignacion_id INT)
BEGIN 
    SELECT
        A.Id AS Id_Asignacion,
        I.Codigo,
        I.Co_Modular,
        I.Nombre,
        I.Descripcion,
        I.Marca,
        DAI.Id,
        DAI.Insumos_Id, 
        DAI.Cantidad,
        DAI.Precio_Unitario,
        DAI.Total,
        DAI.EstadoDetalle,
        DAI.Estado
    FROM detalle_asignacion_insumos AS DAI
    INNER JOIN Asignacion AS A ON A.Id = DAI.Asignacion_Id
    INNER JOIN Insumos AS I ON I.Id = DAI.Insumos_Id 
    WHERE DAI.Asignacion_Id = asignacion_id AND DAI.Estado IN ('Activo');
END //
DELIMITER ;

/*TODO:Registrar detalle insumos */  
DELIMITER //
CREATE PROCEDURE registrar_detalle_insumo( 
    IN insumo_id INT,
    IN asignacion_id INT,
    IN cantidad INT,
    IN precio_unitario DECIMAL(10,2)	

)
BEGIN
    INSERT INTO detalle_asignacion_insumos(Insumos_Id, Asignacion_Id, Cantidad, Precio_Unitario,Total) 
    VALUES(insumo_id, asignacion_id, cantidad, precio_unitario,cantidad*precio_unitario);
END //
DELIMITER ;

/*TODO:Eliminar detalle insumos */  
DELIMITER //
CREATE PROCEDURE eliminar_detalle_insumo( 
    IN detalle_i_id INT 
)
BEGIN
    UPDATE detalle_asignacion_insumos SET Estado = 'Eliminado' WHERE Id = detalle_i_id;
END //
DELIMITER ;



/*TODO:==============ASIGNACIONES=====================*/ 
DELIMITER //
CREATE PROCEDURE registrar_asignacion(
    IN asignacion_id INT,IN taller_id INT,periodo_id INT,IN usuario_id INT, IN descripcion varchar(250)
)
BEGIN
    UPDATE asignacion SET Taller_id=taller_id,Periodo_id=periodo_id, Usuario_id = usuario_id,
    Descripcion=descripcion,Estado='Activo', EstadoAsigacion='Asignado' WHERE Id=asignacion_id;
END //
DELIMITER ;


 /*TODO:==============LISTA SIGNACIONES=====================*/  
DELIMITER // 
CREATE PROCEDURE listar_asignaciones (IN input_search VARCHAR(250))
BEGIN
    -- Tabla temporal para almacenar resultados intermedios
    CREATE TEMPORARY TABLE IF NOT EXISTS temp_results (
        asignacion_id INT,
        Codigo VARCHAR(255),
        Descripcion TEXT,
        EstadoAsigacion VARCHAR(50),
        Estado VARCHAR(50),
        FechaRegistro DATETIME,
        FechaActualizacion DATETIME,
        T_Nombre VARCHAR(255),
        Periodo_Nombre VARCHAR(255),
        Periodo_Fecha_Inicio DATE,
        Periodo_Fecha_Fin DATE,
        NombreRol VARCHAR(255),
        NombresUsuario VARCHAR(255),
        ApellidosUsuario VARCHAR(255),
        CorreoElectronico VARCHAR(255),
        CantidadE INT,
        TotalE DECIMAL(10, 2),
        CantidadH INT,
        TotalH DECIMAL(10, 2),
        CantidadI INT,
        TotalI DECIMAL(10, 2),
        TotalGeneral DECIMAL(10, 2)

    ); 
    -- Insertar datos en la tabla temporal
    INSERT INTO temp_results
    SELECT
        a.Id AS asignacion_id,
        a.Codigo, 
        a.Descripcion,
        a.EstadoAsigacion,
        a.Estado,
        a.FechaRegistro,
        a.FechaActualizacion,
        t.T_Nombre,
        p.Nombre AS Periodo_Nombre,
        p.Fecha_Inicio AS Periodo_Fecha_Inicio,
        p.Fecha_Fin AS Periodo_Fecha_Fin,
        r.NombreRol,
        u.NombresUsuario,
        u.ApellidosUsuario,
        u.CorreoElectronico,
        (SELECT COUNT(*) FROM Detalle_Asignacion_Equipos WHERE Asignacion_Id = a.Id) AS CantidadE,
        (SELECT SUM(Total) FROM Detalle_Asignacion_Equipos WHERE Asignacion_Id = a.Id) AS TotalE,
        (SELECT COUNT(*) FROM Detalle_Asignacion_Herramientas WHERE Asignacion_Id = a.Id) AS CantidadH,
        (SELECT SUM(Total) FROM Detalle_Asignacion_Herramientas WHERE Asignacion_Id = a.Id) AS TotalH,
        (SELECT COUNT(*) FROM Detalle_Asignacion_Insumos WHERE Asignacion_Id = a.Id) AS CantidadI,
        (SELECT SUM(Total) FROM Detalle_Asignacion_Insumos WHERE Asignacion_Id = a.Id) AS TotalI,
        (SELECT SUM(Total) FROM Detalle_Asignacion_Equipos WHERE Asignacion_Id = a.Id) +
        (SELECT SUM(Total) FROM Detalle_Asignacion_Herramientas WHERE Asignacion_Id = a.Id) +
        (SELECT SUM(Total) FROM Detalle_Asignacion_Insumos WHERE Asignacion_Id = a.Id) AS TotalGeneral
    FROM Asignacion AS a
    INNER JOIN Talleres AS t ON t.Id = a.Taller_Id
    INNER JOIN Usuarios AS u ON u.Id = a.Usuario_Id
    INNER JOIN Periodos AS p ON p.Id = a.Periodo_id
    LEFT JOIN roles AS r ON r.Id = u.Id_rol
    WHERE a.Estado = 'Activo' AND a.EstadoAsigacion = 'Asignado' 
    AND (input_search IS NULL OR t.T_Nombre LIKE CONCAT('%', input_search, '%'));

    -- Seleccionar resultados de la tabla temporal
    SELECT * FROM temp_results;

    -- Limpiar tabla temporal
    DROP TEMPORARY TABLE IF EXISTS temp_results;
END //

DELIMITER ;

