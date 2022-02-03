program ejercicio11;
const dimF=200;
type 
	indice=0..200;
	cadena=string[20];
	fotos=record
		titu:cadena;
		autor:cadena;
		mg:integer;
		clics:integer;
		comen:integer;
	end;
	vector=array[1..dimF] of fotos;
function MasVista(v:vector):cadena;
var i,visitasMax:integer;
begin
	MasVista:=v[1].titu;
	visitasMax:=v[1].clics;
	for i:=2 to dimF do begin
		if(v[i].clics > visitasMax) then begin
			visitasMax:=v[i].clics;
			MasVista:=v[i].titu;
		end;
	end;
end;
function totalC(v:vector):integer;
var i:integer;
begin
	totalC:=0;
	for i:=1 to dimF do
		totalC:=totalC+v[i].comen;
end;
function meGustas(v:vector): integer;	
	function Pos(v:vector):indice;
		var i:integer;exito:boolean;
		begin
		Pos:=0;
		i:=1;
		exito:=false;
		while (i<=dimF) and (not exito) do begin
			if(v[i].autor = 'Art Vandelay') then 
				exito:=true
			else 
				i:=i+1;
		end;
		if exito then Pos:=i;
	end;
var i:indice;
begin
	i:=Pos(v);
	if i<>0 then meGustas:=v[i].mg
	else meGustas:=0;
end;
procedure leerVector(var v:vector);
var i:integer;
begin
	for i:=1 to dimF do begin
		writeln('Ingrese titulo');
		readln(v[i].titu);
		writeln('Ingrese autor');
		readln(v[i].autor);
		writeln('Ingrese mg');
		readln(v[i].mg);
		writeln('Ingrese clics');
		readln(v[i].clics);
		writeln('Ingrese comentarios');
		readln(v[i].comen);
	end;
end;
var v:vector;
begin
	leerVector(v);
	writeln('Titulo de la mas vista: ', MasVista(v));
	writeln('Me gustas de Art Vandelay: ', meGustas(v));
	writeln('Comentarios totales:', totalC(v));
end.
