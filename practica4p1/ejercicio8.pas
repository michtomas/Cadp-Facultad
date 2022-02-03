program	ejericicio8;
const dimF=10;
type
	indice=0..400;
	cadena= string[15];
	alumno = record
		ape: cadena;
		nom: cadena;
		dni: integer;
		ano: integer;
		nro: integer;
	end;
	vector = array [1..dimF] of alumno;

procedure cargarVector(var v: vector; var alu:alumno; var dimL: indice);
	procedure leerALumno(var alu:alumno);
		begin
			writeln('Ingrese nombre:');
			readln(alu.nom);
			writeln('Ingrese apellido:');
			readln(alu.ape);
			writeln('Ingrese dni:');
			readln(alu.dni);
			writeln('Ingrese año de nacimiento:');
			readln(alu.ano);
			writeln('Ingrese nro de alumno:');
			readln(alu.nro);
		end;
begin
	dimL:=0;
	leerAlumno(alu);
	while (alu.dni <> -1) and (dimL <= dimF) do 
	begin	
		dimL:=dimL+1;
		v[dimL]:= alu;
		leerAlumno(alu);
	end;	
end;



function porcentaje(v:vector; dimL:indice): real;
	function par(n: integer):boolean;
	begin
		par:=true;
		while (n<>0) and (par) do begin
			if n mod 2 <> 0 then par:=false;
			n:= n div 10;
		end;
	end;
var i,cant:integer;
begin
	cant:=0;
	for i:=1 to dimF do 
		if par(v[i].dni) then cant:=cant+1;
	porcentaje:=cant/dimL;
end;

procedure edad(v:vector; var alu1,alu2: alumno);
var i:integer;
begin
	if v[1].dni < v[2].dni then begin
		alu1:=v[1];
		alu2:=v[2];
	end
	else begin
		alu1:=v[2];
		alu2:=v[1];
	end;
	for i:=3 to dimF do begin
		if v[i].dni < v[1].dni then begin
		alu2:=alu1;
		alu1:=v[i];
		end
		else if v[i].dni < v[2].dni then
			alu2:=v[i];
	end;
	
end;
	
var v:vector; alu1,alu2,alu: alumno; dimL: indice;
begin
	cargarVector(v,alu,dimL);
	writeln('porcentaje de alumnos con dni compuesto de pares: ', porcentaje(v,dimL));
	edad(v,alu1,alu2);
	writeln('alumno de mayor edad: ', alu1.nom, ' ', alu1.ape);
	writeln('segundo alumno de mayor edad: ', alu2.nom, ' ', alu2.ape);
end.
