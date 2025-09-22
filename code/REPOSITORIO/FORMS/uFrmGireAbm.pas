unit uFrmGireAbm;

interface

uses
	Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
	UFRMGIREGRAL, Db, DBActns, Menus, StdActns, ActnList, ComCtrls, ToolWin,
	ExtCtrls, StdCtrls, Mask, DBCtrls, uLocator, uGireEntidad;

type
	TArrayColores = array[TDataSetState] of TColor;

	TControles = array of TWinControl;

	TFrmGIREAbm = class(TFrmGIREGral)
		DataSetCancel1: TDataSetCancel;
		DataSetDelete1: TDataSetDelete;
		DataSetEdit1: TDataSetEdit;
		DataSetFirst1: TDataSetFirst;
		DataSetInsert1: TDataSetInsert;
		DataSetLast1: TDataSetLast;
		DataSetNext1: TDataSetNext;
		DataSetPost1: TDataSetPost;
		DataSetPrior1: TDataSetPrior;
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
		btnProximo: TToolButton;
		btnAnterior: TToolButton;
		btnUltimo: TToolButton;
		ToolButton9: TToolButton;
		btnEliminar: TToolButton;
		ToolButton2: TToolButton;
		btnCopiar: TToolButton;
		btnCortar: TToolButton;
		btnPegar: TToolButton;
		ToolButton1: TToolButton;
		locBuscar: TLocator;
		PanelGeneral: TPanel;
		procedure DataSetRefreshExecute(Sender: TObject);
		procedure FormShow(Sender: TObject);
		procedure InicArrayColores;
		procedure dsCabStateChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
	private
	 { Private declarations }
		FEntidad: TGireEntidad;

		procedure SetearColorCtrlsEdicion;
		procedure SetearFocoPanelActivo;
		procedure HabilitarControles(AHabilitado: Boolean);
	protected
		FArrayColores  : TArrayColores;
		FControlesADesHabilitar: TControles;
		FControlesDesHabilitados: TControles;
		function GetPanelActivo: TWinControl; virtual;
		property Entidad: TGireEntidad read FEntidad;
		procedure InicControlesAHabilitar; virtual;
	public
		{ Public declarations }
		procedure AsignarDatos(aGireEntidadClass: TGireEntidadClass); overload; virtual;
		procedure AsignarDatos(aEntidad: TGireEntidad); overload; virtual;
		procedure AsignarDatos(aDataSets: array of TDataSet); overload; virtual;
		Procedure AbrirDatos; Virtual;
		constructor Create(AOnwer: TComponent); override;
	end;

var
	FrmGIREAbm: TFrmGIREAbm;

implementation

uses DBTables;


{$R *.DFM}

{ TFrmGIREAbm }


procedure TFrmGIREAbm.AbrirDatos;
begin
	If dsCab.DataSet <> nil then
		 dsCab.DataSet.Open;
end;


procedure TFrmGIREAbm.DataSetRefreshExecute(Sender: TObject);
var
	DataSet: TDataSet;
begin
	inherited;
	DataSet := (Sender as TDataSetAction).DataSource.DataSet;

	try
		(DataSet as TQuery).Close;
		(DataSet as TQuery).Open;
	except
		 DataSet.Refresh;
	end;
end;

procedure TFrmGIREAbm.AsignarDatos(aGireEntidadClass: TGireEntidadClass);
begin
	AsignarDatos(AGireEntidadClass.Create(Self)) ;
end;

procedure TFrmGIREAbm.AsignarDatos(aEntidad: TGireEntidad);
begin
	FEntidad := aEntidad ;
	AsignarDatos([AEntidad.QryCab, AEntidad.QryDet1]);
end;

procedure TFrmGIREAbm.AsignarDatos(ADataSets: array of TDataSet);
var
	DataSet: TDataSet;
begin
	DataSet := ADataSets[0];
	dsCab.DataSet :=  DataSet;
end;


procedure TFrmGIREAbm.FormShow(Sender: TObject);
begin
	inherited;
	AbrirDatos;
end;


procedure TFrmGIREAbm.InicArrayColores;
begin
	FArrayColores[dsInsert]   := clWindow;
	FArrayColores[dsEdit]     := clBtnFace;
	FArrayColores[dsBrowse]   := clBtnFace;
	FArrayColores[dsInactive] := clBtnFace;
end;

procedure TFrmGIREAbm.dsCabStateChange(Sender: TObject);
begin
	inherited;
	if dsCab.State <> dsInactive then
	begin
		HabilitarControles(dsCab.State in [dsInsert]);
		SetearColorCtrlsEdicion;
		SetearFocoPanelActivo;
	end;
end;


procedure TFrmGIREAbm.SetearColorCtrlsEdicion;
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
					(FControlesADesHabilitar[i] as TEdit).Color := FArrayColores[dsCab.State];

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
					(FControlesDesHabilitados[i] as TEdit).Color := FArrayColores[dsBrowse];

		inc(i);

	end;

end;


procedure TFrmGIREAbm.SetearFocoPanelActivo;
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
			if WinControl.Enabled then
			begin
				WinControl.SetFocus;
				Exit;
			end;
		end;

		inc(i);

	end;

end;

function TFrmGIREAbm.GetPanelActivo: TWinControl;
begin
	Result := PanelGeneral;
end;

procedure TFrmGIREAbm.InicControlesAHabilitar;
begin

end;

constructor TFrmGIREAbm.Create(AOnwer: TComponent);
begin
	inherited;
	InicControlesAHabilitar;
end;

procedure TFrmGIREAbm.HabilitarControles(AHabilitado: Boolean);
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

procedure TFrmGIREAbm.FormActivate(Sender: TObject);
begin
	inherited;
	WindowState := wsNormal;
end;

end.
