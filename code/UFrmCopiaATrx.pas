unit UFrmCopiaATrx;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFRMGIREDLG, ActnList, StdCtrls, Buttons, ExtCtrls, Db, RXCtrls, Grids,
  DBGrids, RXDBCtrl, UGeneral, UDMCopiaATrx;

type
  TFrmCopiaATrx = class(TFrmGIREDlg)
    Panel2: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    LProc: TLabel;
    LDescProceso: TLabel;
    LRazonSocial: TLabel;
    LCia: TLabel;
    Label3: TLabel;
    LFh_Distribucion: TLabel;
    Label4: TLabel;
    lNro_Corrida: TLabel;
    DSGrillaArchivos: TDataSource;
    GrillaArchivos: TRxDBGrid;
    Label5: TLabel;
    LRutaDestino: TLabel;
    Label6: TLabel;
    LRutaOrigen: TLabel;
    Label7: TLabel;
    procedure AceptarExecute(Sender: TObject);
    procedure GrillaArchivosDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure DSGrillaArchivosDataChange(Sender: TObject; Field: TField);
    procedure FormActivate(Sender: TObject);
  private
    FRegistroDistribucion: TRegistroDistribucion;
    FDMCopiaATrx: TDMCopiaATrx;
    nPosActual: Integer;
  public
    constructor create( AOwner: TComponent; ARegistroDistribucion: TRegistroDistribucion; ARutaSalida,ARutaTrx: String); reintroduce; overload;
    destructor destroy; override;
  end;

implementation


{$R *.DFM}

{ TFrmCopiaATrx }

constructor TFrmCopiaATrx.create(AOwner: TComponent;
  ARegistroDistribucion: TRegistroDistribucion; ARutaSalida,ARutaTrx: String);
begin
  inherited Create(AOwner);
  FRegistroDistribucion := ARegistroDistribucion;
  Verificar_Directorios(ARutaSalida,ARutaTrx);
  LCia.Caption := IntToStr(FRegistroDistribucion.Cod_Cia);
  LRazonSocial.Caption := FRegistroDistribucion.RazonSocial;
  LProc.Caption := IntToStr(FRegistroDistribucion.Nro_Proceso);
  LDescProceso.Caption := FRegistroDistribucion.DescProceso;
  FDMCopiaATrx := TDMCopiaATrx.Create(AOwner,FRegistroDistribucion,ARutaSalida,ARutaTrx);
  LFh_Distribucion.Caption := DateToStr(FDMCopiaATrx.QryUltimaDistribucionFH_DISTRIBUCION.Value);
  lNro_Corrida.Caption := IntToStr(FDMCopiaATrx.QryUltimaDistribucionNRO_CORRIDA.AsInteger);
  LRutaOrigen.Caption := ARutaSalida;
  LRutaDestino.Caption := ARutaTrx;

end;

destructor TFrmCopiaATrx.destroy;
begin
  FDMCopiaATrx.Free;
  inherited;

end;

procedure TFrmCopiaATrx.AceptarExecute(Sender: TObject);
begin
  inherited;
  { Realizar el Control de Procesos }
{  FDMCopiaATrx.ADOControlProcesoGema.Empresa := FRegistroDistribucion.Cod_Cia;
  FDMCopiaATrx.ADOControlProcesoGema.CodProceso := 101;
  FDMCopiaATrx.ADOControlProcesoGema.NroProceso := FRegistroDistribucion.Nro_Proceso;

  FDMCopiaATrx.QryFh_Proceso_Anterior.Close;
  FDMCopiaATrx.QryFh_Proceso_Anterior.Parameters.ParamByName('pCod_Cia').Value := FRegistroDistribucion.Cod_Cia;
  FDMCopiaATrx.QryFh_Proceso_Anterior.Open;

  FDMCopiaATrx.QryDistribucionesProcesos.Close;
  FDMCopiaATrx.QryDistribucionesProcesos.Parameters.ParamByName('pCod_Cia').Value := FRegistroDistribucion.Cod_Cia;
  FDMCopiaATrx.QryDistribucionesProcesos.Parameters.ParamByName('pNro_proceso').Value := FRegistroDistribucion.Nro_Proceso;
  FDMCopiaATrx.QryDistribucionesProcesos.Parameters.ParamByName('pFh_Distribucion').Value := FDMCopiaATrx.QryUltimaDistribucionFH_DISTRIBUCION.Value;
  FDMCopiaATrx.QryDistribucionesProcesos.Parameters.ParamByName('pNro_Corrida').Value := FDMCopiaATrx.QryUltimaDistribucionNRO_CORRIDA.AsInteger;
  FDMCopiaATrx.QryDistribucionesProcesos.Open;

  while not FDMCopiaATrx.QryDistribucionesProcesos.Eof do
  begin
    FDMCopiaATrx.ADOControlProcesoGema.FH_Proceso := FDMCopiaATrx.QryDistribucionesProcesosFH_PROCESO.Value;
    FDMCopiaATrx.ADOControlProcesoGema.FH_Proceso_Anterior := FDMCopiaATrx.QryFh_Proceso_AnteriorFH_PROCESO_ANTERIOR.Value;
    if not FDMCopiaATrx.ADOControlProcesoGema.Autorizado then
      Raise Exception.Create('EL CONTROL DE PROCESOS NO PERMITE CONTINUAR');
    FDMCopiaATrx.QryDistribucionesProcesos.Next;
  end;}

  FDMCopiaATrx.Copiar_A_Trx('CM');

{  FDMCopiaATrx.QryDistribucionesProcesos.First;
  while not FDMCopiaATrx.QryDistribucionesProcesos.Eof do
  begin
    FDMCopiaATrx.ADOControlProcesoGema.FH_Proceso := FDMCopiaATrx.QryDistribucionesProcesosFH_PROCESO.Value;
    FDMCopiaATrx.ADOControlProcesoGema.FH_Proceso_Anterior := FDMCopiaATrx.QryFh_Proceso_AnteriorFH_PROCESO_ANTERIOR.Value;
    FDMCopiaATrx.ADOControlProcesoGema.Finalizado;
    FDMCopiaATrx.QryDistribucionesProcesos.Next;
  end;}

  Application.MessageBox(PChar('LA COPIA A TRANSMISION FINALIZO EXITOSAMENTE'),
                         PChar('Gema - Copia a Transmisión'),
                         MB_ICONINFORMATION );

end;

procedure TFrmCopiaATrx.GrillaArchivosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin

  GrillaArchivos.Canvas.Brush.Color := TColor($00E0AC65);
  GrillaArchivos.Canvas.Font.Color := clWhite;

  if DSGrillaArchivos.DataSet.RecNo = nPosActual then
  begin
    GrillaArchivos.Canvas.Brush.Color := clBlack;
    GrillaArchivos.Canvas.Font.Color  := clWhite;
    GrillaArchivos.Canvas.Font.Style  := [fsBold];
  end;

  GrillaArchivos.DefaultDrawColumnCell(Rect, DataCol, Column, State);

end;

procedure TFrmCopiaATrx.DSGrillaArchivosDataChange(Sender: TObject;
  Field: TField);
begin
  nPosActual := DSGrillaArchivos.DataSet.RecNo;
  GrillaArchivos.Repaint;

end;

procedure TFrmCopiaATrx.FormActivate(Sender: TObject);
begin
  GrillaArchivos.SetFocus;

end;

end.
