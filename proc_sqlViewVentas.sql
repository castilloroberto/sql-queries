

create proc sp_SQLViewVentas
@IDVenta UNIQUEIDENTIFIER
as
    Select * from VentasView 
    where IDVenta = @IDVenta 
    order by CodigoFactura
go