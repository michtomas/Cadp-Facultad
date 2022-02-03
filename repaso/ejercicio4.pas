{ Una maternidad dispone información sobre sus pacientes. De cada una se conoce: nombre, apellido y
peso registrado el primer día de cada semana de embarazo (a lo sumo 42). La maternidad necesita un
programa que analice esta información, determine e informe:
a. Para cada embarazada, la semana con mayor aumento de peso.
b. El aumento de peso total de cada embarazada durante el embarazo.}

program ejercicio4;
const
	dimF=42;
type
	rango:0..dimF;
	cadena=string[20];
	v=array[1..dimF] of real;
	info=record;
		nom:cadena;
		ape:cadena;
		dimL:rango;
		pesos:v;
	end;
	lista=^nodo;
	nodo = record;
		dato:info;
		sig:lista;
	end;
	

function semana(pesos:v;dimL:rango):rango;
var dif,max:real;i,maxSem:rango;
begin
	max:=v[2]-V[1];
	maxSem:=2;
	for i:=3 to dimL do begin
		dif:=v[i]-v[i-1];
		if(dif>max) then begin
			max:=dif;
			maxSem:=i;
		end;
	end;
	semana:=maxSem;
end;

function aumento(pesos:v;dimL:rango):real;
var i:rango;suma:real;
begin
	suma:=0;
	for i:=2 to dimL do
		suma:=suma+v[i]-v[1];
	aumento:=suma;
end;

procedure Analizar(l:lista);
var mama:info;
begin
	{se dispone la informacion de la variable mama en una lista}
	while(l<>nil) do begin
		writeln(aumento(pesos,dimL));
		writeln(semana(pesos,dimL));
		l:=l^.sig;
	end;
end;

var l:lista;
begin
	l:=nil
	cargarLista(l); {se dispone}
	Analizar(l);
end.

