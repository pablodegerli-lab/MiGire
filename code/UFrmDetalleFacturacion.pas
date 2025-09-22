unit UFrmDetalleFacturacion;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFRMGIREDLG, ActnList, StdCtrls, Buttons, ExtCtrls, UDMDetalleFacturacion,
  URepoDetalleFacturacion, Db, DBCtrls, Mask, ToolEdit, ADODb, CheckLst, UGeneral;

ResourceString
sSinServicios = 'No hay servicios definidos para la empresa seleccionada';

type

  EDetalleFacturacion = class(Exception);

  TFrmDetalleFacturacion = class(TFrmGIREDlg)
    Panel2: TPanel;
    DSCias: TDataSource;
    DSServiciosXCia: TDataSource;
    Panel4: TPanel;
    Label2: TLabel;
    DBLCias: TDBLookupComboBox;
    Label1: TLabel;
    edFechaDesde: TDateEdit;
    Label3: TLabel;
    edFechaHasta: TDateEdit;
    GroupBox1: TGroupBox;
    CHLBServicios: TCheckListBox;
    DsDetalle: TDataSource;
    procedure AceptarExecute(Sender: TObject);
    procedure DSCiasDataChange(Sender: TObject; Field: TField);
    function BuscaServicios():Integer;
    procedure FormCreate(Sender: TObject);
  private
    FDMDetalleFacturacion: TDMDetalleFacturacion;
    FRepoDetalleFacturacion: TRepoDetalleFacturacion;
    FListaServicios: array of string;
    FRegistroDistribucion: TRegistroDistribucion;
    procedure VerificarParametros;
  public
    procedure ArmarQryDetalle;
    constructor create (AOwner: TComponent;ARegistroDistribucion: TRegistroDistribucion); reintroduce; overload;
    destructor destroy; override;
  end;

implementation

{$R *.DFM}

{ TFrmDetalleFacturacion }

constructor TFrmDetalleFacturacion.create(AOwner: TComponent;ARegistroDistribucion: TRegistroDistribucion);
begin
  inherited Create(AOwner);
  CHLBServicios.Color := TColor($02880000);
  FRegistroDistribucion := ARegistroDistribucion;
  ModalResult := mrNone;

  FDMDetalleFacturacion := TDMDetalleFacturacion.Create(AOWner);
  DSCias.DataSet.Locate('CIA',FRegistroDistribucion.Cod_Cia,[]);
  DBLCias.KeyValue := DSCias.DataSet.FieldValues['RAZONSOCIAL'];
end;

destructor TFrmDetalleFacturacion.destroy;
begin
  FDMDetalleFacturacion.Free;
  inherited;
end;

procedure TFrmDetalleFacturacion.AceptarExecute(Sender: TObject);
begin
  VerificarParametros;
  ArmarQryDetalle;

  if FDMDetalleFacturacion.QryDetalle.RecordCount > 0 then
  begin
    FRepoDetalleFacturacion := TRepoDetalleFacturacion.Create(Self, DsDetalle.DataSet, edFechaDesde.Text,edFechaHasta.Text );
    try
      FRepoDetalleFacturacion.PreviewModal;
    finally
      FRepoDetalleFacturacion.Free;
    end;
  end;

end;

procedure TFrmDetalleFacturacion.DSCiasDataChange(Sender: TObject;
  Field: TField);
var
  i: integer;
begin
  if (not(DSCias.DataSet.Bof)) and (not(DSCias.DataSet.Eof)) then
    begin

      if BuscaServicios() < 1 then
        Raise eDetalleFacturacion.Create (sSinServicios);

      begin
        CHLBServicios.Items.Clear;
        i := 0;
        FListaServicios := nil;
        SetLength(FListaServicios , DSServiciosXCia.DataSet.RecordCount);
        while not (DSServiciosXCia.DataSet.Eof) do
        begin
          CHLBServicios.Items.Add (FDMDetalleFacturacion.QryServiciosXCia.FieldValues['DESCRIPCION']);
          i := i+1;
          FListaServicios[i-1]:=FDMDetalleFacturacion.QryServiciosXCia.FieldValues['TIPOARCHIVO'];
          DSServiciosXCia.DataSet.Next;
        end;
      end;

    end;

