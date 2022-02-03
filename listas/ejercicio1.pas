program listas;
type
	lista=^nodo;
	nodo=record
		num:integer;
		sig:lista;
	end;
procedure armarNodo(var L: lista; v: integer);
var
 aux,aux2 : lista;
begin
 new(aux);
 new(aux2);
 aux2^.sig := l;
 aux^.num:=v;
 aux^.sig:= aux2^.sig;
 l^.sig := aux;
end;
procedure imprimir(l:lista);
begin
	while(l<>Nil) do begin
		writeln(l^.num);
		l:=l^.sig;
	end;
end;

var
 pri : lista;
 valor : integer;
begin
 pri := nil;
 writeln('Ingrese un numero');
 read(valor);
 while (valor <> 0) do begin
 armarNodo(pri, valor);
 writeln('Ingrese un numero');
 read(valor);
 end;
 imprimir(pri);
 
 
 
end.
