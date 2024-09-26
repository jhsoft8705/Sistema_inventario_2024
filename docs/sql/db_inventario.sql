 

CREATE TABLE Roles (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    NombreRol VARCHAR(50),
    Descripcion VARCHAR(50),
    Estado ENUM('Activo', 'Inactivo') NOT NULL,
    FechaRegistro DATETIME , 
    FechaActualizacion DATETIME
 );



CREATE TABLE Usuarios (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    NombresUsuario VARCHAR(50),
    ApellidosUsuario VARCHAR(50), 
    NumeroDocumento VARCHAR(20),
    Telefono VARCHAR(20),  
    CorreoElectronico VARCHAR(100),
    Contrasena VARCHAR(255),
    Id_rol INT,
    Notificaciones VARCHAR(2) DEFAULT 'NO', 
    Direccion VARCHAR(255), 
    Url_foto VARCHAR(255), 
    Genero VARCHAR(15),
    Estado ENUM('Activo', 'Inactivo', 'Eliminado') NOT NULL DEFAULT 'Activo',
    FechaRegistro DATETIME,
    FechaActualizacion DATETIME,
    CONSTRAINT FK_UserRol FOREIGN KEY (Id_rol) REFERENCES Roles(Id) ON DELETE CASCADE  
);


CREATE TABLE Categorias (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    NombresCategoria VARCHAR(50) NOT NULL,
    DescripcionCategoria VARCHAR(50),
    Estado ENUM('Activo', 'Inactivo', 'Eliminado') NOT NULL DEFAULT 'Activo',

    FechaRegistro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FechaActualizacion DATETIME 
); 

CREATE TABLE UnidadMedida (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    NombresUnd VARCHAR(50) NOT NULL,
    AbreviaturaUnd VARCHAR(10), 
    DescripcionUnd VARCHAR(50),
    Estado ENUM('Activo', 'Inactivo', 'Eliminado') NOT NULL DEFAULT 'Activo',
    FechaRegistro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FechaActualizacion DATETIME 
); 

 

CREATE TABLE Proveedores (
    Id INT AUTO_INCREMENT PRIMARY KEY, 
    Tipo_Documento ENUM('Dni', 'Ruc', 'Pasaporte'),
    NumeroDocumento VARCHAR(20) NOT NULL,
    P_Nombres VARCHAR(100),
    P_Apellidos VARCHAR(100),  
    Telefono VARCHAR(15),
    Direccion VARCHAR(100), 
    Id_Cate INT,
    Notas VARCHAR(250),
    Estado ENUM('Activo', 'Inactivo', 'Eliminado') NOT NULL DEFAULT 'Activo', 
    FechaRegistro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FechaActualizacion DATETIME,
    CONSTRAINT FK_Provider_Category FOREIGN KEY (Id_Cate) REFERENCES Categorias(Id) ON DELETE CASCADE   
); 


 CREATE TABLE Ubicaciones (
    Id INT AUTO_INCREMENT PRIMARY KEY,  
    U_Nombre VARCHAR(100) NOT NULL, 
    U_Descripcion VARCHAR(255) DEFAULT NULL,
    Estado ENUM('Activo', 'Inactivo', 'Eliminado') NOT NULL DEFAULT 'Activo', 
    FechaRegistro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FechaActualizacion DATETIME
 ); 

 CREATE TABLE Talleres (
    Id INT AUTO_INCREMENT PRIMARY KEY,  
    T_Nombre VARCHAR(100) NOT NULL, 
    T_Descripcion VARCHAR(255) DEFAULT NULL,
    Estado ENUM('Activo', 'Inactivo', 'Eliminado') NOT NULL DEFAULT 'Activo', 
    FechaRegistro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FechaActualizacion DATETIME
 ); 
 
  CREATE TABLE Periodos (
    Id INT AUTO_INCREMENT PRIMARY KEY,  
    Nombre VARCHAR(100) NOT NULL, 
    Fecha_Inicio DATE,
    Fecha_Fin DATE,  
    Descripcion VARCHAR(255) DEFAULT NULL,
    Estado ENUM('Activo', 'Inactivo', 'Eliminado') NOT NULL DEFAULT 'Activo', 
    FechaRegistro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FechaActualizacion DATETIME
 ); 


