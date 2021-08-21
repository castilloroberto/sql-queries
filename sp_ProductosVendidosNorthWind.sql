



create proc sp_ProductosVendidos
as
BEGIN
    set NOCOUNT on;
    select od.ProductID,p.ProductName,sum(Quantity) CantidadVendida 
    from [Order Details] od
    inner join [Products] p on p.ProductID = od.ProductID
    GROUP BY od.ProductID,p.ProductName
    ORDER by ProductID ASC;
end
go
