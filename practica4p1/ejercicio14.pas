program ejercicio14;
const dimf=50;
type
	subrango=0..50;
	rango=1..1000;
	rango2=1..5;
	cadena=string[20];
	participante = record
		pais: cadena;
		cod: rango;
		nom: cadena;
		rol: rango2;
		horas: integer;
	end;
	vector = array[1..dimF] of participante;

procedure leerVector(var v:vector; var dimL:subrango);
var	aux:participante;
begin
	dimL:=0;
	writeln('Ingrese pais');
	readln(aux.pais);
	writeln('Ingrese codigo');
	readln(aux.cod);
	writeln('Ingrese nombre del proyecto');
	readln(aux.nom);
	writeln('Ingrese el rol');
	readln(aux.rol);
	writeln('Ingrese horas trabajadas');
	readln(aux.horas);
	while(aux.cod <> (-1)) and (dimL<=dimF) do begin
		dimL:=dimL+1;
		v[dimL]:=aux;
		writeln('Ingrese pais');
		readln(aux.pais);
		writeln('Ingrese codigo');
		readln(aux.cod);
		writeln('Ingrese nombre del proyecto');
		readln(aux.nom);
		writeln('Ingrese el rol');
		readln(aux.rol);
		writeln('Ingrese horas trabajadas');
		readln(aux.horas);
	end;
end;

function monto(v:vector;dimL:subrango): real;
var aux:real; i:subrango;
begin
	aux:=0;
	for i:=1 to dimL do begin
		if(v[i].pais = 'Argentina') then aux:=aux+v[i].horas;
	end;
	monto:=aux;	
	
end;

function horas(v:vector; dimL:subrango): integer;
var aux:integer; i:subrango;
begin
	aux:=0;
	for i:=1 to dimL do
		if(v[i].rol = 3) then aux:=aux+v[i].horas;
	horas:=aux;
end;



var dimL:subrango; v:vector;
begin
end. 
