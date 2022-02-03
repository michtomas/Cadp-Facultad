program ejercicio3;

const
	dimF=100;

type
	vector = array[1..dimF] of integer;
	
procedure imprimir(v: vector; dimL: integer);
var
	i: integer;
begin
	for i:=1 to dimL do
		writeln(v[i]);
end;

procedure imprimirReves(v: vector; dimL: integer);
var 
	i: integer;
begin
	for i:=dimL downto 1 do
		writeln(v[i]);
end;

procedure imprimirMitad(v: vector; dimL: integer);
var
	i,mitad: integer;
begin
	mitad:= dimL Div 2;
	for i:=mitad downto 1 do
		writeln(v[i]);
	for i:=(mitad+1) to dimL do
		writeln(v[i]);
end;


procedure imprimirPorcion(v: vector; dimL, x,y: integer);
var
	i:integer;
begin
	if((x<y) and (dimL>y)) then begin
		for i:=x to y do
			writeln(v[i]);
	end
	else if (dimL>x) then begin
		for i:=x downto y do
			writeln(v[i]);
	end;
end;
	
procedure leerVector(var v: vector; var dimL: integer);
var
	i: integer;
begin
	writeln('Ingrese la dimension deseada del vector');
	readln(dimL);
	while(dimL>dimF) do begin
		writeln('Ingrese una dimension menor o igual a 100');
		readln(dimL);
	end;	
	for i:=1 to dimL do
		readln(v[i]);
end;
var
	v: vector; 
	dimL: integer;
begin
	leerVector(v,dimL);
	imprimir(v,dimL);
	imprimirReves(v,dimL);
	imprimirMitad(v,dimL);
	imprimirPorcion(v,dimL,2,10);
end.
	
	
	
