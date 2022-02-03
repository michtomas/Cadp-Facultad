{ El Observatorio Astronómico de La Plata ha realizado un relevamiento sobre los distintos objetos
astronómicos observados durante el año 2015. Los objetos se clasifican en 7 categorías: 1: estrellas,
2: planetas, 3: satélites, 4: galaxias, 5: asteroides, 6: cometas y 7: nebulosas.
Al observar un objeto, se registran los siguientes datos: código del objeto, categoría del objeto (1..7),
nombre del objeto, distancia a la Tierra (medida en años luz), nombre del descubridor y año de su
descubrimiento.
A. Desarrolle un programa que lea y almacene la información de los objetos que han sido
observados. Dicha información se lee hasta encontrar un objeto con código -1 (el cual no
debe procesarse). La estructura generada debe mantener el orden en que fueron leídos los
datos.
B. Una vez leídos y almacenados todos los datos, se pide realizar un reporte con la siguiente
información:
1. Los códigos de los dos objetos más lejanos de la tierra que se hayan observado.
2. La cantidad de planetas descubiertos por "Galileo Galilei" antes del año 1600.
3. La cantidad de objetos observados por cada categoría.
4. Los nombres de las estrellas cuyos códigos de objeto poseen más dígitos pares que
impares.}

program ejercicio6;
type
	rango=1..7;
	cadena=string[30];
	astro = record
		cod:integer;
		cat:rango;
		nom:cadena;
		dist:real;
		desc:cadena;
		fecha:integer;
	end;
	lista=^nodo;
	nodo = record
		dato:astro;
		sig:lista;
	end;
	contador = array[1..7] of integer;
	
procedure leerAstro(var ast:astro);
begin
	readln(ast.cod);
	if(ast.cod <> -1) then begin
		readln(ast.cat);
		readln(ast.nom);
		readln(ast.dist);
		readln(ast.desc);
		readln(ast.fecha);
	end;
end;

procedure agregar(var pri,ult:lista; ast:astro);
var aux:lista;
begin
	new(aux);
	aux^.dato:=ast;
	aux^.sig:=nil;
	if(pri<>nil) then 
		ult^.sig:=aux
	else
		pri:=aux;
	ult:=aux;
end;

procedure leerLista(var pri,ult:lista);
var ast:astro;
begin
	leerAstro(ast);
	while(ast.cod <>-1) do begin
		agregar(pri,ult,ast);
		leerAstro(ast);
	end;
end;

procedure lejanos(var max1,max2,cod:integer; d1,d2,dist:real);
begin
	if(dist>d1) then begin
		max2:=max1;
		d2:=d1;
		max1:=cod;
		d1:=dist;
	end
	else
	if(dist>d2) then begin
		max2:=cod;
		d2:=dist;
	end;
end;

procedure cantidad(var cant:integer; fecha:integer; descubridor:cadena);
begin
	if(fecha<1600) and (descubridor = 'Galileo Galilei') then cant:=cant+1;
end;

procedure iniciarContador(var vc:contador);
var i:integer;
begin
	for i:=1 to 7 do
		vc[i]:=0;
end;

procedure categorias(var vc:contador; cat:rango);
begin
	vc[cat]:=vc[cat]+1;
end;

function digitos(cod:integer):boolean;
var impares,pares:integer;
begin
	impares:=0;
	pares:=0;
	while (cod<>0) do begin
		if(cod mod 2=0) then pares:=pares+1
		else impares:=impares+1;
		cod:=cod div 10;
	end;
	if(pares>impares) then digitos:=true
	else digitos:=false;
end;

procedure analizarLista(l:lista);
var  max1,max2,cant,i:integer; d1,d2:real;vc:contador;
begin
	max1:=0;
	max2:=0;
	d1:=0;
	d2:=0;
	cant:=0;
	iniciarContador(vc);
	while(l<>nil) do begin
		lejanos(max1,max2,l^.dato.cod,d1,d2,l^.dato.dist);
		cantidad(cant,l^.dato.fecha,l^.dato.desc);
		categorias(vc,l^.dato.cat);
		if(digitos(l^.dato.cod)) then writeln(l^.dato.nom);
	end;
	writeln(max1,max2);
	writeln(cant);
	for i:=1 to 7 do
		writeln('categoria ', i,': ', vc[i]);
end;

var pri,ult:lista; 
begin
	pri:=nil;
	ult:=nil;
	leerLista(pri,ult);
	analizarLista(pri);
end.
