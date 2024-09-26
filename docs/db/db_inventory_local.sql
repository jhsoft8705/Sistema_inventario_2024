-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 02-07-2024 a las 18:47:24
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db_inventory`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_almacen` (IN `almacen_id` INT, IN `p_codigo` VARCHAR(200), IN `p_nombre` VARCHAR(150), IN `p_descripcion` VARCHAR(250), IN `p_tipo` VARCHAR(20), IN `p_ubicacion_id` INT, IN `p_categoria_id` INT, IN `p_proveedor_id` INT, IN `p_marca` VARCHAR(50), IN `p_modelo` VARCHAR(50), IN `p_serie` VARCHAR(100), IN `p_color` VARCHAR(30), IN `p_unidad_medida_id` INT, IN `p_medida` VARCHAR(50), IN `p_cantidad` INT, IN `p_precio_unitario` DECIMAL(10,2), IN `p_fecha_adquisicion` DATE, IN `p_adjunto` VARCHAR(250), IN `p_estado_equipo` VARCHAR(15), IN `p_nota` VARCHAR(250))   BEGIN
    UPDATE Almacen
    SET
        Codigo = p_codigo, 
        Nombre = p_nombre, 
        Descripcion = p_descripcion, 
        Tipo = p_tipo,
        Ubicacion_id = p_ubicacion_id, 
        Categoria_id = p_categoria_id, 
        Proveedor_id = p_proveedor_id, 
        Marca = p_marca, 
        Modelo = p_modelo, 
        Serie = p_serie, 
        Color = p_color, 
        UnidadMedida_id = p_unidad_medida_id, 
        Medida = p_medida, 
        Cantidad = p_cantidad, 
        Precio_Unitario = p_precio_unitario, 
        Total = p_cantidad * p_precio_unitario, 
        Fecha_Adquision = p_fecha_adquisicion, 
        Adjunto = p_adjunto, 
        EstadoEquipo = p_estado_equipo,  
        Nota = p_nota, 
        FechaActualizacion = CURRENT_TIMESTAMP
    WHERE Id = almacen_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_equipo` (IN `equipo_id` INT, IN `p_co_modular` VARCHAR(200), IN `p_nombre` VARCHAR(150), IN `p_descripcion` VARCHAR(250), IN `p_categoria_id` INT, IN `p_proveedor_id` INT, IN `p_marca` VARCHAR(50), IN `p_modelo` VARCHAR(50), IN `p_serie` VARCHAR(100), IN `p_color` VARCHAR(30), IN `p_unidadmedida_id` INT, IN `p_medida` VARCHAR(50), IN `p_cantidad` INT, IN `p_precio_unitario` DECIMAL(10,2), IN `p_fecha_adquisicion` DATE, IN `p_estado_equipo` ENUM('Nuevo','Regular','Viejo'), IN `p_nota` VARCHAR(250))   BEGIN
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_herramienta` (IN `herramienta_id` INT, IN `p_co_modular` VARCHAR(200), IN `p_nombre` VARCHAR(150), IN `p_descripcion` VARCHAR(250), IN `p_categoria_id` INT, IN `p_proveedor_id` INT, IN `p_marca` VARCHAR(50), IN `p_modelo` VARCHAR(50), IN `p_serie` VARCHAR(100), IN `p_color` VARCHAR(30), IN `p_unidadmedida_id` INT, IN `p_medida` VARCHAR(50), IN `p_cantidad` INT, IN `p_precio_unitario` DECIMAL(10,2), IN `p_fecha_adquisicion` DATE, IN `p_Estado_Herramienta` ENUM('Nuevo','Regular','Viejo'), IN `p_nota` VARCHAR(250))   BEGIN
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_insumo` (IN `insumo_id` INT, IN `p_co_modular` VARCHAR(200), IN `p_nombre` VARCHAR(150), IN `p_descripcion` VARCHAR(250), IN `p_categoria_id` INT, IN `p_proveedor_id` INT, IN `p_marca` VARCHAR(50), IN `p_unidadmedida_id` INT, IN `p_medida` VARCHAR(50), IN `p_cantidad` INT, IN `p_precio_unitario` DECIMAL(10,2), IN `p_fecha_adquisicion` DATE, IN `p_estado_insumo` VARCHAR(50), IN `p_nota` VARCHAR(250))   BEGIN
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_periodo` (IN `periodo_id` INT, IN `p_nombre` VARCHAR(100), IN `p_fecha_inicio` DATE, IN `p_fecha_fin` DATE, IN `p_descripcion` VARCHAR(255))   BEGIN
    UPDATE Periodos
    SET
        Nombre = p_nombre,
        Fecha_Inicio = p_fecha_inicio,
        Fecha_Fin = p_fecha_fin,
        Descripcion = p_descripcion,
        FechaActualizacion = CURRENT_TIMESTAMP
    WHERE Id = periodo_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_proveedor` (IN `proveedor_id` INT, IN `p_tipo_documento` ENUM('Dni','Ruc','Pasaporte'), IN `p_numero_documento` VARCHAR(20), IN `p_nombres` VARCHAR(100), IN `p_apellidos` VARCHAR(100), IN `p_telefono` VARCHAR(15), IN `p_direccion` VARCHAR(100), IN `p_id_cate` INT, IN `p_notas` VARCHAR(250))   BEGIN
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_rol` (IN `Id_rol` INT, IN `nombre` VARCHAR(50), IN `descripcion` VARCHAR(50))   BEGIN
    UPDATE Roles 
    SET NombreRol = nombre, Descripcion = descripcion, FechaActualizacion = NOW()
    WHERE Id = Id_rol;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_taller` (IN `taller_id` INT, IN `p_nombre` VARCHAR(100), IN `p_descripcion` VARCHAR(255))   BEGIN
    UPDATE Talleres
    SET
        T_Nombre = p_nombre,
        T_Descripcion = p_descripcion, 
        FechaActualizacion = CURRENT_TIMESTAMP
    WHERE Id = taller_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_ubicacion` (IN `ubicacion_id` INT, IN `u_nombre` VARCHAR(100), IN `u_descripcion` VARCHAR(255))   BEGIN
    UPDATE Ubicaciones
    SET
        U_Nombre = u_nombre,
        U_Descripcion = u_descripcion,
        FechaActualizacion = CURRENT_TIMESTAMP
    WHERE Id = ubicacion_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_unidad_medida` (IN `unidad_id` INT, IN `p_nombres` VARCHAR(100), IN `p_abreviatura` VARCHAR(10), IN `p_descripcion` VARCHAR(100))   BEGIN
    UPDATE UnidadMedida
    SET
        NombresUnd = p_nombres,
        AbreviaturaUnd = p_abreviatura,
        DescripcionUnd = p_descripcion, 
        FechaActualizacion = CURRENT_TIMESTAMP
    WHERE Id = unidad_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `create_temporary_asignacion` (IN `id_usuario` INT)   BEGIN
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminar_categoria` (IN `cate_id` INT)   BEGIN
	UPDATE categorias SET Estado='Eliminado' WHERE Id=cate_id ;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminar_detalle_equipo` (IN `detalle_e_id` INT)   BEGIN
    UPDATE detalle_asignacion_equipos SET Estado='Eliminado' WHERE Id=detalle_e_id ;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminar_detalle_herramienta` (IN `detalle_h_id` INT)   BEGIN
    UPDATE detalle_asignacion_herramientas SET Estado = 'Eliminado' WHERE Id = detalle_h_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminar_detalle_insumo` (IN `detalle_i_id` INT)   BEGIN
    UPDATE detalle_asignacion_insumos SET Estado = 'Eliminado' WHERE Id = detalle_i_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminar_equipo` (IN `equipo_id` INT)   BEGIN
    UPDATE Equipos 
    SET Estado = 'Eliminado' 
    WHERE Id = equipo_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminar_herramienta` (IN `herramienta_id` INT)   BEGIN
    UPDATE Herramientas 
    SET Estado = 'Eliminado' 
    WHERE Id = herramienta_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminar_insumo` (IN `insumo_id` INT)   BEGIN
    UPDATE Insumos 
    SET Estado = 'Eliminado' 
    WHERE Id = insumo_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminar_periodo` (IN `periodo_id` INT)   BEGIN
    UPDATE Periodos 
    SET Estado = 'Eliminado'
    WHERE Id = periodo_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminar_proveedor` (IN `proveedor_id` INT)   BEGIN
    UPDATE Proveedores SET Estado = 'Eliminado' WHERE Id = proveedor_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminar_rol` (IN `Id_rol` INT)   BEGIN
    UPDATE Roles SET Estado = 'Eliminado' WHERE Id = Id_rol;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminar_taller` (IN `taller_id` INT)   BEGIN
    UPDATE Talleres 
    SET Estado = 'Eliminado' 
    WHERE Id = taller_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminar_ubicacion` (IN `ubicacion_id` INT)   BEGIN
    UPDATE Ubicaciones 
    SET Estado = 'Eliminado'
    WHERE Id = ubicacion_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminar_unidad_medida` (IN `unidad_id` INT)   BEGIN
    UPDATE UnidadMedida SET Estado = 'Eliminado' WHERE Id = unidad_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminar_user` (IN `user_id` INT)   BEGIN
	UPDATE Usuarios SET Estado='Eliminado' WHERE Id=user_id ;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `grafico_echart_dona` ()   BEGIN
    -- Consulta principal para obtener datos reales
    SELECT
        COALESCE(COUNT(a.Taller_Id), 0) AS TotalAsignaciones,
        COALESCE(a.Codigo, 'N/A') AS Codigo, -- Asegúrate de que esta columna tenga un valor por defecto
        COALESCE(t.T_Nombre, 'No Hay Talleres') AS T_Nombre
    FROM
        asignacion AS a
    INNER JOIN
        talleres AS t ON t.Id = a.Taller_Id
    WHERE
        a.Estado = 'Activo'
    GROUP BY
        t.T_Nombre
    
    UNION ALL

    -- Consulta para devolver un registro con 0 si no hay datos
    SELECT
        0 AS TotalAsignaciones,
        'N/A' AS Codigo,
        'No Hay Talleres' AS T_Nombre
    WHERE NOT EXISTS (
        SELECT 1
        FROM asignacion AS a
        WHERE a.Estado = 'Activo'
    );

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `grafico_usuario_taller_dona` ()   BEGIN
    SELECT
        COUNT(a.Taller_Id) AS Total,
        a.Codigo,
        CONCAT(u.NombresUsuario, ' ', u.ApellidosUsuario) AS Nombres
    FROM
        asignacion AS a
    INNER JOIN talleres AS t ON t.Id = a.Taller_Id
    INNER JOIN usuarios AS u ON u.Id = a.Usuario_Id
    WHERE  a.Estado = 'Activo'
    GROUP BY a.Codigo, Nombres;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listar_almacen` ()   BEGIN
    SELECT 
        e.Id,
        e.Codigo,
        e.Nombre,
        e.Descripcion,
        e.Tipo,
        u.U_Nombre AS Ubicacion,
        c.NombresCategoria AS Categoria,
        p.P_Nombres AS Proveedor,
        e.Marca,
        e.Modelo,
        e.Serie,
        e.Color,
        um.NombresUnd AS UnidadMedida, 
        e.Medida,
        e.Cantidad,
        e.Precio_Unitario,
        e.Total,
        e.Fecha_Adquision,
        e.Adjunto,
        e.Nota,
        e.Fase,
        e.EstadoEquipo,
        e.Estado,
        e.FechaRegistro,
        e.FechaActualizacion
    FROM 
        Almacen e
    INNER JOIN 
        Ubicaciones u ON e.Ubicacion_id = u.Id
    INNER JOIN 
        Categorias c ON e.Categoria_id = c.Id
    INNER JOIN 
        Proveedores p ON e.Proveedor_id = p.Id
    INNER JOIN 
        UnidadMedida um ON e.UnidadMedida_id = um.Id
    WHERE 
        e.Estado IN ('Activo', 'Inactivo');
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listar_almacen_id` (IN `almacen_id` INT)   BEGIN
    SELECT 
        e.Id,
        e.Codigo,
        e.Nombre,
        e.Descripcion,
        e.Tipo,
        u.Id AS Id_ubicacion,
        u.U_Nombre AS Ubicacion,
        c.Id AS Id_Categoria,
        c.NombresCategoria AS Categoria,
        p.Id AS Id_Proveedor,
        p.P_Nombres AS Proveedor,
        e.Marca,
        e.Modelo,
        e.Serie,
        e.Color,
        um.Id AS Id_Unidad,
        um.NombresUnd AS UnidadMedida,
        e.Medida,
        e.Cantidad,
        e.Precio_Unitario,
        e.Total,
        e.Fecha_Adquision,
        e.Adjunto,
        e.Nota,
        e.Fase,
        e.EstadoEquipo,
        e.Estado,
        e.FechaRegistro,
        e.FechaActualizacion
    FROM 
        Almacen e
    INNER JOIN 
        Ubicaciones u ON e.Ubicacion_id = u.Id
    INNER JOIN 
        Categorias c ON e.Categoria_id = c.Id
    INNER JOIN 
        Proveedores p ON e.Proveedor_id = p.Id
    INNER JOIN 
        UnidadMedida um ON e.UnidadMedida_id = um.Id
    WHERE 
        e.Id = almacen_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listar_asignaciones` (IN `input_search` VARCHAR(250), IN `periodo_name` VARCHAR(250))   BEGIN
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
    WHERE a.Estado = 'Activo' 
        AND a.EstadoAsigacion = 'Asignado' 
        AND (input_search IS NULL OR t.T_Nombre LIKE CONCAT('%', input_search, '%'))
		AND (periodo_name IS NULL OR p.Nombre LIKE CONCAT('%', periodo_name, '%')); 
    -- Seleccionar resultados de la tabla temporal
    SELECT * FROM temp_results;

    -- Limpiar tabla temporal
    DROP TEMPORARY TABLE IF EXISTS temp_results;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listar_asignaciones_id` (IN `p_asignacion_id` INT)   BEGIN
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
        u.NombresUsuario,
        u.ApellidosUsuario
    FROM
        Asignacion a
    INNER JOIN Talleres AS t
    ON
        t.Id = a.Taller_Id
    INNER JOIN Periodos AS p
    ON
        p.Id = a.Periodo_id
    INNER JOIN Usuarios AS u
    ON
        u.Id = a.Usuario_Id
    WHERE
        a.Id = p_asignacion_id ;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listar_categorias` ()   BEGIN
    SELECT *FROM Categorias 
    WHERE Estado IN ('Activo','Inactivo') ;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listar_categoria_id` (IN `cate_id` INT)   BEGIN
    SELECT * FROM Categorias  
    WHERE Id=cate_id ;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listar_equipos` ()   BEGIN
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `listar_equipo_id` (IN `equipo_id` INT)   BEGIN
    SELECT * FROM Equipos  
    WHERE Id = equipo_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listar_herramientas` ()   BEGIN
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `listar_herramienta_id` (IN `herramienta_id` INT)   BEGIN
    SELECT * FROM Herramientas  
    WHERE Id = herramienta_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listar_insumos` ()   BEGIN
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `listar_insumo_id` (IN `insumo_id` INT)   BEGIN
    SELECT * FROM Insumos  
    WHERE Id = insumo_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listar_periodos` ()   BEGIN
    SELECT * FROM Periodos
    WHERE Estado IN ('Activo', 'Inactivo');
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listar_periodo_id` (IN `periodo_id` INT)   BEGIN
    SELECT * FROM Periodos
    WHERE Id = periodo_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listar_proveedores` ()   BEGIN
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `listar_proveedor_id` (IN `proveedor_id` INT)   BEGIN
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `listar_roles` ()   BEGIN
     SELECT * FROM roles WHERE Estado ="Activo";
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listar_rol_id` (IN `Id_rol` INT)   BEGIN
    SELECT * FROM Roles WHERE Id = Id_rol;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listar_talleres` ()   BEGIN
    SELECT * FROM Talleres
    WHERE Estado IN ('Activo', 'Inactivo');
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listar_taller_id` (IN `taller_id` INT)   BEGIN
    SELECT * FROM Talleres  
    WHERE Id = taller_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listar_ubicaciones` ()   BEGIN
    SELECT * FROM Ubicaciones
    WHERE Estado IN ('Activo', 'Inactivo');
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listar_ubicacion_id` (IN `ubicacion_id` INT)   BEGIN
    SELECT * FROM Ubicaciones
    WHERE Id = ubicacion_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listar_unidades_medida` ()   BEGIN
    SELECT * FROM UnidadMedida 
    WHERE Estado IN ('Activo', 'Inactivo');
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listar_unidad_medida_id` (IN `unidad_id` INT)   BEGIN
    SELECT * FROM UnidadMedida  
    WHERE Id = unidad_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listar_user_id` (IN `user_id` INT)   BEGIN
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `listar_usuarios` ()   BEGIN
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `list_detalle_equipos_x_orden_id` (IN `asignacion_id` INT)   BEGIN 
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
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `list_detalle_herramientas_x_orden_id` (IN `asignacion_id` INT)   BEGIN 
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
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `list_detalle_insumos_x_orden_id` (IN `asignacion_id` INT)   BEGIN 
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
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `registrar_almacen` (IN `p_codigo` VARCHAR(200), IN `p_nombre` VARCHAR(150), IN `p_descripcion` VARCHAR(250), IN `p_tipo` VARCHAR(20), IN `p_ubicacion_id` INT, IN `p_categoria_id` INT, IN `p_proveedor_id` INT, IN `p_marca` VARCHAR(50), IN `p_modelo` VARCHAR(50), IN `p_serie` VARCHAR(100), IN `p_color` VARCHAR(30), IN `p_unidad_medida_id` INT, IN `p_medida` VARCHAR(50), IN `p_cantidad` INT, IN `p_precio_unitario` DECIMAL(10,2), IN `p_fecha_adquisicion` DATE, IN `p_adjunto` VARCHAR(250), IN `p_estado_equipo` VARCHAR(15), IN `p_nota` VARCHAR(250))   BEGIN
    INSERT INTO Almacen (
        Codigo, 
        Nombre, 
        Descripcion, 
        Tipo,
        Ubicacion_id, 
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
        Adjunto,  
        EstadoEquipo, 
        Nota
    ) 
    VALUES (
        p_codigo, 
        p_nombre, 
        p_descripcion, 
        p_tipo,
        p_ubicacion_id, 
        p_categoria_id, 
        p_proveedor_id, 
        p_marca, 
        p_modelo, 
        p_serie, 
        p_color, 
        p_unidad_medida_id, 
        p_medida, 
        p_cantidad, 
        p_precio_unitario, 
        p_cantidad * p_precio_unitario, 
        p_fecha_adquisicion, 
        p_adjunto,  
        p_estado_equipo,
        p_nota
    );
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `registrar_asignacion` (IN `asignacion_id` INT, IN `taller_id` INT, `periodo_id` INT, IN `usuario_id` INT, IN `descripcion` VARCHAR(250))   BEGIN
    UPDATE asignacion SET Taller_id=taller_id,Periodo_id=periodo_id, Usuario_id = usuario_id,
    Descripcion=descripcion,Estado='Activo', EstadoAsigacion='Asignado' WHERE Id=asignacion_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `registrar_categoria` (IN `p_nombres` VARCHAR(100), IN `p_descripcion` VARCHAR(100))   BEGIN
    INSERT INTO Categorias (
        NombresCategoria, 
        DescripcionCategoria 
    )
    VALUES (
        p_nombres, 
        p_descripcion 
    );
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `registrar_detalle_equipo` (IN `equipo_id` INT, IN `asignacion_id` INT, IN `cantidad` INT, IN `precio_unitario` DECIMAL(10,2))   BEGIN
    INSERT INTO detalle_asignacion_equipos(Equipo_Id,  Asignacion_Id, Cantidad, Precio_Unitario,Total )
     VALUES( equipo_id,asignacion_id, cantidad, precio_unitario,cantidad*precio_unitario);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `registrar_detalle_herramienta` (IN `herramienta_id` INT, IN `asignacion_id` INT, IN `cantidad` INT, IN `precio_unitario` DECIMAL(10,2))   BEGIN
    INSERT INTO detalle_asignacion_herramientas(Herramienta_Id, Asignacion_Id, Cantidad, Precio_Unitario,Total) 
    VALUES(herramienta_id, asignacion_id, cantidad, precio_unitario,cantidad*precio_unitario);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `registrar_detalle_insumo` (IN `insumo_id` INT, IN `asignacion_id` INT, IN `cantidad` INT, IN `precio_unitario` DECIMAL(10,2))   BEGIN
    INSERT INTO detalle_asignacion_insumos(Insumos_Id, Asignacion_Id, Cantidad, Precio_Unitario,Total) 
    VALUES(insumo_id, asignacion_id, cantidad, precio_unitario,cantidad*precio_unitario);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `registrar_equipo` (IN `p_co_modular` VARCHAR(200), IN `p_nombre` VARCHAR(150), IN `p_descripcion` VARCHAR(250), IN `p_categoria_id` INT, IN `p_proveedor_id` INT, IN `p_marca` VARCHAR(50), IN `p_modelo` VARCHAR(50), IN `p_serie` VARCHAR(100), IN `p_color` VARCHAR(30), IN `p_unidadmedida_id` INT, IN `p_medida` VARCHAR(50), IN `p_cantidad` INT, IN `p_precio_unitario` DECIMAL(10,2), IN `p_fecha_adquisicion` DATE, IN `p_estado_equipo` ENUM('Nuevo','Regular','Viejo'), IN `p_nota` VARCHAR(250))   BEGIN
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `registrar_herramienta` (IN `p_co_modular` VARCHAR(200), IN `p_nombre` VARCHAR(150), IN `p_descripcion` VARCHAR(250), IN `p_categoria_id` INT, IN `p_proveedor_id` INT, IN `p_marca` VARCHAR(50), IN `p_modelo` VARCHAR(50), IN `p_serie` VARCHAR(100), IN `p_color` VARCHAR(30), IN `p_unidadmedida_id` INT, IN `p_medida` VARCHAR(50), IN `p_cantidad` INT, IN `p_precio_unitario` DECIMAL(10,2), IN `p_fecha_adquisicion` DATE, IN `p_Estado_Herramienta` ENUM('Nuevo','Regular','Viejo'), IN `p_nota` VARCHAR(250))   BEGIN
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `registrar_Insumo` (IN `p_co_modular` VARCHAR(200), IN `p_nombre` VARCHAR(150), IN `p_descripcion` VARCHAR(250), IN `p_categoria_id` INT, IN `p_proveedor_id` INT, IN `p_marca` VARCHAR(50), IN `p_unidadmedida_id` INT, IN `p_medida` VARCHAR(50), IN `p_cantidad` INT, IN `p_precio_unitario` DECIMAL(10,2), IN `p_fecha_adquisicion` DATE, IN `p_estado_insumo` VARCHAR(50), IN `p_nota` VARCHAR(250))   BEGIN
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `registrar_periodo` (IN `p_nombre` VARCHAR(100), IN `p_fecha_inicio` DATE, IN `p_fecha_fin` DATE, IN `p_descripcion` VARCHAR(255))   BEGIN
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `registrar_proveedor` (IN `p_tipo_documento` ENUM('Dni','Ruc','Pasaporte'), IN `p_numero_documento` VARCHAR(20), IN `p_nombres` VARCHAR(100), IN `p_apellidos` VARCHAR(100), IN `p_telefono` VARCHAR(15), IN `p_direccion` VARCHAR(100), IN `p_id_cate` INT, IN `p_notas` VARCHAR(250))   BEGIN
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `registrar_rol` (IN `nombre` VARCHAR(50), IN `descripcion` VARCHAR(50))   BEGIN
    INSERT INTO Roles (NombreRol, Descripcion, Estado, FechaRegistro)
    VALUES (nombre, descripcion, 'Activo', NOW());
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `registrar_taller` (IN `p_nombre` VARCHAR(100), IN `p_descripcion` VARCHAR(255))   BEGIN
    INSERT INTO Talleres (
        T_Nombre, 
        T_Descripcion
    )
    VALUES (
        p_nombre, 
        p_descripcion
    );
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `registrar_ubicacion` (IN `u_nombre` VARCHAR(100), IN `u_descripcion` VARCHAR(255))   BEGIN
    INSERT INTO Ubicaciones (
        U_Nombre, 
        U_Descripcion
    )
    VALUES (
        u_nombre, 
        u_descripcion
    );
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `registrar_unidad_medida` (IN `p_nombres` VARCHAR(100), IN `p_abreviatura` VARCHAR(10), IN `p_descripcion` VARCHAR(100))   BEGIN
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `registrar_usuario` (IN `nombres` VARCHAR(100), IN `apellidos` VARCHAR(100), IN `doc` VARCHAR(20), IN `email` VARCHAR(40), IN `pass` VARCHAR(100), IN `rol_id` INT, IN `estado` VARCHAR(10))   BEGIN
    INSERT INTO Usuarios(
        NombresUsuario,
        ApellidosUsuario,
        NumeroDocumento,
        CorreoElectronico,
        Contrasena,
        Id_rol,
        Estado
    )
VALUES(
    nombres,
    apellidos,
    doc,
    email,
    pass,
    rol_id,
    estado
) ;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_login` (IN `user` VARCHAR(50), IN `pass` VARCHAR(30))   BEGIN
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `update_categoria` (IN `cate_id` INT, IN `p_nombres` VARCHAR(100), IN `p_descripcion` VARCHAR(100))   BEGIN
    UPDATE Categorias
    SET
        NombresCategoria = p_nombres,
        DescripcionCategoria = p_descripcion, 
        FechaActualizacion = CURRENT_TIMESTAMP
    WHERE Id = cate_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `update_user` (IN `user_id` INT, IN `nombres` VARCHAR(100), IN `apellidos` VARCHAR(100), IN `doc` VARCHAR(20), IN `email` VARCHAR(40), IN `pass` VARCHAR(100), IN `rol_id` INT, IN `estado` VARCHAR(10))   BEGIN
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
-- Estructura de tabla para la tabla `asignacion`
--

