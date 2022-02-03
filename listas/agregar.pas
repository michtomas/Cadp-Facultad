
procedure agregarAdelante(var l:lista; persona:dato);
var aux:lista;
begin
	new(aux);
	aux^.datos:=persona;
	aux^.sig:=l;
	l:=aux;
end;


procedure agregarAlFinal(var pri,ult: lista; persona:dato);
var aux:lista;
begin
	new(aux);
	aux^.datos:=persona;
	aux^.sig:=NIL;
	if(pri<> nil) then
		ult^.sig:=aux;
	else
		pri:=aux;
	ult:=aux; {revisar esto}
end;


procedure insertarOrdenado(var L:lista; j:jugador);
var
nue: lista;
act, ant: lista; {punteros auxiliares para recorrido}
begin
new (nue);
nue^.dato := j;
act := L; {ubico act y ant al inicio de la lista}
ant := L;
while( act <> nil)and(j.altura > act^.dato.altura)do
begin
ant := act;
act:= act^.sig;
end;
if (act = ant) then {al inicio o lista vacía}
L:= nue;
else {al medio o al final}
ant^.sig:= nue;
nue^.sig:= act;
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


eliminarNodo(var l:lista; dni:integer);
var ant,act:lista;
begin
	ant:=l;
	act:=l;
	while(act<> nil) and (l^.dato.dni <> dni)do begin
		ant:=act;
		act:=act^.sig;
	end;
	
	if(act<>nil) then
		if(act=l) then l:=act^
end;
