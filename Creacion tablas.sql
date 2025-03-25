CREATE TABLE Perfiles (
    ID_Perfil INT PRIMARY KEY IDENTITY(1,1),
    Nombre_Perfil VARCHAR(50) NOT NULL,
    Descripcion TEXT
);

CREATE TABLE Usuarios (
    ID_Usuario INT PRIMARY KEY IDENTITY(1,1),
    Nombre VARCHAR(100) NOT NULL,
    Apellido VARCHAR(100) NOT NULL,
    DNI VARCHAR(20) UNIQUE NOT NULL,
    Telefono VARCHAR(20),
    Email VARCHAR(100) UNIQUE NOT NULL,
    Direccion TEXT,
    Ubigeo VARCHAR(20),
    Contraseña VARCHAR(255) NOT NULL,
    Estado BIT NOT NULL DEFAULT 1,
    ID_Perfil INT NOT NULL,
    FOREIGN KEY (ID_Perfil) REFERENCES Perfiles(ID_Perfil)
);

CREATE TABLE Libros (
    ID_Libro INT PRIMARY KEY IDENTITY(1,1),
    Titulo VARCHAR(255) NOT NULL,
    Autor VARCHAR(255) NOT NULL,
    Categoria VARCHAR(100),
    Editorial VARCHAR(100),
    Anio_Publicacion INT,
    ISBN VARCHAR(50) UNIQUE,
    Precio_Venta DECIMAL(10,2),
    Estado VARCHAR(20) NOT NULL
);

CREATE TABLE Ejemplares (
    ID_Ejemplar INT PRIMARY KEY IDENTITY(1,1),
    ID_Libro INT NOT NULL,
    Codigo_Barras_QR VARCHAR(100) UNIQUE NOT NULL,
    Estado VARCHAR(20) NOT NULL,
    FOREIGN KEY (ID_Libro) REFERENCES Libros(ID_Libro)
);

CREATE TABLE Inventario (
    ID_Inventario INT PRIMARY KEY IDENTITY(1,1),
    ID_Ejemplar INT NOT NULL,
    Ubicacion VARCHAR(100),
    Estado VARCHAR(20) NOT NULL,
    FOREIGN KEY (ID_Ejemplar) REFERENCES Ejemplares(ID_Ejemplar)
);

CREATE TABLE Alquileres (
    ID_Alquiler INT PRIMARY KEY IDENTITY(1,1),
    ID_Usuario INT NOT NULL,
    ID_Libro INT NOT NULL,
    Fecha_Alquiler DATETIME NOT NULL DEFAULT GETDATE(),
    Fecha_Devolucion DATETIME,
    Estado VARCHAR(20) NOT NULL,
    Penalidad DECIMAL(10,2),
    FOREIGN KEY (ID_Usuario) REFERENCES Usuarios(ID_Usuario),
    FOREIGN KEY (ID_Libro) REFERENCES Libros(ID_Libro)
);

CREATE TABLE Ventas (
    ID_Venta INT PRIMARY KEY IDENTITY(1,1),
    ID_Usuario INT NOT NULL,
    ID_Libro INT NOT NULL,
    Fecha_Venta DATETIME NOT NULL DEFAULT GETDATE(),
    Total DECIMAL(10,2) NOT NULL,
    Medio_Pago VARCHAR(50) NOT NULL,
    FOREIGN KEY (ID_Usuario) REFERENCES Usuarios(ID_Usuario),
    FOREIGN KEY (ID_Libro) REFERENCES Libros(ID_Libro)
);

CREATE TABLE Reservas (
    ID_Reserva INT PRIMARY KEY IDENTITY(1,1),
    ID_Usuario INT NOT NULL,
    ID_Libro INT NOT NULL,
    Fecha_Solicitud DATETIME NOT NULL DEFAULT GETDATE(),
    Estado VARCHAR(20) NOT NULL,
    FOREIGN KEY (ID_Usuario) REFERENCES Usuarios(ID_Usuario),
    FOREIGN KEY (ID_Libro) REFERENCES Libros(ID_Libro)
);

CREATE TABLE Pagos (
    ID_Pago INT PRIMARY KEY IDENTITY(1,1),
    ID_Usuario INT NOT NULL,
    ID_Venta INT NULL,
    ID_Alquiler INT NULL,
    Medio_Pago VARCHAR(50) NOT NULL,
    Monto DECIMAL(10,2) NOT NULL,
    Fecha_Pago DATETIME NOT NULL DEFAULT GETDATE(),
    FOREIGN KEY (ID_Usuario) REFERENCES Usuarios(ID_Usuario),
    FOREIGN KEY (ID_Venta) REFERENCES Ventas(ID_Venta),
    FOREIGN KEY (ID_Alquiler) REFERENCES Alquileres(ID_Alquiler)
);

CREATE TABLE Lista_Negra (
    ID_Lista INT PRIMARY KEY IDENTITY(1,1),
    ID_Usuario INT NOT NULL,
    Motivo TEXT NOT NULL,
    Estado VARCHAR(20) NOT NULL,
    FOREIGN KEY (ID_Usuario) REFERENCES Usuarios(ID_Usuario)
);

CREATE TABLE Auditoria (
    ID_Auditoria INT PRIMARY KEY IDENTITY(1,1),
    ID_Usuario INT NOT NULL,
    Accion VARCHAR(255) NOT NULL,
    Fecha_Hora DATETIME NOT NULL DEFAULT GETDATE(),
    Descripcion TEXT,
    FOREIGN KEY (ID_Usuario) REFERENCES Usuarios(ID_Usuario)
);

CREATE TABLE Notificaciones (
    ID_Notificacion INT PRIMARY KEY IDENTITY(1,1),
    ID_Usuario INT NOT NULL,
    Tipo VARCHAR(50) NOT NULL,
    Mensaje TEXT NOT NULL,
    Fecha_Envio DATETIME NOT NULL DEFAULT GETDATE(),
    Estado VARCHAR(20) NOT NULL,
    FOREIGN KEY (ID_Usuario) REFERENCES Usuarios(ID_Usuario)
);