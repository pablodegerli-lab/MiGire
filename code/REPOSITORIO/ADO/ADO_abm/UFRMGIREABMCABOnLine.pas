unit UFrmGIREAbmCabOnLine;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, DBCtrls, Mask, ExtCtrls, Db, Menus,
  DBActns, StdActns, ActnList, uLocator, ToolWin, uXDataSetActions, uDMABM,
  UFRMGIREABMOnLine, degrade, uRepoGireBaseEmpresa, QuickRpt, RXCtrls,
  RXDBCtrl, ADODB, uFrmGireAbmOnLineConsulta, Grids, DBGrids,RxLookup;

type
  TDMABMClass = class of TDMABM;

  TFrmConsultaClass = class of TFrmGireAbmOnLineConsulta;

  TParametros = Array of Variant;

  TFrmGIREAbmCabOnLine = class(TFrmGIREAbmOnLine)
    Panel3: TPanel;
    PageDatos: TPageControl;
    PanelDatos: TTabSheet;
    Degrade1: TDegrade;
    PanelGrilla: TTabSheet;
    Panel8: TPanel;
    DBGrillaDatos: TRxDBGrid;
    PanelDeshabilitados: TPanel;
    procedure ImprimirExecute(Sender: TObject);
    procedure ConsultarExecute(Sender: TObject);
    procedure dsCabDataChange(Sender: TObject; Field: TField);
    procedure PanelGrillaShow(Sender: TObject);
    procedure DBGrillaDatosDblClick(Sender: TObject);
    procedure DBGrillaDatosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrillaDatosKeyPress(Sender: TObject; var Key: Char);
    procedure PageDatosChange(Sender: TObject);
    procedure dsCabStateChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FConsulta : TFrmGireAbmOnLineConsulta;
    FReporte : TRepoGireBaseEmpresa;
    nPosActual: Integer;
    lPrimeraVez: Boolean;
    procedure Creo_Reporte;
    procedure Consulto_registro;
    procedure Inhabilitar_ColumnasGrilla(lHabilita: Boolean);
  protected
    FDM: TDMAbm; 
    function getDMClass: TDMABMClass; virtual;abstract;
    function getConsultaClass: TFrmConsultaClass; virtual;abstract;
    function CrearReporte: TRepoGireBaseEmpresa; virtual;abstract;
  public
    constructor Create(AOwner: TComponent); reintroduce; overload;
    constructor Create (AOwner: TComponent; AParametros: TParametros); reintroduce;overload ;
    Destructor Destroy; override;
  end;

implementation

{$R *.DFM}


{ TFrmGIREAbmCab }

constructor TFrmGIREAbmCabOnLine.Create(AOwner: TComponent);
begin
  inherited Create(AOWner);
  lPrimeraVez := True;
  PageDatos.ActivePage := PanelDatos;
  FDM := getDMClass.Create(AOwner);
  dsCab.DataSet := FDM.QryCab;
  DBGrillaDatos.DataSource := dsCab;
  BorderIcons := [biSystemMenu,biMaximize,biMinimize];
  FReporte := nil;
  AbrirDatos;
  if getConsultaClass <> nil then
	  try
  	  FConsulta := getConsultaClass.Create(AOwner,dsCab.DataSet);
	  except
  	end;
  if Length(FControlesDesHabilitados) > 0 then
    PanelDeshabilitados.Visible := True;
end;


constructor TFrmGIREAbmCabOnLine.Create(AOwner: TComponent;
  AParametros: TParametros);
var
  i,nTope: Integer;
begin
  inherited Create(AOwner);
  lPrimeraVez := True;
  FDM := getDMClass.Create(AOwner);
  dsCab.DataSet := FDM.QryCab;
  DBGrillaDatos.DataSource := dsCab;
  if Length(AParametros) > (dsCab.dataset as TADOQuery).Parameters.Count then
    nTope := (dsCab.dataset as TADOQuery).Parameters.Count
  else
    nTope := Length(Aparametros);
  for i := 0 to nTope-1 do
    (dsCab.dataset as TADOQuery).Parameters[i].Value := AParametros[i];
  BorderIcons := [biSystemMenu,biMaximize,biMinimize];
  FReporte := nil;
  AbrirDatos;
  if getConsultaClass <> nil then
	  try
  	  FConsulta := getConsultaClass.Create(Aowner,dsCab.DataSet);
	  except
  	end;
  if Length(FControlesDesHabilitados) > 0 then
    PanelDeshabilitados.Visible := True;
end;

procedure TFrmGIREAbmCabOnLine.Creo_Reporte;
begin
  try
    FReporte := CrearReporte;
    ToolButton3.Enabled := False;
    if FReporte.RecordCount = 0 then
      Application.MessageBox(PChar('NO EXISTEN DATOS PARA LISTAR'),
    												 PChar(Application.Title),
    												 MB_OK+MB_DEFBUTTON2+MB_ICONINFORMATION)
    else
      FReporte.Preview;
  finally
      FReporte.Free;
      ToolButton3.Enabled := True;
  end;
end;


destructor TFrmGIREAbmCabOnLine.Destroy;
begin
  FConsulta.Free;
  FDM.Free;
  inherited;

end;

