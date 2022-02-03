program ejercicio12;
	
const dimF=53;	
type
	rango=1..4;
	subrango=0..53;
	cadena=string[20];
	datos = record
		nombre: cadena;
		tipo: rango;
		masa:integer;
		dist:real;
	end;
	vector = array[1..dimF] of datos;
	
procedure leerVector(var v:vector);
var i:integer;
begin
	for i:=1 to dimF do begin
		writeln('Ingrese nombre');
		readln(v[i].nombre);
		writeln('Ingrese tipo');
		readln(v[i].tipo);
		writeln('Ingrese masa');
		readln(v[i].masa);
		writeln('Ingrese distancia');
		readln(v[i].dist);
	end;
end;

procedure tipos(v:vector);
var i,t1,t2,t3,t4:integer;
begin
	t1:=0;t2:=0;t3:=0;t4:=0;
	for i:=1 to dimF do begin
		if(v[i].tipo = 1) then t1:=t1+1
		else if(v[i].tipo = 4) then t1:=t4+1
		else if(v[i].tipo = 3) then t1:=t3+1
		else if(v[i].tipo = 2) then t1:=t2+1
	end;
	writeln('galaxias tipo 1:', t1);
	writeln('galaxias tipo 2:', t2);
	writeln('galaxias tipo 3:', t3);
	writeln('galaxias tipo 4:', t4);
end;

procedure principales(v:vector);
	function posDe(v:vector; nombre:cadena):subrango;
	var i:subrango;exito:boolean;		
	begin
		exito:=false; i:=1;
		while(i<=dimF) and (not exito) do 
			if(nombre=v[i].nombre) then exito:=true
			else i:=i+1;
		if(not exito) then i:=0;
		posDe:=i;
	end;
var masaTotal,masaPrincipales:integer; i:subrango;g1,g2,g3:cadena;porcentaje:real;
begin
	masaTotal:=0; masaPrincipales:=0;
	for i:=1 to dimF do
		masaTotal:=masaTotal + v[i].masa;
	g1:='Via Lactea';g2:='Andromeda'; g3:='Triangulo';
	i:=posDe(v,g1);
	masaPrincipales:=masaPrincipales+v[i].masa;
	i:=posDe(v,g2);
	masaPrincipales:=masaPrincipales+v[i].masa;
	i:=posDe(v,g3);
	masaPrincipales:=masaPrincipales+v[i].masa;
	porcentaje:=(masaPrincipales/masaTotal)*100;
	writeln('Porcentaje de las 3 principales respecto al total:', porcentaje);
	writeln('Masa total de las 3 principales: ', masaPrincipales);
end;

function puntoC(v:vector):subrango;
var i,cont:integer;
begin
	cont:=0;
	for i:=1 to dimF do
		if (v[i].tipo <> 4) and (v[i].dist < 1000) then cont:=cont+1;
	puntoC:=cont;
end;

procedure masasMax(v:vector);
var g1,g2:cadena; m1,m2,i: integer;
begin
	g1:=v[1].nombre; m1:=v[1].masa;
	if(v[2].masa < m1) then begin
		g2:=v[2].nombre; m2:=v[2].masa;
	end
	else begin
		g1:=v[2].nombre; m1:=v[2].masa;
		g2:=v[1].nombre; m2:=v[1].masa;		
	end;
	for i:=3 to dimF do begin
		if(m1 < v[i].masa ) then begin
			g2:=g2; m2:=m1;
			g1:=v[i].nombre; m1:=v[i].masa;
		end
		else if(m2 < v[i].masa) then begin
			g2:=v[i].nombre; m2:=v[i].masa;
		end;
	end;
	writeln('Nombres de las galaxias con mayor masa: ', g1, ' y ', g2);
end;

procedure masasMin(v:vector);
var g1,g2:cadena; m1,m2,i: integer;
begin
	g1:=v[1].nombre; m1:=v[1].masa;
	if(v[2].masa > m1) then begin
		g2:=v[2].nombre; m2:=v[2].masa;
	end
	else begin
		g1:=v[2].nombre; m1:=v[2].masa;
		g2:=v[1].nombre; m2:=v[1].masa;		
	end;
	for i:=3 to dimF do begin
		if(m1 > v[i].masa ) then begin
			g2:=g2; m2:=m1;
			g1:=v[i].nombre; m1:=v[i].masa;
		end
		else if(m2 > v[i].masa) then begin
			g2:=v[i].nombre; m2:=v[i].masa;
		end;
	end;
	writeln('Nombres de las galaxias con menor masa: ', g1, ' y ', g2);
end;

var v:vector;
begin
	leerVector(v); tipos(v); principales(v); masasMax(v);masasMin(v);
	writeln('cantidad de galaxias no irregulares que se encuentran a menos de 1000 pc', puntoC(v));
end.
