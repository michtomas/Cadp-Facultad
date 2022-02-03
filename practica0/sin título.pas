{Realice un programa que informe el valor total en pesos de una transacción en dólares.
Para ello, el programa debe leer el monto total en dólares de la transacción, el valor del
1 dólar al día de la fecha y el porcentaje (en pesos) de la comisión que cobra el banco por la
transacción. Por ejemplo, si la transacción se realiza por 10 dólares, el dólar tiene un valor
20,54 pesos y el banco cobra un 4% de comisión, entonces el programa deberá informar:
La transacción será de 213,61 pesos argentinos
(resultado de multiplicar 10*20,54 y adicionarle el 4%)}

program ej6;
	type codigos=1..5;
var
	codigo,codigo1,codigo2: codigos;
  precio,min1,min2: real;
  cant,i: integer;
  
  begin
  	cant:=0;
  	writeln('Ingrese el codigo del producto');
    read(codigo);
    codigo1:=codigo;
    writeln('Precio del producto');
    read(precio);
    min1:=precio;
    if((precio>16) and ( (codigo mod 2) = 0)) then 
    	cant:= cant +1;
    writeln('Siguiente codigo:');
    readln(codigo);
    writeln('Precio:');
    readln(precio);
    if(min1<precio) then begin
    	min2:=precio;
      codigo2:=codigo;
    end
    else begin
      	min2:=min1;
        codigo2:=codigo1;
        min1:=precio;
        codigo1:=codigo;
    end;
    if((precio>16) and ( (codigo mod 2) = 0)) then 
    	cant:= cant +1;
	for i:=3 to 5 do
		begin
			writeln('Siguiente codigo:');
			readln(codigo);
    		writeln('Precio:');
    		readln(precio);
			if((precio>16) and ( (codigo mod 2) = 0)) then 
    			cant:= cant +1;
			if(precio<min1) then begin
				min2:=min1;
				codigo2:=codigo1;
				min1:=precio;
				codigo1:=codigo;
			end
			else 
				if(precio<min2) then begin;
				min2:=precio;
				codigo2:=codigo;
				end;
		end;
    write('cantidad de precios mayor a 16 y codigo par: ', cant);
    write('precios minimos: ', codigo1, ' y ', codigo2);
END.
