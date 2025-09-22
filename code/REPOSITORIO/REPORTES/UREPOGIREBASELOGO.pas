unit uRepoGIREBaseLogo;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls, StdCtrls,
     ExtCtrls, Forms, Quickrpt, QRCtrls, uRepoGIREBase, Define, jpeg;

type
  TRepoGIREBaseLogo = class(TRepoGIREBase)
    BandaEncabezado: TQRBand;
    QRImage1: TQRImage;
    lblNombreSistema: TQRLabel;
    lblPagina: TQRLabel;
    lblFecha: TQRLabel;
    lblHora: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRSysData3: TQRSysData;
    lblDateLine: TQRLabel;
    lblUsuario: TQRLabel;
  private
    FUsuario: String;
    FMuestraUsuario: Boolean;
    procedure SetMuestraUsuario(const Value: Boolean);
    procedure SetUsuario(const Value: String);
  public
    constructor Create(AOwner: TComponent); override;

    property MuestraUsuario: Boolean read FMuestraUsuario write SetMuestraUsuario default False;
    property Usuario: String read FUsuario write SetUsuario;
  end;

implementation

{$R *.DFM}

constructor TRepoGIREBaseLogo.Create(AOwner: TComponent);
begin
  inherited;
  lblNombreSistema.Caption:= Application.Name;
  lblDateLine.Caption:= DateLine;

end;

procedure TRepoGIREBaseLogo.SetMuestraUsuario(const Value: Boolean);
begin
  FMuestraUsuario:= Value;
  if FMuestraUsuario then
     lblUsuario.Caption:= 'Realizado por: No especificado';
end;

procedure TRepoGIREBaseLogo.SetUsuario(const Value: String);
begin
  if FMuestraUsuario then
  begin
     if Trim(Value) <> '' then
        FUsuario:= 'Realizado por: '+UpperCase(Value)
     else
        FUsuario:= 'Realizado por: No especificado';
  end
  else
     FUsuario:= '';

  lblUsuario.Caption:= FUsuario;
end;

end.
