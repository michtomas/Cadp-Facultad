program ejercicio13;
const dimFT=100; dimFA=2020;
type
	rangoP=0..100;
	rangoA=1970..2020;
	vectorT = array[1..dimFT] of real;
	vectorA= array[1970..dimFA] of vectorT;
procedure leerVector(var vT:vectorT; var vA:vectorA);
var j: rangoP; i:rangoA;
begin
	for i:=1970 to dimFA do begin
		for j:=1 to dimFT do begin
			writeln('Ingrese temperatura del punto ', j, ' el año ', i);
			readln(vA[i].vT[j]);
		end;
	end;
end;
function promedio(vA: vectorA; vT:vectorT): rangoA;
var j: rangoP; i,aux:rangoA; prom,prom2,suma:real;
begin
	suma:=0;
	for j:=1 to dimFT do
		suma:=vA[1970].vT[j]+suma;
	prom:=suma/100;
	aux:=1970;
	for i:=1971 to dimFA do begin
		suma:=0;
		for j:=1 to dimFT do 
			suma:=vA[i].vT[j]+suma;
		prom2:=suma/i;
		if(prom < prom2) then begin
			prom:=prom2;
			aux:=i;
		end;
	end;
	promedio:=aux;
end;
function mayorT(vA:vectorA; vT:vectorT):rangoA;
var j:rangoP; aux,i:rangoA;Tmax,T:real;
begin
	Tmax:=0;aux:=0;
	for i:=1970 to dimFA do begin
		for j:=1 to dimFT do begin
			T:=vA[i].vT[j];
			if(Tmax<T) then begin 
				Tmax:=T;
				aux:=i;
			end;
		end;
	end;
	mayorT:=aux;
end;

var vA:vectorA; vT:vectorT; 
begin
	leerVector(vT,vA);
	writeln('año con  mayor promedio de temperatura: ', promedio(vA,vT));
	writeln('sño con msyor temperaura registrada: ', mayorT(vA,vT));
end.
