alter TRIGGER t_UpdateInventario  
ON DetallesVentas   
AFTER INSERT, UPDATE   
AS 
    BEGIN
        update Productos 
        set Existencias = Existencias - (select Cantidad from inserted)
        where ID = (select IDProducto from inserted)
    END
GO  