program ejercicio5;
type
	texto=string[50];
	info = record
		cod:integer;
		des:texto;
		stock:integer;
		min:integer;
		precio:real;
	end;
	lista=^nodo;
	nodo = record
		dato:info;
		sig:lista;
	end;

procedure leerProducto(var p:info);
begin
	write('Ingrese la informacion del producto en el orden de codigo, descripcion, sotck actual, stock minimo y precio');
	read(p.cod);
	if(p.cod <> -1) then begin
		readln(p.des);
		readln(p.stock);
		readln(p.min);
		readln(p.precio);
		write('Finaliza la lectura');
	end
	else
		write('Finaliza la lectura');
end;

procedure agregar(var l:lista; p:info);
var aux:lista;
begin
	new(aux);
	aux^.dato:=p;
	aux^.sig:=l;
	l:=aux;
end;

procedure armarLista(var l:lista);
var p:info;
begin
	leerProducto(p);
	while p.cod <> -1 do 
		begin
			agregar(l,p);
			leerProducto(p);			
		end;
end;

procedure controlStock(sa,sm: integer; var ct,cm: integer);
begin
	ct:=ct+1;
	if(sa<sm) then cm:=cm+1;
end;

function pares(c:integer): boolean;
var cant:integer;
begin
	cant:=0;
	while(c<>0) and (cant<3) do begin
		if(c mod 2 = 0) then cant:=cant+1;
		c:=c div 10;
	end;
	if(cant=3) then 
		pares:=true
	else 
		pares:=false;
end;

procedure minimos(var cod,cod2: integer; codAc:integer; var pm,pm2:real; pAc:real);
begin
	if(pAc<pm) then begin
		pm2:=pm;
		pm:=pAc;
		cod2:=cod;
		cod:=codAc;
	end
	else
		if(pAc<pm2) then begin
			pm2:=pAc;
			cod2:=codAC;
		end;
end;

procedure recorrerLista(l:lista);
var cantTotal,cantMin, cod, cod2:integer; precioMin, precioMin2:real;
begin
	cantTotal:=0;
	cantMin:=0;
	cod:=-1;
	cod2:=-1;
	precioMin:=9999;
	precioMin2:=9999;
	while l<>nil do 
		begin
			controlStock(l^.dato.stock, l^.dato.min,cantTotal,cantMin);
			if(pares(l^.dato.cod)) then writeln(l^.dato.des);
			minimos(cod,cod2,l^.dato.cod, precioMin, precioMin2, l^.dato.precio);
			l:=l^.sig;
		end;
	if(cantTotal<>0) then begin 
		writeln('porcentaje que no cumplen el stock: %', (100-100*cantMin/cantTotal));
		writeln('codigos de los productos mas baratos: ', cod, ' y ', cod2);
	end;
	
end;
{principal}
var
	l:lista;
begin
	l:=nil;
	armarLista(l);
	recorrerLista(l);
end.
