program	banco2;
Type cadena15 = string [15];
	fecha = record
		dia:1..31;
		mes:1..12;
		anio:1900..2100;
		end;
	cliente = record
		nroCuenta: integer;
		sucursal: cadena15;
		nombre:cadena15;
		apellido:cadena15;
		fechaCreacion:fecha;
		saldo: real;
		end;
		
procedure LeerCliente (var cli: cliente);
	procedure LeerFecha (var f: fecha);
		begin
			writeln('Ingrese el dia: '); readln(f.dia);
			writeln('Ingrese el mes: '); readln(f.mes);
			writeln('Ingrese el año: '); readln(f.anio);
		end;
begin
		writeln ('Ingrese numero  cuenta: '); readln (cli.nroCuenta);
		if(cli.nroCuenta <> -1 ) then begin
			writeln ('Ingrese numero  de sucursal: '); readln (cli.sucursal);
			writeln ('Ingrese nombre: '); readln (cli.nombre);
			writeln ('Ingrese apellido: '); readln (cli.apellido);
			writeln ('Ingrese saldo: '); readln (cli.saldo);
		end;
end;

var c: cliente; sumaSaldos, sumaSucursal:real; sucActual: cadena15;
begin
	LeerCliente(c); sumaSaldos:=0;
	while(c.nroCuenta <> -1 ) do
	begin
		sucActual:= c.sucursal; sumaSucursal:=0;
		while (c.sucursal = sucActual) and (c.nroCuenta <> -1 ) do
		begin
			sumaSucursal:= sumaSucursal + c.saldo;
			LeerCliente(c);	
		end;
		writeln('Sucursal: ', sucActual, 'saldo; ', sumaSucursal);	
		sumaSaldos:= sumaSaldos + sumaSucursal;
	end;
	writeln('Monto total: ', sumaSaldos:2:2);
end.
	