CREATE TABLE Almacen (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    Codigo VARCHAR(200) DEFAULT NULL,
    Nombre VARCHAR(150),
    Descripcion VARCHAR(250),
    Tipo ENUM( 'Equipos', 'Herramientas','Articulos'),   
    Ubicacion_id INT,
    Categoria_id INT,
    Proveedor_id INT, 
    Marca VARCHAR(50),
    Modelo VARCHAR(50),
    Serie VARCHAR(100),
    Color VARCHAR(30) DEFAULT NULL, 
    UnidadMedida_id INT,
    Medida VARCHAR(50) DEFAULT NULL,
    Cantidad INT,
    Precio_Unitario DECIMAL(10, 2),
    Total DECIMAL(10, 2),
    Fecha_Adquision DATE,
    Adjunto VARCHAR(250),
    Fase ENUM( 'Asignado', 'Faltante','Sobrante'),  
    EstadoEquipo ENUM( 'Nuevo', 'Regular','Viejo'), 
    Nota VARCHAR(250), 
    Estado ENUM('Activo', 'Inactivo', 'Eliminado') NOT NULL DEFAULT 'Activo',   
    FechaRegistro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FechaActualizacion DATETIME,
    CONSTRAINT FK_Almacen_Unidad FOREIGN KEY (UnidadMedida_id) REFERENCES UnidadMedida(Id) ON DELETE CASCADE,
    CONSTRAINT FK_Almacen_Category FOREIGN KEY (Categoria_id) REFERENCES Categorias(Id) ON DELETE CASCADE,
    CONSTRAINT FK_Almacen_Ubicacion FOREIGN KEY (Ubicacion_id) REFERENCES Ubicaciones(Id) ON DELETE CASCADE,
    CONSTRAINT FK_Almacen_Proveedor FOREIGN KEY (Proveedor_id) REFERENCES Proveedores(Id) ON DELETE CASCADE
);


CREATE TABLE Equipos (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    Codigo VARCHAR(200) DEFAULT NULL,
    Co_Modular VARCHAR(200) DEFAULT NULL, 
    Nombre VARCHAR(150),
    Descripcion VARCHAR(250),  
    Categoria_id INT,
    Proveedor_id INT, 
    Marca VARCHAR(50),
    Modelo VARCHAR(50),
    Serie VARCHAR(100),
    Color VARCHAR(30) DEFAULT NULL, 
    UnidadMedida_id INT,
    Medida VARCHAR(50) DEFAULT NULL,
    Cantidad INT,
    Precio_Unitario DECIMAL(10, 2),
    Total DECIMAL(10, 2),
    Fecha_Adquision DATE,  
    Estado_Equipo ENUM( 'Nuevo', 'Regular','Viejo'), 
    Nota VARCHAR(250), 
    Estado ENUM('Activo', 'Inactivo', 'Eliminado') NOT NULL DEFAULT 'Activo',   
    FechaRegistro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FechaActualizacion DATETIME,
    CONSTRAINT FK_Equipos_Unidad FOREIGN KEY (UnidadMedida_id) REFERENCES UnidadMedida(Id) ON DELETE CASCADE,
    CONSTRAINT FK_Equipos_Category FOREIGN KEY (Categoria_id) REFERENCES Categorias(Id) ON DELETE CASCADE,
    CONSTRAINT FK_Equipos_Proveedor FOREIGN KEY (Proveedor_id) REFERENCES Proveedores(Id) ON DELETE CASCADE
);

CREATE TABLE Herramientas (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    Codigo VARCHAR(200) DEFAULT NULL,
    Co_Modular VARCHAR(200) DEFAULT NULL, 
    Nombre VARCHAR(150),
    Descripcion VARCHAR(250),  
    Categoria_id INT,
    Proveedor_id INT, 
    Marca VARCHAR(50),
    Modelo VARCHAR(50),
    Serie VARCHAR(100),
    Color VARCHAR(30) DEFAULT NULL, 
    UnidadMedida_id INT,
    Medida VARCHAR(50) DEFAULT NULL,
    Cantidad INT,
    Precio_Unitario DECIMAL(10, 2),
    Total DECIMAL(10, 2),
    Fecha_Adquision DATE,  
    Estado_Herramienta ENUM( 'Nuevo', 'Regular','Viejo'), 
    Nota VARCHAR(250), 
    Estado ENUM('Activo', 'Inactivo', 'Eliminado') NOT NULL DEFAULT 'Activo',   
    FechaRegistro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FechaActualizacion DATETIME,
    CONSTRAINT FK_Herramienta_Unidad FOREIGN KEY (UnidadMedida_id) REFERENCES UnidadMedida(Id) ON DELETE CASCADE,
    CONSTRAINT FK_Herramienta_Category FOREIGN KEY (Categoria_id) REFERENCES Categorias(Id) ON DELETE CASCADE,
    CONSTRAINT FK_Herramienta_Proveedor FOREIGN KEY (Proveedor_id) REFERENCES Proveedores(Id) ON DELETE CASCADE
);


