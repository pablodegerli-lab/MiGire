unit UFRMGIREABMOnLine;

interface

uses
	Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
	UFRMGIREGRAL, Db, DBActns, Menus, StdActns, ActnList, ComCtrls, ToolWin,
	ExtCtrls, StdCtrls, Mask, DBCtrls, uLocator, uXDataSetActions,
	RxLookup, ADODB,define, Errores, RXCtrls, RXDBCtrl, Variants;

type
	TArrayColores = array[TDataSetState] of TColor;

	TControles = array of TWinControl;

	TFrmGIREAbmOnLine = class(TFrmGIREGral)
		DataSetCancel1: TDataSetCancel;
		DataSetPost1: TDataSetPost;
		DataSetRefresh1: TDataSetRefresh;
		Agregar1: TMenuItem;
		Modificar1: TMenuItem;
		Aceptar1: TMenuItem;
		Eliminar1: TMenuItem;
		Eliminar2: TMenuItem;
		Refrescar1: TMenuItem;
		Buscar1: TMenuItem;
		Primero1: TMenuItem;
		Prximo1: TMenuItem;
		ANteriror1: TMenuItem;
		Ultimo1: TMenuItem;
		ToolNavegar: TToolBar;
		dsCab: TDataSource;
		btnAgregar: TToolButton;
		btnEditar: TToolButton;
		btnAceptar: TToolButton;
		btnCancelar: TToolButton;
		btnPrimero: TToolButton;
		btnAnterior: TToolButton;
		btnProximo: TToolButton;
		btnUltimo: TToolButton;
		ToolButton9: TToolButton;
		btnEliminar: TToolButton;
		ToolButton2: TToolButton;
		btnCopiar: TToolButton;
		btnCortar: TToolButton;
		btnPegar: TToolButton;
		ToolButton1: TToolButton;
		locBuscar: TLocator;
		XDataSetDelete1: TXDataSetDelete;
		XDataSetEdit1: TXDataSetEdit;
		XDataSetInsert1: TXDataSetInsert;
		XDataSetPrior1: TXDataSetPrior;
		XDataSetNext1: TXDataSetNext;
		XDataSetLast1: TXDataSetLast;
		XDataSetFirst1: TXDataSetFirst;
    ToolButton3: TToolButton;
    Imprimir: TAction;
    btnRefrescar: TToolButton;
    DBStatusLabel1: TDBStatusLabel;
    ToolButton5: TToolButton;
    ToolButton4: TToolButton;
    btnConsultar: TToolButton;
    Consultar: TAction;
    PanelGeneral: TPanel;
		procedure DataSetRefreshExecute(Sender: TObject);
		procedure InicArrayColores;
		procedure dsCabStateChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
	private
		procedure SetearColorCtrlsEdicion;
		procedure SetearFocoPanelActivo;
		procedure HabilitarControles(AHabilitado: Boolean);
		procedure HabilitarLocator(AHabilitado: Boolean);
	protected
		FArrayColores  : TArrayColores;
		FControlesADesHabilitar: TControles;
		FControlesDesHabilitados: TControles;
		function GetPanelActivo: TWinControl; virtual; abstract;
		procedure InicControlesAHabilitar; virtual;
    procedure Refrescar_Datos(ADataSets : Array of TDataSet);
    procedure Ocultar_Descripcion(ANomCampo: String;ADescripcion: TDBText);
	public
		procedure AsignarDatos(aDataSets: array of TDataSet); overload; virtual;
		Procedure AbrirDatos; Virtual;
		constructor Create(AOwner: TComponent); override;
	end;

implementation


uses DBTables, UFrmAbout;

{$R *.DFM}

{ TFrmGIREAbm }


procedure TFrmGIREAbmOnLine.AbrirDatos;
begin
	if dsCab.DataSet <> nil then
  try
    dsCab.DataSet.Open;
  except
    on E : Exception do Traducir_Error(E.Message,dsCab.DataSet);
    else
      Otro_Error(ClassName);
  end;
end;


procedure TFrmGIREAbmOnLine.DataSetRefreshExecute(Sender: TObject);
var
  Dataset : TDataSet;
begin
	inherited;

  DataSet := (Sender as TDataSetAction).DataSource.DataSet;

	try
		(DataSet as TADOQuery).Close;
		(DataSet as TADOQuery).Open;
	except
		 DataSet.Refresh;
	end;
end;

procedure TFrmGIREAbmOnLine.AsignarDatos(ADataSets: array of TDataSet);
begin
	dsCab.DataSet := ADataSets[0];
end;

procedure TFrmGIREAbmOnLine.InicArrayColores;
begin
	FArrayColores[dsInsert]   := clWindow;
	FArrayColores[dsEdit]     := clBtnFace;
	FArrayColores[dsBrowse]   := clBtnFace;
	FArrayColores[dsInactive] := clRed;
end;

