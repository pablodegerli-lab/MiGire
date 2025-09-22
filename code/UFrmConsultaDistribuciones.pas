unit UFrmConsultaDistribuciones;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFRMGIREDLG, ActnList, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids,Define,
  RXDBCtrl, UGeneral, Db, UDMConsultaDistribucion, Mask, ToolEdit, RxLookup, ADODb,
  DBCtrls, Espera, Menus, ImgList, TYPINFO, Variants;

type
	TIconos = (DOC,XLS,TXT,PDF,DBF,PRN);

  TFrmConsultaDistribuciones = class(TFrmGIREDlg)
    Panel2: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    GrillaResumen: TRxDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    DSGrillaResumen: TDataSource;
    BtnImpresion: TBitBtn;
    DSNro_CorridaDesde: TDataSource;
    Panel6: TPanel;
    GroupBox1: TGroupBox;
    DSNro_CorridaHasta: TDataSource;
    DSQryResumen: TDataSource;
    DBLCBEmpresa: TDBLookupComboBox;
    DBTRazonSocial: TDBText;
    DSDistribuciones: TDataSource;
    DBTProceso: TDBText;
    DBTDescProceso: TDBText;
    Esperar1: TEsperar;
    PUMAyuda: TPopupMenu;
    Ayuda: TAction;
    Queesesto1: TMenuItem;
    DSCorridas: TDataSource;
    Label4: TLabel;
    deFh_DistriHasta: TDateEdit;
    Label3: TLabel;
    deFh_DistriDesde: TDateEdit;
    Label7: TLabel;
    LCantDist: TLabel;
    Label8: TLabel;
    LCantArch: TLabel;
    ImageList1: TImageList;
    procedure deFh_DistriDesdeAcceptDate(Sender: TObject; var ADate: TDateTime;
      var Action: Boolean);
    procedure AceptarExecute(Sender: TObject);
    procedure deFh_DistriDesdeExit(Sender: TObject);
    procedure deFh_DistriHastaAcceptDate(Sender: TObject;
      var ADate: TDateTime; var Action: Boolean);
    procedure deFh_DistriHastaExit(Sender: TObject);
    procedure GrillaResumenDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure FormShow(Sender: TObject);
    procedure DSGrillaResumenDataChange(Sender: TObject; Field: TField);
    procedure deFh_DistriDesdeChange(Sender: TObject);
    procedure deFh_DistriHastaChange(Sender: TObject);
    procedure DSNro_CorridaDesdeDataChange(Sender: TObject; Field: TField);
    procedure DSNro_CorridaHastaDataChange(Sender: TObject; Field: TField);
    procedure BtnImpresionClick(Sender: TObject);
    procedure DSDistribucionesDataChange(Sender: TObject; Field: TField);
    procedure FormActivate(Sender: TObject);
    procedure AyudaExecute(Sender: TObject);
  private
    FRegistroDistribucion: TRegistroDistribucion;
    FDMConsultaDistribucion: TDMConsultaDistribucion;
    nPosActual: Integer;
    lPrimeraVez: Boolean;
	  HandActiveWin: HWND;
    procedure BuscoNrosDeCorridaDesde;
    procedure BuscoNrosDeCorridaHasta;
    procedure CerrarDSGrilla;
    procedure Habilitar_BtnAceptar;
  public
    constructor create(Aowner: TComponent; ARegistroDistribucion: TRegistroDistribucion); reintroduce; overload;
    destructor destroy; override;
  end;

implementation

uses URepoResumenDistribucion, UImagenes;


{$R *.DFM}

{ TFrmConsultaDistribuciones }

constructor TFrmConsultaDistribuciones.create(Aowner: TComponent;
  ARegistroDistribucion: TRegistroDistribucion);
begin
  inherited Create(AOwner);
