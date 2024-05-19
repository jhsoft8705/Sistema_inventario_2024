 
 /*TODO:SP Listar categorias*/
DELIMITER //
CREATE PROCEDURE listar_categorias()
BEGIN
    SELECT *FROM Categorias 
    WHERE U.Estado IN ('Activo','Inactivo') ;
END //
DELIMITER ;

 
                
/*TODO:SP Listar categorias x id*/
DELIMITER //
CREATE PROCEDURE listar_categoria_id(IN cate_id INT)
BEGIN
    SELECT * FROM Categorias  
    WHERE Id=cate_id ;
END //
DELIMITER ;


/*TODO:SP Registrar categoria*/ 
DELIMITER //

CREATE PROCEDURE registrar_categoria(
    IN p_nombres VARCHAR(100),
    IN p_descripcion VARCHAR(100)
)
BEGIN
    INSERT INTO Categorias (
        NombresCategoria, 
        DescripcionCategoria 
    )
    VALUES (
        p_nombres, 
        p_descripcion 
    );
END // 
DELIMITER ;



/*TODO:SP Actualizar categoria*/  
DELIMITER //

CREATE PROCEDURE update_categoria(
    IN cate_id INT, 
    IN p_nombres VARCHAR(100),
    IN p_descripcion VARCHAR(100) 
)
BEGIN
    UPDATE Categorias
    SET
        NombresCategoria = p_nombres,
        DescripcionCategoria = p_descripcion, 
        FechaActualizacion = CURRENT_TIMESTAMP
    WHERE Id = cate_id;
END //

DELIMITER ;

 
 
/*TODO:SP Eliminar categoria*/   
DELIMITER //
CREATE PROCEDURE eliminar_categoria(IN cate_id INT)
 BEGIN
	UPDATE categorias SET Estado='Eliminado' WHERE Id=cate_id ;
END // 
DELIMITER ; 

 
   


 
