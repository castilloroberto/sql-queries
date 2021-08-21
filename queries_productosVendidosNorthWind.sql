





select od.ProductID [CodigoProducto],
        p.ProductName [NombreProducto],
        od.Quantity Cantidad,
        od.UnitPrice [PrecioUnitario],
        (od.UnitPrice*od.Quantity) [Subtotal],
        o.OrderID 
from Orders o
inner join [Order Details] od on od.OrderID = o.OrderID
inner join [Products] p on p.ProductID = od.ProductID




select od.ProductID,p.ProductName,sum(Quantity) CantidadVendida 
from [Order Details] od
inner join [Products] p on p.ProductID = od.ProductID
GROUP BY od.ProductID,p.ProductName
ORDER by CantidadVendida desc