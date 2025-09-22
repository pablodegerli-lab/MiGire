unit UDMGirePath;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, ADODB, Variants;

type
  TDMGirePath = class(TDataModule)
    QryGirePath: TADOQuery;
    QryGirePathSISTEMA: TStringField;
    QryGirePathCODPATH: TStringField;
    QryGirePathPATH: TStringField;
  private
    { Private declarations }
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function ObtenerPath(ACodPath: String): String; overload;
    function ObtenerPath(ASistema: String; ACodPath: String): String; overload;
  end;

var
  DMGirePath: TDMGirePath;

implementation

{$R *.DFM}

{ TDataModule3 }

function TDMGirePath.ObtenerPath(ACodPath: String): String;
begin
  Result := ObtenerPath(Application.Name, ACodPath);

end;

constructor TDMGirePath.Create(AOwner: TComponent);
begin
  Inherited;
  QryGirePath.Open;

end;

function TDMGirePath.ObtenerPath(ASistema, ACodPath: String): String;
var
  Resultado : Variant;
begin
  Resultado := QryGirePath.Lookup('SISTEMA;CODPATH',
                          VarArrayOf([ASistema, ACodPath]),
                          'PATH');

  if Resultado = null then
    Result := ''
  else
    Result := Resultado;
end;

destructor TDMGirePath.Destroy;
begin
  QryGirePath.Close;
  inherited;

end;

end.