CREATE TABLE `asignacion` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `asignacion`
--

INSERT INTO `asignacion` (`Id`, `Codigo`, `Taller_Id`, `Periodo_id`, `Usuario_Id`, `EstadoAsigacion`, `Descripcion`, `Estado`, `FechaRegistro`, `FechaActualizacion`) VALUES
(1, 'AS-0001', 2, 1, 3, 'Asignado', 'Equipos asignados en perfeto estado al usuario', 'Activo', '2024-07-01 21:44:20', NULL),
(2, 'AS-0002', 4, 2, 4, 'Asignado', 'Asignado', 'Activo', '2024-07-01 21:45:42', NULL),
(3, 'AS-0003', 3, 1, 10, 'Asignado', 'Nueva asiganción', 'Activo', '2024-07-01 22:12:31', NULL);

--
-- Disparadores `asignacion`
--
DELIMITER $$
CREATE TRIGGER `antes_insert_asignacion` BEFORE INSERT ON `asignacion` FOR EACH ROW BEGIN
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
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `Id` int(11) NOT NULL,
  `NombresCategoria` varchar(50) NOT NULL,
  `DescripcionCategoria` varchar(50) DEFAULT NULL,
  `Estado` enum('Activo','Inactivo','Eliminado') NOT NULL DEFAULT 'Activo',
  `FechaRegistro` datetime NOT NULL DEFAULT current_timestamp(),
  `FechaActualizacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`Id`, `NombresCategoria`, `DescripcionCategoria`, `Estado`, `FechaRegistro`, `FechaActualizacion`) VALUES
(1, 'Herramientas Manuales', 'Herramientas operadas a mano', 'Activo', '2024-05-19 15:36:59', NULL),
(2, 'Computadoras', 'Equipos de cómputo y accesorios', 'Activo', '2024-05-19 15:36:59', NULL),
(3, 'Muebles', 'Mobiliario para el hogar y oficina', 'Activo', '2024-05-19 15:36:59', NULL),
(4, 'Electrónica', 'Dispositivos electrónicos', 'Activo', '2024-05-19 15:36:59', NULL),
(5, 'Confecciones', 'Confecciones', 'Activo', '2024-05-19 15:36:59', '2024-06-08 18:26:04'),
(6, 'Jardinería', 'Herramientas y suministros para jardín', 'Activo', '2024-05-19 15:36:59', NULL),
(7, 'Oficina', 'Suministros y muebles de oficina', 'Activo', '2024-05-19 15:36:59', NULL),
(8, 'Automotriz', 'Accesorios y repuestos para vehículos', 'Activo', '2024-05-19 15:36:59', NULL),
(9, 'Cocina', 'Utensilios y aparatos de cocina', 'Activo', '2024-05-19 15:36:59', NULL),
(10, 'Ferretería', 'Materiales y herramientas de construcción', 'Activo', '2024-05-19 15:36:59', NULL),
(11, 'Instrumentos Musicales', 'Instrumentos y accesorios musicales', 'Activo', '2024-05-19 15:36:59', NULL),
(12, '', '', 'Eliminado', '2024-05-22 21:47:13', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_asignacion_equipos`
--

