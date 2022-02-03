program alcanceYFunciones;
var
 suma, cant : integer;
 function calcularPromedio : real;

 begin
 calcularPromedio := suma / cant;
 end;
begin { programa principal }
 readln(suma);
 readln(cant);
 if (cant <> 0) then begin
 writeln('El promedio es: ' , calcularPromedio)
 end
 else
 writeln('Dividir por cero no parece ser una buena idea');
end.
