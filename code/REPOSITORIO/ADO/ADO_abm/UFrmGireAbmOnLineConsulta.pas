unit UFrmGireAbmOnLineConsulta;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFRMGIREBASE, ComCtrls, ExtCtrls, ActnList, StdCtrls, Buttons, Db, Define;

type
  TFrmGireAbmOnLineConsulta = class(TFrmGIREBase)
    Panel1: TPanel;
    Panel2: TPanel;
    StatusBar1: TStatusBar;
    BtnAceptar: TBitBtn;
    Panel3: TPanel;
    Label1: TLabel;
    DSConsulta: TDataSource;
    BtnNoBuscar: TBitBtn;
    procedure BtnNoBuscarClick(Sender: TObject);
    procedure BtnAceptarClick(Sender: TObject);
  private
  protected
    FEmpresa,FEntidad,FSucursal: Currency;
  public
    constructor Create (AOwner: TComponent; ADataSet: TDataSet); reintroduce; overload;
    Destructor Destroy; override;
  end;

var
  FrmGireAbmOnLineConsulta: TFrmGireAbmOnLineConsulta;

implementation

{$R *.DFM}

{ TFrmSatanConsulta }

constructor TFrmGireAbmOnLineConsulta.Create(AOwner: TComponent;
  ADataSet: TDataSet);
begin
  inherited Create(AOwner);
  if ADataSet <> nil then
    DSConsulta.DataSet := ADataSet;
  if DSConsulta.DataSet.RecordCount = 0 then
  begin
    FEmpresa  := 0;
    FEntidad  := 0;
    FSucursal := 0;
  end
  else
  begin
    if DSConsulta.DataSet.FindField('COD_CIA') = nil then
      FEmpresa := 0
    else
      FEmpresa := DSConsulta.DataSet.FieldByName('COD_CIA').Value;
    if DSConsulta.DataSet.FindField('COD_ENTIDAD') = nil then
      FEntidad := 0
    else
      FEntidad := DSConsulta.DataSet.FieldByName('COD_ENTIDAD').Value;
    if DSConsulta.DataSet.FindField('COD_SUCURSAL') = nil then
      FSucursal := 0
    else
      FSucursal := DSConsulta.DataSet.FieldByName('COD_SUCURSAL').Value;
  end;
end;

destructor TFrmGireAbmOnLineConsulta.Destroy;
begin
  inherited;

end;

procedure TFrmGireAbmOnLineConsulta.BtnNoBuscarClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TFrmGireAbmOnLineConsulta.BtnAceptarClick(Sender: TObject);
begin
  inherited;
//  Pausa(0);
end;

end.
