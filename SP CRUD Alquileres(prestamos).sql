

CREATE or ALTER PROCEDURE [dbo].[sp_InsertarAlquiler]
    @ID_Usuario INT,
    @ID_Libro INT,
	@Fecha_Alquiler DATETIME,
    @Fecha_Devolucion DATETIME,
	@Penalidad decimal (10,2)
AS
BEGIN
    SET NOCOUNT ON;

   

    INSERT INTO Alquileres (ID_Usuario, ID_Libro, Fecha_Alquiler,Fecha_Devolucion, Estado,Penalidad)
    VALUES (@ID_Usuario, @ID_Libro,@Fecha_Alquiler, @Fecha_Devolucion, 'Alquilado',@Penalidad);

      SELECT SCOPE_IDENTITY() AS Id;
END;


CREATE or alter PROCEDURE sp_ActualizarAlquiler
    @ID_Alquiler INT,
	@ID_Usuario INT,
    @ID_Libro INT,
	@Fecha_Alquiler DATETIME,
    @Fecha_Devolucion DATETIME,
    @Estado VARCHAR(20),
    @Penalidad DECIMAL(10,2),
    @Resultado BIT OUTPUT

AS
BEGIN
    SET NOCOUNT ON;

    IF NOT EXISTS (SELECT 1 FROM Alquileres WHERE ID_Alquiler = @ID_Alquiler)
    BEGIN
        SET @Resultado = 0;
        RETURN;
    END

    UPDATE Alquileres
    SET Fecha_Devolucion = @Fecha_Devolucion, Estado = @Estado, Penalidad = @Penalidad
    WHERE ID_Alquiler = @ID_Alquiler;

    SET @Resultado = 1;
END;


CREATE OR ALTER PROCEDURE sp_ObtenerAlquileres
AS
BEGIN
    SELECT * FROM Alquileres A
	INNER JOIN [dbo].[Libros] L ON L.[ID_Libro]=A.[ID_Libro]
	INNER JOIN [dbo].[Usuarios] U ON U.[ID_Usuario]=A.[ID_Usuario]
END;

CREATE OR ALTER PROCEDURE sp_ObtenerAlquilerPorId
    @ID_Alquiler INT
AS
BEGIN
    SET NOCOUNT ON;
    SELECT * FROM Alquileres 
	WHERE ID_Alquiler = @ID_Alquiler;
END;


CREATE PROCEDURE sp_EliminarAlquiler
    @ID_Alquiler INT,
    @Resultado BIT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    IF NOT EXISTS (SELECT 1 FROM Alquileres WHERE ID_Alquiler = @ID_Alquiler)
    BEGIN
        SET @Resultado = 0;
        RETURN;
    END

    DELETE FROM Alquileres WHERE ID_Alquiler = @ID_Alquiler;
    SET @Resultado = 1;
END;