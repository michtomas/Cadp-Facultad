{Realizar un programa que lea información de 200 productos de un supermercado. De cada producto
se lee código y precio (cada código es un número entre 1 y 200). Informar en pantalla:
- Los códigos de los dos productos más baratos.
- La cantidad de productos de más de 16 pesos con código par}

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
