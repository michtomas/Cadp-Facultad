program ej1;
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

type
	cadena=string[20];}
	rango=1..5;
	persona = record
		dni:integer;
		ape:cadena;
		nom:cadena;
		edad:integer;
		cod:rango;
	end;
	VContador = array[1..5] of integer;
	lista=^nodo;
	nodo = record
		dato:persona;
		sig:lista;
	end;
	
procedure leerPersona(var p:persona);
begin
	readln(p.dni);
	readln(p.ape);
	readln(p.nom);
	readln(p.edad);
	readln(p.cod);
end;

procedure agregarPersona(var l:lista; p:persona);
var aux:lista;
begin
	new(aux);
	aux^.dato:=p;
	aux^.sig:=l;
	l:=aux;
end;

function digitos(dni:integer):boolean;
var pares,impares:integer;
begin
	pares:=0;
	impares:=0;
	while(dni<>0) do begin
		if(dni mod 2 = 0) then pares:=pares+1;
		else impares:=impares+1;
		dni:=dni div 10;
	end;
	if(pares > impares) then digitos:=true;
	else digitos:=false;
end;

procedure iniciarVc(var vc:VContador);
var i:integer;
begin
	for i:=1 to 5 do
		vc[i]:=0;
end;

procedure contador(cod:rango;var vc:VContador);
begin
	vc[rango]:=vc[rango]+1:
end;

procedure maximos(v:VContador; max1,max2: rango);
var i:integer;
begin
	max1:=v[1];
	if(v[2]> max1) then begin
		max1:=v[2];
		max2:=v[1];
	end
	else
		max2:=v[2];
	for i:=3 to 5 do begin
		if(v[3]>max1) then begin
			max2:=max1;
			max1:=v[3];
		end;
		else
			if(v[3]>max2) then
				max2:=v[3];
	end;
end;

procedure leerLista(var l:lista);
var p:persona; cant:integer; max1,max2:rango; vc:Vccontador;
begin
	iniciarVc(vc);
	max1:=0;
	max2:=0;
	cant:=0;
	repeat
		leerPersona(p);
		agregarPersona(l,p);
		if(digitos(l^.dato.dni)) then cant:=cant+1;
		contador(l^.dato.cod,vc);
	until(p.dni=33555444);
	maximos(vc,max1,max2);
	writeln('cantidad de personas que cumplen a): ', cant);
	writeln('generos mas vistos: ' max1, ' y ', max2);
end;

function buscarPos(dni:integer);

procedure eliminarPersona(dni:integer; var l:lista);
var
begin
	aux:=buscarPos(dni,l);
end;

