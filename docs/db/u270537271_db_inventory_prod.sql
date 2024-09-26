-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 26-09-2024 a las 22:34:17
-- Versión del servidor: 10.11.8-MariaDB-cll-lve
-- Versión de PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `u270537271_db_inventory`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`u270537271_inventoryuser`@`127.0.0.1` PROCEDURE `actualizar_equipo` (IN `equipo_id` INT, IN `p_co_modular` VARCHAR(200), IN `p_nombre` VARCHAR(150), IN `p_descripcion` VARCHAR(250), IN `p_categoria_id` INT, IN `p_proveedor_id` INT, IN `p_marca` VARCHAR(50), IN `p_modelo` VARCHAR(50), IN `p_serie` VARCHAR(100), IN `p_color` VARCHAR(30), IN `p_unidadmedida_id` INT, IN `p_medida` VARCHAR(50), IN `p_cantidad` INT, IN `p_precio_unitario` DECIMAL(10,2), IN `p_fecha_adquisicion` DATE, IN `p_estado_equipo` ENUM('Nuevo','Regular','Viejo'), IN `p_nota` VARCHAR(250))   BEGIN
    UPDATE Equipos
    SET
        Co_Modular = p_co_modular,
        Nombre = p_nombre, 
        Descripcion = p_descripcion,
        Categoria_id = p_categoria_id,
        Proveedor_id = p_proveedor_id,
        Marca = p_marca,
        Modelo = p_modelo,
        Serie = p_serie,
        Color = p_color,
        UnidadMedida_id = p_unidadmedida_id,
        Medida = p_medida,
        Cantidad = p_cantidad,
        Precio_Unitario = p_precio_unitario,
        Total = p_cantidad * p_precio_unitario,
        Fecha_Adquision = p_fecha_adquisicion,
        Estado_Equipo = p_estado_equipo,
        Nota = p_nota,
        FechaActualizacion = CURRENT_TIMESTAMP
    WHERE Id = equipo_id;
END$$

CREATE DEFINER=`u270537271_inventoryuser`@`127.0.0.1` PROCEDURE `actualizar_herramienta` (IN `herramienta_id` INT, IN `p_co_modular` VARCHAR(200), IN `p_nombre` VARCHAR(150), IN `p_descripcion` VARCHAR(250), IN `p_categoria_id` INT, IN `p_proveedor_id` INT, IN `p_marca` VARCHAR(50), IN `p_modelo` VARCHAR(50), IN `p_serie` VARCHAR(100), IN `p_color` VARCHAR(30), IN `p_unidadmedida_id` INT, IN `p_medida` VARCHAR(50), IN `p_cantidad` INT, IN `p_precio_unitario` DECIMAL(10,2), IN `p_fecha_adquisicion` DATE, IN `p_Estado_Herramienta` ENUM('Nuevo','Regular','Viejo'), IN `p_nota` VARCHAR(250))   BEGIN
    UPDATE Herramientas
    SET
        Co_Modular = p_co_modular,
        Nombre = p_nombre, 
        Descripcion = p_descripcion,
        Categoria_id = p_categoria_id,
        Proveedor_id = p_proveedor_id,
        Marca = p_marca,
        Modelo = p_modelo,
        Serie = p_serie,
        Color = p_color,
        UnidadMedida_id = p_unidadmedida_id,
        Medida = p_medida,
        Cantidad = p_cantidad,
        Precio_Unitario = p_precio_unitario,
        Total = p_cantidad * p_precio_unitario,
        Fecha_Adquision = p_fecha_adquisicion,
        Estado_Herramienta = p_Estado_Herramienta,
        Nota = p_nota,
        FechaActualizacion = CURRENT_TIMESTAMP
    WHERE Id = herramienta_id;
END$$

CREATE DEFINER=`u270537271_inventoryuser`@`127.0.0.1` PROCEDURE `actualizar_insumo` (IN `insumo_id` INT, IN `p_co_modular` VARCHAR(200), IN `p_nombre` VARCHAR(150), IN `p_descripcion` VARCHAR(250), IN `p_categoria_id` INT, IN `p_proveedor_id` INT, IN `p_marca` VARCHAR(50), IN `p_unidadmedida_id` INT, IN `p_medida` VARCHAR(50), IN `p_cantidad` INT, IN `p_precio_unitario` DECIMAL(10,2), IN `p_fecha_adquisicion` DATE, IN `p_estado_insumo` VARCHAR(50), IN `p_nota` VARCHAR(250))   BEGIN
    UPDATE Insumos
    SET
        Co_Modular = p_co_modular,
        Nombre = p_nombre, 
        Descripcion = p_descripcion,
        Categoria_id = p_categoria_id,
        Proveedor_id = p_proveedor_id,
        Marca = p_marca, 
        UnidadMedida_id = p_unidadmedida_id,
        Medida = p_medida,
        Cantidad = p_cantidad,
        Precio_Unitario = p_precio_unitario,
        Total = p_cantidad * p_precio_unitario,
        Fecha_Adquision = p_fecha_adquisicion,
        Estado_Insumo = p_estado_insumo,
        Nota = p_nota,
        FechaActualizacion = CURRENT_TIMESTAMP
    WHERE Id = insumo_id;
END$$

CREATE DEFINER=`u270537271_inventoryuser`@`127.0.0.1` PROCEDURE `actualizar_periodo` (IN `periodo_id` INT, IN `p_nombre` VARCHAR(100), IN `p_fecha_inicio` DATE, IN `p_fecha_fin` DATE, IN `p_descripcion` VARCHAR(255))   BEGIN
    UPDATE Periodos
    SET
        Nombre = p_nombre,
        Fecha_Inicio = p_fecha_inicio,
        Fecha_Fin = p_fecha_fin,
        Descripcion = p_descripcion,
        FechaActualizacion = CURRENT_TIMESTAMP
    WHERE Id = periodo_id;
END$$

CREATE DEFINER=`u270537271_inventoryuser`@`127.0.0.1` PROCEDURE `actualizar_proveedor` (IN `proveedor_id` INT, IN `p_tipo_documento` ENUM('Dni','Ruc','Pasaporte'), IN `p_numero_documento` VARCHAR(20), IN `p_nombres` VARCHAR(100), IN `p_apellidos` VARCHAR(100), IN `p_telefono` VARCHAR(15), IN `p_direccion` VARCHAR(100), IN `p_id_cate` INT, IN `p_notas` VARCHAR(250))   BEGIN
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
END$$

CREATE DEFINER=`u270537271_inventoryuser`@`127.0.0.1` PROCEDURE `actualizar_rol` (IN `Id_rol` INT, IN `nombre` VARCHAR(50), IN `descripcion` VARCHAR(50))   BEGIN
    UPDATE Roles 
    SET NombreRol = nombre, Descripcion = descripcion, FechaActualizacion = NOW()
    WHERE Id = Id_rol;
END$$

CREATE DEFINER=`u270537271_inventoryuser`@`127.0.0.1` PROCEDURE `actualizar_taller` (IN `taller_id` INT, IN `p_nombre` VARCHAR(100), IN `p_descripcion` VARCHAR(255))   BEGIN
    UPDATE Talleres
    SET
        T_Nombre = p_nombre,
        T_Descripcion = p_descripcion, 
        FechaActualizacion = CURRENT_TIMESTAMP
    WHERE Id = taller_id;
END$$

CREATE DEFINER=`u270537271_inventoryuser`@`127.0.0.1` PROCEDURE `actualizar_ubicacion` (IN `ubicacion_id` INT, IN `u_nombre` VARCHAR(100), IN `u_descripcion` VARCHAR(255))   BEGIN
    UPDATE Ubicaciones
    SET
        U_Nombre = u_nombre,
        U_Descripcion = u_descripcion,
        FechaActualizacion = CURRENT_TIMESTAMP
    WHERE Id = ubicacion_id;
END$$

CREATE DEFINER=`u270537271_inventoryuser`@`127.0.0.1` PROCEDURE `actualizar_unidad_medida` (IN `unidad_id` INT, IN `p_nombres` VARCHAR(100), IN `p_abreviatura` VARCHAR(10), IN `p_descripcion` VARCHAR(100))   BEGIN
    UPDATE UnidadMedida
    SET
        NombresUnd = p_nombres,
        AbreviaturaUnd = p_abreviatura,
        DescripcionUnd = p_descripcion, 
        FechaActualizacion = CURRENT_TIMESTAMP
    WHERE Id = unidad_id;
END$$

CREATE DEFINER=`u270537271_inventoryuser`@`127.0.0.1` PROCEDURE `create_temporary_asignacion` (IN `id_usuario` INT)   BEGIN
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
END$$

CREATE DEFINER=`u270537271_inventoryuser`@`127.0.0.1` PROCEDURE `eliminar_categoria` (IN `cate_id` INT)   BEGIN
	UPDATE Categorias SET Estado='Eliminado' WHERE Id=cate_id ;
END$$

CREATE DEFINER=`u270537271_inventoryuser`@`127.0.0.1` PROCEDURE `eliminar_detalle_equipo` (IN `detalle_e_id` INT)   BEGIN
    UPDATE Detalle_Asignacion_Equipos SET Estado='Eliminado' WHERE Id=detalle_e_id;
END$$

CREATE DEFINER=`u270537271_inventoryuser`@`127.0.0.1` PROCEDURE `eliminar_detalle_herramienta` (IN `detalle_h_id` INT)   BEGIN
    UPDATE Detalle_Asignacion_Herramientas SET Estado = 'Eliminado' WHERE Id = detalle_h_id;
END$$

CREATE DEFINER=`u270537271_inventoryuser`@`127.0.0.1` PROCEDURE `eliminar_detalle_insumo` (IN `detalle_i_id` INT)   BEGIN
    UPDATE Detalle_Asignacion_Insumos SET Estado = 'Eliminado' WHERE Id = detalle_i_id;
END$$

CREATE DEFINER=`u270537271_inventoryuser`@`127.0.0.1` PROCEDURE `eliminar_equipo` (IN `equipo_id` INT)   BEGIN
    UPDATE Equipos 
    SET Estado = 'Eliminado' 
    WHERE Id = equipo_id;
END$$

CREATE DEFINER=`u270537271_inventoryuser`@`127.0.0.1` PROCEDURE `eliminar_herramienta` (IN `herramienta_id` INT)   BEGIN
    UPDATE Herramientas 
    SET Estado = 'Eliminado' 
    WHERE Id = herramienta_id;
