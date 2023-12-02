
CREATE TRIGGER ActualizacionClientes
ON clientes
for UPDATE
AS
BEGIN
	if(update(telefono))
	begin
		INSERT INTO bitacoras (tabla, valor_anterior, valor_nuevo, descripcion)
		SELECT 
			'clientes', 
			DELETED.telefono, 
			INSERTED.telefono,
			'se mofico el campo telefono'
		FROM 
			INSERTED 
		JOIN 
			DELETED ON INSERTED.id_cliente = DELETED.id_cliente;
	end;

END
