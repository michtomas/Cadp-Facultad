program ejercicio21;
var
	letra: char;
begin
	writeln('Ingrese el tipo de impuesto');
	readln(letra);
	if(letra='I') then
		writeln('Ingrese por caja 1')
	else 
		writeln('Ingrese por caja 2');
end.
	
