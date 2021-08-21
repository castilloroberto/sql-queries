

create view v_ResumenVenta
as
select 
        v.CodigoFactura,
        c.Nombre as Cliente,
        cl.Nombre as Colaborador,
        sum(dv.Cantidad) as Productos,
        sum(dv.Cantidad * dv.PrecioVenta) as Total,
        v.FechaInicio as Fecha 
from Ventas v
inner join DetallesVentas dv on dv.IDVenta = v.ID
inner join Clientes c on c.DNI = v.IDCliente
inner join Colaboradores cl on cl.DNI = v.IDColaborador
GROUP by v.CodigoFactura,c.Nombre,cl.Nombre,v.FechaInicio
go