END$$

CREATE DEFINER=`u270537271_inventoryuser`@`127.0.0.1` PROCEDURE `eliminar_insumo` (IN `insumo_id` INT)   BEGIN
    UPDATE Insumos 
    SET Estado = 'Eliminado' 
    WHERE Id = insumo_id;
END$$

CREATE DEFINER=`u270537271_inventoryuser`@`127.0.0.1` PROCEDURE `eliminar_periodo` (IN `periodo_id` INT)   BEGIN
    UPDATE Periodos 
    SET Estado = 'Eliminado'
    WHERE Id = periodo_id;
END$$

CREATE DEFINER=`u270537271_inventoryuser`@`127.0.0.1` PROCEDURE `eliminar_proveedor` (IN `proveedor_id` INT)   BEGIN
    UPDATE Proveedores SET Estado = 'Eliminado' WHERE Id = proveedor_id;
END$$

CREATE DEFINER=`u270537271_inventoryuser`@`127.0.0.1` PROCEDURE `eliminar_rol` (IN `Id_rol` INT)   BEGIN
    UPDATE Roles SET Estado = 'Eliminado' WHERE Id = Id_rol;
END$$

CREATE DEFINER=`u270537271_inventoryuser`@`127.0.0.1` PROCEDURE `eliminar_taller` (IN `taller_id` INT)   BEGIN
    UPDATE Talleres 
    SET Estado = 'Eliminado' 
    WHERE Id = taller_id;
END$$

CREATE DEFINER=`u270537271_inventoryuser`@`127.0.0.1` PROCEDURE `eliminar_ubicacion` (IN `ubicacion_id` INT)   BEGIN
    UPDATE Ubicaciones 
    SET Estado = 'Eliminado'
    WHERE Id = ubicacion_id;
END$$

CREATE DEFINER=`u270537271_inventoryuser`@`127.0.0.1` PROCEDURE `eliminar_unidad_medida` (IN `unidad_id` INT)   BEGIN
    UPDATE UnidadMedida SET Estado = 'Eliminado' WHERE Id = unidad_id;
END$$

CREATE DEFINER=`u270537271_inventoryuser`@`127.0.0.1` PROCEDURE `eliminar_user` (IN `user_id` INT)   BEGIN
	UPDATE Usuarios SET Estado='Eliminado' WHERE Id=user_id ;
END$$

CREATE DEFINER=`u270537271_inventoryuser`@`127.0.0.1` PROCEDURE `grafico_echart_dona` ()   BEGIN
    SELECT
        COUNT(a.Taller_Id) AS TotalAsignaciones,
        a.Codigo,
        t.T_Nombre
    FROM
        Asignacion AS a
    INNER JOIN Talleres AS t ON t.Id = a.Taller_Id
    WHERE  a.Estado='Activo'
    GROUP BY
    t.T_Nombre ;
END$$

CREATE DEFINER=`u270537271_inventoryuser`@`127.0.0.1` PROCEDURE `grafico_usuario_taller_dona` ()   BEGIN
    SELECT
        COUNT(a.Taller_Id) AS Total,
        a.Codigo,
        CONCAT(u.NombresUsuario, ' ', u.ApellidosUsuario) AS Nombres
    FROM
        Asignacion AS a
    INNER JOIN Talleres AS t ON t.Id = a.Taller_Id
    INNER JOIN Usuarios AS u ON u.Id = a.Usuario_Id
    WHERE  a.Estado = 'Activo'
    GROUP BY a.Codigo, Nombres;
END$$

CREATE DEFINER=`u270537271_inventoryuser`@`127.0.0.1` PROCEDURE `listar_asignaciones` (IN `input_search` VARCHAR(250), IN `periodo_name` VARCHAR(250))   BEGIN
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
    LEFT JOIN Roles AS r ON r.Id = u.Id_rol
    WHERE a.Estado = 'Activo' 
        AND a.EstadoAsigacion = 'Asignado' 
        AND (input_search IS NULL OR t.T_Nombre LIKE CONCAT('%', input_search, '%'))
		AND (periodo_name IS NULL OR p.Nombre LIKE CONCAT('%', periodo_name, '%')); 
    -- Seleccionar resultados de la tabla temporal
    SELECT * FROM temp_results;

    -- Limpiar tabla temporal
    DROP TEMPORARY TABLE IF EXISTS temp_results;
END$$

CREATE DEFINER=`u270537271_inventoryuser`@`127.0.0.1` PROCEDURE `listar_asignaciones_id` (IN `p_asignacion_id` INT)   BEGIN
    SELECT 
        a.Id,
        a.Codigo,
        a.Taller_Id,
        a.Periodo_id,
        a.Usuario_Id,
        a.EstadoAsigacion,
        a.Descripcion,
        a.Estado,
        a.FechaRegistro,    
        a.FechaActualizacion,
        t.T_Nombre AS Taller_Nombre, 
        p.Nombre AS Periodo_Nombre,
        p.Fecha_Inicio,
        p.Fecha_Fin,
        u.NombresUsuario ,
        u.ApellidosUsuario
    FROM 
        Asignacion a
    INNER JOIN 
        Talleres AS t ON t.Id=a.Taller_Id 
    INNER JOIN 
        Periodos AS  p ON p.Id=a.Periodo_id
    INNER JOIN 
        Usuarios  AS u ON u.Id=a.Usuario_Id 
    WHERE 
        a.Id = p_asignacion_id;
END$$

CREATE DEFINER=`u270537271_inventoryuser`@`127.0.0.1` PROCEDURE `listar_categorias` ()   BEGIN
    SELECT *FROM Categorias as c
    WHERE c.Estado IN ('Activo','Inactivo') ;
END$$

CREATE DEFINER=`u270537271_inventoryuser`@`127.0.0.1` PROCEDURE `listar_categoria_id` (IN `cate_id` INT)   BEGIN
    SELECT * FROM Categorias  
    WHERE Id=cate_id ;
END$$

CREATE DEFINER=`u270537271_inventoryuser`@`127.0.0.1` PROCEDURE `listar_equipos` ()   BEGIN
    SELECT 
        e.Id,
        e.Codigo,
        e.Co_Modular,
        e.Nombre,
        e.Descripcion,
        c.NombresCategoria AS Categoria,
        p.P_Nombres AS ProveedorNombre,
        p.P_Apellidos AS ProveedorApellido,
        e.Marca,
        e.Modelo,
        e.Serie,
        e.Color,
        u.NombresUnd AS UnidadMedida,
        e.Medida,
        e.Cantidad,
        e.Precio_Unitario,
        e.Total,
        e.Fecha_Adquision,
        e.Estado_Equipo,
        e.Nota,
        e.Estado,
        e.FechaRegistro,
        e.FechaActualizacion
    FROM 
        Equipos e
    JOIN 
        Categorias c ON e.Categoria_id = c.Id
    JOIN 
        Proveedores p ON e.Proveedor_id = p.Id
    JOIN 
        UnidadMedida u ON e.UnidadMedida_id = u.Id
    WHERE 
        e.Estado IN ('Activo');
END$$

CREATE DEFINER=`u270537271_inventoryuser`@`127.0.0.1` PROCEDURE `listar_equipo_id` (IN `equipo_id` INT)   BEGIN
    SELECT * FROM Equipos  
    WHERE Id = equipo_id;
END$$

CREATE DEFINER=`u270537271_inventoryuser`@`127.0.0.1` PROCEDURE `listar_herramientas` ()   BEGIN
    SELECT 
        e.Id,
        e.Codigo,
        e.Co_Modular,
        e.Nombre,
        e.Descripcion,
        c.NombresCategoria AS Categoria,
        p.P_Nombres AS ProveedorNombre,
        p.P_Apellidos AS ProveedorApellido,
        e.Marca,
        e.Modelo,
        e.Serie,
        e.Color,
        u.NombresUnd AS UnidadMedida,
        e.Medida,
        e.Cantidad,
        e.Precio_Unitario,
        e.Total,
        e.Fecha_Adquision,
        e.Estado_Herramienta,
        e.Nota,
        e.Estado,
        e.FechaRegistro,
        e.FechaActualizacion
    FROM 
        Herramientas e
    JOIN 
        Categorias c ON e.Categoria_id = c.Id
    JOIN 
        Proveedores p ON e.Proveedor_id = p.Id
    JOIN 
        UnidadMedida u ON e.UnidadMedida_id = u.Id
    WHERE 
        e.Estado = 'Activo';
END$$

CREATE DEFINER=`u270537271_inventoryuser`@`127.0.0.1` PROCEDURE `listar_herramienta_id` (IN `herramienta_id` INT)   BEGIN
    SELECT * FROM Herramientas  
    WHERE Id = herramienta_id;
END$$

CREATE DEFINER=`u270537271_inventoryuser`@`127.0.0.1` PROCEDURE `listar_insumos` ()   BEGIN
    SELECT 
        i.Id,
        i.Codigo,
        i.Co_Modular,
        i.Nombre,
        i.Descripcion,
        c.NombresCategoria AS Categoria,
        p.P_Nombres AS ProveedorNombre,
        p.P_Apellidos AS ProveedorApellido,
        i.Marca, 
        u.NombresUnd AS UnidadMedida,
        i.Medida,
        i.Cantidad,
        i.Precio_Unitario,
        i.Total,
        i.Fecha_Adquision,
        i.Estado_Insumo,
        i.Nota,
        i.Estado,
        i.FechaRegistro,
        i.FechaActualizacion
    FROM 
        Insumos i
    JOIN 
        Categorias c ON i.Categoria_id = c.Id
    JOIN 
        Proveedores p ON i.Proveedor_id = p.Id
    JOIN 
        UnidadMedida u ON i.UnidadMedida_id = u.Id
    WHERE 
        i.Estado IN ('Activo');
END$$

CREATE DEFINER=`u270537271_inventoryuser`@`127.0.0.1` PROCEDURE `listar_insumo_id` (IN `insumo_id` INT)   BEGIN
    SELECT * FROM Insumos  
    WHERE Id = insumo_id;
END$$

CREATE DEFINER=`u270537271_inventoryuser`@`127.0.0.1` PROCEDURE `listar_periodos` ()   BEGIN
    SELECT * FROM Periodos
    WHERE Estado IN ('Activo', 'Inactivo');