CREATE TABLE Insumos (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    Codigo VARCHAR(200) DEFAULT NULL,
    Co_Modular VARCHAR(200) DEFAULT NULL, 
    Nombre VARCHAR(150),
    Descripcion VARCHAR(250),  
    Categoria_id INT,
    Proveedor_id INT, 
    Marca VARCHAR(50), 
    UnidadMedida_id INT,
    Medida VARCHAR(50) DEFAULT NULL,
    Cantidad INT,
    Precio_Unitario DECIMAL(10, 2),
    Total DECIMAL(10, 2),
    Fecha_Adquision DATE,  
    Estado_Insumo ENUM( 'Nuevo', 'Regular','Viejo'), 
    Nota VARCHAR(250), 
    Estado ENUM('Activo', 'Inactivo', 'Eliminado') NOT NULL DEFAULT 'Activo',   
    FechaRegistro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FechaActualizacion DATETIME,
    CONSTRAINT FK_Insumo_Unidad FOREIGN KEY (UnidadMedida_id) REFERENCES UnidadMedida(Id) ON DELETE CASCADE,
    CONSTRAINT FK_Insumo_Category FOREIGN KEY (Categoria_id) REFERENCES Categorias(Id) ON DELETE CASCADE,
    CONSTRAINT FK_Insumo_Proveedor FOREIGN KEY (Proveedor_id) REFERENCES Proveedores(Id) ON DELETE CASCADE
);


CREATE TABLE Asignacion(
    Id INT AUTO_INCREMENT PRIMARY KEY, 
    Codigo VARCHAR(200) DEFAULT NULL, 
    Taller_Id INT,  
    Periodo_id INT,   
    Usuario_Id INT, 
    EstadoAsigacion ENUM('Asignado', 'Sobrante'),
    Descripcion VARCHAR(250),  
    Estado ENUM('Activo', 'Inactivo', 'Eliminado','PreActivo') NOT NULL DEFAULT 'PreActivo',
    FechaRegistro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FechaActualizacion DATETIME,
    CONSTRAINT FK_Asignacion_Taller FOREIGN KEY (Taller_Id) REFERENCES Talleres(Id) ON DELETE CASCADE,
    CONSTRAINT FK_Asignacion_Periodo FOREIGN KEY (Periodo_id) REFERENCES Talleres(Id) ON DELETE CASCADE, 
    CONSTRAINT FK_Asignacion_Usuario FOREIGN KEY (Usuario_Id) REFERENCES Usuarios(Id) ON DELETE CASCADE

 );


/*Cod Autoincrementable*/
DELIMITER // 
CREATE TRIGGER antes_insert_asignacion
BEFORE INSERT ON Asignacion
FOR EACH ROW
BEGIN
    DECLARE last_id INT;
    DECLARE new_code VARCHAR(200); 
    -- Obtenemos el último Id insertado
    SELECT IFNULL(MAX(Id), 0) INTO last_id FROM Asignacion; 
    -- Generamos el nuevo código basado en el último Id
    SET new_code = CONCAT('AS-', LPAD(last_id + 1, 4, '0')); 
    -- Asignamos el nuevo código al campo Codigo del nuevo registro
    SET NEW.Codigo = new_code;
