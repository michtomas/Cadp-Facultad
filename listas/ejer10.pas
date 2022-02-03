program ej10;
type
 cliente = record
  dni: integer;
  num: integer;
 end;
 lista = ^Nodo;
 Nodo = record
  datoC: cliente;
  sig: lista;
 end;


 procedure agregarNodo(var l, ult: lista; c: cliente);
 var
  nue: lista;
 begin
  new(nue);
  nue^.datoC:= c;
  nue^.sig:= nil;
  if (l = nil) then
   l:= nue
  else
   ult^.sig:= nue;
  ult:= nue;
 end;


{RECIBIR CLIENTE}
procedure recibirCli (var l,ult: lista; dni: integer);
var
	cli : cliente;
begin
	cli.dni:= dni;
	if l = nil then
		cli.num:= 1
	else
		cli.num:= ult^.datoC.num + 1;
	agregarNodo(l, ult, cli);
end;

procedure borrarC ( var L: lista; c: cliente);  
  var
   act, ant: lista;
  begin
   act:= l;
   while (act <> nil) and (act^.datoC.num <> c.num) do
   begin
    ant:= act;
    act:= act^.sig;
   end;
   if (act = l) then 
    l:= act^.sig
   else
    ant^.sig:= act^.sig;
    dispose (act);
  end;

procedure atender(var l : lista; var dni, num : integer);
var 
	act : lista;
begin
	dni:= l^.datoC.dni;
	num:= l^.datoC.num;
	
	act:= l;
	l:= l^.sig;
	dispose(act);
end;

  

var
l, ult: lista;
i, cantCli: integer;
begin
 i:= 0;
 l:= nil;
 
 {Leer todos los clientes y agregarlos a la lista de espera - while}
 
 {Atender clientes de a uno}
 
end.
