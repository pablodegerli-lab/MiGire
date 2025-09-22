unit UGireBancos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UGIREENTIDAD, DBTables, Db;

type
  TGireBancos = class(TGireEntidad)
    QryCabBANCO: TFloatField;
    QryCabDESCRIPCION: TStringField;
    QryCabABREV: TStringField;
    QryCabFH_ACTUALIZACION: TDateTimeField;
    QryCabUSUARIO: TStringField;
  private
    { Private declarations }
  public
   function NombreBanco(ABanco: Integer; lAbrev: boolean=false): String;

  end;

var
  GireBancos: TGireBancos;

implementation

{$R *.DFM}

{ TGireBancos }

function TGireBancos.NombreBanco(ABanco: Integer; lAbrev: boolean): String;
begin
  if QryCab.Locate('BANCO',ABanco,[]) then
  begin
    if lAbrev then
      result:=QryCab.fieldByName('ABREV').VALUE
    else
      result:=QryCab.fieldByName('DESCRIPCION').VALUE;
  end
  else
    result:=inttostr(ABanco)+' - Banco Desconocido';

end;

end.
 