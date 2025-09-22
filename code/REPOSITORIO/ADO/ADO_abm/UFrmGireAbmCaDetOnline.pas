unit UFrmGireAbmCaDetOnline;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFRMGIREABMONLINE, Grids, degrade, ComCtrls, Db, Menus, DBActns,
  uXDataSetActions, StdActns, ActnList, RXCtrls, RXDBCtrl, uLocator,
  ToolWin, ExtCtrls, UdmAbmDet, Errores, ADODB, UFrmGireAbmOnlineConsulta,
  UrepoGireBaseEmpresa, DBGrids;

type
  TDMABMClass = class of TDMABMDet;

  TFrmConsultaClass = class of TFrmGireAbmOnLineConsulta;

  TFrmGIREAbmCabDetOnline = class(TFrmGIREAbmOnLine)
    dsDet: TDataSource;
    PageDatos: TPageControl;
    PanelDatos: TTabSheet;
    Degrade1: TDegrade;
    PanelCabecera: TPanel;
    Panel4: TPanel;
    PanelGrilla: TTabSheet;
    Splitter1: TSplitter;
    DBGridDet: TRxDBGrid;
    ToolBarDetalleCab: TToolBar;
    ToolButton13: TToolButton;
    ToolButton14: TToolButton;
    ToolButton15: TToolButton;
    ToolButton16: TToolButton;
    ToolButton17: TToolButton;
    ToolButton18: TToolButton;
    XDataSetDelete2: TXDataSetDelete;
    XDataSetEdit2: TXDataSetEdit;
    XDataSetInsert2: TXDataSetInsert;
    DataSetCancel2: TDataSetCancel;
    DataSetPost2: TDataSetPost;
    DataSetRefresh2: TDataSetRefresh;
    ToolButton19: TToolButton;
    ToolButton20: TToolButton;
    ToolButton21: TToolButton;
    ToolButton22: TToolButton;
    ToolButton23: TToolButton;
    XDataSetPrior2: TXDataSetPrior;
    XDataSetNext2: TXDataSetNext;
    XDataSetLast2: TXDataSetLast;
    XDataSetFirst2: TXDataSetFirst;
    DBGridCab: TRxDBGrid;
    ToolBarDetalle: TToolBar;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    ToolButton24: TToolButton;
    ToolButton25: TToolButton;
    ToolButton26: TToolButton;
    ToolButton27: TToolButton;
    ToolButton28: TToolButton;
    DBGridDetDet: TRxDBGrid;
    procedure dsCabStateChange(Sender: TObject);
    procedure ImprimirExecute(Sender: TObject);
    procedure ConsultarExecute(Sender: TObject);
    procedure PanelGrillaShow(Sender: TObject);
    procedure DBGridCabDblClick(Sender: TObject);
    procedure DBGridDetDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGridDetDetDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure dsDetDataChange(Sender: TObject; Field: TField);
    procedure DBGridCabDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dsCabDataChange(Sender: TObject; Field: TField);
    procedure DBGridCabKeyPress(Sender: TObject; var Key: Char);
    procedure DBGridDetDetKeyPress(Sender: TObject; var Key: Char);
    procedure DBGridDetKeyPress(Sender: TObject; var Key: Char);
    procedure PageDatosChange(Sender: TObject);
    procedure PanelDatosShow(Sender: TObject);
    procedure dsDetStateChange(Sender: TObject);
  private
    FConsulta : TFrmGireAbmOnLineConsulta;
    FReporte : TRepoGireBaseEmpresa;
    nPosActual, nPosActualCab: Integer;
    lPrimeraVez, lPrimeraVezCab: Boolean;
    procedure Creo_Reporte;
    procedure Consulto_registro;
		procedure Redibujar_Grilla(AGrilla: TDBGrid; Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
  protected
    FDM: TDMAbmDet;
    function getDMClass: TDMABMClass; virtual;abstract;
    function getConsultaClass: TFrmConsultaClass; virtual;abstract;
    function CrearReporte: TRepoGireBaseEmpresa; virtual;abstract;
  public
		Procedure AbrirDetalle; Virtual;
    constructor Create(AOwner: TComponent); reintroduce; overload;
    Destructor Destroy; override;
  end;

implementation

{$R *.DFM}

procedure TFrmGIREAbmCabDetOnline.AbrirDetalle;
begin
	if dsDet.DataSet <> nil then
  try
    dsDet.DataSet.Open;
  except
    on E : Exception do Traducir_Error(E.Message,dsDet.DataSet);
    else
      Otro_Error(ClassName);
  end;

end;

procedure TFrmGIREAbmCabDetOnline.Consulto_registro;
begin
  if FConsulta <> nil then
    FConsulta.ShowModal;

end;

constructor TFrmGIREAbmCabDetOnline.Create(AOwner: TComponent);
begin
  inherited Create(AOWner);
  lPrimeraVez := True;
  lPrimeraVezCab := True;
  FDM := getDMClass.Create(AOwner);
  dsCab.DataSet := FDM.QryCab;
  dsDet.DataSet := FDM.QryDet;
  DBGridDet.DataSource := dsDet;
  DBGridCab.DataSource   := dsCab;
  DBGridDetDet.DataSource:= dsDet;
  BorderIcons := [biSystemMenu,biMaxiMize,BiMinimize];
  AbrirDatos;
  AbrirDetalle;
  if getConsultaClass <> nil then
	  try
  	  FConsulta := getConsultaClass.Create(AOwner,dsCab.DataSet);
	  except
  	end;
end;

procedure TFrmGIREAbmCabDetOnline.Creo_Reporte;
begin
  try
    FReporte := CrearReporte;
    if FReporte <>  nil then
    begin
	    ToolButton3.Enabled := False;
  	  if FReporte.RecordCount = 0 then
    	  Application.MessageBox(PChar('NO EXISTEN DATOS PARA LISTAR'),
    													 PChar(Application.Title),
	   													 MB_OK+MB_DEFBUTTON2+MB_ICONINFORMATION)
  	  else
    	  FReporte.Preview;
    end;
  finally
      FReporte.Free;
      ToolButton3.Enabled := True;
  end;

end;

destructor TFrmGIREAbmCabDetOnline.Destroy;
begin
  FConsulta.Free;
	FDM.Free;
  inherited;

end;

procedure TFrmGIREAbmCabDetOnline.dsCabStateChange(Sender: TObject);
begin
  inherited;
	if dsCab.DataSet.State in [dsInsert, dsEdit] then
  begin
    DBGridDet.Enabled := False;
    DBGridDetDet.Enabled := False;
    ToolBarDetalleCab.Enabled := False;
    ToolBarDetalle.Enabled := False;
  end
  else
  begin
    DBGridDet.Enabled := True;
    DBGridDetDet.Enabled := True;
    ToolBarDetalleCab.Enabled := True;
    ToolBarDetalle.Enabled := True;
  end;

end;

procedure TFrmGIREAbmCabDetOnline.ImprimirExecute(Sender: TObject);
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

procedure TFrmGIREAbmCabDetOnline.ConsultarExecute(Sender: TObject);
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

procedure TFrmGIREAbmCabDetOnline.PanelGrillaShow(Sender: TObject);
begin
  lPrimeraVezCab := False;
  lPrimeraVez := False;

end;

procedure TFrmGIREAbmCabDetOnline.DBGridCabDblClick(Sender: TObject);
begin
  PageDatos.ActivePage := PanelDatos;

end;

procedure TFrmGIREAbmCabDetOnline.DBGridDetDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  Redibujar_Grilla(Sender as TrxDBGrid,Rect, DataCol, Column, State);
  (Sender as TRxDBGrid).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TFrmGIREAbmCabDetOnline.Redibujar_Grilla(AGrilla: TDBGrid;
  Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin

  if dsDet.DataSet.RecNo = nPosActual then
  begin
  	if dsDet.DataSet.State = dsInsert then
    begin
	    AGrilla.Canvas.Brush.Color := clWhite;
  	  AGrilla.Canvas.Font.Color := clBlack;
    end
    else
    begin
	    AGrilla.Canvas.Brush.Color := TColor($02CBAA00);
  	  AGrilla.Canvas.Font.Color := clWhite;
    end;
  end;

end;

procedure TFrmGIREAbmCabDetOnline.DBGridDetDetDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  Redibujar_Grilla(Sender as TRxDBGrid,Rect, DataCol, Column, State);
  (Sender as TRxDBGrid).DefaultDrawColumnCell(Rect, DataCol, Column, State);

end;

procedure TFrmGIREAbmCabDetOnline.dsDetDataChange(Sender: TObject;
  Field: TField);
begin
  nPosActual := DSDet.DataSet.RecNo;
{ Para repintar correctamente si me muevo en la grilla con el mouse
  a través de la barra de desplazamiento}
  if not lPrimeravez then
	begin
    DBGridDet.Repaint;
    DBGridDetDet.Repaint;
  end;

end;

procedure TFrmGIREAbmCabDetOnline.DBGridCabDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if dsCab.DataSet.RecNo = nPosActualCab then
  begin
  	if dsCab.DataSet.State = dsInsert then
    begin
	    DBGridCab.Canvas.Brush.Color := clWhite;
  	  DBGridCab.Canvas.Font.Color := clBlack;
    end
    else
    begin
	    DBGridCab.Canvas.Brush.Color := TColor($02CBAA99);
  	  DBGridCab.Canvas.Font.Color := clWhite;
    end;
  end;

  DBGridCab.DefaultDrawColumnCell(Rect, DataCol, Column, State);

end;

procedure TFrmGIREAbmCabDetOnline.dsCabDataChange(Sender: TObject;
  Field: TField);
begin
  nPosActualCab := DSCab.DataSet.RecNo;
{ Para repintar correctamente si me muevo en la grilla con el mouse
  a través de la barra de desplazamiento}
  if not lPrimeravezCab then
    DBGridCab.Repaint;

end;

procedure TFrmGIREAbmCabDetOnline.DBGridCabKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  Key := UpCase(Key);

end;

procedure TFrmGIREAbmCabDetOnline.DBGridDetDetKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  Key := UpCase(Key);

end;

procedure TFrmGIREAbmCabDetOnline.DBGridDetKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  Key := UpCase(Key);

end;

procedure TFrmGIREAbmCabDetOnline.PageDatosChange(Sender: TObject);
begin
	if PageDatos.ActivePage = PanelGrilla then
  	if DBGridCab.CanFocus then
	    DBGridCab.SetFocus
    else
      DBGridDetDet.SetFocus;

end;

procedure TFrmGIREAbmCabDetOnline.PanelDatosShow(Sender: TObject);
begin
  lPrimeraVez := False;

end;

procedure TFrmGIREAbmCabDetOnline.dsDetStateChange(Sender: TObject);
begin
	if dsDet.DataSet.State in [dsEdit,dsInsert] then
  begin
    ToolBarEspecifica.Enabled := False;
    DBGridCab.Enabled := False;
    PanelCabecera.Enabled := False;
    ToolNavegar.Enabled := False;
    MainMenu1.Items[0].Enabled := False;
    MainMenu1.Items[1].Enabled := False;
    MainMenu1.Items[2].Enabled := False;
  end
	else
  begin
    ToolBarEspecifica.Enabled := True;
    DBGridCab.Enabled := True;
    PanelCabecera.Enabled := True;
    ToolNavegar.Enabled := True;
    MainMenu1.Items[0].Enabled := True;
    MainMenu1.Items[1].Enabled := True;
    MainMenu1.Items[2].Enabled := True;
  end
end;

end.