//  GrillaResumen.Color := TColor($02AF6666); Violeta pastel
//  GrillaResumen.Color := TColor($00CBAA00); Celeste pastel
  ModalResult := mrNone;
  FRegistroDistribucion := ARegistroDistribucion;

  FDMConsultaDistribucion := TDMConsultaDistribucion.Create(AOwner);
  DBLCBEmpresa.KeyValue := FRegistroDistribucion.Cod_Cia;
  DSDistribuciones.DataSet.Locate('EMPRESA;PROCESO',VarArrayOf([FRegistroDistribucion.Cod_Cia,FRegistroDistribucion.Nro_Proceso]),[]);
  deFh_DistriDesde.Date := Date;
  deFh_DistriHasta.Date := Date;
  lPrimeraVez := False;
end;

destructor TFrmConsultaDistribuciones.destroy;
begin
  FDMConsultaDistribucion.Free;
  inherited;
end;

procedure TFrmConsultaDistribuciones.deFh_DistriDesdeAcceptDate(Sender: TObject;
  var ADate: TDateTime; var Action: Boolean);
begin
  inherited;
  BuscoNrosDeCorridaDesde;
end;

procedure TFrmConsultaDistribuciones.AceptarExecute(Sender: TObject);
var
  pDesde, pHasta: String;
begin
  Esperar1.Mostrarse(True);
  GrillaResumen.DataSource := nil;
  BtnImpresion.Enabled := False;
  DSQryResumen.DataSet.Close;
  pDesde := DateToString(deFh_DistriDesde.Date)+'01';
  pHasta := DateToString(deFh_DistriHasta.Date)+'99';
  (DSQryResumen.DataSet as TADOQuery).Parameters.ParamByName('pDesde').Value := pDesde;
  (DSQryResumen.DataSet as TADOQuery).Parameters.ParamByName('pHasta').Value := pHasta;
  (DSQryResumen.DataSet as TADOQuery).Parameters.ParamByName('pCod_Cia').Value := DSDistribuciones.DataSet.FieldByName('EMPRESA').AsInteger;
  (DSQryResumen.DataSet as TADOQuery).Parameters.ParamByName('pNro_proceso').Value := DSDistribuciones.DataSet.FieldByName('PROCESO').AsInteger;
  DSQryResumen.DataSet.Open;

  DSCorridas.DataSet.Close;
  (DSCorridas.DataSet as TADOQuery).Parameters.ParamByName('pDesde').Value := DateToString(deFh_DistriDesde.Date);
  (DSCorridas.DataSet as TADOQuery).Parameters.ParamByName('pHasta').Value := DateToString(deFh_DistriHasta.Date);
  (DSCorridas.DataSet as TADOQuery).Parameters.ParamByName('pCod_Cia').Value := DSDistribuciones.DataSet.FieldByName('EMPRESA').AsInteger;
  (DSCorridas.DataSet as TADOQuery).Parameters.ParamByName('pNro_proceso').Value := DSDistribuciones.DataSet.FieldByName('PROCESO').AsInteger;
  DSCorridas.DataSet.Open;

  LCantDist.Caption := IntToStr(DSCorridas.DataSet.RecordCount);
  LCantArch.Caption := IntToStr(DSQryResumen.DataSet.RecordCount);

  GrillaResumen.DataSource := DSGrillaResumen;
  lPrimeraVez := False;
  Esperar1.Mostrarse(False);
  SetActiveWindow(HandActiveWin);
  if DSQryResumen.DataSet.RecordCount = 0 then
    Raise Exception.Create('No existen distribuciones para la fecha solicitada');
  BtnImpresion.Enabled := True;
end;

procedure TFrmConsultaDistribuciones.BuscoNrosDeCorridaDesde;
begin
  DSNro_CorridaDesde.DataSet.Close;
  (DSNro_CorridaDesde.DataSet as TADOQuery).Parameters.ParamByName('pFh_Distribucion').Value := DEFh_DistriDesde.Date;
  DSNro_CorridaDesde.DataSet.Open;

