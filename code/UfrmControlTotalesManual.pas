unit UfrmControlTotalesManual;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFRMGIREDLG, DBCtrls, Grids, DBGrids, RXDBCtrl, Db, StdCtrls, ActnList,
  Buttons, ExtCtrls, UGeneral, UDMControlTotalManual, ADOCtrlM;

type

  TRegistroTotales = Record
    Fh_Proceso: TDate;
    Cantidad: Integer;      {Cantidad que ingresa el operador}
    Importe: Double;        {Importe que ingresa el operador}
    Cantidad_Ctrl: Integer; {Total de registros a procesar - Calculado por GEMA}
    Importe_Ctrl: Double;   {Importe total a prccesar - Calculado por GEMA}
    Cod_Proceso: Integer;   {Codigo de Proceso (1101,1102,etc) asociado al Servicio
                             y utilizado para el componente de Control de Totales por
                             Fecha de Proceso}
    Descripcion: String;    {Descripcion del Proceso (1101,1102,etc) asociado al Servicio }
  end;

  TFrmCtrlTotalesManual = class(TFrmGIREDlg)
    Panel2: TPanel;
    Panel4: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    DSGrillaTotales: TDataSource;
    GrillaTotales: TRxDBGrid;
    LCia: TLabel;
    LRazonSocial: TLabel;
    LProc: TLabel;
    LDescProceso: TLabel;
    Label3: TLabel;
    LFh_Proceso: TLabel;
    BtnMostrarTotales: TBitBtn;
    MostrarTotales: TAction;
    ADOCtrlMenu1: TADOCtrlMenu;
    lLeyenda: TLabel;
    procedure AceptarExecute(Sender: TObject);
    procedure GrillaTotalesDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure DSGrillaTotalesDataChange(Sender: TObject; Field: TField);
    procedure FormActivate(Sender: TObject);
    procedure CancelarExecute(Sender: TObject);
    procedure DSGrillaTotalesStateChange(Sender: TObject);
    procedure MostrarTotalesExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FRegistroDistribucion: TRegistroDistribucion;
    FDMControlTotalManual: TDMControlTotalManual;
    FTotales: Array of TRegistroTotales;
    nPosActual: Integer;
    PrimeraVez: Boolean;
    lInserto: Boolean;
    FTotalServicio_Error: String;
    procedure Controlar_Totales;
    procedure Sumar_Cantidad_Importe;
    procedure Limpiar_Totales;
    procedure Asignar_Totales_Automaticamente;
  public
    constructor create (AOwner: TComponent; aRegistro: TRegistroDistribucion; ATablasMovimientos: Array of String); reintroduce; overload;
    destructor destroy; override;
  end;

implementation

uses UDMGemaConexion, Math;


{$R *.DFM}

{ TFrmCtrlTotalManual }

constructor TFrmCtrlTotalesManual.create(AOwner: TComponent;
  aRegistro: TRegistroDistribucion; ATablasMovimientos: Array of String);
