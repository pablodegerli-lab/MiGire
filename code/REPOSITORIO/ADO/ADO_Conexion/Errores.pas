unit Errores;

interface

uses
	Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
	Db, ADODB;

  procedure Traducir_Error(Mensaje_de_Error: String; DSet: TDataSet);
  Function Otro_Error(Mensaje_de_Error: String): String;

implementation

procedure Traducir_Error(Mensaje_de_Error: String; DSet: TDataSet);
var
  Codigo: Integer;
  TextoError,TextoFijo,TextoAyuda,TextoHelp2,TextoOrden: String;
begin
  TextoFijo  := ' - AVISE A SISTEMAS.';
  TextoAyuda := '(La descripción del error figura a continuación'+#13+'y quizás pueda serle de utilidad).';
  TextoHelp2 := 'SI CONTINUA CON PROBLEMAS AVISE A SISTEMAS.';
  TextoOrden := 'VERIFIQUE SUS DATOS Y REINTENTE LA OPERACION.';
  try
    Codigo := StrToInt(Copy(Mensaje_de_Error,5,5));
  except
    Codigo := 99999;
  end;
  case Codigo of
    1      : TextoError := 'EL REGISTRO QUE ESTA INTENTANDO INGRESAR YA EXISTE. '+#13+TextoOrden+#13+#13+TextoAyuda;
    2..100 : TextoError := 'ERROR DEL SERVIDOR DE ORACLE'+#13+TextoOrden+#13+#13+TextoAyuda;
    900    : TextoError := 'SENTENCIA SQL INVALIDA'+TextoFijo;
    903    : TextoError := 'NOMBRE DE TABLA NO VALIDO O INEXISTENTE'+TextoFijo;
    904    : TextoError := 'NOMBRE DE COLUMNA NO VALIDO O INEXISTENTE'+TextoFijo;
    942    : TextoError := 'TABLA O VISTA INEXISTENTE'+TextoFijo;
    1031   : TextoError := 'NO TIENE AUTORIZACION PARA EFECTUAR ESTA OPERACION.'+#13+TextoOrden+#13+#13+TextoAyuda;
    1400   : TextoError := 'NO PUEDE INSERTAR CAMPOS SIN VALOR.'+#13+TextoOrden+#13+#13+TextoAyuda;
    1401   : TextoError := 'VALOR INSERTADO MUY LARGO PARA LA COLUMNA';
    1407   : TextoError := 'NO PUEDE ACTUALIZAR CAMPOS SIN VALOR. '+#13+TextoOrden+#13+#13+TextoAyuda;
    1476   : TextoError := 'DIVISION POR CERO';
    1481   : TextoError := 'FORMATO DE PARAMETRO INVALIDO (TO_CHAR/TO_NUMBER)';
    2291   : TextoError := 'NO PUEDE INSERTAR O ACTUALIZAR ESTE REGISTRO PORQUE MANTIENE INTEGRIDAD REFERENCIAL CON ALGUNA TABLA. '+#13+TextoOrden+#13+TextoHelp2+#13+#13+TextoAyuda;
    2292   : TextoError := 'NO PUEDE ELIMINAR ESTE REGISTRO PORQUE MANTIENE INTEGRIDAD REFERENCIAL CON ALGUNA TABLA.'+#13+TextoOrden+#13+TextoHelp2+#13+#13+TextoAyuda;
  else
    TextoError := Otro_Error(Mensaje_de_Error);
  end;
  TextoError := TextoError + #10 + #13 + #13 + Mensaje_de_Error;
  DatabaseError(TextoError,DSet);
end;

Function Otro_Error(Mensaje_de_Error: String): String;
var
  TextoError: String;
begin
  if Copy(Mensaje_de_Error,1,26)= 'Cannot insert an empty row' then
    TextoError := 'NO PUEDE INGRESAR DATOS NULOS - CORRIJA'
  else
    if Copy(Mensaje_de_Error,1,20)= 'Table does not exist' then
      TextoError := 'DIRECTORIO Y/O ARCHIVO INEXISTENTE(S)'
    else
      TextoError := 'OCURRIO EL SIGUIENTE ERROR: ';
  Result := TextoError;
end;

end.
