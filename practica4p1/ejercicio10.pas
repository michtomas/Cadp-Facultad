program ejercicio10;
const dimF=300;
type vector = array[1..dimF] of real; indice=0..300;
procedure aumentar(dimL: indice; x:real;var v:vector);
var i:integer;
begin
	for i:=1 to dimL do 
		v[i]:=v[i]*x+v[i];
end;
function prom(v:vector; dimL:indice): real;
var i:integer; total:real;
begin
total:=0;
for i:=1 to dimL do
	total:= total + v[i];
prom:=total/dimL;
end;
procedure leerVector(var v:vector; var dimL:indice);
var x:real;
begin
writeln('Ingrese el salario: ');
readln(x);
while(x<>0) and (dimF>=dimL) do begin
dimL:=dimL+1;
v[dimL]:=x;
writeln('Ingrese el salario: ');
readln(x);
end;
end;
var dimL:indice; aumento:real; v:vector;
begin
aumento:=0.15;
dimL:=0;
leerVector(v,dimL);
aumentar(dimL,aumento,v);
writeln('Salario promedio: ', prom(v,dimL));
end.
