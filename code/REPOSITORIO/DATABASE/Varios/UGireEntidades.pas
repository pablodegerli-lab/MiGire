unit UGireEntidades;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UGIREENTIDAD, DBTables, Db;

type
  TGireEntidades = class(TGireEntidad)
    QryCabCOD_ENTIDAD: TFloatField;
    QryCabDESCRIPCION: TStringField;
    QryCabABREVIATURA: TStringField;
    QryCabDOMICILIO: TStringField;
    QryCabLOCALIDAD: TStringField;
    QryCabCOD_PROVINCIA: TFloatField;
    QryCabCOD_POSTAL: TStringField;
    QryCabCUIT: TStringField;
    QryCabTELEFONO: TStringField;
    QryCabFH_ACTUALIZACION: TDateTimeField;
    QryCabUSUARIO: TStringField;
  private
    { Private declarations }
  public
   function NombreBanco(ABanco: Integer; lAbrev: Boolean = False): String;
  end;

var
  GireEntidades: TGireEntidades;

implementation

{$R *.DFM}

function TGireEntidades.NombreBanco(ABanco: Integer; lAbrev: Boolean): String;
begin
  if QryCab.Locate('Cod_Entidad',ABanco,[]) then
  begin
    if lAbrev then
      Result:=QryCab.FieldByName('ABREVIATURA').VALUE
    else
      Result:=QryCab.FieldByName('DESCRIPCION').VALUE;
  end
  else
    Result:=IntToStr(ABanco)+' - Banco Desconocido';

end;


end.
