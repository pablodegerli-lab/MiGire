unit CliCusEx;

{$DEBUGINFO OFF}

interface

uses classes, Variants;

type

// Para el método OnRequestIdentifier

TRequestFunction   = procedure (    Sender: TObject;
                                    ident : string;             // Nombre del ident.
                                var value : variant;            // Valor que debe tener
                                var cancel: boolean) of object; // true si no es conocido

TRequestIdentifier = procedure (    Sender: TObject;
                                    IdVar : string;             // Nombre del ident.
                                var Valor : variant;            // Valor que debe tener
                                var cancel: boolean) of object; // true si no es conocido
{
TRequestIdentifier = procedure (    Sender: TObject;
                                    ident : string;             // Nombre del ident.
                                    alias : string;
                                var value : variant;            // Valor que debe tener
                                var cancel: boolean) of object; // true si no es conocido
}

TOpr = record              // Todo elemento de la pila como operador u operando
    Typ   : integer;
    value : variant;       // Variant es lento pero muy cómodo de trabajar
  end;

TClipperCustomExpr =class(TComponent)
 private
  fVersion    : String;
  fRequestIdentifier : TRequestIdentifier;
  fRequestFunction   : TRequestFunction;
    FSimplificaComilla: boolean;
  function ReqIdent(ident, alias: string): variant;
  function ReqFunc(ident: string): variant;
  procedure SetRequestIdentifier(value:TRequestIdentifier);
  procedure SetRequestFunction(value:TRequestFunction);
 protected
  heap        : array [0..255] of TOpr;
  index       : integer;
  lasterror   : string;
  lastindex   : integer;
  fExpression : String;
  procedure push(Typ : integer; value : variant);
  function ProcessHeap(FuncName: string; ini: integer ): boolean;

  property Version : string read fVersion;
  property Expression : string read fExpression write fExpression;
  //property OnRequestIdentifier : TRequestIdentifier read fRequestIdentifier
  //                     write SetRequestIdentifier;

  property OnAsignaValor : TRequestIdentifier read fRequestIdentifier
                       write SetRequestIdentifier;

  property OnRequestFunction : TRequestFunction read fRequestFunction
                       write SetRequestFunction;

  property SimplificaComilla : boolean read FSimplificaComilla write FSimplificaComilla default False;

 public
  ArgCnt  : integer;
  ArgVal  : Array [0..31] of Variant;
  ArgTyp  : Array [0..31] of integer;
  ResVal     : variant;
  ResTyp     : integer;

  function Prepare: boolean;
  function Process: boolean;
  function EvalVariant(s: string): variant;
  function EvalFloat(s:string): Double;
  function EvalBoolean(s:string): Boolean;
  function EvalInteger(s:string): integer;
  function EvalString(s:string): String;
  constructor Create(AOwner : TComponent ); override;
  destructor Destroy; override;
end;



implementation

uses dialogs, sysutils;

Const

  // Para el manejo de operadores

  OprSum      = 1;
  OprMinus    = OprSum + 1;
  OprMult     = OprMinus + 1;
  OprDiv      = OprMult + 1;
  OprComp     = OprDiv + 1;
  OpenPar     = OprComp + 1;
  ClosePar    = OpenPar + 1;
  OprMod      = ClosePar + 1;
  OprExp      = OprMod + 1;

  OprLess          = OprExp + 1;
  OprGreater       = OprLess + 1;
  OprNotEqual      = OprGreater + 1;
  OprLessEqual     = OprNotEqual + 1;
  OprGreaterEqual  = OprLessEqual + 1;
  OprConteined     = OprGreaterEqual + 1;
  OprPerfectMatch  = OprConteined + 1;

  OprAnd = OprPerfectMatch + 1;
  OprNot = OprAnd + 1;
  OprOr  = OprNot + 1;
  OprXor = OprOr + 1;

  OprComma = OprXor + 1;
  OprIndirec   = OprComma + 1;

  OpenBracket = OprIndirec + 1;
  CloseBracket = OpenBracket + 1;


  // Tipos de elementos posibles en la pila

  tnone    = 0;
  tinteger = 1;
  tdouble  = 2;
  tstring  = 3;
  tdate    = 4;
  tident   = 5;
  toper    = 6;
  tboolean = 7;
  tfunc    = 8;
  tArray   = 9;

  IncorrectBracket = 'Corchete inesperado.';

constructor TClipperCustomExpr.Create(AOwner : TComponent );
begin
  inherited Create(AOwner);
  fRequestIdentifier := nil;
  fRequestFunction   := nil;
  FSimplificaComilla := False;
  fVersion := '"F.J.M" para GIRE S.A. Febrero de 2001';
end;

destructor TClipperCustomExpr.Destroy;
begin
  inherited destroy;
end;

// Ejecuta los cambios de identificadores por sus valores
// Inicia las llamadas recursivas (por los paréntesis) a procesamiento de Pila.

