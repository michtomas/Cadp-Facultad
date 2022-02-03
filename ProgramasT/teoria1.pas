{Estructura de un programa}
program teoria1;

var {Variables del programa principal}
	{Las variables sirven para almacenar datos/informacion}
	cantidad: integer; {numero entero}
	cumple: boolean; {dato logigo - V o F}
	precio: real; {numero real}
	car: char; {tido de dato caracter}
	cara: char;
	i: integer; 
	{Datos simples ya que contienen un solo valor}
BEGIN {programa principal}
	{Pascal no trabaja con identacion}
	{Mostrar un valor sin inicializar---}
	writeln('La cantidad ingresada es: ', cantidad); {que imprime?-- desconocido/basura}
	cantidad:= 4; {operador asignacion :=}
	{Al indicar el tipo de dato el programa sabe el rango de datos asignables}
	{Y que operaciones podemos realizar con dichos datos}
	{Pascal es un lenguaje fuertemente equipado}
	car:= 'h'; precio:= 10.5;
	{Mientras separemos con ; no es necesario la identacion}
	{Ya que el programa se lee de arriba a abajo, izq a derecha}
	cumple:= true;
	{Operacion de entrada y salida--input y output}
	writeln('Ingrese una cantidad');
	readln(cantidad);
	writeln;
	writeln('La cantidad ingresada es: ', cantidad);
	
	readln;
	
	{Estructuras de control}
	{Sirven para... }
	{Flujo = Secuencia de instrucciones}
	{Secuendia= orden natural de las instrucciones}
	{IF}
	if (cantidad > 100) then
		writeln('la cantidad es mayor a 100');
		cantidad:= cantidad + 1; {se ejecuta siempre o depende de la condicion?}
		{En este caso la unica instruccion del if es el write, ya que pusimos THEN}
		{Por lo tanto se ejecuta siempre el cantidad+1}
		{Si queremos mas de instrucciones debemos escribir:}
	if (cantidad > 100) then begin
		writeln('la cantidad es mayor a 100');
		cantidad:= cantidad +1; {el ultimo ; antes de un else se borra}
	end;
		{ahora cantidad se ejecuta si se cumple la condicion}
	
	{uso el else y begin}
	
	if (cantidad > 100) then begin
		writeln('la cantidad es mayor a 100');
		cantidad:= cantidad +1;
	end
	else begin
		writeln('la cantidad no es mayor a 100');
		cantidad := cantidad * 2;
	end;
	
	{Iteracion pre-condicional}
	
	while (15>cantidad) do
		cantidad:= cantidad +1;
	{al igual que con el if si quiero mas instrucciones debo usar begin y end}
	writeln('la cantidad total es:', cantidad)
	
	{Iteracion post-condicional}
	repeat 
		{conjunto de acciones}
	until (condicion)		
	
	{Repeticion}
	for i:=1 to 10 do begin
		cantidad := cantidad+i;
		writeln('La cantidad es: ', cantidad);
	end;
		{begin y end para mas de una instruccion}
		{necesario declarar i entero antes}
	{tambien vale con letras}
	for car:='a' to cara:='z' do begin
		cantidad := cantidad+1;
		writeln('La cantidad es: ', cantidad);
		writeln('La letra es: ', i)
	end;
END.

