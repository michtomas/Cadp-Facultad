{1. Una productora nacional realiza un casting de personas para la selección de actores extras de una
nueva película, para ello se debe leer y almacenar la información de las personas que desean
participar de dicho casting. De cada persona se lee: DNI, apellido y nombre, edad y el código de
género de actuación que prefiere (1: drama, 2: romántico, 3: acción, 4: suspenso, 5: terror). La lectura
finaliza cuando llega una persona con DNI 33555444, la cual debe procesarse.
Una vez finalizada la lectura de todas las personas, se pide:
a. Informar la cantidad de personas cuyo DNI contiene más dígitos pares que impares.
b. Informar los dos códigos de género más elegidos.
c. Realizar un módulo que reciba un DNI, lo busque y lo elimine de la estructura. El DNI puede no
existir. Invocar dicho módulo en el programa principal.}

program ej1;

const max =5;

type

cadena20 = string[20];
rango = 1..max;

personas = record
	 dni:integer;
	 apellido:cadena20;
	 nombre:cadena20;
	 edad:integer;
	 codgenero:integer; {NICO: tipo rango}
	end; 
	
lista= ^nodo; 

	nodo = record  		
		datos:personas;   
		sig:lista;		
	end;
	

	
vector = array[rango] of integer;
	
procedure leerregistro (var p:personas);

begin
	write('escribe el dni: '); {NICO: sin if -1}
	readln(p.dni);
	write('escribe el apellido: ');
	readln(p.apellido);
	write('escribe el nombre: ');
	readln(p.nombre);
	write('escribe el edad: ');
	readln(p.edad);
	write('escribe el odgigogen: ');
	readln(p.codgenero);
	writeln('-------------');
end;	


procedure agregarfinal(var l,ult:lista; p:personas); {NICO: ult es parametro por referencia}
var 
	nue:lista;
begin
	new(nue);
	nue^.datos:=p;
	nue^.sig:=nil;
	if (l <> nil) then begin
		ult^.sig:=nue;
	end
	else
		l:= nue;
	ult:=nue;
end;

procedure cargarlista (var l:lista);

var
	p:personas;
	ult:lista;
begin
	leerregistro(p);
	while(p.dni<> -1) do begin {NICO: repeat until hasta que dni = 33...}
		agregarfinal(l,ult,p);
		leerregistro(p);
	end;
	
	repeat
		leerregistro(p);
		agregarfinal(l,ult,p);
	until (p.dni = 33555444);
		
end;

procedure inicializar (var v:vector);

var
	i:integer;
begin
	for i:=1 to max do begin	
		v[i]:=0;
	end;
end;	

function parimpar (dni:integer):boolean;

var
	dig,par,impar:integer;
begin
	par:=0;
	impar:=0;
	
	while(dni <> 0) do begin
		dig:= dni mod 10; {NICO: dentro del while}
		if(dig mod 2= 0) then begin
			par:=par+1;
		end	
		else
			impar:=impar+1;
		dni:=dni div 10;
	end;	
	i{f(par > impar) then begin
		parimpar:=true;
	end	
	else
		parimpar:=false;}
		
	parimpar:= (par > impar);
end;

procedure maximo (var cod1,cod2,votos1,votos2:integer;codgenero,votos:integer);
{NICO: los cods serian de tipo rango}
begin
	if(votos >votos1) then begin
		votos2:=votos1;
		cod2:=cod1;
		votos1:=votos;
		cod1:=codgenero;

	end	
	else
		if(votos >votos2) then begin
			votos2:=votos;
			cod2:=codgenero;		
		end;	
end;

procedure borrarelem(var l:lista; dni:integer; var exito:boolean); {NICO: exito por ref}
var
	ant,act:lista;
begin
	exito:=false;
	act:=l;
	while(act<>nil) and (act^.datos.dni<> dni ) do begin {busca el dni y lo elimina}
		ant:=act;
		act:=act^.sig;
	end;
	if (act<>nil) then begin
		exito:=true;
		if (act = l) then  begin
			l:=act^.sig;
		end	
		else 
			ant^.sig:= act^.sig;
		dispose(act);	
	end
	else
		writeln('no se encontro el elemento');
end;

procedure procesar (l:lista);

var
	cant:integer;
	cod1,cod2,votos1,votos2:integer;
	v:vector;
	i:integer;
begin
	cant:=0;
	votos1:=0;
	inicializar(v);
	while(l <> nil) do begin
		if(parimpar(l^.datos.dni)) then begin
			cant:=cant+1;
		end;	
		v[l^.datos.codgenero]:= v[l^.datos.codgenero] +1;
		l:=l^.sig;
	end;
	writeln('a cantidad de personas cuyo DNI contiene más dígitos pares que impares es: ',cant);
	for i:=1 to 5 do begin
		maximo(cod1,cod2,votos1,votos2,i,v[i]);
	end;	
	writeln('El codigo mas elegido es: ',cod1);
	writeln('El csegundo codigo mas elegido es: ',cod2);
end;

var
	l:lista;
	dni:integer;
	exito:boolean;
begin
	l:=nil;
	cargarlista(l);
	procesar(l);
	write('escriba el dni que quiere eliminar');
		readln(dni);
		borrarelem(l,dni,exito);
end.	