END$$

CREATE DEFINER=`u270537271_inventoryuser`@`127.0.0.1` PROCEDURE `listar_periodo_id` (IN `periodo_id` INT)   BEGIN
    SELECT * FROM Periodos
    WHERE Id = periodo_id;
END$$

CREATE DEFINER=`u270537271_inventoryuser`@`127.0.0.1` PROCEDURE `listar_proveedores` ()   BEGIN
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
END$$

CREATE DEFINER=`u270537271_inventoryuser`@`127.0.0.1` PROCEDURE `listar_proveedor_id` (IN `proveedor_id` INT)   BEGIN
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
END$$

CREATE DEFINER=`u270537271_inventoryuser`@`127.0.0.1` PROCEDURE `listar_roles` ()   BEGIN
     SELECT * FROM Roles WHERE Estado = 'Activo';
END$$

CREATE DEFINER=`u270537271_inventoryuser`@`127.0.0.1` PROCEDURE `listar_rol_id` (IN `Id_rol` INT)   BEGIN
    SELECT * FROM Roles WHERE Id = Id_rol;
END$$

CREATE DEFINER=`u270537271_inventoryuser`@`127.0.0.1` PROCEDURE `listar_talleres` ()   BEGIN
    SELECT * FROM Talleres
    WHERE Estado IN ('Activo', 'Inactivo');
END$$

CREATE DEFINER=`u270537271_inventoryuser`@`127.0.0.1` PROCEDURE `listar_taller_id` (IN `taller_id` INT)   BEGIN
    SELECT * FROM Talleres  
    WHERE Id = taller_id;
END$$

CREATE DEFINER=`u270537271_inventoryuser`@`127.0.0.1` PROCEDURE `listar_ubicaciones` ()   BEGIN
    SELECT * FROM Ubicaciones
    WHERE Estado IN ('Activo', 'Inactivo');
END$$

CREATE DEFINER=`u270537271_inventoryuser`@`127.0.0.1` PROCEDURE `listar_ubicacion_id` (IN `ubicacion_id` INT)   BEGIN
    SELECT * FROM Ubicaciones
    WHERE Id = ubicacion_id;
END$$

CREATE DEFINER=`u270537271_inventoryuser`@`127.0.0.1` PROCEDURE `listar_unidades_medida` ()   BEGIN
    SELECT * FROM UnidadMedida 
    WHERE Estado IN ('Activo', 'Inactivo');
END$$

CREATE DEFINER=`u270537271_inventoryuser`@`127.0.0.1` PROCEDURE `listar_unidad_medida_id` (IN `unidad_id` INT)   BEGIN
    SELECT * FROM UnidadMedida  
    WHERE Id = unidad_id;
END$$

CREATE DEFINER=`u270537271_inventoryuser`@`127.0.0.1` PROCEDURE `listar_user_id` (IN `user_id` INT)   BEGIN
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
END$$

CREATE DEFINER=`u270537271_inventoryuser`@`127.0.0.1` PROCEDURE `listar_usuarios` ()   BEGIN
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
END$$

CREATE DEFINER=`u270537271_inventoryuser`@`127.0.0.1` PROCEDURE `list_detalle_equipos_x_orden_id` (IN `asignacion_id` INT)   BEGIN 
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
    FROM Detalle_Asignacion_Equipos AS DAH
    INNER JOIN Asignacion AS A ON A.Id=DAH.Asignacion_Id
    INNER JOIN Equipos AS E ON E.Id=DAH.Equipo_Id 
    WHERE DAH.Asignacion_Id=asignacion_id AND DAH.Estado IN('Activo');
END$$

CREATE DEFINER=`u270537271_inventoryuser`@`127.0.0.1` PROCEDURE `list_detalle_herramientas_x_orden_id` (IN `asignacion_id` INT)   BEGIN 
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
    FROM Detalle_Asignacion_Herramientas AS DAH
    INNER JOIN Asignacion AS A ON A.Id=DAH.Asignacion_Id
    INNER JOIN Herramientas AS H ON H.Id=DAH.Herramienta_Id 
    WHERE DAH.Asignacion_Id = asignacion_id AND DAH.Estado IN('Activo');
END$$

CREATE DEFINER=`u270537271_inventoryuser`@`127.0.0.1` PROCEDURE `list_detalle_insumos_x_orden_id` (IN `asignacion_id` INT)   BEGIN 
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
    FROM Detalle_Asignacion_Insumos AS DAI
    INNER JOIN Asignacion AS A ON A.Id = DAI.Asignacion_Id
    INNER JOIN Insumos AS I ON I.Id = DAI.Insumos_Id 
    WHERE DAI.Asignacion_Id = asignacion_id AND DAI.Estado IN ('Activo');
END$$

CREATE DEFINER=`u270537271_inventoryuser`@`127.0.0.1` PROCEDURE `registrar_asignacion` (IN `asignacion_id` INT, IN `taller_id` INT, `periodo_id` INT, IN `usuario_id` INT, IN `descripcion` VARCHAR(250))   BEGIN
    UPDATE Asignacion SET Taller_id=taller_id,Periodo_id=periodo_id, Usuario_id = usuario_id,
    Descripcion=descripcion,Estado='Activo', EstadoAsigacion='Asignado' WHERE Id=asignacion_id;
END$$

CREATE DEFINER=`u270537271_inventoryuser`@`127.0.0.1` PROCEDURE `registrar_categoria` (IN `p_nombres` VARCHAR(100), IN `p_descripcion` VARCHAR(100))   BEGIN
    INSERT INTO Categorias (
        NombresCategoria, 
        DescripcionCategoria 
    )
    VALUES (
        p_nombres, 
        p_descripcion 
    );
END$$

CREATE DEFINER=`u270537271_inventoryuser`@`127.0.0.1` PROCEDURE `registrar_detalle_equipo` (IN `equipo_id` INT, IN `asignacion_id` INT, IN `cantidad` INT, IN `precio_unitario` DECIMAL(10,2))   BEGIN
    INSERT INTO Detalle_Asignacion_Equipos(Equipo_Id,  Asignacion_Id, Cantidad, Precio_Unitario,Total )
     VALUES( equipo_id,asignacion_id, cantidad, precio_unitario,cantidad*precio_unitario);
END$$

CREATE DEFINER=`u270537271_inventoryuser`@`127.0.0.1` PROCEDURE `registrar_detalle_herramienta` (IN `herramienta_id` INT, IN `asignacion_id` INT, IN `cantidad` INT, IN `precio_unitario` DECIMAL(10,2))   BEGIN
    INSERT INTO Detalle_Asignacion_Herramientas(Herramienta_Id, Asignacion_Id, Cantidad, Precio_Unitario,Total) 
    VALUES(herramienta_id, asignacion_id, cantidad, precio_unitario,cantidad*precio_unitario);
END$$

CREATE DEFINER=`u270537271_inventoryuser`@`127.0.0.1` PROCEDURE `registrar_detalle_insumo` (IN `insumo_id` INT, IN `asignacion_id` INT, IN `cantidad` INT, IN `precio_unitario` DECIMAL(10,2))   BEGIN
    INSERT INTO Detalle_Asignacion_Insumos(Insumos_Id, Asignacion_Id, Cantidad, Precio_Unitario,Total) 
    VALUES(insumo_id, asignacion_id, cantidad, precio_unitario,cantidad*precio_unitario);
END$$

CREATE DEFINER=`u270537271_inventoryuser`@`127.0.0.1` PROCEDURE `registrar_equipo` (IN `p_co_modular` VARCHAR(200), IN `p_nombre` VARCHAR(150), IN `p_descripcion` VARCHAR(250), IN `p_categoria_id` INT, IN `p_proveedor_id` INT, IN `p_marca` VARCHAR(50), IN `p_modelo` VARCHAR(50), IN `p_serie` VARCHAR(100), IN `p_color` VARCHAR(30), IN `p_unidadmedida_id` INT, IN `p_medida` VARCHAR(50), IN `p_cantidad` INT, IN `p_precio_unitario` DECIMAL(10,2), IN `p_fecha_adquisicion` DATE, IN `p_estado_equipo` ENUM('Nuevo','Regular','Viejo'), IN `p_nota` VARCHAR(250))   BEGIN
    INSERT INTO Equipos ( 
        Co_Modular,
        Nombre, 
        Descripcion,
        Categoria_id,
        Proveedor_id,
        Marca,
        Modelo,
        Serie,
        Color,
        UnidadMedida_id,
        Medida,
        Cantidad,
        Precio_Unitario,
        Total,
        Fecha_Adquision,
        Estado_Equipo,
        Nota,
        FechaRegistro
    )
    VALUES (
        p_co_modular,
        p_nombre, 
        p_descripcion,
        p_categoria_id,
        p_proveedor_id,
        p_marca,
        p_modelo,
        p_serie,
        p_color,
        p_unidadmedida_id,
        p_medida,
        p_cantidad,
        p_precio_unitario,
        p_cantidad * p_precio_unitario,
        p_fecha_adquisicion,
        p_estado_equipo,
        p_nota,
        NOW()
    );
END$$

CREATE DEFINER=`u270537271_inventoryuser`@`127.0.0.1` PROCEDURE `registrar_herramienta` (IN `p_co_modular` VARCHAR(200), IN `p_nombre` VARCHAR(150), IN `p_descripcion` VARCHAR(250), IN `p_categoria_id` INT, IN `p_proveedor_id` INT, IN `p_marca` VARCHAR(50), IN `p_modelo` VARCHAR(50), IN `p_serie` VARCHAR(100), IN `p_color` VARCHAR(30), IN `p_unidadmedida_id` INT, IN `p_medida` VARCHAR(50), IN `p_cantidad` INT, IN `p_precio_unitario` DECIMAL(10,2), IN `p_fecha_adquisicion` DATE, IN `p_Estado_Herramienta` ENUM('Nuevo','Regular','Viejo'), IN `p_nota` VARCHAR(250))   BEGIN
    INSERT INTO Herramientas ( 
        Co_Modular,
        Nombre, 
        Descripcion,
        Categoria_id,
        Proveedor_id,
        Marca,
        Modelo,
        Serie,
        Color,
        UnidadMedida_id,
        Medida,
        Cantidad,
        Precio_Unitario,
        Total,
        Fecha_Adquision,
        Estado_Herramienta,
        Nota,
        FechaRegistro
    )
    VALUES (
        p_co_modular,
        p_nombre, 
        p_descripcion,
        p_categoria_id,
        p_proveedor_id,
        p_marca,
        p_modelo,
        p_serie,
        p_color,
        p_unidadmedida_id,
        p_medida,
        p_cantidad,
        p_precio_unitario,
        p_cantidad * p_precio_unitario,
        p_fecha_adquisicion,
        p_Estado_Herramienta,
        p_nota,
        NOW()
    );