END// 
DELIMITER ;
 

 
CREATE TABLE Detalle_Asignacion_Equipos(
    Id INT AUTO_INCREMENT PRIMARY KEY,
    Equipo_Id INT,
    Asignacion_Id INT,
    Cantidad INT,
    Precio_Unitario DECIMAL(10, 2),
    Total DECIMAL(10, 2),  
    EstadoDetalle ENUM('Asignado') NOT NULL DEFAULT 'Asignado',   
    Estado ENUM('Activo', 'Inactivo', 'Eliminado') NOT NULL DEFAULT 'Activo',   
    CONSTRAINT FK_Detalle_Equipo FOREIGN KEY (Equipo_id) REFERENCES Equipos(Id) ON DELETE CASCADE ,  
    CONSTRAINT FK_Detalle_Asignacion FOREIGN KEY (Asignacion_Id) REFERENCES Asignacion(Id) ON DELETE CASCADE   
);
 
 CREATE TABLE Detalle_Asignacion_Herramientas(
    Id INT AUTO_INCREMENT PRIMARY KEY,
    Herramienta_Id INT,
    Asignacion_Id INT,
    Cantidad INT,
    Precio_Unitario DECIMAL(10, 2),
    Total DECIMAL(10, 2),  
    EstadoDetalle ENUM('Asignado') NOT NULL DEFAULT 'Asignado',   
    Estado ENUM('Activo', 'Inactivo', 'Eliminado') NOT NULL DEFAULT 'Activo',   
    CONSTRAINT FK_Detalle_Herramienta FOREIGN KEY (Herramienta_Id) REFERENCES Herramientas(Id) ON DELETE CASCADE,   
    CONSTRAINT FK_Detalle_AsignacionH FOREIGN KEY (Asignacion_Id) REFERENCES Asignacion(Id) ON DELETE CASCADE   
);
 
 CREATE TABLE Detalle_Asignacion_Insumos(
    Id INT AUTO_INCREMENT PRIMARY KEY,
    Insumos_Id INT,
    Asignacion_Id INT,
    Cantidad INT,
    Precio_Unitario DECIMAL(10, 2),
    Total DECIMAL(10, 2),  
    EstadoDetalle ENUM('Asignado') NOT NULL DEFAULT 'Asignado',   
    Estado ENUM('Activo', 'Inactivo', 'Eliminado') NOT NULL DEFAULT 'Activo',   
    CONSTRAINT FK_Detalle_Insumos FOREIGN KEY (Insumos_Id) REFERENCES Insumos(Id) ON DELETE CASCADE   ,
    CONSTRAINT FK_Detalle_AsignacionI FOREIGN KEY (Asignacion_Id) REFERENCES Asignacion(Id) ON DELETE CASCADE   
);


CREATE TABLE Faltantes(
    Id INT AUTO_INCREMENT PRIMARY KEY,
    Codigo VARCHAR(200) DEFAULT NULL, 
    Nombre VARCHAR(150), 
    Cantidad INT,
    Precio_Unitario DECIMAL(10, 2),
    Total DECIMAL(10, 2), 
    Equipo_id INT,
    EstadoEquipo ENUM( 'Faltante') NOT NULL DEFAULT 'Faltante',  
    Estado ENUM('Activo', 'Inactivo', 'Eliminado') NOT NULL DEFAULT 'Activo',  
    CONSTRAINT FK_Faltante_Equipo FOREIGN KEY (Equipo_id) REFERENCES Equipos(Id) ON DELETE CASCADE   

);

CREATE TABLE Sobrantes(
    Id INT AUTO_INCREMENT PRIMARY KEY,
    Codigo VARCHAR(200) DEFAULT NULL, 
    Nombre VARCHAR(150), 
    Cantidad INT,
    Precio_Unitario DECIMAL(10, 2),
    Total DECIMAL(10, 2), 
    Equipo_id INT,
    EstadoEquipo ENUM( 'Sobrante') NOT NULL DEFAULT 'Sobrante',   
    Estado ENUM('Activo', 'Inactivo', 'Eliminado') NOT NULL DEFAULT 'Activo',   
    CONSTRAINT FK_sobrante_Equipo FOREIGN KEY (Equipo_id) REFERENCES Equipos(Id) ON DELETE CASCADE   
);


 

-- Insertar roles
INSERT INTO Roles (NombreRol, Descripcion, Estado, FechaRegistro, FechaActualizacion) 
VALUES ('Administrador', 'Rol con acceso total', 'Activo', NOW(), NOW());

