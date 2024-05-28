 

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


CREATE TABLE Asignados(
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



--POR ELIMINAR
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
    Nota, 
    Fase,
    EstadoEquipo,
    Estado
) VALUES 
(
    'COD001', 
    'Equipo de Sonido', 
    'Equipo de sonido para eventos', 
    'Equipos',
    1, 
    1, 
    1, 
    'Sony', 
    'Model-X', 
    'SERIE123', 
    'Negro', 
    1, 
    '1.5 metros', 
    10, 
    1500.00, 
    15000.00, 
    '2023-01-15', 
    'adjunto1.pdf', 
    'Equipo en buen estado', 
    'Asignado',
    'Nuevo',
    'Activo'
), 
(
    'COD002', 
    'Taladro', 
    'Taladro industrial', 
    'Herramientas',
    1, 
    1, 
    1, 
    'Bosch', 
    'Model-T', 
    'SERIE456', 
    'Azul', 
    1, 
    '30 cm', 
    20, 
    300.00, 
    6000.00, 
    '2023-03-22', 
    'adjunto2.pdf', 
    'Uso regular', 
    'Asignado',
    'Regular',
    'Activo'
), 
(
    'COD003', 
    'Mesa de Trabajo', 
    'Mesa de trabajo para taller', 
    'Articulos',
    1, 
    1, 
    1, 
    'Workshop', 
    'Model-W', 
    'SERIE789', 
    'Gris', 
    1, 
    '2 metros', 
    5, 
    200.00, 
    1000.00, 
    '2023-05-10', 
    'adjunto3.pdf', 
    'Mesa en buen estado', 
    'Asignado',
    'Nuevo',
    'Activo'
);
