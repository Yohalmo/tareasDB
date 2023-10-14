use hotel;
-- CURSOR DINAMICO -----------------------------------------------
-- Variables para nueva insercion
declare @Impuesto decimal(10, 2) = 13.00;
declare @PrecioActual decimal(10, 2);
declare @NuevoPrecio decimal(10,2);
declare @servicio int;
 
declare CursorDinamico cursor dynamic for
select id_servicio, precio_servicio from dbo.servicios_adicionales

open CursorDinamico
fetch next from CursorDinamico into @servicio, @PrecioActual
print 'Actualizando el precio de los servicios adicionales'

while @@FETCH_STATUS = 0
begin
    print 'Precio actual: ' + cast(@PrecioActual as varchar(10))
	set @NuevoPrecio = @PrecioActual + (@PrecioActual * (@Impuesto / 100))

	update dbo.servicios_adicionales set precio_servicio = @NuevoPrecio 
	where id_servicio = @servicio

	insert into bitacoras(tabla, valor_anterior, valor_nuevo, descripcion)
	values ('servicios_adicionales', cast(@PrecioActual as varchar(10)),
	cast(@NuevoPrecio as varchar(10)), 'Impuesto agregado al servicio')
	
	fetch next from CursorDinamico into @servicio, @PrecioActual
end

close CursorDinamico
deallocate CursorDinamico