 unit UFrmPrincipal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFRMGIREGRAL, degrade, Menus, StdActns, ActnList, ComCtrls, ToolWin,
  ExtCtrls, StdCtrls, jpeg, Grids, DBGrids, RXDBCtrl, UDMPrincipal, Db, ADODB,
  RxGIF, Define, UDMGeneraArchivos, UGeneral, GireMBox, Dehoras, AppEvent,
  Ayuda, uLocator, ADOCtrlM, Variants,QRPrntr,qrexport;

type
  TFrmPrincipal = class(TFrmGIREGral)
    Panel2: TPanel;
    Panel3: TPanel;
    Degrade1: TDegrade;
    Label1: TLabel;
    DSDistribuciones: TDataSource;
    TBGeneraArchivos: TToolButton;
    TBCopiaATrx: TToolButton;
    ToolButton3: TToolButton;
    TBConsultaDistribuciones: TToolButton;
    GenerarArchivos: TAction;
    CopiaATrx: TAction;
    ConsultarDistribuciones: TAction;
    CopiaraTransmisin1: TMenuItem;
    ToolButton5: TToolButton;
    TBAyudaSistema: TToolButton;
    CargarAyuda: TAction;
    Sistema1: TMenuItem;
    AyudadelSistema1: TMenuItem;
    Image2: TImage;
    DefinirImpresora: TAction;
    TBDefinirImpresora: TToolButton;
    ColaDeImpresion: TPrintDialog;
    ImprimirResumen: TAction;
    Ayuda1: TAyuda;
    VolverAtras: TAction;
    VueltaAtrsltimoGeneracindeArchivos1: TMenuItem;
    TBVueltaAtras: TToolButton;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel5: TPanel;
    Label2: TLabel;
    LocalizadorDistribucion: TLocator;
    DbGrillaDistribuciones: TRxDBGrid;
    CambiarClave: TAction;
    TBCambioClave: TToolButton;
    CambiodeContrasea1: TMenuItem;
    AdoCtrlMenuGema: TADOCtrlMenu;
    ListarDetalleFacturacion: TAction;
    Especiales1: TMenuItem;
    DetalledeFacturacinaEmpresa1: TMenuItem;
    SeleccionarImpresora1: TMenuItem;
    ConsultadeDistribucionesRealizadas1: TMenuItem;
    ToolButton1: TToolButton;
    Image1: TImage;
    PMGema: TPopupMenu;
    GeneracindeArchivos2: TMenuItem;
    CopiaraTransmisin2: TMenuItem;
    VueltaAtrsltimaGeneracindeArchivos1: TMenuItem;
    Label3: TLabel;
    LCantDistri: TLabel;
    N2: TMenuItem;
    ConsultadeDistribucionesRealizadas2: TMenuItem;
    DetalledeFacturacinaEmpresa2: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure GenerarArchivosExecute(Sender: TObject);
    procedure CopiaATrxExecute(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure DbGrillaDistribucionesTitleBtnClick(Sender: TObject;
      ACol: Integer; Field: TField);
    procedure DbGrillaDistribucionesDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure DSDistribucionesDataChange(Sender: TObject; Field: TField);
    procedure DefinirImpresoraExecute(Sender: TObject);
    procedure DbGrillaDistribucionesDblClick(Sender: TObject);
    procedure ConsultarDistribucionesExecute(Sender: TObject);
    procedure CargarAyudaExecute(Sender: TObject);
    procedure VolverAtrasExecute(Sender: TObject);
    procedure CambiarClaveExecute(Sender: TObject);
    procedure ListarDetalleFacturacionExecute(Sender: TObject);
    procedure ToolBarEspecificaDblClick(Sender: TObject);
  private
    FDMPrincipal: TDMPrincipal;
    FDMGeneraArchivos: TDMGeneraArchivos;
    PosActual: Integer;
    FRegistroDistribucion: TRegistroDistribucion;
    FMisAccionesHabilitadas: Array of TAction;
    FOrdenAscendente: Boolean;
    procedure Inicializar_RegistroDistribucion;
    procedure Pintar_Columna(ACol: Integer);
    procedure Ver_DeHabilitar_Generacion_Archivos;
    procedure ObtenerCamposLocalizador;
    procedure ObtenerListaAccionesHabilitadas;
    function UsuarioHabilitado(ATAction: TACtion): Boolean;
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

uses UImagenes, UDMGemaConexion, UDMGirePath, UFrmConfirmacion,
  URepoResumenDistribucion, UFrmConsultaDistribuciones, UFrmCopiaATrx,
  uFrmGIRECambioPasw, UFrmVueltaAtras, UFrmDetalleFacturacion, Math,
  StrUtils, {} uRepoResumenPagos603Edenor,uRepoResumenPagos603{};

{$R *.DFM}

procedure TFrmPrincipal.FormCreate(Sender: TObject);
begin
  inherited;
  AdoCtrlMenuGema.Usuario := GemaConexion.NombreUsuario;
  ObtenerListaAccionesHabilitadas;
  FDMPrincipal := TDMPrincipal.Create(Self);
  ObtenerCamposLocalizador;
  LCantDistri.Caption := IntToStr(DSDistribuciones.DataSet.RecordCount);
  Salir.Enabled := True;
  ConsultarDistribuciones.Enabled := True;
  CargarAyuda.Enabled := True;
  FOrdenAscendente := True;
end;

procedure TFrmPrincipal.FormDestroy(Sender: TObject);
begin
  inherited;
  FDMPrincipal.Free;
end;

procedure TFrmPrincipal.GenerarArchivosExecute(Sender: TObject);
var
  FrmConfirmacion: TFrmConfirmacion;
begin
  Inicializar_RegistroDistribucion;
  FrmConfirmacion := TFrmConfirmacion.Create(Self, FRegistroDistribucion);
  try
    if FrmConfirmacion.ShowModal = mrOK then
    begin
      try
        FrmPrincipal.Enabled := False;
        FRegistroDistribucion.Fh_Proceso := frmConfirmacion.DEFh_Proceso.Date;
        FRegistroDistribucion.Fh_Distribucion := Date;
        FDMGeneraArchivos := TDMGeneraArchivos.create( Self,FRegistroDistribucion,FDMPrincipal.ObtenerPath('SALIDA'),FDMPrincipal.ObtenerPath('TRANSMISION'));
      finally
        GemaConexion.GrabarLog(FRegistroDistribucion.Log_Proceso);
        FrmPrincipal.Enabled := True;
        FDMGeneraArchivos.Free;
      end;
    end;
  finally
    FrmConfirmacion.Free;
  end;
  DSDistribuciones.DataSet.Close;
  DSDistribuciones.DataSet.Open;
  DSDistribuciones.DataSet.Locate('EMPRESA;PROCESO',VarArrayOf([FRegistroDistribucion.Cod_Cia,FRegistroDistribucion.Nro_Proceso]),[]);
end;

procedure TFrmPrincipal.CopiaATrxExecute(Sender: TObject);
var
  FrmCopiaATrx: TFrmCopiaATrx;
begin
  Inicializar_RegistroDistribucion;
  FrmCopiaATrx := TFrmCopiaATrx.Create(Self,FRegistroDistribucion,FDMPrincipal.ObtenerPath('SALIDA'),FDMPrincipal.ObtenerPath('TRANSMISION'));
  try
    FrmCopiaATrx.ShowModal;
  finally
    FrmCopiaATrx.Free;
  end;

end;

procedure TFrmPrincipal.FormActivate(Sender: TObject);
var
  i: Integer;
begin
  DBGrillaDistribuciones.Color := TColor($02880000);
  for i := 0 to DBGrillaDistribuciones.Columns.Count - 1 do
    DBGrillaDistribuciones.Columns[i].Font.Color := TColor($00FFFFFF);
  Pintar_Columna(1);

end;

procedure TFrmPrincipal.DbGrillaDistribucionesTitleBtnClick(
  Sender: TObject; ACol: Integer; Field: TField);
var
	cTipoOrden: String;
begin
  Inicializar_RegistroDistribucion;
  DSDistribuciones.DataSet.Close;
  if FOrdenAscendente then
    cTipoOrden := 'ASC'
  else
    cTipoOrden := 'DESC';
  FOrdenAscendente := not FOrdenAscendente;

  (DSDistribuciones.DataSet as TADOQuery).SQL.Strings[22] := 'order by '+
                                                            DbGrillaDistribuciones.Columns[ACol].FieldName+
                                                            ' '+cTipoOrden+
                                                            ','+
                                                            DbGrillaDistribuciones.Columns[2].FieldName;
  cTipoOrden :=  (DSDistribuciones.DataSet as TADOQuery).SQL.text;
  DSDistribuciones.DataSet.Open;
  Pintar_Columna(ACol);
  DSDistribuciones.DataSet.Locate('EMPRESA;PROCESO',VarArrayOf([FRegistroDistribucion.Cod_Cia,FRegistroDistribucion.Nro_Proceso]),[]);

end;

procedure TFrmPrincipal.Pintar_Columna(ACol: Integer);
var
  i: Integer;
begin
{ // Colores Pastel
  DBGrillaCheque.Columns[0].Title.Color := TColor($0000AFFF); // Siena
  DBGrillaCheque.Columns[1].Title.Color := TColor($00AA60AA); // Mora Pastel
  DBGrillaCheque.Columns[2].Title.Color := TColor($00BFFFFF); // Amarillo Pastel
  DBGrillaCheque.Columns[3].Title.Color := TColor($00EEAA00); // Azul Pastel (*)
  DBGrillaCheque.Columns[4].Title.Color := TColor($0055DDDD); // Oliva Pastel
  DBGrillaCheque.Columns[5].Title.Color := TColor($00FFAAAA); // Violeta Pastel
  }
  for i := 0 to DBGrillaDistribuciones.Columns.Count - 1 do
    DBGrillaDistribuciones.Columns[i].Color := TColor($02880000);
  DBGrillaDistribuciones.Columns[ACol].Color := TColor($02AF6666);

  LocalizadorDistribucion.DataSource := nil;
  LocalizadorDistribucion.DefaultFieldName := DbGrillaDistribuciones.Columns[ACol].FieldName;
  LocalizadorDistribucion.DataSource := DSDistribuciones;

end;

procedure TFrmPrincipal.DbGrillaDistribucionesDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if DSDistribuciones.DataSet.RecNo = PosActual then
  begin
//    DbGrillaDistribuciones.Canvas.Brush.Color := TColor($02AF8000);
    DbGrillaDistribuciones.Canvas.Brush.Color := clScrollBar;
    DbGrillaDistribuciones.Canvas.Font.Color := clNavy;
    DbGrillaDistribuciones.Canvas.Font.Style := [fsBold];
  end;

  DbGrillaDistribuciones.RowsHeight := 25;
  DbGrillaDistribuciones.DefaultDrawColumnCell( Rect,DataCol,Column,State );

end;

procedure TFrmPrincipal.DSDistribucionesDataChange(Sender: TObject;
  Field: TField);
begin
  PosActual := DSDistribuciones.DataSet.RecNo;
  DbGrillaDistribuciones.Repaint;
  Ver_DeHabilitar_Generacion_Archivos;
end;

procedure TFrmPrincipal.DefinirImpresoraExecute(Sender: TObject);
begin
  ColadeImpresion.Execute;
end;
                                        
procedure TFrmPrincipal.DbGrillaDistribucionesDblClick(Sender: TObject);
begin
  if GenerarArchivos.Enabled then
    GenerarArchivosExecute(Self);
end;

procedure TFrmPrincipal.Ver_DeHabilitar_Generacion_Archivos;
begin

  { La copia a Transmision se habilita solo en los casos Manuales}
  CopiaATrx.Enabled := False;
  if (DSDistribuciones.DataSet.FieldByName('COPIA_A_TRANSMISION').Value = 'M')
    and (UsuarioHabilitado(CopiaATrx)) then
    CopiaATrx.Enabled := True;

end;


procedure TFrmPrincipal.ConsultarDistribucionesExecute(Sender: TObject);
var
  FrmConsultaDistribucion: TFrmConsultaDistribuciones;
begin
  Inicializar_RegistroDistribucion;
  FrmConsultaDistribucion := TFrmConsultaDistribuciones.create(Self,FRegistroDistribucion);
  try
    FrmConsultaDistribucion.ShowModal;
  finally
    FrmConsultaDistribucion.Free;
  end;

end;

procedure TFrmPrincipal.Inicializar_RegistroDistribucion;
var
  MotivoError: string;
begin
  try
  MotivoError := 'Cargando parametro empresa - ';
  FRegistroDistribucion.Cod_Cia             := DSDistribuciones.DataSet.FieldValues['EMPRESA'];
  MotivoError := 'Cargando parametro número de proceso - ';
  FRegistroDistribucion.Nro_Proceso         := DSDistribuciones.DataSet.FieldValues['PROCESO'];
  MotivoError := 'Cargando parametro para Razón Social - ';
  FRegistroDistribucion.RazonSocial         := DSDistribuciones.DataSet.FieldValues['RAZONSOCIAL'];
  MotivoError := 'Cargando parametro descripción - ';
  FRegistroDistribucion.DescProceso         := DSDistribuciones.DataSet.FieldValues['DESCRIPCION'];
  MotivoError := 'Cargando parametro fecha de distribución - ';
  FRegistroDistribucion.Fh_Distribucion     := Date;
  FRegistroDistribucion.Path_Cia            := '<Sin conversion>';
  if FDMPrincipal.Existe_Conversion(FRegistroDistribucion.Cod_Cia,FRegistroDistribucion.Nro_Proceso) then
    FRegistroDistribucion.Path_Cia            := FDMPrincipal.ObtenerPathCiaDBF(DSDistribuciones.DataSet.FieldValues['EMPRESA']);
  MotivoError := 'Cargando parametro directorio de trabajo - ';
  FRegistroDistribucion.Path_Work           := FDMPrincipal.ControlarPathWorkEmpresa( DSDistribuciones.DataSet.FieldValues['PATH_WORK'] );
  MotivoError := 'Cargando parametro copia a transmisión - ';
  FRegistroDistribucion.Copia_A_Trx         := DSDistribuciones.DataSet.FieldValues['COPIA_A_TRANSMISION'];
  MotivoError := 'Cargando parametro codigo de modo - ';
  FRegistroDistribucion.Cod_Modo            := FDMPrincipal.Buscar_Modo(DSDistribuciones.DataSet.FieldValues['EMPRESA'], DSDistribuciones.DataSet.FieldValues['PROCESO'], DSDistribuciones.DataSet.FieldValues['COD_MODO']);
  MotivoError := 'Cargando parametro fecha de utimo proceso - ';
//LABL
  If DSDistribuciones.DataSet.FieldValues['ULTFHPROCESO'] = null then
    FRegistroDistribucion.Fh_Proceso_Ultima   := date - 1
  else
    FRegistroDistribucion.Fh_Proceso_Ultima   := DSDistribuciones.DataSet.FieldValues['ULTFHPROCESO'];
  MotivoError := 'Cargando parametro número de proceso automatico - ';
//LABL
  If  DSDistribuciones.DataSet.FieldValues['PROCESO_AU'] = null then
    FRegistroDistribucion.Nro_Proceso_AU := 0
  else
    FRegistroDistribucion.Nro_Proceso_AU := DSDistribuciones.DataSet.FieldValues['PROCESO_AU'];
  MotivoError := 'Cargando parametro lote de proceso automatico - ';

  If DSDistribuciones.DataSet.FieldValues['LOTE_AU'] = null then
    FRegistroDistribucion.Lote_AU := '0'
  else
    FRegistroDistribucion.Lote_AU := DSDistribuciones.DataSet.FieldValues['LOTE_AU'];

  MotivoError := 'Cargando parametro fecha de proceso anterior - ';
	if DSDistribuciones.DataSet.FieldValues['FH_PROCESO_ANTERIOR'] = null then
	  FRegistroDistribucion.Fh_Proceso_Anterior := Date
  else
	  FRegistroDistribucion.Fh_Proceso_Anterior := DSDistribuciones.DataSet.FieldValues['FH_PROCESO_ANTERIOR'];

  MotivoError := 'Cargando parametro de dia habil - ';
	FRegistroDistribucion.Parametro_Dia_Habil := DSDistribuciones.DataSet.FieldValues['PARAMETRO_DIA_HABIL'];

  MotivoError := 'Cargando parametro de conversion desde DBFs - ';
  FRegistroDistribucion.Existe_Conversion := FDMPrincipal.Existe_Conversion(FRegistroDistribucion.Cod_Cia,FRegistroDistribucion.Nro_Proceso);

  MotivoError := 'Cargando parametro código de proceso relacionado - ';
  FRegistroDistribucion.Procesos_Relacionados := FDMPrincipal.ProcesosRelacionados(FRegistroDistribucion.Cod_Cia);

  MotivoError := 'Cargando parametro Imprime - ';
  FRegistroDistribucion.Imprime := (DSDistribuciones.DataSet.FieldByName('IMPRIME').AsInteger = 1);

//  FRegistroDistribucion.Genera_Nulos := FDMPrincipal.Genero_Archivo_Nulo(FRegistroDistribucion.Cod_Cia,FRegistroDistribucion.Nro_Proceso,FRegistroDistribucion.);

  except
    raise Exception.Create('Falta la parametrización de la empresa. Avise a Sistemas!!!'+#13#10+'Motivo: '+MotivoError+'ERROR');
  end;
end;

procedure TFrmPrincipal.CargarAyudaExecute(Sender: TObject);
begin
  inherited;
  Ayuda1.Ejecutar;
end;

procedure TFrmPrincipal.VolverAtrasExecute(Sender: TObject);
var
  FrmVueltaAtras: TFrmVueltaAtras;
  cPath: String;
  BMQryDistribuciones: TBookmark;
begin
  Inicializar_RegistroDistribucion;
  cPath := '<Sin Conversion>';
  if  FRegistroDistribucion.Existe_Conversion then
    cPath := FDMPrincipal.ObtenerPathCiaDBF((FRegistroDistribucion.Cod_Cia));
  FrmVueltaAtras := TFrmVueltaAtras.Create(Self,FRegistroDistribucion,cPath);
  try
    FrmVueltaAtras.ShowModal;
  finally
    FrmVueltaAtras.Free;
    BMQryDistribuciones := FDMPrincipal.QryDistribuciones.GetBookmark;
    FDMPrincipal.QryDistribuciones.Close;
    FDMPrincipal.QryDistribuciones.Open;
    FDMPrincipal.QryDistribuciones.GotoBookmark(BMQryDistribuciones);
    FDMPrincipal.QryDistribuciones.FreeBookmark(BMQryDistribuciones);
  end;
end;

procedure TFrmPrincipal.ObtenerCamposLocalizador;
var
  i: Integer;
begin
  for i:= 0 to DbGrillaDistribuciones.Columns.Count - 1 do
  begin
    LocalizadorDistribucion.Fields.Add(DbGrillaDistribuciones.Columns[i].FieldName);
    LocalizadorDistribucion.FieldsTitles.Add(DbGrillaDistribuciones.Columns[i].Title.Caption);
  end;
end;

procedure TFrmPrincipal.CambiarClaveExecute(Sender: TObject);
var
  CambioPasw:TFrmGIRECambioPasw;
begin
  CambioPasw:=TFrmGIRECambioPasw.Create(Owner);
  CambioPasw.GireEnlace:=GemaConexion;
  CambioPasw.ShowModal;
end;

procedure TFrmPrincipal.ObtenerListaAccionesHabilitadas;
var
  i,j:Integer;
begin
  j := 0;
  for i := 0 to ActionList1.ActionCount - 1 do
    if (ActionList1.Actions[i] as TAction).Enabled then
    begin
      j := j + 1;
      SetLength(FMisAccionesHabilitadas,j);
      FMisAccionesHabilitadas[j-1] := ActionList1.Actions[i] as TAction;
    end;
end;

function TFrmPrincipal.UsuarioHabilitado(ATAction: TACtion): Boolean;
var
  i: Integer;
begin
  i := 0;
  while (i < Length(FMisAccionesHabilitadas)) and (ATAction <> FMisAccionesHabilitadas[i]) do
    i := i + 1;
  if i = Length(FMisAccionesHabilitadas) then
    Result := False
  else
    Result := True;

end;

procedure TFrmPrincipal.ListarDetalleFacturacionExecute(Sender: TObject);
var
  FrmDetalleFacturacion: TFrmDetalleFacturacion;
begin
  AdoCtrlMenuGema.Autorizado('LISTADOFACTURACION');
  Inicializar_RegistroDistribucion;
  FrmDetalleFacturacion := TFrmDetalleFacturacion.Create(Self,FRegistroDistribucion);
  try
    FrmDetalleFacturacion.ShowModal;
  finally
    FrmDetalleFacturacion.Free;
  end;

end;



procedure TFrmPrincipal.ToolBarEspecificaDblClick(Sender: TObject);
var repo : TRepoResumenPagos603Edenor;
    repo2: TRepoResumenPagos603;
    filtro:TQRExportFilter;
begin
  inherited;
//  PARA PROBAR LOS REPORTES
{
   repo := TRepoResumenPagos603Edenor.create(nil);
   TAdoQuery(repo.DataSet).Parameters[0].value := strtodate('28/08/2013');
   TAdoQuery(repo.DataSet).Parameters[1].Value := strtodate('28/08/2013');
   repo.DataSet.Open;
   repo.QryTotales.Open;
   filtro := TQRAsciiExportFilter.Create('C:\prup.txt');

   repo.ExportToFilter(filtro);
   repo.Preview;
   freeAndNil(repo);
}
{

   repo2 := TRepoResumenPagos603.create(nil);
//   repo2.PrinterSettings.PaperSize := Tabloid;
   TAdoQuery(repo2.DataSet).Parameters[0].value := strtodate('28/08/2013');
   TAdoQuery(repo2.DataSet).Parameters[1].Value := strtodate('28/08/2013');
   repo2.DataSet.Open;
   repo2.DataSet.Open;
   filtro := TQRAsciiExportFilter.Create('C:\plp.txt');

   repo2.ExportToFilter(filtro);
   repo2.Preview;
   freeAndNil(repo2);
}
end;

end.
