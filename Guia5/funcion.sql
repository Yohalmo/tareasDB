
create function CalcularGastoTotal(@IdReservacion int)
returns decimal(10, 2)
as
begin

	declare @Total decimal(10, 2);

	--calcula el monto total del hospedaje
	set @Total = (select DATEDIFF(day, fecha_entrada, fecha_salida) * precio_noche
	from reservaciones r inner join habitaciones h on h.id_habitacion = r.id_habitacion
	where id_reservacion = @IdReservacion);
	
	--suma lo consumido en los servicios adicionales 
	set @Total = @Total + (select sum(precio_servicio) from historial_Servicios where id_reservacion = @IdReservacion);
	
	return @Total;
end