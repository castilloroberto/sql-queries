


create proc sp_VistaProductos
as
Begin
    set NOCOUNT on;
    select ProductID [CodigoProducto],
            ProductName [NombreProducto],
            c.CategoryName [Categoria],
            UnitPrice [PrecioUnitario],
            UnitsInStock [Inventario],
            QuantityPerUnit [CantidadPorUnidad],
            s.CompanyName [Proveedor]
    from Products p
    inner JOIN Categories c on c.CategoryID = p.CategoryID
    inner JOIN Suppliers s on s.SupplierID = p.SupplierID;
end
go