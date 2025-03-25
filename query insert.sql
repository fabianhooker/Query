--INSERT INTO Perfiles (Nombre_Perfil, Descripcion)
--VALUES
--    ('Cliente', 'Usuarios que pueden alquilar y comprar libros, y acceder a su historial.'),
--    ('Administrador', 'Usuarios con acceso completo al sistema, incluyendo gesti�n de usuarios, libros y transacciones.'),
--    ('Colaborador', 'Usuarios que pueden contribuir con rese�as, recomendaciones y contenido adicional.');
--INSERT INTO Usuarios (Nombre, Apellido, DNI, Telefono, Email, Direccion, Ubigeo, Contrase�a, ID_Perfil)
--VALUES
--    ('Ana', 'L�pez', '12345678A', '987654321', 'ana.lopez@email.com', 'Calle Principal 123', '150101', 'contrasena1', (SELECT ID_Perfil FROM Perfiles WHERE Nombre_Perfil = 'Cliente')),
--    ('Pedro', 'Garc�a', '87654321B', '123456789', 'pedro.garcia@email.com', 'Avenida Central 456', '150301', 'adminpass', (SELECT ID_Perfil FROM Perfiles WHERE Nombre_Perfil = 'Administrador')),
--    ('Sof�a', 'Mart�nez', '56789123C', '555123456', 'sofia.martinez@email.com', 'Jir�n Secundario 789', '150201', 'colabpass', (SELECT ID_Perfil FROM Perfiles WHERE Nombre_Perfil = 'Colaborador'));


--INSERT INTO Libros (Titulo, Autor, Categoria, Editorial, Anio_Publicacion, ISBN, Precio_Venta, Estado)
--VALUES
--    ('Cien a�os de soledad', 'Gabriel Garc�a M�rquez', 'Novela', 'Editorial Sudamericana', 1967, '978-0679729514', 25.00, 'Disponible'),
--    ('1984', 'George Orwell', 'Ciencia Ficci�n', 'Secker & Warburg', 1949, '978-0451524935', 18.50, 'Disponible'),
--    ('El Se�or de los Anillos', 'J.R.R. Tolkien', 'Fantas�a', 'Allen & Unwin', 1954, '978-0618260274', 35.00, 'Disponible'),
--    ('Don Quijote de la Mancha', 'Miguel de Cervantes', 'Novela', 'Francisco de Robles', 1605, '978-8420471133', 22.75, 'Disponible'),
--    ('Orgullo y prejuicio', 'Jane Austen', 'Novela Rom�ntica', 'T. Egerton', 1813, '978-0141439518', 19.99, 'Disponible'),
--    ('Matar a un ruise�or', 'Harper Lee', 'Novela', 'J. B. Lippincott & Co.', 1960, '978-0061120084', 21.00, 'Disponible'),
--    ('El Principito', 'Antoine de Saint-Exup�ry', 'Novela', 'Reynal & Hitchcock', 1943, '978-0156012195', 15.50, 'Disponible'),
--    ('Harry Potter y la piedra filosofal', 'J.K. Rowling', 'Fantas�a', 'Bloomsbury', 1997, '978-0747532699', 28.00, 'Disponible'),
--    ('Crimen y castigo', 'Fyodor Dostoevsky', 'Novela', 'The Russian Messenger', 1866, '978-0679734501', 24.25, 'Disponible'),
--    ('Los juegos del hambre', 'Suzanne Collins', 'Ciencia Ficci�n', 'Scholastic Press', 2008, '978-0439023481', 26.50, 'Disponible');


-- Creaci�n de Ejemplares

INSERT INTO Ejemplares (ID_Libro, Codigo_Barras_QR, Estado)
VALUES
    (1, 'ISBN-978-0679729514-001', 'Disponible'),
    (2, 'ISBN-978-0451524935-001', 'Disponible'),
    (3, 'ISBN-978-0618260274-001', 'Disponible'),
    (4, 'ISBN-978-8420471133-001', 'Disponible'),
    (5, 'ISBN-978-0141439518-001', 'Disponible'),
    (6, 'ISBN-978-0061120084-001', 'Disponible'),
    (7, 'ISBN-978-0156012195-001', 'Disponible'),
    (8, 'ISBN-978-0747532699-001', 'Disponible'),
    (9, 'ISBN-0679734501-001', 'Disponible'),
    (10, 'ISBN-0439023481-001', 'Disponible');

-- Creaci�n de Inventario
INSERT INTO Inventario (ID_Ejemplar, Ubicacion, Estado)
VALUES
		(1, 'Estante A1', 'Disponible'),
		(2, 'Estante A2', 'Disponible'),
		(3, 'Estante B1', 'Disponible'),
	(4, 'Estante A1', 'Disponible'),
    (5, 'Estante C1', 'Disponible'),
    (6, 'Estante C2', 'Disponible'),
    (7, 'Estante D1', 'Disponible'),
    (8, 'Estante D2', 'Disponible'),
    (9, 'Estante E1', 'Disponible'),
    (10, 'Estante E2', 'Disponible');