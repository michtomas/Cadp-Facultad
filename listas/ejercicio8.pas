program JugamosConListas;
	type
	lista = ^nodo;
	nodo = record
		num : integer;
		sig : lista;
	end;


procedure armarNodo(var L: lista; v: integer);
var
 aux : lista;	
 act,ant:lista;
begin
 new(aux);
 aux^.num:=v;
 act:=L;
 ant:=L;
 while (act<>nil) and (act^.num>v) do
 begin
	ant:=act;
	act:=act^.sig;
 end;
 if(act=ant) then {lista vacia}
	l:=aux
 else
	ant^.sig:=aux;
aux^.sig:=act;
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

end.