function TClipperCustomExpr.Process: boolean;
Var
  i : integer;

  // Borra segmentos de la pila y desplaza el resto hacia arriba.
  procedure DeleteFromhead(i,   // Posic. primer elemento a borrar.
                           cnt : integer); // Num. elementos a borrar.
  var
    k : integer;
  begin
    for k:=i to Index-Cnt-1 do
      heap[k] := heap[k+cnt];
    dec(index,cnt)
  end;
begin
  i:=0;
  While i< index do
   begin
     if heap[i].Typ = tIdent then
       if (i<pred(index)) and (heap[i+1].Typ = tOper) and (heap[i+1].value = OprIndirec) then
         begin
           heap[i].value := ReqIdent(VarAsType(heap[i+2].value,VarString), VarAsType(heap[i].value,VarString) );
           DeleteFromhead(i+1,2);
         end
       else
        heap[i].value := ReqIdent(VarAsType(heap[i].value,VarString) , '');
     inc(i)
   end;
   result := ProcessHeap('',0);
   if lastindex>1 then
    begin
     if lasterror = '' then
        lasterror := 'No se evaluó todo lo que se leyó. Debe faltar o sobrar un operador';
     raise Exception.Create(lasterror);
    end;
end;

// Esta llamada es recursiva, siempre que no haya error evalua la pila y deja su
// resultado en ResVal, ResTyp.

// Lo recursivo ocurre evaluando expresiones entre paréntesis. Ejemplo:
//  3+(3+1) llama con  '3+(3+1)' que a su vez llama con 3+1

function TClipperCustomExpr.ProcessHeap(FuncName: string; ini : integer ): boolean;
var
  i,          // Como contador
  tmpindex,   // Act. indice de la copia temporal de la pila
  len,        // longitud de la expressión entre paréntesis
  ToDelete,   // Evaluada la sub-expressión se retira de la pila
  tmplen,     // acumulado de sub-expressiones borradas
  cntparent   : integer;  // Contando paréntesis
  cntbracket  : integer;  // Contando corchetes
  tmpheap     : array [0..255] of TOpr;  // Copia temporal de la pila
  NewFunc     : String; // identificador de la función
  Arreglo     : String;


  // Borra segmentos de la pila y desplaza el resto hacia arriba.
  procedure DeleteFromhead(i,   // Posic. primer elemento a borrar.
                           cnt : integer); // Num. elementos a borrar.
  var
    k : integer;
  begin
    for k:=i to TmpIndex-Cnt-1 do
      tmpheap[k] := tmpheap[k+cnt];
    dec(tmpindex,cnt)
  end;

