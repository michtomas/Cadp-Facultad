{Implementar un programa que lea y almacene información de clientes de una empresa aseguradora
automotriz. De cada cliente se lee: código de cliente, DNI, apellido, nombre, código de póliza
contratada (1..6) y monto básico que abona mensualmente. La lectura finaliza cuando llega el cliente
con código 1122, el cual debe procesarse.
La empresa dispone de una tabla donde guarda un valor que representa un monto adicional que el
cliente debe abonar en la liquidación mensual de su seguro, de acuerdo al código de póliza que tiene
contratada.
Una vez finalizada la lectura de todos los clientes, se pide:
a. Informar para cada cliente DNI, apellido, nombre y el monto completo que paga mensualmente
por su seguro automotriz (monto básico + monto adicional).
b. Informar apellido y nombre de aquellos clientes cuyo DNI contiene al menos dos dígitos 9.
c. Realizar un módulo que reciba un código de cliente, lo busque (seguro existe) y lo elimine de la
estructura.}

program ejercicio2;
type
	rango=1..6;
	cadena =string[20];
	cliente = record
		dni:integer;
		ape:cadena;
		nom:cadena;
		cod:rango;
		monto:real;
	end;
	lista=^nodo;
	nodo =record
		dato:cliente;
		sig:lista;
	end;
	
	
procedure leerCliente(var cli:cliente);
begin
	readln(cli.dni);
	readln(cli.ape);
	readln(cli.nom);
	readln(cli.cod);
	readln(cli.monto);
end;

procedure agregarCliente(var l:lista; cli:cliente);
var aux:lista;
begin
	new(aux);
	aux^.dato:=cli;
	aux^.sig:=l;
	l:=aux;
end;

procedure informarCliente(c:cliente; v:tabla);
begin
	writeln(c.dni);
	writeln(c.nom);
	writeln(c.ape);
	writeln(c.monto * v[c.cod]);
end;

function digitos(c:cliente):boolean;
var aux,cant:integer;
begin
	cant:=0;
	while (c.dni<> 0) and (cant<2) do begin
		aux:=c.dni mod 10;
		if( aux = 9) then cant:=cant+1;
		c.dni:=c.dni div 10;
	end;
	if(cant=2) then digitos:=true
	else digitos:=false;
end;

procedure informarCliente2(c:cliente);
begin
	writeln(c.nom);
	writeln(c.ape);
end;

procedure leerLista(var l:lista; v:tabla);
var cli:cliente;
begin
	repeat
		leerCliente(cli);
		agregarCliente(l,cli);
		informarCliente(cli,v);
		if(digitos(cli)) then informarCliente2(cli);
end;

procedure eliminarNodo(var l:lista; codigo:integer; var exito:boolean);
var ant,act:lista;
begin
	act:=l;
	ant:=l;
	while(act<> nil) and (act^.dato.cod<> codigo) do begin
		ant:=act;
		act:=act^.sig;
	end;
	if(act<> nil) then begin
		exito:=true;
		if(act=l) then l:=act^.sig;
		else ant^.sig:=act^.sig;
		dispose(act);
	end
	else
		writeln('no se encontro el elemento');
end;

var codigo:integer;l:lista; v:tabla; exito:boolean
begin
	{se dispone tabla v}
	l:nil;
	leerLista(l,v);
	readln(codigo);
	exito:=false;
	eliminarNodo(l,codigo,exito);
end.