CREATE TABLE `detalle_asignacion_equipos` (
  `Id` int(11) NOT NULL,
  `Equipo_Id` int(11) DEFAULT NULL,
  `Asignacion_Id` int(11) DEFAULT NULL,
  `Cantidad` int(11) DEFAULT NULL,
  `Precio_Unitario` decimal(10,2) DEFAULT NULL,
  `Total` decimal(10,2) DEFAULT NULL,
  `EstadoDetalle` enum('Asignado') NOT NULL DEFAULT 'Asignado',
  `Estado` enum('Activo','Inactivo','Eliminado') NOT NULL DEFAULT 'Activo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detalle_asignacion_equipos`
--

INSERT INTO `detalle_asignacion_equipos` (`Id`, `Equipo_Id`, `Asignacion_Id`, `Cantidad`, `Precio_Unitario`, `Total`, `EstadoDetalle`, `Estado`) VALUES
(1, 1, 1, 1, 144.00, 144.00, 'Asignado', 'Activo'),
(2, 3, 1, 1, 144.00, 144.00, 'Asignado', 'Activo'),
(6, 29, 2, 2, 750.00, 1500.00, 'Asignado', 'Activo'),
(7, 3, 3, 1, 144.00, 144.00, 'Asignado', 'Activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_asignacion_herramientas`
--

CREATE TABLE `detalle_asignacion_herramientas` (
  `Id` int(11) NOT NULL,
  `Herramienta_Id` int(11) DEFAULT NULL,
  `Asignacion_Id` int(11) DEFAULT NULL,
  `Cantidad` int(11) DEFAULT NULL,
  `Precio_Unitario` decimal(10,2) DEFAULT NULL,
  `Total` decimal(10,2) DEFAULT NULL,
  `EstadoDetalle` enum('Asignado') NOT NULL DEFAULT 'Asignado',
  `Estado` enum('Activo','Inactivo','Eliminado') NOT NULL DEFAULT 'Activo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detalle_asignacion_herramientas`
--

INSERT INTO `detalle_asignacion_herramientas` (`Id`, `Herramienta_Id`, `Asignacion_Id`, `Cantidad`, `Precio_Unitario`, `Total`, `EstadoDetalle`, `Estado`) VALUES
(1, 2, 1, 1, 500.00, 500.00, 'Asignado', 'Activo'),
(2, 4, 2, 1, 25.00, 25.00, 'Asignado', 'Activo'),
(3, 4, 2, 2, 25.00, 50.00, 'Asignado', 'Activo'),
(4, 2, 3, 1, 500.00, 500.00, 'Asignado', 'Activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_asignacion_insumos`
--

CREATE TABLE `detalle_asignacion_insumos` (
  `Id` int(11) NOT NULL,
  `Insumos_Id` int(11) DEFAULT NULL,
  `Asignacion_Id` int(11) DEFAULT NULL,
  `Cantidad` int(11) DEFAULT NULL,
  `Precio_Unitario` decimal(10,2) DEFAULT NULL,
  `Total` decimal(10,2) DEFAULT NULL,
  `EstadoDetalle` enum('Asignado') NOT NULL DEFAULT 'Asignado',
  `Estado` enum('Activo','Inactivo','Eliminado') NOT NULL DEFAULT 'Activo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detalle_asignacion_insumos`
--

INSERT INTO `detalle_asignacion_insumos` (`Id`, `Insumos_Id`, `Asignacion_Id`, `Cantidad`, `Precio_Unitario`, `Total`, `EstadoDetalle`, `Estado`) VALUES
(1, 2, 1, 1, 0.10, 0.10, 'Asignado', 'Activo'),
(2, 1, 2, 1, 2.50, 2.50, 'Asignado', 'Activo'),
(3, 2, 3, 1, 0.10, 0.10, 'Asignado', 'Activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipos`
--

CREATE TABLE `equipos` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `equipos`
--

INSERT INTO `equipos` (`Id`, `Codigo`, `Co_Modular`, `Nombre`, `Descripcion`, `Categoria_id`, `Proveedor_id`, `Marca`, `Modelo`, `Serie`, `Color`, `UnidadMedida_id`, `Medida`, `Cantidad`, `Precio_Unitario`, `Total`, `Fecha_Adquision`, `Estado_Equipo`, `Nota`, `Estado`, `FechaRegistro`, `FechaActualizacion`) VALUES
(1, 'EQ-00001', '67502360', 'MAQUINA DE COSER', 'DOMESTICA COSTURA RECTA', 1, 1, 'SINGER', 'N/A', 'RB55571', 'MARRON', 1, NULL, 2, 144.00, 2500.00, NULL, 'Regular', NULL, 'Activo', '2024-06-08 18:24:23', NULL),
(2, 'EQ-00002', '67502360', 'MAQUINA DE COSER', 'DOMESTICA COSTURA RECTA', 3, 1, 'SINGER', 'N/A', 'RB56301', 'MARRON', 1, 'Caja de 100', 2, 120.00, 240.00, '2024-06-10', 'Regular', '', 'Activo', '2024-06-08 18:24:23', '2024-06-10 17:56:21'),
(3, 'EQ-00003', '67502360', 'MAQUINA DE COSER', 'DOMESTICA COSTURA RECTA', 1, 1, 'SINGER', 'N/A', 'RB219418', 'MARRON', 1, NULL, 1, 144.00, NULL, NULL, 'Regular', NULL, 'Activo', '2024-06-08 18:24:23', NULL),
(4, 'EQ-00004', '67502360', 'MAQUINA DE COSER', 'DOMESTICA COSTURA RECTA', 1, 1, 'SINGER', 'N/A', 'Nª0172291', 'MARRON', 1, NULL, 1, 144.00, NULL, NULL, 'Regular', NULL, 'Activo', '2024-06-08 18:24:23', NULL),
(5, 'EQ-00005', '67502360', 'MAQUINA DE COSER', 'DOMESTICA COSTURA RECTA', 1, 1, 'SINGER', 'N/A', 'RB055980', 'MARRON', 1, NULL, 1, 144.00, NULL, NULL, 'Regular', NULL, 'Activo', '2024-06-08 18:24:23', NULL),
(6, 'EQ-00006', '67502360', 'MAQUINA DE COSER', 'DOMESTICA COSTURA RECTA', 1, 1, 'SINGER', 'N/A', 'Nª71203', 'MARRON', 1, NULL, 1, 144.00, NULL, NULL, 'Regular', NULL, 'Activo', '2024-06-08 18:24:23', NULL),
(7, 'EQ-00007', '67502360', 'MAQUINA DE COSER', 'DOMESTICA COSTURA RECTA', 1, 1, 'SINGER UNIVERSAL', 'N/A', 'Nª925417', 'MARRON', 1, NULL, 1, 144.00, NULL, NULL, 'Regular', NULL, 'Activo', '2024-06-08 18:24:23', NULL),
(8, 'EQ-00008', '67502360', 'MAQUINA DE COSER', 'DOMESTICA COSTURA RECTA', 1, 1, 'SINGER', 'N/A', 'Nª55879', 'MARRON', 1, NULL, 1, 144.00, NULL, NULL, 'Regular', NULL, 'Activo', '2024-06-08 18:24:23', NULL),
(9, 'EQ-00009', '67502360', 'MAQUINA DE COSER', 'DOMESTICA COSTURA RECTA', 1, 1, 'SINGER', 'Nª529630', 'N/A', 'MARRON', 1, NULL, 1, 144.00, NULL, NULL, 'Regular', NULL, 'Activo', '2024-06-08 18:24:23', NULL),
(10, 'EQ-00010', '67502360', 'MAQUINA DE COSER', 'DOMESTICA COSTURA RECTA', 1, 1, 'SINGER', 'N/A', 'RB 282159', 'MARRON', 1, NULL, 1, 144.00, NULL, NULL, 'Regular', NULL, 'Activo', '2024-06-08 18:24:23', NULL),
(11, 'EQ-00011', '67502360', 'MAQUINA DE COSER', 'DOMESTICA COSTURA RECTA', 1, 1, 'SINGER', 'N/A', 'ES 07987', 'MARRON', 1, NULL, 1, 144.00, NULL, NULL, 'Regular', NULL, 'Activo', '2024-06-08 18:24:23', NULL),
(12, 'EQ-00012', '67502360', 'MAQUINA DE COSER', 'DOMESTICA COSTURA RECTA', 1, 1, 'SINGER', 'N/A', 'Nª56056', 'MARRON', 1, NULL, 1, 144.00, NULL, NULL, 'Regular', NULL, 'Activo', '2024-06-08 18:24:23', NULL),
(13, 'EQ-00013', '67502360', 'MAQUINA DE COSER', 'DOMESTICA COSTURA RECTA', 1, 1, 'SINGER', 'N/A', 'N/A', 'MARRON', 1, NULL, 1, 144.00, NULL, NULL, 'Regular', NULL, 'Activo', '2024-06-08 18:24:23', NULL),
(14, 'EQ-00014', '67502584', 'MAQUINA DE COSER', 'SEMINDUSTRIAL COSTURA RECTA', 1, 1, 'SINGER', 'N/A', '318-229796', 'MARRON', 1, NULL, 1, 304.00, NULL, NULL, 'Regular', NULL, 'Activo', '2024-06-08 18:24:23', NULL),
(15, 'EQ-00015', '67502360', 'MAQUINA DE COSER', 'SEMINDUSTRIAL COSTURA RECTA ZIGZAG', 1, 1, 'FAEDA', 'N/A', 'Nª961028', 'BLANCO- MARRON', 1, NULL, 1, 224.00, NULL, NULL, 'Regular', NULL, 'Activo', '2024-06-08 18:24:23', NULL),
(16, 'EQ-00016', '67502580', 'MAQUINA REMALLADORA', 'SEMINDUSTRIAL REMALLAD SEMIN', 1, 1, 'MAMYLOCK', 'N/A', 'N/A', 'BLANCA', 1, NULL, 1, 577.84, NULL, NULL, '', NULL, 'Activo', '2024-06-08 18:24:23', NULL),
(17, 'EQ-00017', '67502470', 'MAQUINA DE COSER', 'FAMILIAR COSTURA RECTA', 1, 1, 'SINGER', 'N/A', 'Nª1528N', 'MALETIN BLANCO', 1, NULL, 1, 969.60, NULL, NULL, '', NULL, 'Activo', '2024-06-08 18:24:23', NULL),
(18, 'EQ-00018', '67502360', 'MAQUINA DE COSER', 'FAMILIAR COSTURA RECTA', 1, 1, 'SINGER', 'N/A', 'Nª1529N', 'MALETIN BLANCO', 1, NULL, 1, 320.00, NULL, NULL, '', NULL, 'Activo', '2024-06-08 18:24:23', NULL),
(19, 'EQ-00019', '67502360', 'Máquina De Coser', 'FAMILIAR COSTURA RECTA', 1, 1, 'SINGER', 'N/A', 'Nª179821', 'MARRON', 1, NULL, 1, 320.00, NULL, NULL, '', NULL, 'Activo', '2024-06-08 18:24:23', NULL),
(20, 'EQ-00020', '67502360', 'Máquina De Coser', 'FAMILIAR COSTURA RECTA', 1, 1, 'SINGER', 'N/A', 'Nª- 823811', 'MARON', 1, NULL, 1, 320.00, NULL, NULL, '', NULL, 'Activo', '2024-06-08 18:24:23', NULL),
(21, 'EQ-00021', NULL, 'Máquina Remalladora', 'INDUSTRIAL REMALLADORA', 1, 1, 'SIRUBA', 'N/A', 'Nª516M2-35', 'BLANCO', 1, NULL, 1, 1960.00, NULL, NULL, '', NULL, 'Activo', '2024-06-08 18:24:23', NULL),
(22, 'EQ-00022', NULL, 'Máquina Remalladora', 'INDUSTRIAL REMALLADORA', 1, 1, 'SINGER', 'N/A', 'Nª32403119', 'BLANCO', 1, NULL, 1, 1600.00, NULL, NULL, '', NULL, 'Activo', '2024-06-08 18:24:23', NULL),
(23, 'EQ-00023', NULL, 'Máquina Remalladora', 'INDUSTRIAL REMALLADORA', 1, 1, 'SINGER', 'N/A', 'Nª32403101', 'BLANCO', 1, NULL, 1, 1600.00, NULL, NULL, '', NULL, 'Activo', '2024-06-08 18:24:23', NULL),
(24, 'EQ-00024', NULL, 'Máquina Costura Recta', 'INDUSTRIAL COSTURA RECTA', 1, 1, 'JUKI', 'N/A', 'Nª67502470', 'BLANCO', 1, NULL, 1, 1240.00, NULL, NULL, '', NULL, 'Activo', '2024-06-08 18:24:23', NULL),
(25, 'EQ-00025', NULL, 'Máquina Costura Recta', 'INDUSTRIAL INDUSTRIAL', 1, 1, 'SINGER', 'N/A', 'Nª DOEK04069', 'BLANCO', 1, NULL, 1, 1200.00, NULL, NULL, '', NULL, 'Activo', '2024-06-08 18:24:23', NULL),
(26, 'EQ-00026', NULL, 'Máquina Costura Recta', 'INDUSTRIAL INDUSTRIAL', 1, 1, 'SINGER', 'N/A', 'Nª132491543', 'BLANCO', 1, NULL, 1, 1200.00, NULL, NULL, '', NULL, 'Activo', '2024-06-08 18:24:23', NULL),
(27, 'EQ-00027', NULL, 'Máquina Recubridora', 'INDUSTRIAL INDUSTRIAL', 1, 1, 'SINGER', 'N/A', 'Nª12435077', 'BLANCO', 1, NULL, 1, 2400.00, NULL, NULL, '', NULL, 'Activo', '2024-06-08 18:24:23', NULL),
(28, 'EQ-00028', 'CM-001', 'Maquina recta', 'INDUSTRIAL INDUSTRIAL', 5, 4, 'COBALT', 'N/A', 'CM-9510 M', 'BLANCO', 4, '20 CM ', 1, 1790.00, 1790.00, '2024-06-08', 'Nuevo', 'INDUSTRIAL INDUSTRIAL', 'Activo', '2024-06-08 18:24:23', '2024-06-08 18:27:03'),
(29, 'EQ-00029', 'CM-001', 'Computadora', 'Computadora de escritorio con procesador Intel Core i5 y 8GB de RAM', 1, 1, 'HP', 'Pavilion', 'XYZ123', 'Negro', 1, 'Unidad', 5, 750.00, 3750.00, '2024-06-07', 'Nuevo', 'Equipos para oficina', 'Activo', '2024-06-10 17:57:59', NULL),
(30, 'EQ-00030', 'CM-002', 'Mouse', 'Mouse óptico con cable USB', 2, 1, 'Logitech', 'M100', 'ABC123', 'Negro', 2, 'Unidad', 10, 15.00, 150.00, '2024-06-07', 'Nuevo', 'Accesorio para computadora', 'Activo', '2024-06-10 17:57:59', NULL),
(31, 'EQ-00031', 'CM-003', 'Memorias', 'Memoria RAM DDR4 de 8GB', 3, 1, 'Kingston', 'HyperX', '123XYZ', 'Negro', 3, 'Unidad', 20, 40.00, 800.00, '2024-06-07', 'Nuevo', 'Componente de computadora', 'Activo', '2024-06-10 17:57:59', NULL);

--
-- Disparadores `equipos`
--
DELIMITER $$
CREATE TRIGGER `antes_insert_equipos` BEFORE INSERT ON `equipos` FOR EACH ROW BEGIN
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
-- Estructura de tabla para la tabla `herramientas`
--

CREATE TABLE `herramientas` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `herramientas`
--

INSERT INTO `herramientas` (`Id`, `Codigo`, `Co_Modular`, `Nombre`, `Descripcion`, `Categoria_id`, `Proveedor_id`, `Marca`, `Modelo`, `Serie`, `Color`, `UnidadMedida_id`, `Medida`, `Cantidad`, `Precio_Unitario`, `Total`, `Fecha_Adquision`, `Estado_Herramienta`, `Nota`, `Estado`, `FechaRegistro`, `FechaActualizacion`) VALUES
(1, 'HOM-00001', 'CM01', 'Martillo', 'Herramienta de mano con cabeza metálica y mango de madera.', 1, 1, 'Genérica', NULL, NULL, 'Metálico', 1, '', 10, 15.00, 150.00, '2024-06-07', 'Nuevo', 'Herramienta básica de carpintería.', 'Activo', '2024-06-07 21:58:34', '2024-06-07 21:58:34'),
(2, 'HOM-00002', 'CM02', 'Cortadora', 'Máquina cortadora de metales y plásticos.', 1, 1, 'CortaMAX', 'CM5000', 'CORTA-2023', 'Gris', 1, '', 5, 500.00, 2500.00, '2023-12-15', 'Regular', 'Máquina de alto rendimiento para trabajos industriales.', 'Activo', '2024-06-07 21:58:34', '2024-06-07 21:58:34'),
(3, 'HOM-00003', 'CM03', 'Mesas de Metal', 'Conjunto de mesas de trabajo fabricadas en acero inoxidable.', 1, 1, 'InduSteel', 'Industrial Pro', 'IND-2024', 'Plateado', 1, '', 1, 1200.00, 3600.00, '2024-03-20', 'Nuevo', 'Ideales para uso en talleres mecánicos.', 'Activo', '2024-06-07 21:58:34', '2024-06-07 21:58:34'),
(4, 'HOM-00004', 'CM04', 'Extensión', 'Cable de extensión eléctrica de 10 metros.', 1, 1, 'PowerCable', 'HeavyDuty', 'EXT-10M', 'Naranja', 1, '10m', 8, 25.00, 200.00, '2024-05-10', 'Nuevo', 'Cable resistente para uso en exteriores.', 'Activo', '2024-06-07 21:58:34', '2024-06-07 21:58:34'),
(5, 'HOM-00005', 'CM05', 'Estante', 'Estante metálico de 5 niveles.', 3, 1, 'MetalMax', 'Industrial 5000', 'EST-5N', 'Negro', 1, '10', 6, 150.00, 900.00, '2024-04-02', 'Nuevo', 'Estante resistente y duradero para almacenamiento.', 'Activo', '2024-06-07 21:58:34', '2024-06-07 22:04:21'),
(6, 'HOM-00006', 'CM-001', 'test', 'test', 3, 4, 'test', 'test', 'test', 'Negro', 3, 'test', 9, 40.00, 360.00, '2024-06-15', 'Nuevo', 'test', 'Eliminado', '2024-06-07 22:05:12', NULL);

--
-- Disparadores `herramientas`
--
DELIMITER $$
CREATE TRIGGER `antes_insert_herramientas` BEFORE INSERT ON `herramientas` FOR EACH ROW BEGIN
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
-- Estructura de tabla para la tabla `insumos`
--

CREATE TABLE `insumos` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `insumos`
--

INSERT INTO `insumos` (`Id`, `Codigo`, `Co_Modular`, `Nombre`, `Descripcion`, `Categoria_id`, `Proveedor_id`, `Marca`, `UnidadMedida_id`, `Medida`, `Cantidad`, `Precio_Unitario`, `Total`, `Fecha_Adquision`, `Estado_Insumo`, `Nota`, `Estado`, `FechaRegistro`, `FechaActualizacion`) VALUES
(1, 'I-00001', 'MOD001', 'Agujas de coser', 'Agujas de alta calidad para coser a mano o a máquina', 1, 1, 'Singer', 1, 'Pack de 10', 50, 2.50, 125.00, '2024-01-15', 'Nuevo', 'Uso para textiles', 'Activo', '2024-06-08 16:08:39', '2024-06-08 18:16:05'),
(2, 'I-00002', 'MOD002', 'Tornillos', 'Tornillos de acero inoxidable para madera y metal', 1, 1, 'Truper', 1, 'Caja de 100', 200, 0.10, 20.00, '2024-02-10', 'Nuevo', 'Para uso general', 'Activo', '2024-06-08 16:08:39', NULL),
(3, 'I-00003', 'test', 'test', 'test', 3, 4, 'HP', 3, '10', 22, 50.00, 1100.00, '2024-06-15', 'Regular', 'test', 'Eliminado', '2024-06-08 18:13:08', '2024-06-08 18:13:56');

--
-- Disparadores `insumos`
--
DELIMITER $$
CREATE TRIGGER `antes_insert_insumos` BEFORE INSERT ON `insumos` FOR EACH ROW BEGIN
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
-- Estructura de tabla para la tabla `periodos`
--

CREATE TABLE `periodos` (
  `Id` int(11) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `Fecha_Inicio` date DEFAULT NULL,
  `Fecha_Fin` date DEFAULT NULL,
  `Descripcion` varchar(255) DEFAULT NULL,
  `Estado` enum('Activo','Inactivo','Eliminado') NOT NULL DEFAULT 'Activo',
  `FechaRegistro` datetime NOT NULL DEFAULT current_timestamp(),
  `FechaActualizacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `periodos`
--

INSERT INTO `periodos` (`Id`, `Nombre`, `Fecha_Inicio`, `Fecha_Fin`, `Descripcion`, `Estado`, `FechaRegistro`, `FechaActualizacion`) VALUES
(1, 'Enero 2024', '2024-01-01', '2024-01-31', 'Inventario mensual de enero 2024', 'Activo', '2024-06-06 00:00:55', NULL),
(2, 'Febrero 2024', '2024-02-01', '2024-02-28', 'Inventario mensual de febrero 2024', 'Activo', '2024-06-06 00:00:55', NULL),
(3, 'Mayo 2024', '2024-01-01', '2024-03-31', 'Inventario del primer trimestre de 2024', 'Activo', '2024-06-06 00:00:55', '2024-06-06 00:11:28'),
(4, 'Julio 2024', '2024-04-01', '2024-06-30', 'Inventario del segundo trimestre de 2024', 'Activo', '2024-06-06 00:00:55', '2024-06-06 00:11:20'),
(5, 'Marzo 2024', '2024-03-01', '2024-03-31', 'Inventario mensual de marzo 2024', 'Inactivo', '2024-06-06 00:00:55', NULL),
(6, 'test1', '2024-06-07', '2024-06-07', 'test1', 'Eliminado', '2024-06-06 00:11:41', '2024-06-06 00:11:51');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `proveedores`
--

INSERT INTO `proveedores` (`Id`, `Tipo_Documento`, `NumeroDocumento`, `P_Nombres`, `P_Apellidos`, `Telefono`, `Direccion`, `Id_Cate`, `Notas`, `Estado`, `FechaRegistro`, `FechaActualizacion`) VALUES
(1, 'Dni', '73569079', 'Ministerio', 'de educación', '901202339', '123 Calle Principal', 7, 'test', 'Activo', '2024-05-23 00:28:25', '2024-06-07 18:49:38'),
(4, 'Ruc', '73569079', 'Proveedor', 'Generico', '98738646', 'La jalca grande camino a torre bitel', 8, 'Proveedor de muebles', 'Activo', '2024-05-23 21:38:23', '2024-06-10 22:36:44'),
(5, 'Pasaporte', '', '', '', '', '', 7, '', 'Eliminado', '2024-05-26 23:38:17', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `Id` int(11) NOT NULL,
  `NombreRol` varchar(50) DEFAULT NULL,
  `Descripcion` varchar(50) DEFAULT NULL,
  `Estado` enum('Activo','Inactivo','Eliminado') NOT NULL,
  `FechaRegistro` datetime DEFAULT NULL,
  `FechaActualizacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`Id`, `NombreRol`, `Descripcion`, `Estado`, `FechaRegistro`, `FechaActualizacion`) VALUES
(1, 'Administrador', 'Rol con acceso total', 'Activo', '2024-05-19 15:36:59', '2024-05-19 15:36:59'),
(2, 'Profesor(a)', 'Rol con acceso limitado', 'Activo', '2024-05-19 15:36:59', '2024-06-14 22:19:02'),
(3, 'Jefe de almacen', 'test', 'Activo', NULL, '2024-06-13 19:03:16');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `talleres`
--

CREATE TABLE `talleres` (
  `Id` int(11) NOT NULL,
  `T_Nombre` varchar(100) NOT NULL,
  `T_Descripcion` varchar(255) DEFAULT NULL,
  `Estado` enum('Activo','Inactivo','Eliminado') NOT NULL DEFAULT 'Activo',
  `FechaRegistro` datetime NOT NULL DEFAULT current_timestamp(),
  `FechaActualizacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `talleres`
--

INSERT INTO `talleres` (`Id`, `T_Nombre`, `T_Descripcion`, `Estado`, `FechaRegistro`, `FechaActualizacion`) VALUES
(1, 'Computación e Informática', 'Cursos de programación, desarrollo web, y manejo de software de oficina.', 'Activo', '2024-06-05 17:27:43', NULL),
(2, 'Cocina y Gastronomía', 'Cursos de cocina peruana e internacional, pastelería y panadería.', 'Activo', '2024-06-05 17:27:43', NULL),
(3, 'Electricidad y Electrónica', 'Talleres de instalaciones eléctricas, reparación de electrodomésticos  ', 'Activo', '2024-06-05 17:27:43', '2024-06-05 23:29:06'),
(4, 'Mecánica Automotriz', 'Cursos de mantenimiento y reparación de vehículos', 'Activo', '2024-06-05 17:27:43', '2024-06-05 23:28:56'),
(5, 'Moda y Confección', 'Diseño de moda, confección de prendas, y patronaje.', 'Activo', '2024-06-05 17:27:43', '2024-06-05 23:18:26'),
(6, 'Carpintería y Ebanistería', 'Cursos de fabricación de muebles, diseño en madera y restauración.', 'Activo', '2024-06-05 17:27:43', NULL),
(7, 'Belleza y Estética', 'Talleres de peluquería, cosmetología, y manicure/pedicure.', 'Activo', '2024-06-05 17:27:43', NULL),
(8, 'Marketing Digital y Redes Sociales', 'Cursos de gestión de redes sociales, publicidad en línea.', 'Activo', '2024-06-05 17:27:43', '2024-06-05 23:33:19'),
(9, 'Idiomas', 'Talleres de inglés, francés, portugués, y otros idiomas extranjeros.', 'Activo', '2024-06-05 17:27:43', NULL),
(10, 'Administración y Contabilidad', 'Cursos de administración de empresas, contabilidad básica y avanzada ', 'Activo', '2024-06-05 17:27:43', '2024-06-05 23:29:12'),
(11, 'test', 'test', 'Eliminado', '2024-06-05 23:19:57', NULL),
(12, 'test2', 'test2', 'Eliminado', '2024-06-05 23:20:45', '2024-06-05 23:20:53'),
(13, 'test', 'Unidad de conteo', 'Eliminado', '2024-06-05 23:22:12', '2024-06-05 23:29:43'),
(14, 'test', 'test', 'Eliminado', '2024-06-05 23:22:22', '2024-06-05 23:35:45'),
(15, 'test1', 'test2', 'Eliminado', '2024-06-05 23:29:30', NULL),
(16, 'Construcciones metalicas', 'Talleres de construcciones metalicas', 'Activo', '2024-06-07 22:17:41', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ubicaciones`
--

CREATE TABLE `ubicaciones` (
  `Id` int(11) NOT NULL,
  `U_Nombre` varchar(100) NOT NULL,
  `U_Descripcion` varchar(255) DEFAULT NULL,
  `Estado` enum('Activo','Inactivo','Eliminado') NOT NULL DEFAULT 'Activo',
  `FechaRegistro` datetime NOT NULL DEFAULT current_timestamp(),
  `FechaActualizacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ubicaciones`
--

INSERT INTO `ubicaciones` (`Id`, `U_Nombre`, `U_Descripcion`, `Estado`, `FechaRegistro`, `FechaActualizacion`) VALUES
(1, 'Taller de Operador de Computo\n', 'CONST. METAL\n', 'Activo', '2024-05-24 11:07:11', NULL),
(2, 'Sala de Cocina', 'Ubicación para utensilios y equipos de cocina', 'Activo', '2024-06-06 00:21:48', NULL),
(3, 'Aula de Cómputo', 'Ubicación para equipos y herramientas de informática', 'Activo', '2024-06-06 00:21:48', NULL),
(4, 'Laboratorio de Manualidades', 'Ubicación para equipos de laboratorio y materiales científicos', 'Activo', '2024-06-06 00:21:48', NULL),
(5, 'Taller de Carpintería', 'Ubicación para herramientas y maquinaria de carpintería', 'Activo', '2024-06-06 00:21:48', NULL),
(6, 'Almacen del aula 05', 'Ubicación para equipos de ejercicio y entrenamiento físico', 'Activo', '2024-06-06 00:21:48', NULL),
(7, 'test1', 'test1', 'Eliminado', '2024-06-06 00:25:40', '2024-06-06 00:25:45');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unidadmedida`
--

CREATE TABLE `unidadmedida` (
  `Id` int(11) NOT NULL,
  `NombresUnd` varchar(50) NOT NULL,
  `AbreviaturaUnd` varchar(10) DEFAULT NULL,
  `DescripcionUnd` varchar(50) DEFAULT NULL,
  `Estado` enum('Activo','Inactivo','Eliminado') NOT NULL DEFAULT 'Activo',
  `FechaRegistro` datetime NOT NULL DEFAULT current_timestamp(),
  `FechaActualizacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `unidadmedida`
--

INSERT INTO `unidadmedida` (`Id`, `NombresUnd`, `AbreviaturaUnd`, `DescripcionUnd`, `Estado`, `FechaRegistro`, `FechaActualizacion`) VALUES
(1, 'Kilogramo', 'kg', 'Unidad de medida de masa', 'Activo', '2024-05-19 15:36:59', NULL),
(2, 'Litro', 'L', 'Unidad de medida de volumen', 'Activo', '2024-05-19 15:36:59', NULL),
(3, 'Metro', 'm', 'Unidad de medida de longitud', 'Activo', '2024-05-19 15:36:59', NULL),
(4, 'Pieza', 'pz', 'Unidad de conteo', 'Activo', '2024-05-19 15:36:59', '2024-05-23 21:32:20'),
(5, 'Caja', 'cj', 'Unidad de empaquetado', 'Activo', '2024-05-19 15:36:59', NULL),
(6, 'Centímetro', 'cm', 'Unidad de medida de longitud', 'Activo', '2024-06-07 22:13:20', NULL),
(7, 'Gramo', 'g', 'Unidad de medida de masa', 'Activo', '2024-06-07 22:13:38', NULL),
(8, 'Mililitro', 'ml', 'Unidad de medida de volumen', 'Activo', '2024-06-07 22:14:05', NULL),
(9, 'test1', 'test1', 'test1', 'Eliminado', '2024-06-13 19:18:50', '2024-06-13 19:18:58');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
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
  `Estado` enum('Activo','Inactivo','Eliminado') NOT NULL,
  `FechaRegistro` datetime DEFAULT NULL,
  `FechaActualizacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`Id`, `NombresUsuario`, `ApellidosUsuario`, `NumeroDocumento`, `Telefono`, `CorreoElectronico`, `Contrasena`, `Id_rol`, `Notificaciones`, `Direccion`, `Url_foto`, `Genero`, `Estado`, `FechaRegistro`, `FechaActualizacion`) VALUES
(1, 'Juan', 'Pérez', '123456789', '555-1234', 'juan.perez@example.com', '12345', 1, 'NO', 'Calle Falsa 123', 'url_foto1.jpg', 'Masculino', 'Inactivo', '2024-05-19 15:36:59', '2024-05-19 15:36:59'),
(2, 'María', 'Gómez', '987654321', '555-5678', 'maria.gomez@example.com', '12345', 2, 'SI', 'Avenida Siempre Viva 742', 'url_foto2.jpg', 'Femenino', 'Activo', '2024-05-19 15:36:59', '2024-05-19 15:36:59'),
(3, 'Carlos', 'Rodríguez', '456789123', '555-8765', 'carlos.rodriguez@example.com', '12345', 1, 'NO', 'Calle Principal 456', 'url_foto3.jpg', 'Masculino', 'Activo', '2024-05-19 15:36:59', '2024-05-19 15:36:59'),
(4, 'Ana', 'Martínez', '789123456', '555-3456', 'ana.martinez@example.com', '12345', 2, 'NO', 'Calle Secundaria 789', 'url_foto4.jpg', 'Femenino', 'Activo', '2024-05-19 15:36:59', '2024-05-19 15:36:59'),
(5, 'Luis', 'Fernández', '321654987', '555-6543', 'luis.fernandez@example.com', '12345', 1, 'SI', 'Avenida Central 321', 'url_foto5.jpg', 'Masculino', 'Inactivo', '2024-05-19 15:36:59', '2024-05-19 15:36:59'),
(6, 'Elena', 'López', '654987321', '555-4321', 'elena.lopez@example.com', '12345', 2, 'NO', 'Callejón del Gato 654', 'url_foto6.jpg', 'Femenino', 'Activo', '2024-05-19 15:36:59', '2024-05-19 15:36:59'),
(7, 'Miguel', 'Sánchez', '159753468', '555-9876', 'miguel.sanchez@example.com', '12345', 1, 'SI', 'Boulevard Principal 159', 'url_foto7.jpg', 'Masculino', 'Inactivo', '2024-05-19 15:36:59', '2024-05-19 15:36:59'),
(8, 'Isabel', 'Torres', '357159486', '555-6789', 'isabel.torres@example.com', '12345', 2, 'NO', 'Calle Estrecha 357', 'url_foto8.jpg', 'Femenino', 'Activo', '2024-05-19 15:36:59', '2024-05-19 15:36:59'),
(9, 'Jorge', 'Ramírez', '753951486', '555-2345', 'jorge.ramirez@example.com', '12345', 1, 'SI', 'Avenida Ancha 753', 'url_foto9.jpg', 'Masculino', 'Activo', '2024-05-19 15:36:59', '2024-05-19 15:36:59'),
(10, 'Laura', 'Mendoza', '951753486', '555-7654', 'laura.mendoza@example.com', '12345', 2, 'NO', 'Callejón del Sol 951', 'url_foto10.jpg', 'Femenino', 'Activo', '2024-05-19 15:36:59', '2024-05-19 15:36:59'),
(11, 'Usuario del Sistema', 'General', '123789456', '555-3457', 'admin@gmail.com', '12345', 1, 'NO', 'Calle del Río 123', 'url_foto11.jpg', 'Masculino', 'Activo', '2024-05-19 15:36:59', '2024-05-19 15:36:59');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `asignacion`
--
ALTER TABLE `asignacion`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `FK_Asignacion_Taller` (`Taller_Id`),
  ADD KEY `FK_Asignacion_Periodo` (`Periodo_id`),
  ADD KEY `FK_Asignacion_Usuario` (`Usuario_Id`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `detalle_asignacion_equipos`
--
ALTER TABLE `detalle_asignacion_equipos`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `FK_Detalle_Equipo` (`Equipo_Id`),
  ADD KEY `FK_Detalle_Asignacion` (`Asignacion_Id`);

--
-- Indices de la tabla `detalle_asignacion_herramientas`
--
ALTER TABLE `detalle_asignacion_herramientas`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `FK_Detalle_Herramienta` (`Herramienta_Id`),
  ADD KEY `FK_Detalle_AsignacionH` (`Asignacion_Id`);

--
-- Indices de la tabla `detalle_asignacion_insumos`
--
ALTER TABLE `detalle_asignacion_insumos`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `FK_Detalle_Insumos` (`Insumos_Id`),
  ADD KEY `FK_Detalle_AsignacionI` (`Asignacion_Id`);

--
-- Indices de la tabla `equipos`
--
ALTER TABLE `equipos`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `FK_Equipos_Unidad` (`UnidadMedida_id`),
  ADD KEY `FK_Equipos_Category` (`Categoria_id`),
  ADD KEY `FK_Equipos_Proveedor` (`Proveedor_id`);

--
-- Indices de la tabla `herramientas`
--
ALTER TABLE `herramientas`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `FK_Herramienta_Unidad` (`UnidadMedida_id`),
  ADD KEY `FK_Herramienta_Category` (`Categoria_id`),
  ADD KEY `FK_Herramienta_Proveedor` (`Proveedor_id`);

--
-- Indices de la tabla `insumos`
--
ALTER TABLE `insumos`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `FK_Insumo_Unidad` (`UnidadMedida_id`),
  ADD KEY `FK_Insumo_Category` (`Categoria_id`),
  ADD KEY `FK_Insumo_Proveedor` (`Proveedor_id`);

--
-- Indices de la tabla `periodos`
--
ALTER TABLE `periodos`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `FK_Provider_Category` (`Id_Cate`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `talleres`
--
ALTER TABLE `talleres`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `ubicaciones`
--
ALTER TABLE `ubicaciones`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `unidadmedida`
--
ALTER TABLE `unidadmedida`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `FK_UserRol` (`Id_rol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `asignacion`
--
ALTER TABLE `asignacion`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `detalle_asignacion_equipos`
--
ALTER TABLE `detalle_asignacion_equipos`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `detalle_asignacion_herramientas`
--
ALTER TABLE `detalle_asignacion_herramientas`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `detalle_asignacion_insumos`
--
ALTER TABLE `detalle_asignacion_insumos`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `equipos`
--
ALTER TABLE `equipos`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT de la tabla `herramientas`
--
ALTER TABLE `herramientas`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `insumos`
--
ALTER TABLE `insumos`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `periodos`
--
ALTER TABLE `periodos`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `talleres`
--
ALTER TABLE `talleres`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `ubicaciones`
--
ALTER TABLE `ubicaciones`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `unidadmedida`
--
ALTER TABLE `unidadmedida`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `asignacion`
--
ALTER TABLE `asignacion`
  ADD CONSTRAINT `FK_Asignacion_Periodo` FOREIGN KEY (`Periodo_id`) REFERENCES `talleres` (`Id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_Asignacion_Taller` FOREIGN KEY (`Taller_Id`) REFERENCES `talleres` (`Id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_Asignacion_Usuario` FOREIGN KEY (`Usuario_Id`) REFERENCES `usuarios` (`Id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `detalle_asignacion_equipos`
--
ALTER TABLE `detalle_asignacion_equipos`
  ADD CONSTRAINT `FK_Detalle_Asignacion` FOREIGN KEY (`Asignacion_Id`) REFERENCES `asignacion` (`Id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_Detalle_Equipo` FOREIGN KEY (`Equipo_Id`) REFERENCES `equipos` (`Id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `detalle_asignacion_herramientas`
--
ALTER TABLE `detalle_asignacion_herramientas`
  ADD CONSTRAINT `FK_Detalle_AsignacionH` FOREIGN KEY (`Asignacion_Id`) REFERENCES `asignacion` (`Id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_Detalle_Herramienta` FOREIGN KEY (`Herramienta_Id`) REFERENCES `herramientas` (`Id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `detalle_asignacion_insumos`
--
ALTER TABLE `detalle_asignacion_insumos`
  ADD CONSTRAINT `FK_Detalle_AsignacionI` FOREIGN KEY (`Asignacion_Id`) REFERENCES `asignacion` (`Id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_Detalle_Insumos` FOREIGN KEY (`Insumos_Id`) REFERENCES `insumos` (`Id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `equipos`
--
ALTER TABLE `equipos`
  ADD CONSTRAINT `FK_Equipos_Category` FOREIGN KEY (`Categoria_id`) REFERENCES `categorias` (`Id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_Equipos_Proveedor` FOREIGN KEY (`Proveedor_id`) REFERENCES `proveedores` (`Id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_Equipos_Unidad` FOREIGN KEY (`UnidadMedida_id`) REFERENCES `unidadmedida` (`Id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `herramientas`
--
ALTER TABLE `herramientas`
  ADD CONSTRAINT `FK_Herramienta_Category` FOREIGN KEY (`Categoria_id`) REFERENCES `categorias` (`Id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_Herramienta_Proveedor` FOREIGN KEY (`Proveedor_id`) REFERENCES `proveedores` (`Id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_Herramienta_Unidad` FOREIGN KEY (`UnidadMedida_id`) REFERENCES `unidadmedida` (`Id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `insumos`
--
ALTER TABLE `insumos`
  ADD CONSTRAINT `FK_Insumo_Category` FOREIGN KEY (`Categoria_id`) REFERENCES `categorias` (`Id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_Insumo_Proveedor` FOREIGN KEY (`Proveedor_id`) REFERENCES `proveedores` (`Id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_Insumo_Unidad` FOREIGN KEY (`UnidadMedida_id`) REFERENCES `unidadmedida` (`Id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD CONSTRAINT `FK_Provider_Category` FOREIGN KEY (`Id_Cate`) REFERENCES `categorias` (`Id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `FK_UserRol` FOREIGN KEY (`Id_rol`) REFERENCES `roles` (`Id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