END$$

CREATE DEFINER=`u270537271_inventoryuser`@`127.0.0.1` PROCEDURE `registrar_Insumo` (IN `p_co_modular` VARCHAR(200), IN `p_nombre` VARCHAR(150), IN `p_descripcion` VARCHAR(250), IN `p_categoria_id` INT, IN `p_proveedor_id` INT, IN `p_marca` VARCHAR(50), IN `p_unidadmedida_id` INT, IN `p_medida` VARCHAR(50), IN `p_cantidad` INT, IN `p_precio_unitario` DECIMAL(10,2), IN `p_fecha_adquisicion` DATE, IN `p_estado_insumo` VARCHAR(50), IN `p_nota` VARCHAR(250))   BEGIN
    INSERT INTO Insumos ( 
        Co_Modular,
        Nombre, 
        Descripcion,
        Categoria_id,
        Proveedor_id,
        Marca, 
        UnidadMedida_id,
        Medida,
        Cantidad,
        Precio_Unitario,
        Total,
        Fecha_Adquision,
        Estado_Insumo,
        Nota,
        FechaRegistro
    )
    VALUES (
        p_co_modular,
        p_nombre, 
        p_descripcion,
        p_categoria_id,
        p_proveedor_id,
        p_marca, 
        p_unidadmedida_id,
        p_medida,
        p_cantidad,
        p_precio_unitario,
        p_cantidad * p_precio_unitario,
        p_fecha_adquisicion,
        p_estado_insumo,
        p_nota,
        NOW()
    );
END$$

CREATE DEFINER=`u270537271_inventoryuser`@`127.0.0.1` PROCEDURE `registrar_periodo` (IN `p_nombre` VARCHAR(100), IN `p_fecha_inicio` DATE, IN `p_fecha_fin` DATE, IN `p_descripcion` VARCHAR(255))   BEGIN
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
END$$

CREATE DEFINER=`u270537271_inventoryuser`@`127.0.0.1` PROCEDURE `registrar_proveedor` (IN `p_tipo_documento` ENUM('Dni','Ruc','Pasaporte'), IN `p_numero_documento` VARCHAR(20), IN `p_nombres` VARCHAR(100), IN `p_apellidos` VARCHAR(100), IN `p_telefono` VARCHAR(15), IN `p_direccion` VARCHAR(100), IN `p_id_cate` INT, IN `p_notas` VARCHAR(250))   BEGIN
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
END$$

CREATE DEFINER=`u270537271_inventoryuser`@`127.0.0.1` PROCEDURE `registrar_rol` (IN `nombre` VARCHAR(50), IN `descripcion` VARCHAR(50))   BEGIN
    INSERT INTO Roles (NombreRol, Descripcion, Estado, FechaRegistro)
    VALUES (nombre, descripcion, 'Activo', NOW());
END$$

CREATE DEFINER=`u270537271_inventoryuser`@`127.0.0.1` PROCEDURE `registrar_taller` (IN `p_nombre` VARCHAR(100), IN `p_descripcion` VARCHAR(255))   BEGIN
    INSERT INTO Talleres (
        T_Nombre, 
        T_Descripcion
    )
    VALUES (
        p_nombre, 
        p_descripcion
    );
END$$

CREATE DEFINER=`u270537271_inventoryuser`@`127.0.0.1` PROCEDURE `registrar_ubicacion` (IN `u_nombre` VARCHAR(100), IN `u_descripcion` VARCHAR(255))   BEGIN
    INSERT INTO Ubicaciones (
        U_Nombre, 
        U_Descripcion
    )
    VALUES (
        u_nombre, 
        u_descripcion
    );
END$$

CREATE DEFINER=`u270537271_inventoryuser`@`127.0.0.1` PROCEDURE `registrar_unidad_medida` (IN `p_nombres` VARCHAR(100), IN `p_abreviatura` VARCHAR(10), IN `p_descripcion` VARCHAR(100))   BEGIN
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
END$$

CREATE DEFINER=`u270537271_inventoryuser`@`127.0.0.1` PROCEDURE `registrar_usuario` (IN `nombres` VARCHAR(100), IN `apellidos` VARCHAR(100), IN `doc` VARCHAR(20), IN `email` VARCHAR(40), IN `pass` VARCHAR(100), IN `rol_id` INT, IN `estado` VARCHAR(10))   BEGIN
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

END$$

CREATE DEFINER=`u270537271_inventoryuser`@`127.0.0.1` PROCEDURE `sp_login` (IN `user` VARCHAR(50), IN `pass` VARCHAR(30))   BEGIN
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
END$$

CREATE DEFINER=`u270537271_inventoryuser`@`127.0.0.1` PROCEDURE `update_categoria` (IN `cate_id` INT, IN `p_nombres` VARCHAR(100), IN `p_descripcion` VARCHAR(100))   BEGIN
    UPDATE Categorias
    SET
        NombresCategoria = p_nombres,
        DescripcionCategoria = p_descripcion, 
        FechaActualizacion = CURRENT_TIMESTAMP
    WHERE Id = cate_id;
END$$

CREATE DEFINER=`u270537271_inventoryuser`@`127.0.0.1` PROCEDURE `update_user` (IN `user_id` INT, IN `nombres` VARCHAR(100), IN `apellidos` VARCHAR(100), IN `doc` VARCHAR(20), IN `email` VARCHAR(40), IN `pass` VARCHAR(100), IN `rol_id` INT, IN `estado` VARCHAR(10))   BEGIN
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
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Almacen`
--

CREATE TABLE `Almacen` (
  `Id` int(11) NOT NULL,
  `Codigo` varchar(200) DEFAULT NULL,
  `Nombre` varchar(150) DEFAULT NULL,
  `Descripcion` varchar(250) DEFAULT NULL,
  `Tipo` enum('Equipos','Herramientas','Articulos') DEFAULT NULL,
  `Ubicacion_id` int(11) DEFAULT NULL,
  `Categoria_id` int(11) DEFAULT NULL,
  `Proveedor_id` int(11) DEFAULT NULL,
  `Marca` varchar(50) DEFAULT NULL,
  `Modelo` varchar(50) DEFAULT NULL,
  `Serie` varchar(100) DEFAULT NULL,
  `Color` varchar(30) DEFAULT NULL,
  `UnidadMedida_id` int(11) DEFAULT NULL,
  `Medida` varchar(50) DEFAULT NULL,
  `Cantidad` int(11) DEFAULT NULL,
  `Precio_Unitario` decimal(10,2) DEFAULT NULL,
  `Total` decimal(10,2) DEFAULT NULL,
  `Fecha_Adquision` date DEFAULT NULL,
  `Adjunto` varchar(250) DEFAULT NULL,
  `Fase` enum('Asignado','Faltante','Sobrante') DEFAULT NULL,
  `EstadoEquipo` enum('Nuevo','Regular','Viejo') DEFAULT NULL,
  `Nota` varchar(250) DEFAULT NULL,
  `Estado` enum('Activo','Inactivo','Eliminado') NOT NULL DEFAULT 'Activo',
  `FechaRegistro` datetime NOT NULL DEFAULT current_timestamp(),
  `FechaActualizacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Asignacion`
--

CREATE TABLE `Asignacion` (
  `Id` int(11) NOT NULL,
  `Codigo` varchar(200) DEFAULT NULL,
  `Taller_Id` int(11) DEFAULT NULL,
  `Periodo_id` int(11) DEFAULT NULL,
  `Usuario_Id` int(11) DEFAULT NULL,
  `EstadoAsigacion` enum('Asignado','Sobrante') DEFAULT NULL,
  `Descripcion` varchar(250) DEFAULT NULL,
  `Estado` enum('Activo','Inactivo','Eliminado','PreActivo') NOT NULL DEFAULT 'PreActivo',
  `FechaRegistro` datetime NOT NULL DEFAULT current_timestamp(),
  `FechaActualizacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `Asignacion`
--

INSERT INTO `Asignacion` (`Id`, `Codigo`, `Taller_Id`, `Periodo_id`, `Usuario_Id`, `EstadoAsigacion`, `Descripcion`, `Estado`, `FechaRegistro`, `FechaActualizacion`) VALUES
(1, 'AS-0001', 2, 1, 1, 'Asignado', 'Asiganción', 'Activo', '2024-09-26 22:25:24', NULL);

--
-- Disparadores `Asignacion`
--
DELIMITER $$
CREATE TRIGGER `antes_insert_asignacion` BEFORE INSERT ON `Asignacion` FOR EACH ROW BEGIN
    DECLARE last_id INT;
    DECLARE new_code VARCHAR(200); 
    -- Obtenemos el último Id insertado
    SELECT IFNULL(MAX(Id), 0) INTO last_id FROM Asignacion; 
    -- Generamos el nuevo código basado en el último Id
    SET new_code = CONCAT('AS-', LPAD(last_id + 1, 4, '0')); 
    -- Asignamos el nuevo código al campo Codigo del nuevo registro
    SET NEW.Codigo = new_code;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Categorias`
--

CREATE TABLE `Categorias` (
  `Id` int(11) NOT NULL,
  `NombresCategoria` varchar(50) NOT NULL,
  `DescripcionCategoria` varchar(50) DEFAULT NULL,
  `Estado` enum('Activo','Inactivo','Eliminado') NOT NULL DEFAULT 'Activo',
  `FechaRegistro` datetime NOT NULL DEFAULT current_timestamp(),
  `FechaActualizacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `Categorias`
--

