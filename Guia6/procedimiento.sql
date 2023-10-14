create PROCEDURE NuevoCliente @nombre varchar(255), @apellido varchar(255), @dui varchar(10), 
@pasaporte varchar(255), @id_direccion int, @telefono varchar(15), @email varchar(50)
as BEGIN

INSERT INTO clientes ( nombre, apellido, dui, pasaporte, id_direccion, Telefono, email) 
VALUES (@nombre, @apellido, @dui, @pasaporte, @id_direccion, @telefono, @email);

end;