procedure TFrmGIREAbmCabOnLine.ImprimirExecute(Sender: TObject);
begin
  if dsCab.DataSet.RecordCount > 0 then
    Creo_Reporte
  else
  begin
    Application.MessageBox(PChar('NO EXISTEN DATOS PARA LISTAR'),
  												 PChar(Application.Title),
  												 MB_OK+MB_DEFBUTTON2+MB_ICONINFORMATION);
    Abort;
  end;

end;

procedure TFrmGIREAbmCabOnLine.ConsultarExecute(Sender: TObject);
begin
  if dsCab.DataSet.RecordCount > 0 then
    Consulto_registro
  else
  begin
    Application.MessageBox(PChar('NO EXISTEN DATOS PARA CONSULTAR'),
  												 PChar(Application.Title),
  												 MB_OK+MB_DEFBUTTON2+MB_ICONINFORMATION);
    Abort;
  end;
  end;

procedure TFrmGIREAbmCabOnLine.Consulto_registro;
begin
  if FConsulta <> nil then
    FConsulta.ShowModal;
end;

procedure TFrmGIREAbmCabOnLine.dsCabDataChange(Sender: TObject;
  Field: TField);
begin
  nPosActual := DSCab.DataSet.RecNo;
{ Para repintar correctamente si me muevo en la grilla con el mouse
  a través de la barra de desplazamiento}
  if not lPrimeravez then
    DBGrillaDatos.Repaint;

  inherited;
end;

procedure TFrmGIREAbmCabOnLine.PanelGrillaShow(Sender: TObject);
begin
  lPrimeraVez := False;

end;

procedure TFrmGIREAbmCabOnLine.DBGrillaDatosDblClick(Sender: TObject);
begin
  PageDatos.ActivePage := PanelDatos;

end;

procedure TFrmGIREAbmCabOnLine.DBGrillaDatosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if dsCab.DataSet.RecNo = nPosActual then
  begin
  	if dsCab.DataSet.State = dsInsert then
    begin
	    DBGrillaDatos.Canvas.Brush.Color := clWhite;
  	  DBGrillaDatos.Canvas.Font.Color := clBlack;
    end
    else
    begin
	    DBGrillaDatos.Canvas.Brush.Color := TColor($02CBAA00);
  	  DBGrillaDatos.Canvas.Font.Color := clWhite;
    end;
  end;

  DBGrillaDatos.DefaultDrawColumnCell(Rect, DataCol, Column, State);

end;

procedure TFrmGIREAbmCabOnLine.DBGrillaDatosKeyPress(Sender: TObject;
  var Key: Char);
begin
  Key := UpCase(Key);

end;

procedure TFrmGIREAbmCabOnLine.PageDatosChange(Sender: TObject);
begin
	if PageDatos.ActivePage = PanelGrilla then
  begin
    DBGrillaDatos.SetFocus;
  end;
end;

procedure TFrmGIREAbmCabOnLine.dsCabStateChange(Sender: TObject);
begin
  inherited;
  Inhabilitar_ColumnasGrilla(dsCab.DataSet.State = dsInsert);

end;

procedure TFrmGIREAbmCabOnLine.Inhabilitar_ColumnasGrilla(lHabilita: Boolean);
var
	i,j: Integer;
  Campo: String;
begin
	j := 0;
 	while j <= Length(FControlesADesHabilitar) -1 do
  begin
    i := 0;

		if FControlesADesHabilitar[j] is TDBEdit then
			Campo := (FControlesADesHabilitar[j] as TDBEdit).DataField
		else
			if FControlesADesHabilitar[j] is TDBLookupComboBox then
				Campo := (FControlesADesHabilitar[j] as TDBLookupComboBox).DataField
			else
				if FControlesADesHabilitar[j] is TRxDBLookupCombo then
					Campo := (FControlesADesHabilitar[j] as TRxDBLookupCombo).DataField;

		while i <= DBGrillaDatos.Columns.Count - 1 do
	  begin
	    if DBGrillaDatos.Columns[i].FieldName = Campo then
 	    begin
   	    DBGrillaDatos.Columns[i].ReadOnly := not lHabilita;
     	  i := DBGrillaDatos.Columns.Count;
      end;
      Inc(i);
    end;
    Inc(j);
 	end;

	j := 0;
 	while j <= Length(FControlesDesHabilitados) -1 do
  begin
    i := 0;

		if FControlesDesHabilitados[j] is TDBEdit then
			Campo := (FControlesDesHabilitados[j] as TDBEdit).DataField
		else
			if FControlesDesHabilitados[j] is TDBLookupComboBox then
				Campo := (FControlesDesHabilitados[j] as TDBLookupComboBox).DataField
			else
				if FControlesDesHabilitados[j] is TRxDBLookupCombo then
					Campo := (FControlesDesHabilitados[j] as TRxDBLookupCombo).DataField;

		while i <= DBGrillaDatos.Columns.Count - 1 do
	  begin
	    if DBGrillaDatos.Columns[i].FieldName = Campo then
 	    begin
   	    DBGrillaDatos.Columns[i].Visible := False;
     	  i := DBGrillaDatos.Columns.Count;
      end;
      Inc(i);
    end;
    Inc(j);
 	end;

end;


procedure TFrmGIREAbmCabOnLine.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  fdm.ActualizarVMs();
  inherited;
end;

end.