begin
// Se recorre la pila y se evalúa según precedencia
 try

  // primero se optiene la expresión entre paréntesis (1+2) es 1+2.
  i := 0;
  cntparent := 0;
  cntbracket := 0;
  while (i<index) do
    begin
     if (heap[i+ini].Typ=toper) and (heap[i+ini].value=OpenPar) then
       inc(cntparent);
     if (heap[i+ini].Typ=toper) and (heap[i+ini].value=ClosePar) then
       dec(cntparent);
     if cntparent<0 then
       break;

     if (heap[i+ini].Typ=toper) and (heap[i+ini].value=OpenBracket) then
       inc(cntbracket);
     if (heap[i+ini].Typ=toper) and (heap[i+ini].value=CloseBracket) then
       dec(cntbracket);

     if cntBracket<0 then
       break;

     tmpheap[i] := heap[i+ini];
     inc(i);
    end;

  // Una manera de detectar desbalance de paréntesis.

  if (i>=(index-1)) and (cntparent<>0) then
   begin
    if lasterror = '' then
     begin
      if cntparent<0 then
        lasterror := 'Falta paréntesis abriendo'
      else
        lasterror := 'Falta paréntesis cerrando'
     end;
    raise Exception.Create(lasterror);

    result := false;
    exit
   end;

   {
  if (i>=(index-1)) and (cntBracket<>0) then
   begin
    if lasterror = '' then
     begin
      if cntBracket<0 then
        lasterror := 'Falta corchete ''['' abriendo'
      else
        lasterror := 'Falta corchete '']'' cerrando'
     end;
    raise Exception.Create(lasterror);

    result := false;
    exit
   end;
   }

  tmpindex := i; // index;


  // Paréntesis

  // Relativamente simple. Evaluar (a+b)/2 es evaluar a+b, reemplazando luego
  // este último resultado por el (a+b) y luego se evalúa c/2
  // La rutina de evaluación "Proccess" se llama a si misma.

  i := 0;
  tmplen := 0;

  while i<tmpindex do
    begin
      if (tmpheap[i].Typ=toper) and (tmpheap[i].value=OpenPar) then
        begin
          // Primero se determina la longitud de la sub-expresión.
          // que puede tener más sub-expresiones.

          len := i+ini+tmplen;
          cntparent := 0;
          while (len<index) do
            begin
             if (heap[len].Typ=toper) and (heap[len].value=OpenPar) then
               inc(cntparent);
             if (heap[len].Typ=toper) and (heap[len].value=ClosePar) then
               dec(cntparent);
             inc(len);
             if cntparent<=0 then
               break;
            end;
          len := len - (i+ini+tmplen);


          if (i>0) and (tmpheap[pred(i)].Typ=tfunc ) then
            NewFunc := tmpheap[pred(i)].Value
          else
            NewFunc := '';

          // Se evalúa la sub-expresión
          ProcessHeap(NewFunc, i+1+ini+tmplen);

          // Ya se tiene los resultado de la misma

          // Se borrara la subexpressión excepto un caracter dónde se
          // colocará el nuevo resultado de la misma.
          if NewFunc>'' then
            ToDelete := len
          else
            ToDelete := len - 1;

          // Como de la pila original no se borra nada (en heap)
          // debemos tener en cuenta cuanto se ha desplazado los
          // indices de uno respecto a otro

          inc(tmplen,ToDelete);

          // asigna valor y se borra lo que sobra

          if NewFunc>'' then
           begin
            if tmpheap[i-1].Typ = tFunc then
              tmpheap[i-1].value := ReqFunc(NewFunc);
            tmpheap[i-1].Typ   := ResTyp;
            DeleteFromhead(i,ToDelete);
            dec(i)
           end
          else
           begin
            tmpheap[i].value := ResVal;
            tmpheap[i].Typ   := ResTyp;
            DeleteFromhead(i+1,ToDelete)
           end
        end
      // En el caso lo que está entre corchetes debe ser evaluado
      else if (tmpheap[i].Typ=toper) and (tmpheap[i].value=OpenBracket) then
        begin
          // Primero se determina la longitud de la sub-expresión.
          // que puede tener más sub-expresiones.

          len := i+ini+tmplen;
          cntBracket := 0;
          while (len<index) do
            begin
             if (heap[len].Typ=toper) and (heap[len].value=OpenBracket) then
               inc(cntBracket);
             if (heap[len].Typ=toper) and (heap[len].value=CloseBracket) then
               dec(cntBracket);
             inc(len);
             if cntBracket<=0 then
               break;
            end;
          len := len - (i+ini+tmplen);


          if (i>0) and (tmpheap[pred(i)].Typ=tArray ) then
            Arreglo := tmpheap[pred(i)].Value
          else
            raise Exception.Create(IncorrectBracket);

          // Se evalúa la sub-expresión
          ProcessHeap('', i+1+ini+tmplen);

          // Ya se tiene los resultado de la misma

          // Se borrara la subexpressión excepto un caracter dónde se
          // colocará el nuevo resultado de la misma.

          ToDelete := len;

          // Como de la pila original no se borra nada (en heap)
          // debemos tener en cuenta cuanto se ha desplazado los
          // indices de uno respecto a otro

          inc(tmplen,ToDelete);

          // asigna valor y se borra lo que sobra


           begin
          { TODO : Arreglos con indexación M }
            if tmpheap[i-1].Typ = tArray then
              tmpheap[i-1].value := ReqIdent(Arreglo,'');
            tmpheap[i-1].Typ   := ResTyp;
            DeleteFromhead(i,ToDelete);
            dec(i)
           end
        end;

      inc(i)
    end;


  // Unario negación  y suma,

  // La idea es así. Sabemos que un oprador es unario si de lado derecho
  // tiene un operando (los paréntesis aquí ya no existen) y del lado
  // izquierdo otro operador

  // Como vamos a borra el operando simplemente leemos de derecha a izquierda
  // para que el desplzamiento no estorbe

  i := tmpindex-1;
  while i>=0 do
    begin
     if (tmpheap[i].Typ=toper) and (tmpheap[i].value=OprNot) and
        (tmpheap[i+1].Typ<>toper)then
      begin
       // Efecto de borde, el único operadro unario sin operador a la izquierda
       // es el primero.
       if (i=0) or (tmpheap[i-1].Typ=toper) then
        begin
         tmpheap[i+1].value :=  not tmpheap[i+1].value;
         // Borramos el operador porque ya evaluamos
         DeleteFromhead(i,1);
        end
      end
     else if (tmpheap[i].Typ=toper) and (tmpheap[i].value=OprMinus) and
        (tmpheap[i+1].Typ<>toper)then
      begin
       if (i=0) or (tmpheap[i-1].Typ=toper) then
        begin
         tmpheap[i+1].value :=  - tmpheap[i+1].value;
         // Borramos el operador porque ya evaluamos
         DeleteFromhead(i,1);
        end
      end
     // La suma es como la resta pero no se toca el operando
     else if (tmpheap[i].Typ=toper) and (tmpheap[i].value=OprSum) and
        (tmpheap[i+1].Typ<>toper)then
       if (i=0) or (tmpheap[i-1].Typ=toper) then
         DeleteFromhead(i,1);
     dec(i)
    end;

  // multiplicación y división,

  // En este caso de derecha izquierda ya que así lo define la precedencia
  // el algoritmo es el mismo. Se buscan dos operandos con un operador en el
  // medio (*,/,%) y se elimina dos elementos reemplazando el primero por
  // el resultador aritmético de la operación

  i := 0;
