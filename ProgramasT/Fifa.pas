
program Fifa;
{La FIFA  esta analizando la informacion de las entradas vendidas para los 52 partidos del mundial de furbol Qatar 2022.
* Para ello, para cada partido se leen las ventas realizadas.
* De cada venta se conoce fecha de venta, nombre del pais del comprador y cantidad de entradas compradas.
* La lectura de las ventas de cada partido finalza con cantidad de entradas -1.
* Realizar un programa que informe:
* a) Cantidad de entradas vendidas para cada partido.
* b) Los dos numeros de partidos que tienen mayor cantidad de entradas venidas
* c) Cantidad total de entradas vendidas
* d) Cantidad total de entradas compradas por argentinos.
}


const
	max_part=52;
	{constantes}

type
	cadena_fecha = string[10];
	cadena = string[50];
	{tipos de datos definidos por el usuario}
	rango_partidos = 'a'..'p';
	{subrango}

var 
	{tipos de datos predefinidos por el lenguaje}
	fecha:	cadena_fecha; {cadena de caracteres - 255 caracteres por defecto}
	pais: cadena; {entonces entre corchetes le ponemos limite y ahorra memoria}
	cantidad, cant_ent_part, cant_total, cant_arg: integer;
	i: rango_partidos;
	r: real;

BEGIN
	cant_total:=0;
	cant_arg:=0;
	for i:= 'a' to 'p' do begin
		{leer ventas del partido i}
		
		cant_ent_part :=0;
		write('Ingrese la cantidad: ');
		readln(cantidad);
		while (cantidad <> -1) do begin
			writeln ('Ingrese una fecha: ');
			readln(fecha);
			writeln('Ingrese el pais: ');
			readln(pais);
			cant_ent_part := cant_ent_part + cantidad;
			{procesar informacion obtenida}
			if (pais= 'Argentina') then
				cant_arg:= cant_arg + cantidad;
			write('Ingrese la cantidad: ');
			readln(cantidad);
		end;
		cant_total := cant_total + cant_ent_part;
		writeln('La cantidad de entradas para el partido ', i, ' es: ', cant_ent_part);
	end;
	writeln('La cantidad total de entradas es: ', cant_total);
	writeln('La cantidad total de entradas para argentinos es: ', cant_arg);
	
END.

