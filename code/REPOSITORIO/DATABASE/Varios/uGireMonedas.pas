unit uGireMonedas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UGireEntidad, DBTables, Db;

type
  TGireMonedas = class(TGireEntidad)
    QryCabMONEDA: TStringField;
    QryCabDESCRIPCION: TStringField;
  private
    { Private declarations }
  public
    function NombreMoneda(AMoneda: String ): String;
  end;

var
  GireMonedas: TGireMonedas;

implementation

{$R *.DFM}

{ TGireMonedas }

function TGireMonedas.NombreMoneda(AMoneda: String): String;
begin
   if QryCab.Locate('MONEDA',AMoneda,[]) then
    result:=QryCab.fieldByName('DESCRIPCION').VALUE
  else
    result:=AMoneda+' - Moneda Desconocida';

end;

end.