//  while i<tmpindex do
  while i< Pred(tmpindex) do   // siendo binarios no puede haber operador al final
    begin
      if (tmpheap[i].Typ=toper) and (tmpheap[i].value=OprExp) then
        begin
         tmpheap[i-1].value := Exp( ln(tmpheap[i-1].value) * tmpheap[i+1].value);
         DeleteFromhead(i,2);
         dec(i);
        end
      else if (tmpheap[i].Typ=toper) and (tmpheap[i].value=OprMult) then
        begin
         tmpheap[i-1].value := tmpheap[i-1].value * tmpheap[i+1].value;
         DeleteFromhead(i,2);
         dec(i);
        end
      else if (tmpheap[i].Typ=toper) and (tmpheap[i].value=OprDiv) then
        begin
         tmpheap[i-1].value := tmpheap[i-1].value / tmpheap[i+1].value;
         DeleteFromhead(i,2);
         dec(i);
        end
      else if (tmpheap[i].Typ=toper) and (tmpheap[i].value=OprMod) then
        begin
         tmpheap[i-1].value := tmpheap[i-1].value mod tmpheap[i+1].value;
         DeleteFromhead(i,2);
         dec(i);
        end
      else if (tmpheap[i].Typ=toper) and (tmpheap[i].value=OprAnd) then
        begin
         tmpheap[i-1].value := tmpheap[i-1].value and tmpheap[i+1].value;
         DeleteFromhead(i,2);
         dec(i);
        end;
      inc(i)
    end;

  // Suma y resta

  // Análogo a la multiplicación y división binaria (por contraposición a unaria)

  i := 0;
//  while i<tmpindex do
  while i< Pred(tmpindex) do   // siendo binarios no puede haber operador al final
    begin
      if (tmpheap[i].Typ=toper) and (tmpheap[i].value=OprSum) then
        begin
         tmpheap[i-1].value := tmpheap[i-1].value + tmpheap[i+1].value;
         DeleteFromhead(i,2);
         dec(i);
        end
      else if (tmpheap[i].Typ=toper) and (tmpheap[i].value=OprMinus) then
        begin
         tmpheap[i-1].value := tmpheap[i-1].value - tmpheap[i+1].value;
         DeleteFromhead(i,2);
         dec(i);
        end
      else if (tmpheap[i].Typ=toper) and (tmpheap[i].value=OprOr) then
        begin
         tmpheap[i-1].value := tmpheap[i-1].value or tmpheap[i+1].value;
         DeleteFromhead(i,2);
         dec(i);
        end
      else if (tmpheap[i].Typ=toper) and (tmpheap[i].value=OprXor) then
        begin
         tmpheap[i-1].value := tmpheap[i-1].value xor tmpheap[i+1].value;
         DeleteFromhead(i,2);
         dec(i);
        end;

      inc(i)
    end;

  // Comparaciones/ operadores relacionales

  i := 0;
