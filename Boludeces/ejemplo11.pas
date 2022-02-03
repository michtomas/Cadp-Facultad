program ejemplo11;
var
	fondo, frente, area: real;
begin
	readln (fondo); readln (frente);
	area:= frente*fondo;
	if(900<=area) then 
			writeln('Comprar terreno')
		else
			writeln('No comprar terreno');
end.
		