end;

procedure TFrmConsultaDistribuciones.deFh_DistriDesdeExit(
  Sender: TObject);
begin
  BuscoNrosDeCorridaDesde;
end;

procedure TFrmConsultaDistribuciones.BuscoNrosDeCorridaHasta;
begin
  DSNro_CorridaHasta.DataSet.Close;
  (DSNro_CorridaHasta.DataSet as TADOQuery).Parameters.ParamByName('pFh_Distribucion').Value := DEFh_DistriHasta.Date;
  DSNro_CorridaHasta.DataSet.Open;

end;

procedure TFrmConsultaDistribuciones.deFh_DistriHastaAcceptDate(
  Sender: TObject; var ADate: TDateTime; var Action: Boolean);
begin
  inherited;
  BuscoNrosDeCorridaHasta;
end;

procedure TFrmConsultaDistribuciones.deFh_DistriHastaExit(Sender: TObject);
begin
  inherited;
  BuscoNrosDeCorridaHasta;
end;

procedure TFrmConsultaDistribuciones.GrillaResumenDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  bitmap : TBitmap;
  fixRect : TRect;
  bmpWidth : integer;

  imgIndex : integer;

begin
  inherited;
  fixRect := Rect;
  { Personalizando el tipo de archivo generado }
  { Lógica para mostrar la imagen adecuada al tipo de archivo generado }
	imgIndex := Ord( getEnumValue( TypeInfo( TIconos ), DSGrillaResumen.DataSet.FieldByName('LOGO').AsString)  );

  if Column.FieldName = 'NOMBRE_ARCHIVO' then
  begin

   	bitmap := TBitmap.Create;
    try
      { Obtengo la imagen del ImageList }
      ImageList1.GetBitmap(imgIndex,bitmap);
      { Arreglo las dimensiones del bitmap }
      bmpWidth := (Rect.Bottom - Rect.Top);
      fixRect.Right := Rect.Left + bmpWidth;
      { Dibujo el bitmap }
      GrillaResumen.Canvas.StretchDraw(fixRect,bitmap);
    finally
      bitmap.Free;
    end;

    { restauro el rectángulo de salida y agrego espacio para los gráficos }
    fixRect := Rect;
    fixRect.Left := fixRect.Left + bmpWidth;
  end;

  if (DSGrillaResumen.DataSet.FieldByName('COLOR').Value = '2') then
  begin
//    GrillaResumen.Canvas.Brush.Color := TColor($00CD8B10);
    GrillaResumen.Canvas.Brush.Color := TColor($00CEB993);
    GrillaResumen.Canvas.Font.Color  := clWhite;
  end
  else
  begin
//    GrillaResumen.Canvas.Brush.Color := TColor($00E0AC65);
    GrillaResumen.Canvas.Brush.Color := TColor($00AF9A74);
    GrillaResumen.Canvas.Font.Color  := clWhite;
  end;

  if DSGrillaResumen.DataSet.RecNo = nPosActual then
  begin
    GrillaResumen.Canvas.Brush.Color := clBlack;
    GrillaResumen.Canvas.Font.Color  := clWhite;
    GrillaResumen.Canvas.Font.Style  := [fsBold];
  end;

  GrillaResumen.DefaultDrawColumnCell(fixRect, DataCol, Column, State);
//  GrillaResumen.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TFrmConsultaDistribuciones.FormShow(Sender: TObject);
begin
  inherited;
  deFh_DistriDesde.SetFocus;

end;

procedure TFrmConsultaDistribuciones.DSGrillaResumenDataChange(
  Sender: TObject; Field: TField);
begin
  nPosActual := DSGrillaResumen.DataSet.RecNo;
  if DSGrillaResumen.DataSet.State = dsBrowse then
    if DSGrillaResumen.DataSet.RecordCount > 0 then
      GrillaResumen.SetFocus;