begin
  inherited Create(AOwner);
  FRegistroDistribucion := aRegistro;
  lInserto := True;
  FDMControlTotalManual := TDMControlTotalManual.create(AOwner,FRegistroDistribucion,ATablasMovimientos);
  lInserto := False;
  LCia.Caption := IntToStr(FRegistroDistribucion.Cod_Cia);
  LRazonSocial.Caption := FRegistroDistribucion.RazonSocial;
  LProc.Caption := IntToStr(FRegistroDistribucion.Nro_Proceso);
  LDescProceso.Caption := FRegistroDistribucion.DescProceso;
  LFh_Proceso.Caption := DateToStr(FRegistroDistribucion.Fh_Proceso);
  ADOCtrlMenu1.Usuario := GemaConexion.NombreUsuario;
	if MostrarTotales.Enabled then
    BtnMostrarTotales.Visible := True
  else
    BtnMostrarTotales.Visible := False;

  if (GrillaTotales.DataSource.DataSet.RecordCount = 0) and (FRegistroDistribucion.Cod_Modo > 1) then
    	Raise Exception.Create('NO EXISTEN MOVIMIENTOS PARA DISTRIBUIR'+#13#10+'DENTRO DE LOS SERVICIOS ESPECIFICADOS.'+#13#10+'SE REALIZARA UNA VUELTA ATRAS');

end;

destructor TFrmCtrlTotalesManual.destroy;
begin
  FDMControlTotalManual.Free;
  inherited;
end;

procedure TFrmCtrlTotalesManual.AceptarExecute(Sender: TObject);
begin
  ModalResult := mrNone;
  try
    Sumar_Cantidad_Importe;
    Controlar_Totales;
  except
    if  FRegistroDistribucion.Es_AU then
      raise Exception.Create('ATENCION: EL TOTAL DE CONTROL DE '+FTotalServicio_Error+' NO COINCIDE. Gema Automatico - Control de Totales')
    else
     begin
      Application.MessageBox(PChar('ATENCION: EL TOTAL DE CONTROL DE '+FTotalServicio_Error+' NO COINCIDE. REINTENTE LA OPERACION'),
                           PChar('Gema - Control de Totales'),
                           48 );
      Limpiar_Totales;
     end;

  end;
end;

procedure TFrmCtrlTotalesManual.Controlar_Totales;
var
  i: Integer;
begin
  FDMControlTotalManual.ADOCtrlTotalesGema.Empresa    := FRegistroDistribucion.Cod_Cia;
  FDMControlTotalManual.ADOCtrlTotalesGema.NroProceso := IfThen(FRegistroDistribucion.Nro_Proceso_AU <> 0, FRegistroDistribucion.Nro_Proceso_AU , FRegistroDistribucion.Nro_Proceso);
  i := 0;
  while i <= Length(FTotales) - 1 do
  begin
    FDMControlTotalManual.ADOCtrlTotalesGema.CodProceso := FTotales[i].Cod_Proceso;
    FDMControlTotalManual.ADOCtrlTotalesGema.FH_Proceso := FTotales[i].Fh_Proceso;
    FDMControlTotalManual.ADOCtrlTotalesGema.CantidadRegistros := FTotales[i].Cantidad;
    FDMControlTotalManual.ADOCtrlTotalesGema.ImporteTotal := FTotales[i].Importe;

    if (not FDMControlTotalManual.ADOCtrlTotalesGema.Execute) or
       (FTotales[i].Cantidad <> FTotales[i].Cantidad_Ctrl) or
       (FTotales[i].Importe <> FTotales[i].Importe_Ctrl) then
    begin
      FTotalServicio_Error := FTotales[i].Descripcion+' - '+DateToStr(FTotales[i].Fh_Proceso);
      Abort;
    end;
    i := i + 1;
  end;

  ModalResult := mrOk;
end;

procedure TFrmCtrlTotalesManual.Sumar_Cantidad_Importe;
var
  i: Integer;
begin
  { En teoría esta rutina podría eliminarse dado que se utiliza un código de proceso
    distinto para cada servicio y por fecha de proceso existe un solo total por servicio.
    Alcanza con controlar directamente sobre el Dataset de la grilla.}
  DSGrillaTotales.DataSet.First;
  if not DSGrillaTotales.DataSet.Eof then
  begin
    SetLength(FTotales, 1);
    FTotales[Length(FTotales)-1].Fh_Proceso    := StrToDate(DSGrillaTotales.DataSet.FieldByName('FH_PROCESO').Value);
    FTotales[Length(FTotales)-1].Cantidad      := DSGrillaTotales.DataSet.FieldByName('CANTIDAD').Value;
    FTotales[Length(FTotales)-1].Importe       := DSGrillaTotales.DataSet.FieldByName('IMPORTE').Value;
    FTotales[Length(FTotales)-1].Cantidad_Ctrl := DSGrillaTotales.DataSet.FieldByName('CANTIDAD_CTRL').Value;
    FTotales[Length(FTotales)-1].Importe_Ctrl  := DSGrillaTotales.DataSet.FieldByName('IMPORTE_CTRL').Value;
    FTotales[Length(FTotales)-1].Cod_Proceso   := DSGrillaTotales.DataSet.FieldByName('COD_PROCESO').Value;
    FTotales[Length(FTotales)-1].Descripcion   := DSGrillaTotales.DataSet.FieldByName('DESCRIPCION').Value;
    if FRegistroDistribucion.Es_AU then
     begin
      FTotales[Length(FTotales)-1].Cantidad      := FTotales[Length(FTotales)-1].Cantidad_Ctrl;
      FTotales[Length(FTotales)-1].Importe       := FTotales[Length(FTotales)-1].Importe_Ctrl;
     end;
    i := 0;
    DSGrillaTotales.DataSet.Next;
    while not DSGrillaTotales.DataSet.Eof do
    begin
      while (i <= Length(FTotales) - 1) and
        ((FTotales[Length(FTotales)-1].Fh_Proceso <> StrToDate(DSGrillaTotales.DataSet.FieldByName('FH_PROCESO').Value)) or
         (FTotales[Length(FTotales)-1].Cod_Proceso <> DSGrillaTotales.DataSet.FieldByName('COD_PROCESO').Value)) do
        i := i + 1;
      if i > Length(FTotales)-1 then
      begin
        SetLength(FTotales, Length(FTotales)+1);
        FTotales[Length(FTotales)-1].Fh_Proceso    := StrToDate(DSGrillaTotales.DataSet.FieldByName('FH_PROCESO').Value);
        FTotales[Length(FTotales)-1].Cantidad      := DSGrillaTotales.DataSet.FieldByName('CANTIDAD').Value;
        FTotales[Length(FTotales)-1].Importe       := DSGrillaTotales.DataSet.FieldByName('IMPORTE').Value;
        FTotales[Length(FTotales)-1].Cantidad_Ctrl := DSGrillaTotales.DataSet.FieldByName('CANTIDAD_CTRL').Value;
        FTotales[Length(FTotales)-1].Importe_Ctrl  := DSGrillaTotales.DataSet.FieldByName('IMPORTE_CTRL').Value;
        FTotales[Length(FTotales)-1].Cod_Proceso   := DSGrillaTotales.DataSet.FieldByName('COD_PROCESO').Value;
		    FTotales[Length(FTotales)-1].Descripcion   := DSGrillaTotales.DataSet.FieldByName('DESCRIPCION').Value;
        if FRegistroDistribucion.Es_AU then
         begin
          FTotales[Length(FTotales)-1].Cantidad      := FTotales[Length(FTotales)-1].Cantidad_Ctrl;
          FTotales[Length(FTotales)-1].Importe       := FTotales[Length(FTotales)-1].Importe_Ctrl;
         end;
      end
      else
      begin
        FTotales[i].Cantidad      := FTotales[i].Cantidad + DSGrillaTotales.DataSet.FieldByName('CANTIDAD').Value;
        FTotales[i].Importe       := FTotales[i].Importe + DSGrillaTotales.DataSet.FieldByName('IMPORTE').Value;
        FTotales[i].Cantidad_Ctrl := FTotales[i].Cantidad_Ctrl + DSGrillaTotales.DataSet.FieldByName('CANTIDAD_CTRL').Value;
        FTotales[i].Importe_Ctrl  := FTotales[i].Importe_Ctrl + DSGrillaTotales.DataSet.FieldByName('IMPORTE_CTRL').Value;
        if FRegistroDistribucion.Es_AU then
         begin
          FTotales[Length(FTotales)-1].Cantidad      := FTotales[Length(FTotales)-1].Cantidad_Ctrl;
          FTotales[Length(FTotales)-1].Importe       := FTotales[Length(FTotales)-1].Importe_Ctrl;
         end;
      end;
      DSGrillaTotales.DataSet.Next;
    end;
  end;
end;

procedure TFrmCtrlTotalesManual.Limpiar_Totales;
begin
  FDMControlTotalManual.MDTotalesControl.First;
  while not FDMControlTotalManual.MDTotalesControl.Eof do
  begin
    FDMControlTotalManual.MDTotalesControl.Edit;
    FDMControlTotalManual.MDTotalesControlCANTIDAD.Value := 0;
    FDMControlTotalManual.MDTotalesControlIMPORTE.Value := 0;
    FDMControlTotalManual.MDTotalesControl.Post;
    FDMControlTotalManual.MDTotalesControl.Next;
  end;
  FDMControlTotalManual.MDTotalesControl.Refresh;
  FTotales := nil;
  FormActivate(Self);
end;

procedure TFrmCtrlTotalesManual.GrillaTotalesDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  GrillaTotales.Canvas.Brush.Color := clWhite;
  GrillaTotales.Canvas.Font.Color  := clBlack;

  if (DSGrillaTotales.DataSet.FieldByName('CANTIDAD').AsInteger <> DSGrillaTotales.DataSet.FieldByName('CANTIDAD_CTRL').AsInteger) or
		(DSGrillaTotales.DataSet.FieldByName('IMPORTE').AsFloat <> DSGrillaTotales.DataSet.FieldByName('IMPORTE_CTRL').AsFloat) then
	  GrillaTotales.Canvas.Font.Color  := clRed;

  if DSGrillaTotales.DataSet.RecNo = nPosActual then
  begin
    GrillaTotales.Canvas.Brush.Color := TColor($02AF7F06);   //$02AFB026
    GrillaTotales.Canvas.Font.Color := clWhite;
    if (GrillaTotales.SelectedIndex > 1) and (DataCol = GrillaTotales.SelectedIndex) then
    begin
		  GrillaTotales.Canvas.Brush.Color := clBlack;
		  GrillaTotales.Canvas.Font.Color  := clWhite;
    end;
    if (DataCol < 2) and (GrillaTotales.Focused) then
		  GrillaTotales.Col := 3;
  end;

  if DataCol < 2 then
  begin
	  GrillaTotales.Canvas.Brush.Color := TColor($02DDDDDD);
	  GrillaTotales.Canvas.Font.Color  := clBlack;
	  GrillaTotales.Canvas.Font.Style  := [fsBold];
  end
  else
	  GrillaTotales.Canvas.Font.Style  := [];

  GrillaTotales.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TFrmCtrlTotalesManual.DSGrillaTotalesDataChange(Sender: TObject;
  Field: TField);
begin
  nPosActual := DSGrillaTotales.DataSet.RecNo;
  if not Primeravez then
    GrillaTotales.Repaint;
end;

procedure TFrmCtrlTotalesManual.FormActivate(Sender: TObject);
begin
  DSGrillaTotales.DataSet.First;
  GrillaTotales.SetFocus;
  GrillaTotales.Col := 3;
  PrimeraVez := False;
  Aceptar.Enabled := True;
  if (GrillaTotales.DataSource.DataSet.RecordCount = 0) and (FRegistroDistribucion.Cod_Modo = 1) then
    GrillaTotales.Enabled := False;

end;

procedure TFrmCtrlTotalesManual.CancelarExecute(Sender: TObject);
begin
  { Vuelta atrás }
  if Application.MessageBox(PChar(' ¿ CONFIRMA LA CANCELACION DEL CONTROL DE TOTALES ?.'+#13#10+' SI LO HACE EL SISTEMA EJECUTARA UNA "VUELTA ATRAS". '),
 	                          PChar('Gema - Control de Totales'),
                             MB_OKCANCEL+MB_DEFBUTTON2+MB_ICONWARNING ) = idOK then
    inherited
  else
 	  ModalResult := mrNone;
end;

procedure TFrmCtrlTotalesManual.DSGrillaTotalesStateChange(Sender: TObject);
begin
  if (DSGrillaTotales.DataSet.State = dsInsert) and (not lInserto) then
  begin
    BtnAceptar.SetFocus;
    Abort;
  end

end;

procedure TFrmCtrlTotalesManual.MostrarTotalesExecute(Sender: TObject);
begin
  ModalResult := mrNone;
  Asignar_Totales_Automaticamente;
  GrillaTotales.Columns[4].Visible := not GrillaTotales.Columns[4].Visible;
  GrillaTotales.Columns[5].Visible := not GrillaTotales.Columns[5].Visible;
  GrillaTotales.Refresh;
end;

procedure TFrmCtrlTotalesManual.Asignar_Totales_Automaticamente;
begin
  FDMControlTotalManual.MDTotalesControl.First;
  while not FDMControlTotalManual.MDTotalesControl.Eof do
  begin
    FDMControlTotalManual.MDTotalesControl.Edit;
    FDMControlTotalManual.MDTotalesControlCANTIDAD.Value := FDMControlTotalManual.MDTotalesControlCANTIDAD_CTRL.Value;
    FDMControlTotalManual.MDTotalesControlIMPORTE.Value := FDMControlTotalManual.MDTotalesControlIMPORTE_CTRL.Value;
    FDMControlTotalManual.MDTotalesControl.Post;
    FDMControlTotalManual.MDTotalesControl.Next;
  end;
end;

procedure TFrmCtrlTotalesManual.FormShow(Sender: TObject);
begin
  if (GrillaTotales.DataSource.DataSet.RecordCount = 0) and (FRegistroDistribucion.Cod_Modo = 1) then
  begin
	  Application.MessageBox(PChar('NO EXISTEN MOVIMIENTOS PARA DISTRIBUIR PERO LA EMPRESA REQUIERE LOS ARCHIVOS VACIOS. CONTINUE CON EL PROCESO SIN INGRESAR TOTALES.'),
			                     PChar('Gema - Control de Totales'),
			                     MB_OK+MB_DEFBUTTON1+MB_ICONWARNING );
    lLeyenda.Caption := 'PRESIONE EL BOTON RECALCULAR SIN INGRESAR TOTALES';
    lLeyenda.Font.Color := clRed;
    lLeyenda.Color := clWhite;
  end;
  inherited;

end;

end.