//  while i<tmpindex do
  while i< Pred(tmpindex) do   // siendo binarios no puede haber operador al final
    begin
      if (tmpheap[i].Typ=toper) and (tmpheap[i].value=OprComp) then
        begin
         if VarType(tmpheap[i-1].value)=VarString then
           begin
             if Length(tmpheap[i+1].value)=0 then
               tmpheap[i-1].value := true
             else if Length(tmpheap[i+1].value)>Length(tmpheap[i-1].value) then
               tmpheap[i-1].value := false
             else
               tmpheap[i-1].value := Pos(VarAsType(tmpheap[i+1].value,varString),
                                         VarAsType(tmpheap[i-1].value,varString))=1
           end
         else
           tmpheap[i-1].value := tmpheap[i-1].value = tmpheap[i+1].value;
         DeleteFromhead(i,2);
         dec(i);
        end
      else if (tmpheap[i].Typ=toper) and (tmpheap[i].value=OprPerfectMatch) then
        begin
         tmpheap[i-1].value := tmpheap[i-1].value = tmpheap[i+1].value;
         DeleteFromhead(i,2);
         dec(i);
        end
      else if (tmpheap[i].Typ=toper) and (tmpheap[i].value=OprConteined) then
        begin
         tmpheap[i-1].value := Pos(VarAsType(tmpheap[i-1].value,varString),
                                   VarAsType(tmpheap[i+1].value,varString))>0;
         DeleteFromhead(i,2);
         dec(i);
        end
      else if (tmpheap[i].Typ=toper) and (tmpheap[i].value=OprNotEqual) then
        begin
         tmpheap[i-1].value := tmpheap[i-1].value <> tmpheap[i+1].value;
         DeleteFromhead(i,2);
         dec(i);
        end
      else if (tmpheap[i].Typ=toper) and (tmpheap[i].value=OprLess) then
        begin
         tmpheap[i-1].value := tmpheap[i-1].value < tmpheap[i+1].value;
         DeleteFromhead(i,2);
         dec(i);
        end
      else if (tmpheap[i].Typ=toper) and (tmpheap[i].value=OprGreater) then
        begin
         tmpheap[i-1].value := tmpheap[i-1].value > tmpheap[i+1].value;
         DeleteFromhead(i,2);
         dec(i);
        end
      else if (tmpheap[i].Typ=toper) and (tmpheap[i].value=OprLessEqual) then
        begin
         tmpheap[i-1].value := tmpheap[i-1].value <= tmpheap[i+1].value;
         DeleteFromhead(i,2);
         dec(i);
        end
      else if (tmpheap[i].Typ=toper) and (tmpheap[i].value=OprGreaterEqual) then
        begin
         tmpheap[i-1].value := tmpheap[i-1].value >= tmpheap[i+1].value;
         DeleteFromhead(i,2);
         dec(i);
        end;
      inc(i)
    end;


  // Procesamos las comas y actualizamos ArgCnt, ArgVal, ArgTyp

  i := 0;
  ArgCnt := 0;
  while i<tmpindex do
    begin
      if (tmpheap[i].Typ=toper) and (tmpheap[i].value=OprComma) then
        begin
         inc(ArgCnt);
         ArgVal[ArgCnt] := tmpheap[i+1].value;
         ArgTyp[ArgCnt] := tmpheap[i+1].Typ;

         DeleteFromhead(i,1);
         dec(i);
        end;
      inc(i);
    end;

  // Hay cosas interesantes, como el hecho de que me lavo las manos respecto al
  // tipo  resultante de datos. Eso se lo dejo a Delphi. Así que según el
  // resultado en la pila tenemos el tipo.

  // Ciertamente no veo necesidad de separar división entera de la de punto
  // flotante total queremos suplir cierta sintaxis Clipper.

  Case VarType(tmpheap[0].value) of
    varEmpty, varNull : tmpheap[0].Typ := tnone;
    varByte,
    varSmallint,
    varInteger        : tmpheap[0].Typ := tinteger;
    varSingle,
    varDouble,
    varCurrency       : tmpheap[0].Typ := tdouble;
    varDate           : tmpheap[0].Typ := tdate;
    varString         : if tmpheap[0].Typ <> tArray then tmpheap[0].Typ := tstring;
  end; {case}


  ArgVal[0] := tmpheap[0].value;
  ArgTyp[0] := tmpheap[0].Typ;

  if VarType(ArgVal[0])=0 then
    ArgCnt := 0
  else
    inc(ArgCnt);

  ResVal := tmpheap[0].value;
  ResTyp := tmpheap[0].Typ;
  lastindex := tmpindex;    // Lo del lastindex aquí es un parche,
                            // es para ver si no sobró algo como en
                            // una expresión de tipo  "2+4*5/ " (falta un operando)
  ProcessHeap := true;

 except
   {
   on e: exception do
   begin
    // Cosas no previstas, ejemplo '45' - 'e4'
    lastindex := tmpindex;
    if lasterror = '' then
      lasterror := e.Message; //'Error, probablemente de conversión de tipo';
    raise Exception.Create(lasterror);
    ProcessHeap := false;
   end;
   }
    ProcessHeap := false;
    raise;
 end;
end;


procedure TClipperCustomExpr.push(Typ : integer; value : variant);
begin
  heap[index].Typ := Typ;
  heap[index].value := value;
  inc(index);
end;

function anglostrtofloat(s: string): double;
var
  os : char;
begin
  os := DecimalSeparator;
  DecimalSeparator := '.';
  result := strtofloat(s);
  DecimalSeparator := os;
end;

// Simple y cómodo  Prepare , Proccess resumido

function TClipperCustomExpr.EvalVariant(s: string): variant;
begin
  fExpression := s;
  Prepare;
  Process;
  result := ResVal
end;

// Para cada tipo en particular. Es por si al programador le da flojera usar
// VarAsType

function TClipperCustomExpr.EvalFloat(s:string): Double;
Var
  tmp : variant;
begin
  tmp := EvalVariant(s);
  if VarType(tmp)=VarNull then
    result := 0
  else
    result := VarAsType(tmp, VarDouble)
end;

function TClipperCustomExpr.EvalBoolean(s:string): Boolean;
Var
  tmp : variant;
begin
  tmp := EvalVariant(s);

  if VarType(tmp)=VarNull then
    result := false
  else
    result := VarAsType(tmp, varInteger)<>0
end;

function TClipperCustomExpr.EvalInteger(s:string): integer;
Var
  tmp : variant;
begin
  tmp := EvalVariant(s);
  if VarType(tmp)=VarNull then
    result := 0
  else
    result := VarAsType(tmp, varInteger)
end;