{ Para repintar correctamente si me muevo en la grilla con el mouse
  a través de la barra de desplazamiento}
  if not lPrimeravez then
    GrillaResumen.Repaint;

end;

procedure TFrmConsultaDistribuciones.deFh_DistriDesdeChange(
  Sender: TObject);
begin
  CerrarDSGrilla;
end;

procedure TFrmConsultaDistribuciones.CerrarDSGrilla;
begin
  DSGrillaResumen.DataSet.Close;
  LCantDist.Caption := '0';
  LCantArch.Caption := '0';
  lPrimeraVez := True;
end;

procedure TFrmConsultaDistribuciones.deFh_DistriHastaChange(
  Sender: TObject);
begin
  CerrarDSGrilla;
end;

procedure TFrmConsultaDistribuciones.DSNro_CorridaDesdeDataChange(
  Sender: TObject; Field: TField);
begin
  CerrarDSGrilla;
  Habilitar_BtnAceptar;
end;

procedure TFrmConsultaDistribuciones.DSNro_CorridaHastaDataChange(
  Sender: TObject; Field: TField);
begin
  CerrarDSGrilla;
  Habilitar_BtnAceptar;
end;

procedure TFrmConsultaDistribuciones.BtnImpresionClick(Sender: TObject);
var
  RepoResumenDistribucion: TRepoResumenDistribucion;
  W_Cia, W_Proceso: Integer;
  W_DescCia, W_DescProceso: String;
begin
	W_Cia := DSDistribuciones.DataSet.FieldByname('EMPRESA').Value;
	W_Proceso := DSDistribuciones.DataSet.FieldByname('PROCESO').Value;
	W_DescCia := DSDistribuciones.DataSet.FieldByname('RAZONSOCIAL').Value;
	W_DescProceso := DSDistribuciones.DataSet.FieldByname('DESCRIPCION').Value;
  RepoResumenDistribucion := TRepoResumenDistribucion.Create(Self, W_Cia, W_Proceso, W_DescCia, W_DescProceso, DSQryResumen.DataSet,'REIMPRESION');
  try
    RepoResumenDistribucion.PreviewModal;
  finally
    RepoResumenDistribucion.Free;
  end;

end;

procedure TFrmConsultaDistribuciones.Habilitar_BtnAceptar;
begin
  if (deFh_DistriDesde.Date > 0) and (deFh_DistriHasta.Date > 0) then
      BtnAceptar.Enabled := True
  else
    BtnAceptar.Enabled := False;

end;

procedure TFrmConsultaDistribuciones.DSDistribucionesDataChange(
  Sender: TObject; Field: TField);
begin
	if DSDistribuciones.State = dsBrowse then
    DSGrillaResumen.DataSet.Close;

end;

procedure TFrmConsultaDistribuciones.FormActivate(Sender: TObject);
begin
  inherited;
  HandActiveWin := GetActiveWindow();

end;


procedure TFrmConsultaDistribuciones.AyudaExecute(Sender: TObject);
begin
  inherited;
  Application.MessageBox(PChar('ARCHIVO: nombre del archivo que se envía al UMBRAL de SALIDA.' + #13#10 +
															 'DESCRIPCION: Servicio al que pertenece el archivo.' + #13#10 +
                               'MOVIMIENTOS: cantidad de talones / transacciones.' + #13#10 +
                               'REGISTROS: cantidad de líneas en el archivo.' + #13#10 +
															 'IMPORTE: Sumatoria de importes de los movimientos (si corresponde).' + #13#10 +
                               'FECHA y HORA: de la distribución, es decir de cuando se ejecutó el proceso de Gema.' + #13#10 +
                               'Nº de CORRIDA: indica en que corrida dentro de la misma fecha de distribución se generó el archivo.'),
							           PChar('Gema - Consulta de Distribuciones'),
							           MB_ICONINFORMATION);

end;

end.
