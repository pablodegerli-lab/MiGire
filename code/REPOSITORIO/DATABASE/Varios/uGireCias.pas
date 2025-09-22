unit uGireCias;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uGireEntidad, DBTables, Db;

type
  TGireCias = class(TGireEntidad)
  private
    { Private declarations }
  public
   function NombreEmpresa(AEmpresa: Integer; lAbrev: Boolean = False): String;
  end;

var
  GireCias: TGireCias;

implementation

{$R *.DFM}

function TGireCias.NombreEmpresa(AEmpresa: Integer; lAbrev: Boolean): String;
begin
  if QryCab.Locate('Cod_Cia',AEmpresa,[]) then
  begin
    if lAbrev then
      Result:=QryCab.FieldByName('ABREVIATURA').VALUE
    else
      Result:=QryCab.FieldByName('DESCRIPCION').VALUE;
  end
  else
    Result:=IntToStr(AEmpresa)+' - Empresa Desconocida';

end;

end.
