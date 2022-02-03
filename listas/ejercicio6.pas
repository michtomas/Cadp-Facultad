program ejercicio6;

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
	v=array[1..7] of integer;
	
procedure cargarV(var rangosV:v);
var i:integer;
begin 
	for i:=1 to 7 do
		rangosV[i]:=0;
end;

procedure leerSonda(var s: sonda; var cantS,cantMeses:integer; var costoTotal:real);
begin
	readln(s.nombre);
	readln(s.meses);
	readln(s.costoC);
	readln(s.costoM);
	readln(s.rango);
	cantS:=cantS+1;
	costoTotal:=costoTotal + s.costoC+ s.costoM;
	cantMeses:=cantMeses + s.meses;
end;

procedure agregar(var l:lista; s:sonda);
var aux:lista;
begin
	new(aux);
	aux^.dato:=s;
	aux^.sig:=l;
	l:=aux;
end;
	
procedure cargarLista(var l:lista; var promTiempo,promCosto:real);
var s:sonda; cantS,cantMeses:integer; costoTotal:real;
begin
	repeat
		leerSonda(s,cantS,cantMeses,costoTotal);
		agregar(l,s);
	until(s.nombre='GAIA');
	promTiempo:=cantMeses/cantS;
	promCosto:=costoTotal/cantS;
end;

procedure costosa(nom:cadena; var nomM:cadena; cC,cM:real; var maxC:real);
begin
	if(cC+cM>maxC) then begin 
		nomM:=nom;
		maxC:=cC+cM
	end; 
end;
 
procedure rangos(r:indice; var rangoV:v);
begin
	rangoV[r]:=rangoV[r] + 1;
end;

procedure supDuracion(var cant:integer; promTiempo:real; meses:integer);
begin
	if(meses>promTiempo) then cant:=cant+1;
end;

procedure supCosto(nombre:cadena; costoC, promC:real);
begin	
	if(CostoC>promC) then write(nombre);
end;

procedure analizarLista(l:lista; promTiempo,promCosto:real);
var maxC:real; nombreMax:cadena; rangoV:v; cant,i:integer;
begin
	cargarV(rangoV);
	maxC:=0;
	while l<> nil do begin
		costosa(l^.dato.nombre,nombreMax,l^.dato.costoC,l^.dato.costoM,maxC);
		rangos(l^.dato.rango,rangoV);
		supDuracion(cant,promTiempo,l^.dato.meses);
		supCosto(l^.dato.nombre, l^.dato.costoC, promCosto);
		l:=l^.sig;
	end;
	writeln(nombreMax);
	for i:=1 to 7 do
		writeln(rangoV[i]);
	writeln(cant);
end;

var l:lista; promTiempo,promCosto: real;

begin
	l:=nil;
	promTiempo:=0;
	promCosto:=0;
	cargarLista(l,promTiempo,promCosto);
	analizarLista(l,promTiempo,promCosto);
end.
