

use SistemasIDB

select * from Productos
select * from marcas
select * from Categorias
select * from proveedores

insert into Categorias VALUES('Bebidas'),('Comidas')
insert into Marcas VALUES('Cocacola'),('Pepsi')
insert into proveedores(Nombre) VALUES('Cerveceria Hondureña')

insert into Productos VALUES('COC01','Cocacola 3L','3 Litros',58,56,1,1,1,1)

select * from pro


exec sp_rptProductrosFiltro 'Cerveceria Hondureña'