INSERT INTO Roles (NombreRol, Descripcion, Estado, FechaRegistro, FechaActualizacion) 
VALUES ('Usuario', 'Rol con acceso limitado', 'Activo', NOW(), NOW());

-- Insertar usuarios
INSERT INTO Usuarios (NombresUsuario, ApellidosUsuario, NumeroDocumento, Telefono, CorreoElectronico, Contrasena, Id_rol, Notificaciones, Direccion, Url_foto, Genero, Estado, FechaRegistro, FechaActualizacion) 
VALUES 
('Juan', 'Pérez', '123456789', '555-1234', 'juan.perez@example.com', '12345', 1, 'NO', 'Calle Falsa 123', 'url_foto1.jpg', 'Masculino', 'Activo', NOW(), NOW()),
('María', 'Gómez', '987654321', '555-5678', 'maria.gomez@example.com', '12345', 2, 'SI', 'Avenida Siempre Viva 742', 'url_foto2.jpg', 'Femenino', 'Activo', NOW(), NOW()),
('Carlos', 'Rodríguez', '456789123', '555-8765', 'carlos.rodriguez@example.com', '12345', 1, 'NO', 'Calle Principal 456', 'url_foto3.jpg', 'Masculino', 'Activo', NOW(), NOW()),
('Ana', 'Martínez', '789123456', '555-3456', 'ana.martinez@example.com', '12345', 2, 'NO', 'Calle Secundaria 789', 'url_foto4.jpg', 'Femenino', 'Activo', NOW(), NOW()),
('Luis', 'Fernández', '321654987', '555-6543', 'luis.fernandez@example.com', '12345', 1, 'SI', 'Avenida Central 321', 'url_foto5.jpg', 'Masculino', 'Activo', NOW(), NOW()),
('Elena', 'López', '654987321', '555-4321', 'elena.lopez@example.com', '12345', 2, 'NO', 'Callejón del Gato 654', 'url_foto6.jpg', 'Femenino', 'Activo', NOW(), NOW()),
('Miguel', 'Sánchez', '159753468', '555-9876', 'miguel.sanchez@example.com', '12345', 1, 'SI', 'Boulevard Principal 159', 'url_foto7.jpg', 'Masculino', 'Activo', NOW(), NOW()),
('Isabel', 'Torres', '357159486', '555-6789', 'isabel.torres@example.com', '12345', 2, 'NO', 'Calle Estrecha 357', 'url_foto8.jpg', 'Femenino', 'Activo', NOW(), NOW()),
('Jorge', 'Ramírez', '753951486', '555-2345', 'jorge.ramirez@example.com', '12345', 1, 'SI', 'Avenida Ancha 753', 'url_foto9.jpg', 'Masculino', 'Activo', NOW(), NOW()),
('Laura', 'Mendoza', '951753486', '555-7654', 'laura.mendoza@example.com', '12345', 2, 'NO', 'Callejón del Sol 951', 'url_foto10.jpg', 'Femenino', 'Activo', NOW(), NOW()),
('Pedro', 'Rivas', '123789456', '555-3457', 'pedro.rivas@example.com', '12345', 1, 'NO', 'Calle del Río 123', 'url_foto11.jpg', 'Masculino', 'Activo', NOW(), NOW());


INSERT INTO Categorias (NombresCategoria, DescripcionCategoria, Estado)
VALUES  
('Herramientas Manuales', 'Herramientas operadas a mano', 'Activo'),
('Computadoras', 'Equipos de cómputo y accesorios', 'Activo'),
('Muebles', 'Mobiliario para el hogar y oficina', 'Activo'),  
('Electrónica', 'Dispositivos electrónicos', 'Activo'),
('Alimentos', 'Comestibles y bebidas', 'Activo'), 
('Jardinería', 'Herramientas y suministros para jardín', 'Activo'),
('Oficina', 'Suministros y muebles de oficina', 'Activo'), 
('Automotriz', 'Accesorios y repuestos para vehículos', 'Activo'),
('Cocina', 'Utensilios y aparatos de cocina', 'Activo'),
('Ferretería', 'Materiales y herramientas de construcción', 'Activo'),  
('Instrumentos Musicales', 'Instrumentos y accesorios musicales', 'Activo');


