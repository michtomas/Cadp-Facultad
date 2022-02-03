program ejercicio7;

type
	cadena=string[20];
	indice=1..7;
	sonda = record
		nombre:cadena;
		meses:integer;
		costoC:real;
		costoM:real;
		rango:indice;
	end;
	lista=^nodo;
	nodo = record
		dato:sonda;
		sig:lista;
	end;	

procedure agregar(var l:lista; s:sonda);
var aux:lista;
begin
	new(aux);
	aux^.dato:=s;
	aux^.sig:=l;
	l:=aux;
end;

procedure leerSonda(var s: sonda);
begin
	readln(s.nombre);
	readln(s.meses);
	readln(s.costoC);
	readln(s.costoM);
	readln(s.rango);
end;

procedure cargarLista(var l:lista);
var s:sonda; 
begin
	repeat
		leerSonda(s);
		agregar(l,s);
	until(s.nombre='GAIA');
end;

function cumple(s:sonda):boolean;
begin
	if(s.costoC>s.costoM) and (s.rango<>1) then
		cumple:=true
	else
		cumple:=false;
end;



procedure dividirListas(l:lista; var lApro,lDesa:lista);
begin
	
	if (cumple(l^.dato)) then
		agregar(lApro,l^.dato)
	else
		agregar(lDesa,l^.dato);
end;

procedure analizar(lDesa:lista);
var costo:real;
begin
	while lDesa<> nil do begin
		costo:=lDesa^.dato.costoC + lDesa^.dato.costoM;
		write('Costo de la sonda ', lDesa^.dato.nombre, ' : ', costo);
	end;
end;

var l,lApro,lDesa:lista;
begin
	l:=Nil;
	lApro:=nil;
	lDesa:=nil;
	cargarLista(l);
	dividirListas(l,lApro,lDesa);
	analizar(lDesa);
end.