procedure TFrmGIREAbmOnLine.dsCabStateChange(Sender: TObject);
begin
	inherited;
	if dsCab.State <> dsInactive then
	begin
		HabilitarControles(dsCab.State in [dsInsert]);
		HabilitarLocator(dsCab.State in [dsBrowse]);
		SetearColorCtrlsEdicion;
		if dsCab.State = dsInsert then
			SetearFocoPanelActivo;
	end;
end;


procedure TFrmGIREAbmOnLine.SetearColorCtrlsEdicion;
var
	i: Integer;
begin
	i := 0;
	while i <= Length(FControlesADesHabilitar) -1 do
	begin

		if FControlesADesHabilitar[i] is TDBEdit then
			(FControlesADesHabilitar[i] as TDBEdit).Color := FArrayColores[dsCab.State]
		else
			if FControlesADesHabilitar[i] is TDBLookupComboBox then
				(FControlesADesHabilitar[i] as TDBLookupComboBox).Color := FArrayColores[dsCab.State]
			else
				if FControlesADesHabilitar[i] is TEdit then
					(FControlesADesHabilitar[i] as TEdit).Color := FArrayColores[dsCab.State]
				else
					if FControlesADesHabilitar[i] is TRxDBLookupCombo then
						(FControlesADesHabilitar[i] as TRxDBLookupCombo).Color := FArrayColores[dsCab.State];

		inc(i);

	end;

	i := 0;
	while i <= Length(FControlesDesHabilitados) -1 do
	begin

		if FControlesDesHabilitados[i] is TDBEdit then
			(FControlesDesHabilitados[i] as TDBEdit).Color := FArrayColores[dsBrowse]
		else
			if FControlesDesHabilitados[i] is TDBLookupComboBox then
				(FControlesDesHabilitados[i] as TDBLookupComboBox).Color := FArrayColores[dsBrowse]
			else
				if FControlesDesHabilitados[i] is TEdit then
					(FControlesDesHabilitados[i] as TEdit).Color := FArrayColores[dsBrowse]
				else
					if FControlesDesHabilitados[i] is TRxDBLookupCombo then
						(FControlesDesHabilitados[i] as TRxDBLookupCombo).Color := FArrayColores[dsBrowse];

		inc(i);

	end;

end;


procedure TFrmGIREAbmOnLine.SetearFocoPanelActivo;
var
	i: Integer;
	PanelActivo: TWinControl;
	WinControl: TWinControl;
begin
	i := 0;
	PanelActivo := GetPanelActivo;

	while i <= PanelActivo.ControlCount -1 do
	begin

		if PanelActivo.Controls[i] is TWinControl then
		begin
			WinControl := (PanelActivo.Controls[i] as TWinControl);
			if (WinControl.Enabled) and not(WinControl is TPanel) and
       (WinControl.CanFocus) then
			begin
				WinControl.SetFocus;
				Exit;
			end;
		end;

		inc(i);

	end;

end;

procedure TFrmGIREAbmOnLine.InicControlesAHabilitar;
begin

end;

constructor TFrmGIREAbmOnLine.Create(AOwner: TComponent);
begin
	inherited;
	InicControlesAHabilitar;
	InicArrayColores;
end;

procedure TFrmGIREAbmOnLine.HabilitarControles(AHabilitado: Boolean);
var
	i: Integer;
begin
	i := 0;
	while i <= Length(FControlesADesHabilitar) -1 do
	begin
		FControlesADesHabilitar[i].Enabled := AHabilitado;
		inc(i);
	end;

	i := 0;
	while i <= Length(FControlesDesHabilitados) -1 do
	begin
		FControlesDesHabilitados[i].Enabled := False;
		inc(i);
	end;

end;


procedure TFrmGIREAbmOnLine.HabilitarLocator(AHabilitado: Boolean);
begin
	locBuscar.Enabled    := AHabilitado;
  btnConsultar.Enabled := AHabilitado;

end;


procedure TFrmGIREAbmOnLine.Refrescar_Datos(ADataSets: array of TDataSet);
var
  i : Integer;
begin
  for i := 0 to Length(ADataSets)-1 do
  	try
	    (ADataSets[i] as TADOQuery).Close;
  		(ADataSets[i] as TADOQuery).Open;
  	except
	  	 ADataSets[i].Refresh;
  	end;

end;

procedure TFrmGIREAbmOnLine.Ocultar_Descripcion(ANomCampo: String;ADescripcion: TDBText);
begin
  if dsCab.DataSet.FieldByName(ANomCampo).Value = null then
    ADescripcion.Visible := False
  else
    ADescripcion.Visible := True;

end;

procedure TFrmGIREAbmOnLine.FormShow(Sender: TObject);
begin
  inherited;
  SetearFocoPanelActivo;
end;

procedure TFrmGIREAbmOnLine.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
	DestruirAlCerrar := False;
  inherited;

end;

end.