end;


procedure TFrmDetalleFacturacion.ArmarQryDetalle;
var
  i: integer;
  aux: string;
  lPrimeraVez: Boolean;
begin
  FDMDetalleFacturacion.QryDetalle.Close;
  FDMDetalleFacturacion.QryDetalle.SQL.Clear;
  FDMDetalleFacturacion.QryDetalle.SQL.Add('Select ');

  FDMDetalleFacturacion.QryDetalle.SQL.Add('DIS.COD_TIPO_ARCHIVO_DBF, ');
  FDMDetalleFacturacion.QryDetalle.SQL.Add('DIS.INCLUIR_EN_FACTURA, ');

  FDMDetalleFacturacion.QryDetalle.SQL.Add('CIAS.DESCRIPCION AS DESCRIPCION_CIA, ');
  FDMDetalleFacturacion.QryDetalle.SQL.Add('TIPODBF.DESCRIPCION AS DESCRIPCION_TIPODBF, ');

  FDMDetalleFacturacion.QryDetalle.SQL.Add('RES.COD_CIA, ');
  FDMDetalleFacturacion.QryDetalle.SQL.Add('RES.NRO_PROCESO, ');
  FDMDetalleFacturacion.QryDetalle.SQL.Add('RES.COD_TIPO_ARCHIVO, ');
  FDMDetalleFacturacion.QryDetalle.SQL.Add('RES.COD_DISENO, ');
  FDMDetalleFacturacion.QryDetalle.SQL.Add('RES.NRO_ORDEN, ');
  FDMDetalleFacturacion.QryDetalle.SQL.Add('RES.NOMBRE_ARCHIVO, ');
  FDMDetalleFacturacion.QryDetalle.SQL.Add('RES.NRO_CORRIDA, ');
  FDMDetalleFacturacion.QryDetalle.SQL.Add('RES.CANTIDAD_MOVIMIENTOS, ');
  FDMDetalleFacturacion.QryDetalle.SQL.Add('RES.IMPORTE, ');
  FDMDetalleFacturacion.QryDetalle.SQL.Add('RES.FH_DISTRIBUCION, ');
  FDMDetalleFacturacion.QryDetalle.SQL.Add('RES.FH_ACTUALIZACION ');

  FDMDetalleFacturacion.QryDetalle.SQL.Add('FROM GEMA.RESUMENES RES , ');
  FDMDetalleFacturacion.QryDetalle.SQL.Add('GEMA.DISTRIBUCIONES_DETALLE DIS , ');
  FDMDetalleFacturacion.QryDetalle.SQL.Add('GEMA.TIPOS_DE_ARCHIVO_DBF TIPODBF, ');
  FDMDetalleFacturacion.QryDetalle.SQL.Add('GIRE.CIAS CIAS ');

  FDMDetalleFacturacion.QryDetalle.SQL.Add('WHERE  RES.COD_CIA = '+
        IntToStr(FDMDetalleFacturacion.QryCiasGema.FieldValues['COD_CIA'])+' AND ' );

  FDMDetalleFacturacion.QryDetalle.SQL.Add('DIS.COD_CIA = CIAS.COD_CIA AND ' );
  FDMDetalleFacturacion.QryDetalle.SQL.Add('DIS.COD_TIPO_ARCHIVO_DBF = TIPODBF.COD_TIPO_ARCHIVO_DBF AND ');
  FDMDetalleFacturacion.QryDetalle.SQL.Add('DIS.INCLUIR_EN_FACTURA = 1 AND ' );

  FDMDetalleFacturacion.QryDetalle.SQL.Add('DIS.COD_CIA = RES.COD_CIA AND ' );
  FDMDetalleFacturacion.QryDetalle.SQL.Add('DIS.NRO_PROCESO = RES.NRO_PROCESO AND ' );
  FDMDetalleFacturacion.QryDetalle.SQL.Add('DIS.COD_TIPO_ARCHIVO = RES.COD_TIPO_ARCHIVO AND ');
  FDMDetalleFacturacion.QryDetalle.SQL.Add('DIS.COD_DISENO = RES.COD_DISENO AND ' );
  FDMDetalleFacturacion.QryDetalle.SQL.Add('DIS.NRO_ORDEN = RES.NRO_ORDEN AND (' );

  lPrimeraVez := True;
  for i := 0 to (CHLBServicios.Items.Count - 1) do
   if CHLBServicios.Checked[i] then
     if lPrimeraVez then
     begin
       FDMDetalleFacturacion.QryDetalle.SQL.Add('RES.COD_TIPO_ARCHIVO = '''+FListaServicios[i] +'''') ;
       lPrimeraVez := False;
     end
     else
     begin
       FDMDetalleFacturacion.QryDetalle.SQL.Add('OR');
       FDMDetalleFacturacion.QryDetalle.SQL.Add('RES.COD_TIPO_ARCHIVO = '''+FListaServicios[i] +'''') ;
     end;
  FDMDetalleFacturacion.QryDetalle.SQL.Add(')');

  if edFechaDesde.Text = '  /  /    ' then
     edFechaDesde.Date := Date;
  aux := 'To_Date( ' + ''''+ edFechaDesde.Text + ''',''dd/mm/yyyy'')' ;
  FDMDetalleFacturacion.QryDetalle.SQL.Add(' AND RES.FH_DISTRIBUCION >= ' + aux);

  if edFechaHasta.Text = '  /  /    ' then
     edFechaHasta.Date := Date;
  aux := 'To_Date( ' + ''''+ edFechaHasta.Text + ''',''dd/mm/yyyy'')' ;
  FDMDetalleFacturacion.QryDetalle.SQL.Add(' AND RES.FH_DISTRIBUCION <= ' + aux);

  FDMDetalleFacturacion.QryDetalle.SQL.Add('ORDER BY DIS.COD_TIPO_ARCHIVO_DBF, ');
  FDMDetalleFacturacion.QryDetalle.SQL.Add('         RES.COD_TIPO_ARCHIVO, ');
  FDMDetalleFacturacion.QryDetalle.SQL.Add('         RES.FH_ACTUALIZACION');

  FDMDetalleFacturacion.QryDetalle.Open;

  if FDMDetalleFacturacion.QryDetalle.RecordCount < 1 then
    Showmessage('No hay facturación dentro de los parámetros solicitados');

