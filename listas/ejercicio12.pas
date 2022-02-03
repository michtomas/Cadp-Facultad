program ejercicio12;

type
	cadena=string[20];
	info=record
		version:cadena;
		pantalla:real;
		ram:real;
	end;
	lista=^nodo;
	nodo = record
		dato:info;
		sig:lista;
	end;


procedure recorrerLista(l:lista);
var
begin
	while (l<>nil) do begin
		cant:=0;
		vActual:=l^.dato.version;
		while (l<>nil) and (vActual=l^.dato.version) do begin
			cant:=cant+1;
			l:=l^.sig;
			contarB(l^.dato,cant);
			sumarPantalla(l^.dato.pantalla,suma);
		end;
	end;
end;

{principal}
var

begin
	l:=nil;
	cargarLista(l); {se dispone}
	recorrerLista(l);
	
