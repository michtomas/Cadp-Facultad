program ejercicio1;
var 
	frente, fondo, area, perimetro: real;
begin
	writeln('Ingrese cuantos mts de fondo tiene ');
	readln(fondo);
	writeln('Ingrese cuantos mts de frente tiene ');
	readln(frente);
	//calculo del area
	area:= fondo*frente;
	writeln('El area es:', area);
	//calculamos el perimetro
	perimetro:= 2*fondo + 2*frente;
	writeln('Metros de alambre necesarios: ', perimetro);
end.
	
	