INSERT INTO UnidadMedida (NombresUnd, AbreviaturaUnd, DescripcionUnd, Estado) VALUES
('Kilogramo', 'kg', 'Unidad de medida de masa', 'Activo'),
('Litro', 'L', 'Unidad de medida de volumen', 'Activo'),
('Metro', 'm', 'Unidad de medida de longitud', 'Activo'),
('Pieza', 'pz', 'Unidad de conteo', 'Activo'),
('Caja', 'cj', 'Unidad de empaquetado', 'Activo');


INSERT INTO Proveedores (Tipo_Documento, NumeroDocumento, P_Nombres, P_Apellidos, Telefono, Direccion, Id_Cate, Notas, Estado)
VALUES
('Dni', '12345678', 'Juan', 'Perez', '123456789', 'Calle Falsa 123', 1, 'Proveedor confiable', 'Activo'),
('Ruc', '87654321', 'Maria', 'Gonzalez', '987654321', 'Av. Siempre Viva 742', 2, 'Entrega rápida', 'Activo'),
('Pasaporte', 'A1234567', 'Luis', 'Martinez', '456789123', 'Calle Luna 456', 3, 'Buena calidad', 'Activo'),
('Dni', '23456789', 'Ana', 'Lopez', '234567890', 'Av. Sol 321', 4, 'Precios competitivos', 'Inactivo'),
('Ruc', '76543210', 'Carlos', 'Garcia', '345678901', 'Calle Estrella 789', 5, 'Atención personalizada', 'Activo');

INSERT INTO Talleres (T_Nombre, T_Descripcion, Estado) VALUES 
('Computación e Informática', 'Cursos de programación, desarrollo web, y manejo de software de oficina.', 'Activo'),
('Cocina y Gastronomía', 'Cursos de cocina peruana e internacional, pastelería y panadería.', 'Activo'),
('Electricidad y Electrónica', 'Talleres de instalaciones eléctricas, reparación de electrodomésticos.', 'Activo'),
('Mecánica Automotriz', 'Cursos de mantenimiento y reparación de vehículos, sistemas eléctricos.', 'Activo'),
('Moda y Confección', 'Diseño de moda, confección de prendas, y patronaje.', 'Activo'),
('Carpintería y Ebanistería', 'Cursos de fabricación de muebles, diseño en madera y restauración.', 'Activo'),
('Belleza y Estética', 'Talleres de peluquería, cosmetología, y manicure/pedicure.', 'Activo'),
('Marketing Digital y Redes Sociales', 'Cursos de gestión de redes sociales, publicidad en línea.', 'Activo'),
('Idiomas', 'Talleres de inglés, francés, portugués, y otros idiomas extranjeros.', 'Activo'),
('Administración y Contabilidad', 'Cursos de administración de empresas, contabilidad básica y avanzada.', 'Activo');


-- Inserción de 5 registros en la tabla Periodos
INSERT INTO Periodos (Nombre, Fecha_Inicio, Fecha_Fin, Descripcion, Estado)
VALUES 
('Enero 2024', '2024-01-01', '2024-01-31', 'Inventario mensual de enero 2024', 'Activo'),
('Febrero 2024', '2024-02-01', '2024-02-28', 'Inventario mensual de febrero 2024', 'Activo'),
('Primer Trimestre 2024', '2024-01-01', '2024-03-31', 'Inventario del primer trimestre de 2024', 'Activo'),
('Segundo Trimestre 2024', '2024-04-01', '2024-06-30', 'Inventario del segundo trimestre de 2024', 'Activo'),
('Marzo 2024', '2024-03-01', '2024-03-31', 'Inventario mensual de marzo 2024', 'Inactivo');

INSERT INTO Ubicaciones (U_Nombre, U_Descripcion, Estado) VALUES
('Sala de Cocina', 'Ubicación para utensilios y equipos de cocina', 'Activo'),
('Aula de Cómputo', 'Ubicación para equipos y herramientas de informática', 'Activo'),
('Laboratorio de Manualidades', 'Ubicación para equipos de laboratorio y materiales científicos', 'Activo'),
('Taller de Carpintería', 'Ubicación para herramientas y maquinaria de carpintería', 'Activo'),
('Almacen del aula 05', 'Ubicación para equipos de ejercicio y entrenamiento físico', 'Activo');

