program ejemplo13;
var
	letra: char;
begin
	writeln('Ingrese el tipo de impuesto que desea abonar');
	readln(letra);
	case letra of
	'I': writeln('Dirigirse a Caja 1');
	'M': writeln('Dirigirse a Caja 2');
	'P': writeln('Dirigirse a Caja 3');
	'S': writeln('Dirigirse a Caja 4');
	else write('Aca no se cobra ese impuesto')
	end;
end.
