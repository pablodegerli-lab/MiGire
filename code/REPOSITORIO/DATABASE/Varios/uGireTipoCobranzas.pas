unit uGireTipoCobranzas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UGIREENTIDAD, DBTables, Db;

type
  TGireTipoCobranzas = class(TGireEntidad)
    QryCabTIPOCOB: TStringField;
    QryCabDESCRIPCION: TStringField;
    QryCabUSUARIO: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  GireTipoCobranzas: TGireTipoCobranzas;

implementation

{$R *.DFM}

end.
 