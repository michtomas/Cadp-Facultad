program ejercicio4;
const dimF = 100;
type
	vector = array [1..100] of integer;

function pos(v: vector; x,dimL: integer): integer;
var i : integer; exito: boolean;
begin
	exito:=false;
	pos:=-1;
	i:=1;
	while (dimL>=i) and( not exito) do begin
		if(v[i] = x) then begin
			exito:=true;
			pos:=i;
		end
		else 
			i:=i+1;
	end;
end;

procedure intercambio(var v: vector; x,y,dimL: integer);
var aux: integer;
begin
	if (dimL>=x) and (dimL>=y) then begin
		 aux:=v[x];
		 v[x]:=v[y];
		 v[y]:=aux;
	end
	else 
		writeln('Ingreso posiciones invalidas');
end;

function suma(v:vector; dimL: integer): integer;
var i: integer;
begin
	suma:=0;
	for i:=1 to dimL do
		suma:= suma + v[i];
end;

function promedio(v:vector; dimL: integer): real;
begin
	promedio:= suma(v,dimL)/dimL;
end;


procedure extremos(v:vector; dimL: integer; var max,min: integer);
var i: integer;
begin
	max:=1;min:=1;
	for i:=2 to dimL do begin
		if(v[i]>v[max]) then
			max:=i;
		if(v[i]<v[min]) then
			min:=i;
	end;
end;

procedure leerVector(var v: vector; var dimL: integer);
begin
	dimL:=1;
	readln(v[dimL]);
	while(dimF>dimL) and (v[dimL]<>0) do begin
		dimL:=dimL+1;
		readln(v[dimL]);
	end;	
end;
procedure imprimir(v: vector; dimL: integer);
var
	i: integer;
begin
	for i:=1 to dimL do
		writeln(v[i]);
end;

var
	v: vector; dimL,x,y: integer;

begin
	leerVector(v,dimL);
	extremos(v,dimL,x,y);
	intercambio(v,x,y,dimL);
	imprimir(v,dimL)
end.
