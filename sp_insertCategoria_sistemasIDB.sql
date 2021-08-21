

SELECT * FROM Categorias

create proc sp_insertCategoria
@NOMBRECAT NVARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;
    Insert INTO Categorias VALUES(@NOMBRECAT)
END
GO