end;

function TFrmDetalleFacturacion.BuscaServicios: Integer;
begin
  FDMDetalleFacturacion.QryServiciosXCia.Close;
  FDMDetalleFacturacion.QryServiciosXCia.Parameters.ParamByName('pCod_Cia').Value :=
         FDMDetalleFacturacion.QryCiasGema.FieldValues['COD_CIA'];
  FDMDetalleFacturacion.QryServiciosXCia.Open;
  Result := FDMDetalleFacturacion.QryServiciosXCia.RecordCount;
end;

procedure TFrmDetalleFacturacion.VerificarParametros;
var
  SeleccionoServicios: boolean;
  x: Integer;
  fechaDesde: TDateTime;
  fechaHasta: TDateTime;
begin
  if (DSCias.DataSet.Eof) or (DSCias.DataSet.Bof) then
    Raise Exception.Create('Debe seleccionar una Empresa');

  SeleccionoServicios := false;
  for x := 0 to (CHLBServicios.Items.Count - 1) do
   if CHLBServicios.Checked[x] then
    SeleccionoServicios := true;
  if not(SeleccionoServicios) then
    Raise Exception.Create('Debe seleccionar al menos un Servicio');

  if edFechaDesde.Text = '  /  /    ' then
    FechaDesde := Date
  else
    fechaDesde := StrToDate(edFechaDesde.text);
  if edFechaHasta.Text = '  /  /    ' then
    FechaHasta := Date
  else
    FechaHasta := StrToDate(edFechaHasta.text);
  if FechaDesde > FechaHasta then
    Raise Exception.Create('Verificar rango de fechas');

end;

procedure TFrmDetalleFacturacion.FormCreate(Sender: TObject);
begin
  inherited;
  edFechaDesde.Date := Date;
  edFechaHasta.Date := Date;
end;

end.
