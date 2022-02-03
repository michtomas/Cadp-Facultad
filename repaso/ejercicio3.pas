{Una remisería dispone de información acerca de los viajes realizados durante el mes de mayo de
2020. De cada viaje se conoce: número de viaje, código de auto, dirección de origen, dirección de
destino y kilómetros recorridos durante el viaje. Esta información se encuentra ordenada por código
de auto y para un mismo código de auto pueden existir 1 o más viajes. Se pide:
a. Informar los dos códigos de auto que más kilómetros recorrieron.
b. Generar una lista nueva con los viajes de más de 5 kilómetros recorridos, ordenada por número
de viaje.}

program ejercicio3;

type
	cadena =string[20];
	infoViaje = record
		num:integer;
		cod:integer;
		dirO:cadena;
		dirD:cadena;
		km:real;
	end;
	lista=^nodo;
	nodo = record
		dato:infoViaje;
		sig:lista;
	end;
	
procedure leerViaje(var v:infoViaje);
begin
	readln(v.num);
	readln(v.cod);
	readln(v.dirO);
	readln(v.dirD);
	readln(v.km);
end;	
	
procedure agregarOrdenado(var l:lista; v:infoViaje);
var
begin
	
end;	