INSERT INTO `Categorias` (`Id`, `NombresCategoria`, `DescripcionCategoria`, `Estado`, `FechaRegistro`, `FechaActualizacion`) VALUES
(1, 'Herramientas Manuales', 'Herramientas operadas a mano', 'Activo', '2024-09-26 22:07:39', NULL),
(2, 'Computadoras', 'Equipos de cómputo y accesorios', 'Activo', '2024-09-26 22:07:39', NULL),
(3, 'Muebles', 'Mobiliario para el hogar y oficina', 'Activo', '2024-09-26 22:07:39', NULL),
(4, 'Electrónica', 'Dispositivos electrónicos', 'Activo', '2024-09-26 22:07:39', NULL),
(5, 'Alimentos', 'Comestibles y bebidas', 'Activo', '2024-09-26 22:07:39', NULL),
(6, 'Jardinería', 'Herramientas y suministros para jardín', 'Activo', '2024-09-26 22:07:39', NULL),
(7, 'Oficina', 'Suministros y muebles de oficina', 'Activo', '2024-09-26 22:07:39', '2024-09-26 22:24:08'),
(8, 'Automotriz', 'Accesorios y repuestos para vehículos', 'Activo', '2024-09-26 22:07:39', NULL),
(9, 'Cocina', 'Utensilios y aparatos de cocina', 'Activo', '2024-09-26 22:07:39', NULL),
(10, 'Ferretería', 'Materiales y herramientas de construcción', 'Activo', '2024-09-26 22:07:39', NULL),
(11, 'Instrumentos Musicales', 'Instrumentos y accesorios musicales', 'Activo', '2024-09-26 22:07:39', NULL),
(12, '', '', 'Eliminado', '2024-09-26 22:24:11', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Detalle_Asignacion_Equipos`
--

CREATE TABLE `Detalle_Asignacion_Equipos` (
  `Id` int(11) NOT NULL,
  `Equipo_Id` int(11) DEFAULT NULL,
  `Asignacion_Id` int(11) DEFAULT NULL,
  `Cantidad` int(11) DEFAULT NULL,
  `Precio_Unitario` decimal(10,2) DEFAULT NULL,
  `Total` decimal(10,2) DEFAULT NULL,
  `EstadoDetalle` enum('Asignado') NOT NULL DEFAULT 'Asignado',
  `Estado` enum('Activo','Inactivo','Eliminado') NOT NULL DEFAULT 'Activo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `Detalle_Asignacion_Equipos`
--

INSERT INTO `Detalle_Asignacion_Equipos` (`Id`, `Equipo_Id`, `Asignacion_Id`, `Cantidad`, `Precio_Unitario`, `Total`, `EstadoDetalle`, `Estado`) VALUES
(1, 1, 1, 1, 750.00, 750.00, 'Asignado', 'Activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Detalle_Asignacion_Herramientas`
--

CREATE TABLE `Detalle_Asignacion_Herramientas` (
  `Id` int(11) NOT NULL,
  `Herramienta_Id` int(11) DEFAULT NULL,
  `Asignacion_Id` int(11) DEFAULT NULL,
  `Cantidad` int(11) DEFAULT NULL,
  `Precio_Unitario` decimal(10,2) DEFAULT NULL,
  `Total` decimal(10,2) DEFAULT NULL,
  `EstadoDetalle` enum('Asignado') NOT NULL DEFAULT 'Asignado',
  `Estado` enum('Activo','Inactivo','Eliminado') NOT NULL DEFAULT 'Activo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `Detalle_Asignacion_Herramientas`
--

INSERT INTO `Detalle_Asignacion_Herramientas` (`Id`, `Herramienta_Id`, `Asignacion_Id`, `Cantidad`, `Precio_Unitario`, `Total`, `EstadoDetalle`, `Estado`) VALUES
(1, 3, 1, 1, 1200.00, 1200.00, 'Asignado', 'Activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Detalle_Asignacion_Insumos`
--

CREATE TABLE `Detalle_Asignacion_Insumos` (
  `Id` int(11) NOT NULL,
  `Insumos_Id` int(11) DEFAULT NULL,
  `Asignacion_Id` int(11) DEFAULT NULL,
  `Cantidad` int(11) DEFAULT NULL,
  `Precio_Unitario` decimal(10,2) DEFAULT NULL,
  `Total` decimal(10,2) DEFAULT NULL,
  `EstadoDetalle` enum('Asignado') NOT NULL DEFAULT 'Asignado',
  `Estado` enum('Activo','Inactivo','Eliminado') NOT NULL DEFAULT 'Activo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `Detalle_Asignacion_Insumos`
--

INSERT INTO `Detalle_Asignacion_Insumos` (`Id`, `Insumos_Id`, `Asignacion_Id`, `Cantidad`, `Precio_Unitario`, `Total`, `EstadoDetalle`, `Estado`) VALUES
(1, 1, 1, 1, 2.50, 2.50, 'Asignado', 'Activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Equipos`
--

CREATE TABLE `Equipos` (
  `Id` int(11) NOT NULL,
  `Codigo` varchar(200) DEFAULT NULL,
  `Co_Modular` varchar(200) DEFAULT NULL,
  `Nombre` varchar(150) DEFAULT NULL,
  `Descripcion` varchar(250) DEFAULT NULL,
  `Categoria_id` int(11) DEFAULT NULL,
  `Proveedor_id` int(11) DEFAULT NULL,
  `Marca` varchar(50) DEFAULT NULL,
  `Modelo` varchar(50) DEFAULT NULL,
  `Serie` varchar(100) DEFAULT NULL,
  `Color` varchar(30) DEFAULT NULL,
  `UnidadMedida_id` int(11) DEFAULT NULL,
  `Medida` varchar(50) DEFAULT NULL,
  `Cantidad` int(11) DEFAULT NULL,
  `Precio_Unitario` decimal(10,2) DEFAULT NULL,
  `Total` decimal(10,2) DEFAULT NULL,
  `Fecha_Adquision` date DEFAULT NULL,
  `Estado_Equipo` enum('Nuevo','Regular','Viejo') DEFAULT NULL,
  `Nota` varchar(250) DEFAULT NULL,
  `Estado` enum('Activo','Inactivo','Eliminado') NOT NULL DEFAULT 'Activo',
  `FechaRegistro` datetime NOT NULL DEFAULT current_timestamp(),
  `FechaActualizacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `Equipos`
--

INSERT INTO `Equipos` (`Id`, `Codigo`, `Co_Modular`, `Nombre`, `Descripcion`, `Categoria_id`, `Proveedor_id`, `Marca`, `Modelo`, `Serie`, `Color`, `UnidadMedida_id`, `Medida`, `Cantidad`, `Precio_Unitario`, `Total`, `Fecha_Adquision`, `Estado_Equipo`, `Nota`, `Estado`, `FechaRegistro`, `FechaActualizacion`) VALUES
(1, NULL, 'CM-001', 'Computadora', 'Computadora de escritorio con procesador Intel Core i5 y 8GB de RAM', 1, 1, 'HP', 'Pavilion', 'XYZ123', 'Negro', 1, 'Unidad', 5, 750.00, 3750.00, '2024-06-07', 'Nuevo', 'Equipos para oficina', 'Activo', '2024-09-26 22:07:39', NULL),
(2, NULL, 'CM-002', 'Mouse', 'Mouse óptico con cable USB', 2, 1, 'Logitech', 'M100', 'ABC123', 'Negro', 2, 'Unidad', 10, 15.00, 150.00, '2024-06-07', 'Nuevo', 'Accesorio para computadora', 'Activo', '2024-09-26 22:07:39', NULL),
(3, NULL, 'CM-003', 'Memorias', 'Memoria RAM DDR4 de 8GB', 3, 1, 'Kingston', 'HyperX', '123XYZ', 'Negro', 3, 'Unidad', 20, 40.00, 800.00, '2024-06-07', 'Nuevo', 'Componente de computadora', 'Activo', '2024-09-26 22:07:39', NULL);

--
-- Disparadores `Equipos`
--
DELIMITER $$
CREATE TRIGGER `antes_insert_equipos` BEFORE INSERT ON `Equipos` FOR EACH ROW BEGIN
    DECLARE last_id INT;
    DECLARE new_code VARCHAR(200);

    -- Obtenemos el último Id insertado
    SELECT IFNULL(MAX(Id), 0) INTO last_id FROM Equipos;

    -- Generamos el nuevo código basado en el último Id
    SET new_code = CONCAT('EQ-', LPAD(last_id + 1, 5, '0'));

    -- Asignamos el nuevo código al campo Codigo del nuevo registro
    SET NEW.Codigo = new_code;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Faltantes`
--

CREATE TABLE `Faltantes` (
  `Id` int(11) NOT NULL,
  `Codigo` varchar(200) DEFAULT NULL,
  `Nombre` varchar(150) DEFAULT NULL,
  `Cantidad` int(11) DEFAULT NULL,
  `Precio_Unitario` decimal(10,2) DEFAULT NULL,
  `Total` decimal(10,2) DEFAULT NULL,
  `Equipo_id` int(11) DEFAULT NULL,
  `EstadoEquipo` enum('Faltante') NOT NULL DEFAULT 'Faltante',
  `Estado` enum('Activo','Inactivo','Eliminado') NOT NULL DEFAULT 'Activo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Herramientas`
--

CREATE TABLE `Herramientas` (
  `Id` int(11) NOT NULL,
  `Codigo` varchar(200) DEFAULT NULL,
  `Co_Modular` varchar(200) DEFAULT NULL,
  `Nombre` varchar(150) DEFAULT NULL,
  `Descripcion` varchar(250) DEFAULT NULL,
  `Categoria_id` int(11) DEFAULT NULL,
  `Proveedor_id` int(11) DEFAULT NULL,
  `Marca` varchar(50) DEFAULT NULL,
  `Modelo` varchar(50) DEFAULT NULL,
  `Serie` varchar(100) DEFAULT NULL,
  `Color` varchar(30) DEFAULT NULL,
  `UnidadMedida_id` int(11) DEFAULT NULL,
  `Medida` varchar(50) DEFAULT NULL,
  `Cantidad` int(11) DEFAULT NULL,
  `Precio_Unitario` decimal(10,2) DEFAULT NULL,
  `Total` decimal(10,2) DEFAULT NULL,
  `Fecha_Adquision` date DEFAULT NULL,
  `Estado_Herramienta` enum('Nuevo','Regular','Viejo') DEFAULT NULL,
  `Nota` varchar(250) DEFAULT NULL,
  `Estado` enum('Activo','Inactivo','Eliminado') NOT NULL DEFAULT 'Activo',
  `FechaRegistro` datetime NOT NULL DEFAULT current_timestamp(),
  `FechaActualizacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `Herramientas`
--

INSERT INTO `Herramientas` (`Id`, `Codigo`, `Co_Modular`, `Nombre`, `Descripcion`, `Categoria_id`, `Proveedor_id`, `Marca`, `Modelo`, `Serie`, `Color`, `UnidadMedida_id`, `Medida`, `Cantidad`, `Precio_Unitario`, `Total`, `Fecha_Adquision`, `Estado_Herramienta`, `Nota`, `Estado`, `FechaRegistro`, `FechaActualizacion`) VALUES
(1, NULL, 'CM01', 'Martillo', 'Herramienta de mano con cabeza metálica y mango de madera.', 1, 1, 'Genérica', NULL, NULL, 'Metálico', 1, '', 10, 15.00, 150.00, '2024-06-07', 'Nuevo', 'Herramienta básica de carpintería.', 'Activo', '2024-09-26 22:07:39', '2024-09-26 22:07:39'),
(2, NULL, 'CM02', 'Cortadora', 'Máquina cortadora de metales y plásticos.', 1, 1, 'CortaMAX', 'CM5000', 'CORTA-2023', 'Gris', 1, '', 5, 500.00, 2500.00, '2023-12-15', 'Regular', 'Máquina de alto rendimiento para trabajos industriales.', 'Activo', '2024-09-26 22:07:39', '2024-09-26 22:07:39'),
(3, NULL, 'CM03', 'Mesas de Metal', 'Conjunto de mesas de trabajo fabricadas en acero inoxidable.', 1, 1, 'InduSteel', 'Industrial Pro', 'IND-2024', 'Plateado', 1, '', 1, 1200.00, 3600.00, '2024-03-20', 'Nuevo', 'Ideales para uso en talleres mecánicos.', 'Activo', '2024-09-26 22:07:39', '2024-09-26 22:07:39'),
(4, NULL, 'CM04', 'Extensión', 'Cable de extensión eléctrica de 10 metros.', 1, 1, 'PowerCable', 'HeavyDuty', 'EXT-10M', 'Naranja', 1, '10m', 8, 25.00, 200.00, '2024-05-10', 'Nuevo', 'Cable resistente para uso en exteriores.', 'Activo', '2024-09-26 22:07:39', '2024-09-26 22:07:39'),
(5, NULL, 'CM05', 'Estante', 'Estante metálico de 5 niveles.', 1, 1, 'MetalMax', 'Industrial 5000', 'EST-5N', 'Negro', 1, '', 6, 150.00, 900.00, '2024-04-02', 'Nuevo', 'Estante resistente y duradero para almacenamiento.', 'Activo', '2024-09-26 22:07:39', '2024-09-26 22:07:39');

--
-- Disparadores `Herramientas`
--
DELIMITER $$
CREATE TRIGGER `antes_insert_herramientas` BEFORE INSERT ON `Herramientas` FOR EACH ROW BEGIN
    DECLARE last_id INT;
    DECLARE new_code VARCHAR(200);

    -- Obtenemos el último Id insertado
    SELECT IFNULL(MAX(Id), 0) INTO last_id FROM Herramientas;

    -- Generamos el nuevo código basado en el último Id
    SET new_code = CONCAT('HOM-', LPAD(last_id + 1, 5, '0'));

    -- Asignamos el nuevo código al campo Codigo del nuevo registro
    SET NEW.Codigo = new_code;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Insumos`
--

CREATE TABLE `Insumos` (
  `Id` int(11) NOT NULL,
  `Codigo` varchar(200) DEFAULT NULL,
  `Co_Modular` varchar(200) DEFAULT NULL,
  `Nombre` varchar(150) DEFAULT NULL,
  `Descripcion` varchar(250) DEFAULT NULL,
  `Categoria_id` int(11) DEFAULT NULL,
  `Proveedor_id` int(11) DEFAULT NULL,
  `Marca` varchar(50) DEFAULT NULL,
  `UnidadMedida_id` int(11) DEFAULT NULL,
  `Medida` varchar(50) DEFAULT NULL,
  `Cantidad` int(11) DEFAULT NULL,
  `Precio_Unitario` decimal(10,2) DEFAULT NULL,
  `Total` decimal(10,2) DEFAULT NULL,
  `Fecha_Adquision` date DEFAULT NULL,
  `Estado_Insumo` enum('Nuevo','Regular','Viejo') DEFAULT NULL,
  `Nota` varchar(250) DEFAULT NULL,
  `Estado` enum('Activo','Inactivo','Eliminado') NOT NULL DEFAULT 'Activo',
  `FechaRegistro` datetime NOT NULL DEFAULT current_timestamp(),
  `FechaActualizacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `Insumos`
--

INSERT INTO `Insumos` (`Id`, `Codigo`, `Co_Modular`, `Nombre`, `Descripcion`, `Categoria_id`, `Proveedor_id`, `Marca`, `UnidadMedida_id`, `Medida`, `Cantidad`, `Precio_Unitario`, `Total`, `Fecha_Adquision`, `Estado_Insumo`, `Nota`, `Estado`, `FechaRegistro`, `FechaActualizacion`) VALUES
(1, NULL, 'MOD001', 'Agujas de coser', 'Agujas de alta calidad para coser a mano o a máquina', 1, 1, 'Singer', 1, 'Pack de 10', 50, 2.50, 125.00, '2024-01-15', 'Nuevo', 'Uso para textiles', 'Activo', '2024-09-26 22:07:39', NULL),
(2, NULL, 'MOD002', 'Tornillos', 'Tornillos de acero inoxidable para madera y metal', 1, 1, 'Truper', 1, 'Caja de 100', 200, 0.10, 20.00, '2024-02-10', 'Nuevo', 'Para uso general', 'Activo', '2024-09-26 22:07:39', NULL);

--
-- Disparadores `Insumos`
--
DELIMITER $$
CREATE TRIGGER `antes_insert_insumos` BEFORE INSERT ON `Insumos` FOR EACH ROW BEGIN
    DECLARE last_id INT;
    DECLARE new_code VARCHAR(200);

    -- Obtenemos el último Id insertado
    SELECT IFNULL(MAX(Id), 0) INTO last_id FROM Insumos;

    -- Generamos el nuevo código basado en el último Id
    SET new_code = CONCAT('I-', LPAD(last_id + 1, 5, '0'));

    -- Asignamos el nuevo código al campo Codigo del nuevo registro
    SET NEW.Codigo = new_code;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Periodos`
--

CREATE TABLE `Periodos` (
  `Id` int(11) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `Fecha_Inicio` date DEFAULT NULL,
  `Fecha_Fin` date DEFAULT NULL,
  `Descripcion` varchar(255) DEFAULT NULL,
  `Estado` enum('Activo','Inactivo','Eliminado') NOT NULL DEFAULT 'Activo',
  `FechaRegistro` datetime NOT NULL DEFAULT current_timestamp(),
  `FechaActualizacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `Periodos`
--

INSERT INTO `Periodos` (`Id`, `Nombre`, `Fecha_Inicio`, `Fecha_Fin`, `Descripcion`, `Estado`, `FechaRegistro`, `FechaActualizacion`) VALUES
(1, 'Enero 2024', '2024-01-01', '2024-01-31', 'Inventario mensual de enero 2024', 'Activo', '2024-09-26 22:07:39', NULL),
(2, 'Febrero 2024', '2024-02-01', '2024-02-28', 'Inventario mensual de febrero 2024', 'Activo', '2024-09-26 22:07:39', NULL),
(3, 'Primer Trimestre 2024', '2024-01-01', '2024-03-31', 'Inventario del primer trimestre de 2024', 'Activo', '2024-09-26 22:07:39', NULL),
(4, 'Segundo Trimestre 2024', '2024-04-01', '2024-06-30', 'Inventario del segundo trimestre de 2024', 'Activo', '2024-09-26 22:07:39', NULL),
(5, 'Marzo 2024', '2024-03-01', '2024-03-31', 'Inventario mensual de marzo 2024', 'Inactivo', '2024-09-26 22:07:39', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Proveedores`
--

CREATE TABLE `Proveedores` (
  `Id` int(11) NOT NULL,
  `Tipo_Documento` enum('Dni','Ruc','Pasaporte') DEFAULT NULL,
  `NumeroDocumento` varchar(20) NOT NULL,
  `P_Nombres` varchar(100) DEFAULT NULL,
  `P_Apellidos` varchar(100) DEFAULT NULL,
  `Telefono` varchar(15) DEFAULT NULL,
  `Direccion` varchar(100) DEFAULT NULL,
  `Id_Cate` int(11) DEFAULT NULL,
  `Notas` varchar(250) DEFAULT NULL,
  `Estado` enum('Activo','Inactivo','Eliminado') NOT NULL DEFAULT 'Activo',
  `FechaRegistro` datetime NOT NULL DEFAULT current_timestamp(),
  `FechaActualizacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `Proveedores`
--

INSERT INTO `Proveedores` (`Id`, `Tipo_Documento`, `NumeroDocumento`, `P_Nombres`, `P_Apellidos`, `Telefono`, `Direccion`, `Id_Cate`, `Notas`, `Estado`, `FechaRegistro`, `FechaActualizacion`) VALUES
(1, 'Dni', '12345678', 'Juan', 'Perez', '123456789', 'Calle Falsa 123', 1, 'Proveedor confiable', 'Activo', '2024-09-26 22:07:39', NULL),
(2, 'Ruc', '87654321', 'Maria', 'Gonzalez', '987654321', 'Av. Siempre Viva 742', 2, 'Entrega rápida', 'Activo', '2024-09-26 22:07:39', '2024-09-26 22:15:28'),
(3, 'Pasaporte', 'A1234567', 'Luis', 'Martinez', '456789123', 'Calle Luna 456', 3, 'Buena calidad', 'Activo', '2024-09-26 22:07:39', NULL),
(4, 'Dni', '23456789', 'Ana', 'Lopez', '234567890', 'Av. Sol 321', 4, 'Precios competitivos', 'Inactivo', '2024-09-26 22:07:39', NULL),
(5, 'Ruc', '76543210', 'Carlos', 'Garcia', '345678901', 'Calle Estrella 789', 5, 'Atención personalizada', 'Activo', '2024-09-26 22:07:39', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Roles`
--

CREATE TABLE `Roles` (
  `Id` int(11) NOT NULL,
  `NombreRol` varchar(50) DEFAULT NULL,
  `Descripcion` varchar(50) DEFAULT NULL,
  `Estado` enum('Activo','Inactivo') NOT NULL,
  `FechaRegistro` datetime DEFAULT NULL,
  `FechaActualizacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `Roles`
--

INSERT INTO `Roles` (`Id`, `NombreRol`, `Descripcion`, `Estado`, `FechaRegistro`, `FechaActualizacion`) VALUES
(1, 'Administrador', 'Rol con acceso total', 'Activo', '2024-09-26 22:07:39', '2024-09-26 22:07:39'),
(2, 'Usuario', 'Rol con acceso limitado', 'Activo', '2024-09-26 22:07:39', '2024-09-26 22:07:39');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Sobrantes`
--

CREATE TABLE `Sobrantes` (
  `Id` int(11) NOT NULL,
  `Codigo` varchar(200) DEFAULT NULL,
  `Nombre` varchar(150) DEFAULT NULL,
  `Cantidad` int(11) DEFAULT NULL,
  `Precio_Unitario` decimal(10,2) DEFAULT NULL,
  `Total` decimal(10,2) DEFAULT NULL,
  `Equipo_id` int(11) DEFAULT NULL,
  `EstadoEquipo` enum('Sobrante') NOT NULL DEFAULT 'Sobrante',
  `Estado` enum('Activo','Inactivo','Eliminado') NOT NULL DEFAULT 'Activo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Talleres`
--

CREATE TABLE `Talleres` (
  `Id` int(11) NOT NULL,
  `T_Nombre` varchar(100) NOT NULL,
  `T_Descripcion` varchar(255) DEFAULT NULL,
  `Estado` enum('Activo','Inactivo','Eliminado') NOT NULL DEFAULT 'Activo',
  `FechaRegistro` datetime NOT NULL DEFAULT current_timestamp(),
  `FechaActualizacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `Talleres`
--

INSERT INTO `Talleres` (`Id`, `T_Nombre`, `T_Descripcion`, `Estado`, `FechaRegistro`, `FechaActualizacion`) VALUES
(1, 'Computación e Informática', 'Cursos de programación, desarrollo web, y manejo de software de oficina.', 'Activo', '2024-09-26 22:07:39', NULL),
(2, 'Cocina y Gastronomía', 'Cursos de cocina peruana e internacional, pastelería y panadería.', 'Activo', '2024-09-26 22:07:39', NULL),
(3, 'Electricidad y Electrónica', 'Talleres de instalaciones eléctricas, reparación de electrodomésticos.', 'Activo', '2024-09-26 22:07:39', NULL),
(4, 'Mecánica Automotriz', 'Cursos de mantenimiento y reparación de vehículos, sistemas eléctricos.', 'Activo', '2024-09-26 22:07:39', NULL),
(5, 'Moda y Confección', 'Diseño de moda, confección de prendas, y patronaje.', 'Activo', '2024-09-26 22:07:39', NULL),
(6, 'Carpintería y Ebanistería', 'Cursos de fabricación de muebles, diseño en madera y restauración.', 'Activo', '2024-09-26 22:07:39', NULL),
(7, 'Belleza y Estética', 'Talleres de peluquería, cosmetología, y manicure/pedicure.', 'Activo', '2024-09-26 22:07:39', NULL),
(8, 'Marketing Digital y Redes Sociales', 'Cursos de gestión de redes sociales, publicidad en línea.', 'Activo', '2024-09-26 22:07:39', NULL),
(9, 'Idiomas', 'Talleres de inglés, francés, portugués, y otros idiomas extranjeros.', 'Activo', '2024-09-26 22:07:39', NULL),
(10, 'Administración y Contabilidad', 'Cursos de administración de empresas, contabilidad básica y avanzada.', 'Activo', '2024-09-26 22:07:39', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Ubicaciones`
--

CREATE TABLE `Ubicaciones` (
  `Id` int(11) NOT NULL,
  `U_Nombre` varchar(100) NOT NULL,
  `U_Descripcion` varchar(255) DEFAULT NULL,
  `Estado` enum('Activo','Inactivo','Eliminado') NOT NULL DEFAULT 'Activo',
  `FechaRegistro` datetime NOT NULL DEFAULT current_timestamp(),
  `FechaActualizacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `Ubicaciones`
--

INSERT INTO `Ubicaciones` (`Id`, `U_Nombre`, `U_Descripcion`, `Estado`, `FechaRegistro`, `FechaActualizacion`) VALUES
(1, 'Sala de Cocina', 'Ubicación para utensilios y equipos de cocina', 'Activo', '2024-09-26 22:07:39', NULL),
(2, 'Aula de Cómputo', 'Ubicación para equipos y herramientas de informática', 'Activo', '2024-09-26 22:07:39', NULL),
(3, 'Laboratorio de Manualidades', 'Ubicación para equipos de laboratorio y materiales científicos', 'Activo', '2024-09-26 22:07:39', NULL),
(4, 'Taller de Carpintería ', 'Ubicación para herramientas y maquinaria de carpintería ', 'Activo', '2024-09-26 22:07:39', '2024-09-26 22:13:51'),
(5, 'Almacen del aula 05', 'Ubicación para equipos de ejercicio y entrenamiento físico', 'Activo', '2024-09-26 22:07:39', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `UnidadMedida`
--

CREATE TABLE `UnidadMedida` (
  `Id` int(11) NOT NULL,
  `NombresUnd` varchar(50) NOT NULL,
  `AbreviaturaUnd` varchar(10) DEFAULT NULL,
  `DescripcionUnd` varchar(50) DEFAULT NULL,
  `Estado` enum('Activo','Inactivo','Eliminado') NOT NULL DEFAULT 'Activo',
  `FechaRegistro` datetime NOT NULL DEFAULT current_timestamp(),
  `FechaActualizacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `UnidadMedida`
--

INSERT INTO `UnidadMedida` (`Id`, `NombresUnd`, `AbreviaturaUnd`, `DescripcionUnd`, `Estado`, `FechaRegistro`, `FechaActualizacion`) VALUES
(1, 'Kilogramo', 'kg', 'Unidad de medida de masa', 'Activo', '2024-09-26 22:07:39', NULL),
(2, 'Litro', 'L', 'Unidad de medida de volumen', 'Activo', '2024-09-26 22:07:39', NULL),
(3, 'Metro', 'm', 'Unidad de medida de longitud', 'Activo', '2024-09-26 22:07:39', NULL),
(4, 'Pieza', 'pz', 'Unidad de conteo', 'Activo', '2024-09-26 22:07:39', NULL),
(5, 'Caja', 'cj', 'Unidad de empaquetado', 'Activo', '2024-09-26 22:07:39', NULL),
(6, 'test1', 'test1', 'test1', 'Eliminado', '2024-09-26 22:13:15', '2024-09-26 22:13:23');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Usuarios`
--

CREATE TABLE `Usuarios` (
  `Id` int(11) NOT NULL,
  `NombresUsuario` varchar(50) DEFAULT NULL,
  `ApellidosUsuario` varchar(50) DEFAULT NULL,
  `NumeroDocumento` varchar(20) DEFAULT NULL,
  `Telefono` varchar(20) DEFAULT NULL,
  `CorreoElectronico` varchar(100) DEFAULT NULL,
  `Contrasena` varchar(255) DEFAULT NULL,
  `Id_rol` int(11) DEFAULT NULL,
  `Notificaciones` varchar(2) DEFAULT 'NO',
  `Direccion` varchar(255) DEFAULT NULL,
  `Url_foto` varchar(255) DEFAULT NULL,
  `Genero` varchar(15) DEFAULT NULL,
  `Estado` enum('Activo','Inactivo','Eliminado') NOT NULL DEFAULT 'Activo',
  `FechaRegistro` datetime DEFAULT NULL,
  `FechaActualizacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `Usuarios`
--

INSERT INTO `Usuarios` (`Id`, `NombresUsuario`, `ApellidosUsuario`, `NumeroDocumento`, `Telefono`, `CorreoElectronico`, `Contrasena`, `Id_rol`, `Notificaciones`, `Direccion`, `Url_foto`, `Genero`, `Estado`, `FechaRegistro`, `FechaActualizacion`) VALUES
(1, 'Juan', 'Pérez', '123456789', '555-1234', 'juan.perez@example.com', '12345', 1, 'NO', 'Calle Falsa 123', 'url_foto1.jpg', 'Masculino', 'Activo', '2024-09-26 22:07:39', '2024-09-26 22:07:39'),
(2, 'María', 'Gómez', '987654321', '555-5678', 'maria.gomez@example.com', '12345', 2, 'SI', 'Avenida Siempre Viva 742', 'url_foto2.jpg', 'Femenino', 'Activo', '2024-09-26 22:07:39', '2024-09-26 22:07:39'),
(3, 'Carlos', 'Rodríguez', '456789123', '555-8765', 'carlos.rodriguez@example.com', '12345', 1, 'NO', 'Calle Principal 456', 'url_foto3.jpg', 'Masculino', 'Activo', '2024-09-26 22:07:39', '2024-09-26 22:07:39'),
(4, 'Ana', 'Martínez', '789123456', '555-3456', 'ana.martinez@example.com', '12345', 2, 'NO', 'Calle Secundaria 789', 'url_foto4.jpg', 'Femenino', 'Activo', '2024-09-26 22:07:39', '2024-09-26 22:07:39'),
(5, 'Luis', 'Fernández', '321654987', '555-6543', 'luis.fernandez@example.com', '12345', 1, 'SI', 'Avenida Central 321', 'url_foto5.jpg', 'Masculino', 'Activo', '2024-09-26 22:07:39', '2024-09-26 22:07:39'),
(6, 'Elena', 'López', '654987321', '555-4321', 'elena.lopez@example.com', '12345', 2, 'NO', 'Callejón del Gato 654', 'url_foto6.jpg', 'Femenino', 'Activo', '2024-09-26 22:07:39', '2024-09-26 22:07:39'),
(7, 'Miguel', 'Sánchez', '159753468', '555-9876', 'miguel.sanchez@example.com', '12345', 1, 'SI', 'Boulevard Principal 159', 'url_foto7.jpg', 'Masculino', 'Activo', '2024-09-26 22:07:39', '2024-09-26 22:07:39'),
(8, 'Isabel', 'Torres', '357159486', '555-6789', 'isabel.torres@example.com', '12345', 2, 'NO', 'Calle Estrecha 357', 'url_foto8.jpg', 'Femenino', 'Activo', '2024-09-26 22:07:39', '2024-09-26 22:07:39'),
(9, 'Jorge', 'Ramírez', '753951486', '555-2345', 'jorge.ramirez@example.com', '12345', 1, 'SI', 'Avenida Ancha 753', 'url_foto9.jpg', 'Masculino', 'Activo', '2024-09-26 22:07:39', '2024-09-26 22:07:39'),
(10, 'Laura', 'Mendoza', '951753486', '555-7654', 'laura.mendoza@example.com', '12345', 2, 'NO', 'Callejón del Sol 951', 'url_foto10.jpg', 'Femenino', 'Activo', '2024-09-26 22:07:39', '2024-09-26 22:07:39'),
(11, 'Pedro', 'Rivas', '123789456', '555-3457', 'pedro.rivas@example.com', '12345', 1, 'NO', 'Calle del Río 123', 'url_foto11.jpg', 'Masculino', 'Activo', '2024-09-26 22:07:39', '2024-09-26 22:07:39');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `Almacen`
--
ALTER TABLE `Almacen`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `FK_Almacen_Unidad` (`UnidadMedida_id`),
  ADD KEY `FK_Almacen_Category` (`Categoria_id`),
  ADD KEY `FK_Almacen_Ubicacion` (`Ubicacion_id`),
  ADD KEY `FK_Almacen_Proveedor` (`Proveedor_id`);

--
-- Indices de la tabla `Asignacion`
--
ALTER TABLE `Asignacion`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `FK_Asignacion_Taller` (`Taller_Id`),
  ADD KEY `FK_Asignacion_Periodo` (`Periodo_id`),
  ADD KEY `FK_Asignacion_Usuario` (`Usuario_Id`);

--
-- Indices de la tabla `Categorias`
--
ALTER TABLE `Categorias`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `Detalle_Asignacion_Equipos`
--
ALTER TABLE `Detalle_Asignacion_Equipos`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `FK_Detalle_Equipo` (`Equipo_Id`),
  ADD KEY `FK_Detalle_Asignacion` (`Asignacion_Id`);

--
-- Indices de la tabla `Detalle_Asignacion_Herramientas`
--
ALTER TABLE `Detalle_Asignacion_Herramientas`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `FK_Detalle_Herramienta` (`Herramienta_Id`),
  ADD KEY `FK_Detalle_AsignacionH` (`Asignacion_Id`);

--
-- Indices de la tabla `Detalle_Asignacion_Insumos`
--
ALTER TABLE `Detalle_Asignacion_Insumos`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `FK_Detalle_Insumos` (`Insumos_Id`),
  ADD KEY `FK_Detalle_AsignacionI` (`Asignacion_Id`);

--
-- Indices de la tabla `Equipos`
--
ALTER TABLE `Equipos`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `FK_Equipos_Unidad` (`UnidadMedida_id`),
  ADD KEY `FK_Equipos_Category` (`Categoria_id`),
  ADD KEY `FK_Equipos_Proveedor` (`Proveedor_id`);

--
-- Indices de la tabla `Faltantes`
--
ALTER TABLE `Faltantes`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `FK_Faltante_Equipo` (`Equipo_id`);

--
-- Indices de la tabla `Herramientas`
--
ALTER TABLE `Herramientas`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `FK_Herramienta_Unidad` (`UnidadMedida_id`),
  ADD KEY `FK_Herramienta_Category` (`Categoria_id`),
  ADD KEY `FK_Herramienta_Proveedor` (`Proveedor_id`);

--
-- Indices de la tabla `Insumos`
--
ALTER TABLE `Insumos`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `FK_Insumo_Unidad` (`UnidadMedida_id`),
  ADD KEY `FK_Insumo_Category` (`Categoria_id`),
  ADD KEY `FK_Insumo_Proveedor` (`Proveedor_id`);

--
-- Indices de la tabla `Periodos`
--
ALTER TABLE `Periodos`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `Proveedores`
--
ALTER TABLE `Proveedores`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `FK_Provider_Category` (`Id_Cate`);

--
-- Indices de la tabla `Roles`
--
ALTER TABLE `Roles`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `Sobrantes`
--
ALTER TABLE `Sobrantes`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `FK_sobrante_Equipo` (`Equipo_id`);

--
-- Indices de la tabla `Talleres`
--
ALTER TABLE `Talleres`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `Ubicaciones`
--
ALTER TABLE `Ubicaciones`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `UnidadMedida`
--
ALTER TABLE `UnidadMedida`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `Usuarios`
--
ALTER TABLE `Usuarios`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `FK_UserRol` (`Id_rol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `Almacen`
--
ALTER TABLE `Almacen`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Asignacion`
--
ALTER TABLE `Asignacion`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `Categorias`
--
ALTER TABLE `Categorias`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `Detalle_Asignacion_Equipos`
--
ALTER TABLE `Detalle_Asignacion_Equipos`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `Detalle_Asignacion_Herramientas`
--
ALTER TABLE `Detalle_Asignacion_Herramientas`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `Detalle_Asignacion_Insumos`
--
ALTER TABLE `Detalle_Asignacion_Insumos`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `Equipos`
--
ALTER TABLE `Equipos`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `Faltantes`
--
ALTER TABLE `Faltantes`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Herramientas`
--
ALTER TABLE `Herramientas`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `Insumos`
--
ALTER TABLE `Insumos`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `Periodos`
--
ALTER TABLE `Periodos`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `Proveedores`
--
ALTER TABLE `Proveedores`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `Roles`
--
ALTER TABLE `Roles`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `Sobrantes`
--
ALTER TABLE `Sobrantes`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Talleres`
--
ALTER TABLE `Talleres`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `Ubicaciones`
--
ALTER TABLE `Ubicaciones`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `UnidadMedida`
--
ALTER TABLE `UnidadMedida`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `Usuarios`
--
ALTER TABLE `Usuarios`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `Almacen`
--
ALTER TABLE `Almacen`
  ADD CONSTRAINT `FK_Almacen_Category` FOREIGN KEY (`Categoria_id`) REFERENCES `Categorias` (`Id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_Almacen_Proveedor` FOREIGN KEY (`Proveedor_id`) REFERENCES `Proveedores` (`Id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_Almacen_Ubicacion` FOREIGN KEY (`Ubicacion_id`) REFERENCES `Ubicaciones` (`Id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_Almacen_Unidad` FOREIGN KEY (`UnidadMedida_id`) REFERENCES `UnidadMedida` (`Id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `Asignacion`
--
ALTER TABLE `Asignacion`
  ADD CONSTRAINT `FK_Asignacion_Periodo` FOREIGN KEY (`Periodo_id`) REFERENCES `Talleres` (`Id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_Asignacion_Taller` FOREIGN KEY (`Taller_Id`) REFERENCES `Talleres` (`Id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_Asignacion_Usuario` FOREIGN KEY (`Usuario_Id`) REFERENCES `Usuarios` (`Id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `Detalle_Asignacion_Equipos`
--
ALTER TABLE `Detalle_Asignacion_Equipos`
  ADD CONSTRAINT `FK_Detalle_Asignacion` FOREIGN KEY (`Asignacion_Id`) REFERENCES `Asignacion` (`Id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_Detalle_Equipo` FOREIGN KEY (`Equipo_Id`) REFERENCES `Equipos` (`Id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `Detalle_Asignacion_Herramientas`
--
ALTER TABLE `Detalle_Asignacion_Herramientas`
  ADD CONSTRAINT `FK_Detalle_AsignacionH` FOREIGN KEY (`Asignacion_Id`) REFERENCES `Asignacion` (`Id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_Detalle_Herramienta` FOREIGN KEY (`Herramienta_Id`) REFERENCES `Herramientas` (`Id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `Detalle_Asignacion_Insumos`
--
ALTER TABLE `Detalle_Asignacion_Insumos`
  ADD CONSTRAINT `FK_Detalle_AsignacionI` FOREIGN KEY (`Asignacion_Id`) REFERENCES `Asignacion` (`Id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_Detalle_Insumos` FOREIGN KEY (`Insumos_Id`) REFERENCES `Insumos` (`Id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `Equipos`
--
ALTER TABLE `Equipos`
  ADD CONSTRAINT `FK_Equipos_Category` FOREIGN KEY (`Categoria_id`) REFERENCES `Categorias` (`Id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_Equipos_Proveedor` FOREIGN KEY (`Proveedor_id`) REFERENCES `Proveedores` (`Id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_Equipos_Unidad` FOREIGN KEY (`UnidadMedida_id`) REFERENCES `UnidadMedida` (`Id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `Faltantes`
--
ALTER TABLE `Faltantes`
  ADD CONSTRAINT `FK_Faltante_Equipo` FOREIGN KEY (`Equipo_id`) REFERENCES `Equipos` (`Id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `Herramientas`
--
ALTER TABLE `Herramientas`
  ADD CONSTRAINT `FK_Herramienta_Category` FOREIGN KEY (`Categoria_id`) REFERENCES `Categorias` (`Id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_Herramienta_Proveedor` FOREIGN KEY (`Proveedor_id`) REFERENCES `Proveedores` (`Id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_Herramienta_Unidad` FOREIGN KEY (`UnidadMedida_id`) REFERENCES `UnidadMedida` (`Id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `Insumos`
--
ALTER TABLE `Insumos`
  ADD CONSTRAINT `FK_Insumo_Category` FOREIGN KEY (`Categoria_id`) REFERENCES `Categorias` (`Id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_Insumo_Proveedor` FOREIGN KEY (`Proveedor_id`) REFERENCES `Proveedores` (`Id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_Insumo_Unidad` FOREIGN KEY (`UnidadMedida_id`) REFERENCES `UnidadMedida` (`Id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `Proveedores`
--
ALTER TABLE `Proveedores`
  ADD CONSTRAINT `FK_Provider_Category` FOREIGN KEY (`Id_Cate`) REFERENCES `Categorias` (`Id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `Sobrantes`
--
ALTER TABLE `Sobrantes`
  ADD CONSTRAINT `FK_sobrante_Equipo` FOREIGN KEY (`Equipo_id`) REFERENCES `Equipos` (`Id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `Usuarios`
--
ALTER TABLE `Usuarios`
  ADD CONSTRAINT `FK_UserRol` FOREIGN KEY (`Id_rol`) REFERENCES `Roles` (`Id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
