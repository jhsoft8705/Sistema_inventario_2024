-------VERSION 2------------------
DELIMITER  //
CREATE PROCEDURE grafico_echart_dona()  
BEGIN
    SELECT
        COUNT(a.Taller_Id) AS TotalAsignaciones,
        a.Codigo,
        t.T_Nombre
    FROM
        asignacion AS a
    INNER JOIN talleres AS t ON t.Id = A.Taller_Id
    WHERE  a.Estado='Activo'
    GROUP BY
    t.T_Nombre ;
END //
DELIMITER ;


-------VERSION 2
DELIMITER //

CREATE PROCEDURE grafico_echart_dona()
BEGIN
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

END //

DELIMITER ;



----------------------USUARIO X TALLERS
DELIMITER  //
CREATE PROCEDURE grafico_usuario_taller_dona()  
BEGIN
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
END //
DELIMITER ;
