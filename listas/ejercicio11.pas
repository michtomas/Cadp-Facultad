program ejercicio11;
type
	cadena=string[20];
	alumno = record
		nro:integer;
		ape:cadena;
		prom:real;
	end;
	lista=^nodo;
	nodo = record
		dato:alumno;
		sig:lista;
	end;
	vector = array[1..10] of alumno;

procedure leerALumno(var alu:alumno);
begin
	readln(alu.nro);
	if(alu.nro<>0) do begin
		readln(alu.ape);
		readln(alu.prom);
	end;
end;

procedure agregarAlumno(alu:alumno; var l:lista);
var aux:lista;
begin
	new(aux);
	aux^.dato:=alu;
	aux^.sig:=l;
	l:=aux;
end;


procedure leerLista(var l:lista);
var alu:alumno;
begin
	leerALumno(alu);
	while (alu.nro <> 0) do begin
		agregarAlumno(alu,l);
		leerALumno(alu);
	end;
end;

function buscarPos(v,promedio):integer;
var i:integer;
begin
	i:=1;
	while(v[i].prom> promedio) do 
		i:=i+1;
	buscarPos:=i;
end;

procedure agregarAlVector(var v:vector;var dimL:integer; l:lista);
var i:integer;aux,aux2:alumno;
begin
	indice:=buscarPos(v,l^.dato.prom);
	if(dimL<10) then dimL:=dimL+1;
	aux:=v[indice];
	v[indice]:=l^.dato;
	for i:=indice+1 to dimL do begin
		aux2:=v[i]
		v[i]:=aux;
		aux:=aux2;
	end;
end;

procedure premios(l:lista; var v:vector);
var dimL:integer;
begin
	v[1]:=l^.dato;
	dimL:=1;
	l:=l^.sig;
	while(l<> nil) do begin
		if(l^.dato.prom > v[dimL].prom) then
			agregarAlVector();
		else
			if(dimL<10) then begin
				dimL:=dimL+1;
				v[dimL]:=l^.dato
			end;
		l:=l^.sig;
	end;
end;
