program ejercicio10;
type
	cliente=record
		dni:integer;
		num:integer;
	end;
	lista=^nodo;
	nodo= record
		dato:cliente;
		sig:lista;
	end;

procedure leerPrimerCliente(var cli:cliente);
begin
	readln(cli.dni);
	cli.num:=1;
end;

procedure leerCliente(var cli: cliente; l:lista);
begin
	readln(cli.dni);
	num:=l^.dato.num +1;
end;

procedure agregarCliente(var l,ult:lista; cli:cliente);
var aux:lista;
begin
	new(aux);
	aux^.sig:=nil;
	aux^.dato:=cli;
	if(l<>nil) then
		ult^.sig:=aux;
	else
		l:=aux;
	ult:=aux;	
end;
procedure leerLista(var l:lista);
var
	cli:info;
begin
	leerPrimerCliente(cli);
	while(cli.dni <> 0) do begin
		agregarCliente(l,cli)
		leerCliente(cli);	
	end;	
end;

procedure atenderCliente();
begin
end;


	
