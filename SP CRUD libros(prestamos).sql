CREATE PROCEDURE sp_InsertarLibro
    @Titulo VARCHAR(255),
    @Autor VARCHAR(255),
    @Categoria VARCHAR(100),
    @Editorial VARCHAR(100),
    @Anio_Publicacion INT,
    @ISBN VARCHAR(50),
    @Precio_Venta DECIMAL(10,2),
    @Estado VARCHAR(20),
    @ID_Libro INT OUTPUT,
    @Resultado BIT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (SELECT 1 FROM Libros WHERE ISBN = @ISBN)
    BEGIN
        SET @Resultado = 0;
        RETURN;
    END

    INSERT INTO Libros (Titulo, Autor, Categoria, Editorial, Anio_Publicacion, ISBN, Precio_Venta, Estado)
    VALUES (@Titulo, @Autor, @Categoria, @Editorial, @Anio_Publicacion, @ISBN, @Precio_Venta, @Estado);

    SET @ID_Libro = SCOPE_IDENTITY();
    SET @Resultado = 1;
END;

CREATE PROCEDURE sp_ActualizarLibro
    @ID_Libro INT,
    @Titulo VARCHAR(255),
    @Autor VARCHAR(255),
    @Categoria VARCHAR(100),
    @Editorial VARCHAR(100),
    @Anio_Publicacion INT,
    @ISBN VARCHAR(50),
    @Precio_Venta DECIMAL(10,2),
    @Estado VARCHAR(20),
    @Resultado BIT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    IF NOT EXISTS (SELECT 1 FROM Libros WHERE ID_Libro = @ID_Libro)
    BEGIN
        SET @Resultado = 0;
        RETURN;
    END

    UPDATE Libros
    SET Titulo = @Titulo, Autor = @Autor, Categoria = @Categoria, Editorial = @Editorial, Anio_Publicacion = @Anio_Publicacion, ISBN = @ISBN, Precio_Venta = @Precio_Venta, Estado = @Estado
    WHERE ID_Libro = @ID_Libro;

    SET @Resultado = 1;
END;


CREATE PROCEDURE sp_ObtenerLibros
AS
BEGIN
    SELECT * FROM Libros;
END;


CREATE PROCEDURE sp_ObtenerLibroPorId
    @ID_Libro INT
AS
BEGIN
    SET NOCOUNT ON;
    SELECT * FROM Libros WHERE ID_Libro = @ID_Libro;
END;

CREATE PROCEDURE sp_EliminarLibro
    @ID_Libro INT,
    @Resultado BIT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    IF NOT EXISTS (SELECT 1 FROM Libros WHERE ID_Libro = @ID_Libro)
    BEGIN
        SET @Resultado = 0;
        RETURN;
    END

    DELETE FROM Libros WHERE ID_Libro = @ID_Libro;
    SET @Resultado = 1;
END;