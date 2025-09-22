unit UGirePath;

interface                          

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UGireEntidad, DBTables, Db, Variants;

type
  TGirePath = class(TGireEntidad)
  public
    function ObtenerPath(ACodPath: String): String; overload;
    function ObtenerPath(ASistema: String; ACodPath: String): String; overload;
  end;

var
  GirePath: TGirePath;

implementation

{$R *.DFM}

{ TGirePath }

function TGirePath.ObtenerPath(ACodPath: String): String;
begin
  Result := ObtenerPath(Application.Name, ACodPath);
end;

function TGirePath.ObtenerPath(ASistema, ACodPath: String): String;
begin
  QryCab.Open;

  Result := QryCab.Lookup('SISTEMA;CODPATH',
                          VarArrayOf([ASistema, ACodPath]),
                          'PATH');
end;

end.
