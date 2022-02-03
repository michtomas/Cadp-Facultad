agregarAlFinal(var ult,pri:lista; reg:registro);
var aux:lista;
new(aux);
aux^.dato:=reg;
aux^.sig:=nil;
if(pri<>ult) then
	ult^.sig:=aux
else
	pri:=aux;
ult:=aux;

ordenado(var l:lista; reg:registro);
var aux:lista; act,ant:lista;
begin
new(aux);
aux^.dato:=reg;
act:=l;
ant:=l;
while(act<>nil) and (act^.dato.num<reg.num) do begin
	ant:=act;
	act:=act^.sig;
end;
if(ant=act) then
	l:=aux;
else
	ant^.sig:=aux;
aux^.sig:=act;

eliminar()
