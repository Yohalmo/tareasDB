create PROCEDURE HistorialReservaciones
as BEGIN

	select nombre,fecha_entrada, fecha_salida, nombre_habitacion 
	from reservaciones r inner join clientes c on c.id_cliente = r.id_cliente
	inner join habitaciones h on h.id_habitacion = r.id_habitacion 

end;