function TClipperCustomExpr.EvalString(s:string): String;
Var
  tmp : variant;
begin
  tmp := EvalVariant(s);
  if VarType(tmp)=VarNull then
    result := ''
  else
    result := VarAsType(tmp, VarString)
end;



const
  FloatChars = ['0'..'9','.', 'e', 'E'];
  digitos    = ['0'..'9'];
  operadores = ['+','/', '%', '#', '$' , ','];


// Como ProccessHeap evalua la pila. Prepare la crea, es quí donde se reconocen
// tokens.

function TClipperCustomExpr.Prepare: boolean;
var
  i, max,           // Contador y tope
  ini, j,           // desde donde y contador
  cntpto : integer; // Contar puntos, más de uno en un número es malo
  cnte   : integer; // Contar 'e', más de uno en un número es malo
  Typ    : integer;
  tmp    : string;

begin
  index := 0;            // De la pila
  lasterror := '';

  fExpression := trim(fExpression); // Sin espacios en blanco. Estorban
  max := length(fExpression);      // La longitud de la expressión

  if max=0 then  // De la nada la nado, o mejor un error.
    begin
      if lasterror = '' then
        lasterror := 'Línea vacía. nada que evaluar';
      raise Exception.Create(lasterror);
      result := false;
      exit
    end;

  i:=1;  // i señala que caracter estamos procesando
  repeat
    while (fExpression[i]=' ') and (i<max) do  // Saltamos los blancos en medio de la expr.
      inc(i);
    ini := i;
    Case fExpression[i] of
    '0'..'9' :         // nunca me ha gustado empezar un número con un "."
      begin
        cntpto := 0;
        cnte := 0;
        while (i<=max) and
              (fExpression[i] in FloatChars) do  // Ahora si consideramos al "."
          begin
            if fExpression[i]='.' then
              begin
                inc(cntpto);
                if cntpto>1 then
                  begin
                    if lasterror = '' then
                      lasterror := 'Se esperaba un dígito y se leyó un punto (.)';
                    raise Exception.Create(lasterror);
                    result := false;
                    exit
                  end
              end
            else if UpCase(fExpression[i])='E' then
              begin
                inc(cnte);
                if cnte>1 then
                  begin
                    if lasterror = '' then
                      lasterror := 'Se esperaba un dígito y se leyó una ''e'' ';
                    raise Exception.Create(lasterror);

                    result := false;
                    exit
                  end
              end;
            inc(i)
          end;

        if (cntpto=0) and (cnte=0) then  // Esto depende del "."
          Typ := tinteger
        else
          Typ := tdouble
      end;
    '_',         // aceptamos identificadores con "_" como caracter inicial
    'A'..'Z',
    'a'..'z' :   // identificadores
      begin
        j := 1;

        // leemos hasta que nos quedemos sin digitos o sin expresión
        While ((i+j)<=max) and (fExpression[i+j] in ['_','0'..'9','A'..'Z','a'..'z']) do
          inc(j);

        i := i+j;

        Typ := tident;
        // Las funciones con paréntesis

        if fExpression[i]='(' then
          Typ := tFunc
        else if fExpression[i]='[' then
          Typ := tArray;

      end;
    '''' :       // La comilla simple inicio de string.
      begin
        j := 1;
        While ((i+j)<=max) do
          begin
            if fExpression[i+j] = '''' then
              if not ((i+j+1<=max) and            // Hasta el fin de la cadena
                (fExpression[i+j+1] = '''')) then  // o la próxima comilla
                                                  // Excepto comilla consecutiva
                break
              else
                inc(j);
            inc(j);
          end;

        if ((i+j)>=max) and (fExpression[i+j] <> '''') then
          begin
            if lasterror = '' then
              lasterror := 'Se esperaba una comilla simple '' y no fue hallada.';
            raise Exception.Create(lasterror);
            result := false;
            exit
          end;
        i := i+j+1;
        Typ := tstring;
      end;
    '"' :       // La comilla doble inicio de string.
      begin
        j := 1;
        While ((i+j)<=max) do
          begin
            if fExpression[i+j] = '"' then
                break;
            inc(j);
          end;

        if ((i+j)>=max) and (fExpression[i+j] <> '"') then
          begin
            if lasterror = '' then
              lasterror := 'Se esperaba una comilla doble " y no fue hallada.';
            raise Exception.Create(lasterror);
            result := false;
            exit
          end;
        i := i+j+1;
        Typ := tstring;
      end;
    '»' :       // caracteres "«" y "»" = Alt + 174 y Alt + 175
      begin
        if lasterror = '' then
          lasterror := 'Falta signo "«" como comienzo de cadena';
        raise Exception.Create(lasterror);
        result := false;
        exit
      end;
    '«' :       // El signo "«" como inicio de string.
      begin
        j := 1;
        While ((i+j)<=max) do
          begin
            if fExpression[i+j] = '»' then
                break;
            inc(j);
          end;

        if ((i+j)>=max) and (fExpression[i+j] <> '»') then
          begin
            if lasterror = '' then
              lasterror := 'Se esperaba un signo "»" como final de cadena y no fue hallado.';
            raise Exception.Create(lasterror);
            result := false;
            exit
          end;
        i := i+j+1;
        Typ := tstring;
      end;
    '(',')' :     // Los paréntesis vistos como operadores
      begin
        Typ := toper;
        inc(i)
      end;
    ']' :
      begin
        if lasterror = '' then
          lasterror := 'Falta corchete "[" abriendo';
        raise Exception.Create(lasterror);
        result := false;
        exit
      end;
    '[' :     // Los corchetes vistos como operadores para arreglos
      begin
        j := 1;
        While ((i+j)<=max) do
          begin
            if fExpression[i+j] in[']', '['] then
                break
              else
                inc(j);
          end;

        if fExpression[i+j] <> ']' then
          begin
            if lasterror = '' then
              lasterror := 'Falta corchete "]" cerrando';
            raise Exception.Create(lasterror);
            result := false;
            exit
          end;
        i := i+j+1;
        Typ := tArray;
//        Typ := toper;
//        inc(i)
      end;
    '^' :     // Exponenciación equivale **
      begin
        Typ := toper;
        inc(i)
      end;
    '*' :  // Puede ser multiplicación o exponencianción
      begin
        if (i<=max) and (fExpression[i]='*') then
          begin
            if ((i+1)<=max) and (fExpression[i+1]='*') then
              inc(i,2)
            else
              inc(i)
          end;
        Typ := toper
      end;
    '-':   //  - y ->
      begin
        if (i<=max) and (fExpression[i] = '-') then
          begin
            if (((i+1)<=max) and (fExpression[i+1]='>')) then
              inc(i,2)
            else
              inc(i)
          end;
        Typ := toper
      end;

    '<', '>': // <  <=  > >=  <>
      begin
        if (i<=max) and (fExpression[i] in ['<','>']) then
          begin
            if (((i+1)<=max) and (fExpression[i+1]='=')) or
               (((i+1)<=max) and (fExpression[i+1]='>') and (fExpression[i]='<'))then
              inc(i,2)
            else
              inc(i)
          end;
        Typ := toper
      end;
    '=' : // =  ==
      begin
        if (i<=max) and (fExpression[i]='=') then
          begin
            if ((i+1)<=max) and (fExpression[i+1]='=') then
              inc(i,2)
            else
              inc(i)
          end;
        Typ := toper
      end;
    '!' : // !   !=
      begin
        if (i<=max) and (fExpression[i]='!') then
          begin
            if ((i+1)<=max) and (fExpression[i+1]='=') then
              inc(i,2)
            else
              inc(i)
          end;
        Typ := toper
      end;
    '.': //  .not.  .and.  .or. .xor.
      begin
        if (i<=max) and (fExpression[i]='.') then
          begin
            if ((i+2)<=max) and
               ( CompareText(Copy(fExpression,i+1,2),'t.')=0) then
             begin
              inc(i,3);
              Typ := tboolean
             end
            else if ((i+2)<=max) and
               ( CompareText(Copy(fExpression,i+1,2),'f.')=0) then
             begin
              inc(i,3);
              Typ := tboolean
             end
            else if ((i+3)<=max) and
               ( CompareText(Copy(fExpression,i+1,3),'or.')=0) then
             begin
              inc(i,4);
              Typ := toper
             end
            else if ((i+4)<=max) and
               ( CompareText(Copy(fExpression,i+1,4),'not.')=0) then
             begin
              inc(i,5);
              Typ := toper
             end
            else if ((i+4)<=max) and
               ( CompareText(Copy(fExpression,i+1,4),'and.')=0) then
             begin
              inc(i,5);
              Typ := toper
             end
            else if ((i+4)<=max) and
               ( CompareText(Copy(fExpression,i+1,4),'xor.')=0) then
             begin
              inc(i,5);
              Typ := toper
             end
            else
             begin
              inc(i);
              Typ := tnone
             end
          end
        else
          begin
           inc(i);
           Typ := tnone
           end
      end;
    '+','/', '%', '#', '$', ',' :
      begin
        if (i<=max) and (fExpression[i] in operadores) then
            inc(i);
        Typ := toper
      end;
     else  (*case*)
      begin
        tmp := Copy(fExpression,ini,255);
        Typ := tnone
      end
    end; {case}


    // Ahora a la pila
    Case Typ of
    toper:
      begin
        tmp := Copy(fExpression,ini,i-ini);
        if tmp='+' then
          push(toper,OprSum)
        else if tmp='->' then
          push(toper,OprIndirec)
        else if tmp='-' then
          push(toper,OprMinus)
        else if tmp='**' then
          push(toper,OprExp)
        else if tmp='^' then
          push(toper,OprExp)
        else if tmp='*' then
          push(toper,OprMult)
        else if tmp='/' then
          push(toper,OprDiv)
        else if tmp='=' then
          push(toper,OprComp)
        else if tmp='(' then
          push(toper,OpenPar)
        else if tmp=')' then
          push(toper,ClosePar)
        else if tmp='[' then
          push(toper,OpenBracket)
        else if tmp=']' then
          push(toper,CloseBracket)
        else if tmp='%' then
          push(toper,OprMod)
        else if tmp='<' then
          push(toper,OprLess)
        else if tmp='<=' then
          push(toper,OprLessEqual)
        else if tmp='>' then
          push(toper,OprGreater)
        else if tmp='>=' then
          push(toper,OprGreaterEqual)
        else if tmp='<>' then
          push(toper,OprNotEqual)
        else if tmp='#' then
          push(toper,OprNotEqual)
        else if tmp='$' then
          push(toper,OprConteined)
        else if tmp='==' then
          push(toper,OprPerfectMatch)
        else if tmp='!' then
          push(toper,OprNot)
        else if tmp='!=' then
          push(toper,OprNotEqual)
        else if CompareText(tmp,'.not.')=0 then
          push(toper,OprNot)
        else if CompareText(tmp,'.and.')=0 then
          push(toper,OprAnd)
        else if CompareText(tmp,'.or.')=0 then
          push(toper,OprOr)
        else if CompareText(tmp,'.xor.')=0 then
          push(toper,OprXor)
        else if tmp=',' then
          push(toper,OprComma)
        else
          begin
            if lasterror = '' then
              lasterror := 'Identificador no reconocido: ' + tmp;
            raise Exception.Create(lasterror);
            result := false;
            exit
          end;
      end;
    tstring:
      begin
        // copiamos lo que está entre comillas
        tmp := Copy(fExpression,ini+1,i-ini-2);
        // Las comillas repetidas de manera contigua, reemplazads por simples
        if FSimplificaComilla then
          tmp := StringReplace(tmp,'''''','''',[rfReplaceAll]);
        push(tstring,tmp)
      end;
    tboolean:
      begin
        tmp := Copy(fExpression,ini,i-ini);
        push(tinteger,UpCase(tmp[2])='T')
      end;
    tfunc:
      begin
        tmp := Copy(fExpression,ini,i-ini);
        push(tfunc,tmp)
      end;
    tArray:
      begin
        tmp := Copy(fExpression,ini,i-ini);
        push(tArray,tmp)
      end;
    tident:
      begin
        tmp := Copy(fExpression,ini,i-ini);
        push(tident,tmp)
      end;
    tinteger:
      begin
        tmp := Copy(fExpression,ini,i-ini);
        push(tinteger,StrToInt64(tmp))
      end;
    tdouble:
      begin
        tmp := Copy(fExpression,ini,i-ini);
        push(tdouble,anglostrtofloat(tmp))
      end;
    else
      begin
        if lasterror = '' then
          lasterror := '"Token" no identificado: ' + tmp;
        raise Exception.Create(lasterror);
        result := false;
        exit
      end
    end; {case}

  until (i>max);
  Prepare := true
end;

// Esta es la rutina que corre internamente para darnos oprtunidad de
// asociar un identificador a un valor.

function TClipperCustomExpr.ReqIdent(ident, alias: string): variant;
Var
  value  : variant;
  cancel : boolean;
begin
  if UpperCase(ident) = 'NIL' then
    result := null
  else
  begin
    if @fRequestIdentifier <> nil then
    begin
      value := null;
      cancel := false;
      fRequestIdentifier( Self, ident, value, cancel);
      if cancel then
      begin
        if lasterror = '' then
            lasterror := 'identificador no definido ('''+ident+''')';
        raise Exception.Create(lasterror);
        result := 0
      end
      else
        result := value;
    end
    else
    begin
      if lasterror = '' then
          lasterror := 'No hay rutina para asignación de identificadores ('''+ident+''')' ;
      raise Exception.Create(lasterror);

      result := 0
    end;
  end;
end;

function TClipperCustomExpr.ReqFunc(ident: string): variant;
Var
  value  : variant;
  cancel : boolean;
begin
  if @fRequestFunction <> nil then
    begin
      value := null;
      cancel := false;
      fRequestFunction(self, ident, value, cancel);
      if cancel then
        begin
         if lasterror = '' then
           lasterror := 'función no definida ( '''+ident+''')' ;
         raise Exception.Create(lasterror);
         result := 0
        end
      else
        result := value;
    end
  else
    begin
      if lasterror = '' then
          lasterror := 'No hay rutina para asignación de funciones ( '''+ident+''')' ;
      raise Exception.Create(lasterror);

      result := 0
    end;
end;

procedure TClipperCustomExpr.SetRequestIdentifier(value:TRequestIdentifier);
begin
  fRequestIdentifier := value;
end;

procedure TClipperCustomExpr.SetRequestFunction(value:TRequestFunction);
begin
  fRequestFunction := value;
end;

end.

