{Una empresa de transporte de cargas dispone de la información de su flota compuesta por 100
camiones. De cada camión se tiene: patente, año de fabricación y capacidad (peso máximo en
toneladas que puede transportar).
Realizar un programa que lea y almacene la información de los viajes realizados por la empresa. De
cada viaje se lee: código de viaje, código del camión que lo realizó (1..100), distancia en kilómetros recorrida, 
ciudad de destino, año en que se realizó el viaje y DNI del chofer. La lectura finaliza cuando
se lee el código de viaje -1.
Una vez leída y almacenada la información, se pide:
1. Informar la patente del camión que más kilómetros recorridos posee y la patente del camión que
menos kilómetros recorridos posee.
2. Informar la cantidad de viajes que se han realizado en camiones con capacidad mayor a 30,5
toneladas y que posean una antigüedad mayor a 5 años al momento de realizar el viaje (año en
que se realizó el viaje).
3. Informar los códigos de los viajes realizados por choferes cuyo DNI tenga sólo dígitos impares.
Nota: Los códigos de viaje no se repiten.}

program ejercicio5;
const dimF=100;
type
	rango=1..dimF;
	cadena=string[6];
	cadena2=string[20];
	camion=record
		pat:cadena;
		mode:integer;
		cap:real;
	end;
	vector = array[1..dimF] of camion;
	viaje=record
		codV:integer;
		codC:rango;
		km:real;
		ciudad:cadena2;
		fecha:integer;
		dni:integer;
	end;
	lista=^nodo;
	nodo = record
		dato:viaje;
		sig:lista;
	end;
	contador = array[1..dimF] of integer;
	
	lista2=^nodo2;
	nodo2= record
		v:integer;
		sig:lista2;
	end;
	
procedure leerViaje(var reg:viaje);
begin
	readln(reg.codV);
	readln(reg.codC);
	readln(reg.km);
	readln(reg.ciudad);
	readln(reg.fecha);
	readln(reg.dni);
end;

procedure agregarViaje(var l:lista; reg:viaje);
var aux:lista;
begin
	new(aux);
	aux^.dato:=reg;
	aux^.sig:=l;
	l:=aux;
end;

procedure iniciarContador(var vc:contador);
var i:integer;
begin
	for i:=1 to dimF do
		vc[i]:=0;
end;

procedure extremos(var max,min:rango; vc:contador);
var i:rango;
begin
	max:=1;
	min:=1;
	for i:=2 to dimF do begin
		if(vc[i]>vc[max]) then max:=i
		else if(vc[i]<vc[min]) then min:=i;
	end;
end;

procedure cantidad(var cant:integer; fecha:integer; codC:rango; vcamion:vector);
var ant:integer;
begin
	ant:=fecha-vcamion[codC].mode;
	if(vcamion[codC].cap>30.5) and (ant>5) then
		cant:=cant+1;
end;

function impares(dni:integer):boolean;
aux:boolean
begin
	exito:=true;
	while(dni<>0) and (exito) do begin
		if(dni mod 2 = 0) then
			exito:=false
		else
			dni:=dni div 10;
	end;
	impares:=exito;
end;

procedure codigosDeViaje(var l2:lista2; codV:integer;);
var aux:lista2;
begin
	new(aux);
	aux^.v:=codV;
	aux^.sig:=l2;
	l2:=aux;
end;

procedure InformarCodigos(l2:lista2);
begin
	while(l2<>nil) do begin
		writeln('codigos de viaje con chofer de dni de digitos impares', l2^.v);
		l2:=l2^.sig;
	end;
end;

procedure leerEInformar(var l:lista,vcamion:vector);
var reg:viaje;vc:contador;cant:integer; max,min:rango; l2:lista2;
begin
	iniciarContador(vc);
	leerViaje(reg);
	l2:=nil;
	max:=0;
	min:=0;
	cant:=0;
	while(reg.codV<>-1) do begin
		agregar(l,reg);
		vc[reg.codC]:=vc[reg.codC]+reg.km;
		cantidad(cant,reg.fecha,reg.codC,vcamion);
		if(impares(reg.dni)) then codigosDeViaje(l2,reg.codV);
		leerViaje(reg);
	end;
	extremos(max,min,vc);
	if(max<>0) and (min<>0) then writeln('patentes: ', max ' y ', min);
	writeln('cantidad de viajes que cumplen los requisitos: ', cant);
	InformarCodigos(l2);
end;

var l:lista; vcamion:vector;
begin
	l:=nil;
	cargarVector(vcamion); {se dispone}
	leerEInformar(l,vcamion);
end.