INSERT INTO Equipos (Co_Modular, Nombre, Descripcion, Categoria_id, Proveedor_id, Marca, Modelo, Serie, Color, UnidadMedida_id, Medida, Cantidad, Precio_Unitario, Total, Fecha_Adquision, Estado_Equipo, Nota, Estado, FechaRegistro)
VALUES 
('CM-001', 'Computadora', 'Computadora de escritorio con procesador Intel Core i5 y 8GB de RAM', 1, 1, 'HP', 'Pavilion', 'XYZ123', 'Negro', 1, 'Unidad', 5, 750.00, 3750.00, '2024-06-07', 'Nuevo', 'Equipos para oficina', 'Activo', NOW()),
(  'CM-002', 'Mouse', 'Mouse óptico con cable USB', 2, 1, 'Logitech', 'M100', 'ABC123', 'Negro', 2, 'Unidad', 10, 15.00, 150.00, '2024-06-07', 'Nuevo', 'Accesorio para computadora', 'Activo', NOW()),
(  'CM-003', 'Memorias', 'Memoria RAM DDR4 de 8GB', 3, 1, 'Kingston', 'HyperX', '123XYZ', 'Negro', 3, 'Unidad', 20, 40.00, 800.00, '2024-06-07', 'Nuevo', 'Componente de computadora', 'Activo', NOW());

INSERT INTO Herramientas (Co_Modular, Nombre, Descripcion, Categoria_id, Proveedor_id, Marca, Modelo, Serie, Color, UnidadMedida_id, Medida, Cantidad, Precio_Unitario, Total, Fecha_Adquision, Estado_Herramienta, Nota, Estado, FechaRegistro, FechaActualizacion) 
VALUES 
    ('CM01', 'Martillo', 'Herramienta de mano con cabeza metálica y mango de madera.', 1, 1, 'Genérica', NULL, NULL, 'Metálico', 1, '', 10, 15.00, 150.00, '2024-06-07', 'Nuevo', 'Herramienta básica de carpintería.', 'Activo', NOW(), NOW()),
    ('CM02', 'Cortadora', 'Máquina cortadora de metales y plásticos.', 1, 1, 'CortaMAX', 'CM5000', 'CORTA-2023', 'Gris', 1, '', 5, 500.00, 2500.00, '2023-12-15', 'Regular', 'Máquina de alto rendimiento para trabajos industriales.', 'Activo', NOW(), NOW()),
    ('CM03', 'Mesas de Metal', 'Conjunto de mesas de trabajo fabricadas en acero inoxidable.', 1, 1, 'InduSteel', 'Industrial Pro', 'IND-2024', 'Plateado', 1, '', 1, 1200.00, 3600.00, '2024-03-20', 'Nuevo', 'Ideales para uso en talleres mecánicos.', 'Activo', NOW(), NOW()),
    ('CM04', 'Extensión', 'Cable de extensión eléctrica de 10 metros.', 1, 1, 'PowerCable', 'HeavyDuty', 'EXT-10M', 'Naranja', 1, '10m', 8, 25.00, 200.00, '2024-05-10', 'Nuevo', 'Cable resistente para uso en exteriores.', 'Activo', NOW(), NOW()),
    ('CM05', 'Estante', 'Estante metálico de 5 niveles.', 1, 1, 'MetalMax', 'Industrial 5000', 'EST-5N', 'Negro', 1, '', 6, 150.00, 900.00, '2024-04-02', 'Nuevo', 'Estante resistente y duradero para almacenamiento.', 'Activo', NOW(), NOW());

  INSERT INTO Insumos (Co_Modular, Nombre, Descripcion, Categoria_id, Proveedor_id, Marca, UnidadMedida_id, Medida, Cantidad, Precio_Unitario, Total, Fecha_Adquision, Estado_Insumo, Nota, Estado) 
VALUES 
('MOD001', 'Agujas de coser', 'Agujas de alta calidad para coser a mano o a máquina', 1, 1, 'Singer', 1, 'Pack de 10', 50, 2.50, 125.00, '2024-01-15', 'Nuevo', 'Uso para textiles', 'Activo'),
('MOD002', 'Tornillos', 'Tornillos de acero inoxidable para madera y metal', 1, 1, 'Truper', 1, 'Caja de 100', 200, 0.10, 20.00, '2024-02-10', 'Nuevo', 'Para uso general', 'Activo');
 