unit AdoGenAr;

{$DEBUGINFO OFF}

interface

uses
  Windows, SysUtils, Classes, ADODB, CliCusEx, CliMacEx, Variants;

type

  TNotifRegistros = procedure(Valor: integer) of object;

  TNotifAppend = procedure(var Registro: string; var Appendea: boolean) of object;

  TNotifExisteArchivo = procedure(const Archivo: string; var Sigue: boolean) of object;

  TNotifTmp = procedure() of object;

  EErrorGeneraArchivo = class(Exception);

  pArchProc = ^TArchProc;
  TArchProc = record
    Path: string;
    Nombre: string;
    CantRegDetalle: Integer;
    CantRegHeader: Integer;
    CantRegTrailer: Integer;
    CantLotes: Integer;
    Tamano: Integer;
    ImporteDetalle: Double;
    Complemento: string;
  end;

  TAdoGeneraArchivo = class(TComponent)
  private
    { Private declarations }
    FConexion: TADOConnection;
    FCodigoDiseno: string;
    FCtrlFin: string;
    FParametrosValores: Variant;
    FParametrosCadenas: array of Variant;
    FCodigoSistema: integer;
    FEvaluadorExpre: TClipperMacroExpr;
    FVector_Sql: TStringList;
    FOnAntesDeApendearDetalle: TNotifAppend;
    FFinDeLinea: boolean;
    FContador: integer;
    FOnInformaTotales: TNotifRegistros;
    FOnInformaRegistro: TNotifRegistros;
    FOnExisteArchivo: TNotifExisteArchivo;
    FListArchivo: TList;
    FPARAMETRO_INTERNO: Variant;
    FComparacion: Variant;
    FIntComparacion: Variant;
    FOnCreandoTemporal: TNotifTmp;
    FOnTemporalCreado: TNotifTmp;
    FPathTemporal: string;
    FNombreArchivoTMP: string;
    FOnPasoDos: TNotifTmp;
    FOnPasoTres: TNotifTmp;
    procedure SetFinDeLinea(const Value: boolean);
    procedure ObtengoTotalDeRegistros(var qSelect: TADOQuery);
    procedure AgregoArchivoLista(pArchivo: string);
    procedure ActualizoArchivoLista(nRegDet, nRegHead, nRegTrail, nLotes, nTamano: integer; nImporte: Double; cComplemento: string);
    function CuentaLineas(cTexto: string): integer;
    function GetArchivosProcesados(Index: Integer): TArchProc;
    function GetCantArchivosProcesados: Integer;
    procedure ObtengoNombreArchivo(var cNombre: string);
    procedure ObtengoComplemento(var cComplemento: string);
    procedure VerificoArmaArchivo(const aCodSQL: array of string);
  protected
    { Protected declarations }
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    function ReemplazoCadenas(sTexto: string): string;
    procedure ReemplazoParametros(var pQuery: TADOQuery; IDRegistro: string);
    function SinCorte_D: Variant;
    function SinCorte_CD: Variant;
    function SinCorte_CDP: Variant;
    function SinCorte_DP: Variant;
    function PorLote_DT: Variant;
    function PorLote_DTP: Variant;
    function PorLote_HD: Variant;
    function PorLote_HDP: Variant;
    function PorLote_HDT: Variant;
    function PorLote_HDTP: Variant;
    function PorLote_CDT: Variant;
    function PorLote_CDTP: Variant;
    function PorLote_CHD: Variant;
    function PorLote_CHDP: Variant;
    function PorLote_CHDTP: Variant;
    function PorLote_CHDT: Variant;
    function ConCorte_D: Variant;
    function ConCorte_CD: Variant;
    function ConCorte_CDP: Variant;
    function ConCorte_DP: Variant;
    procedure HeaderDetalleTrailer(lCabecera, lPie: Boolean);
    procedure ConCorte(lCabecera, lPie: Boolean; lVacio: Boolean = False);
    //<LABL PFORMA-88>
    procedure ConCorte1Linea(lCabecera, lPie: Boolean; lVacio: Boolean = False);
    function ConCorte1Linea_CDP: Variant;
    //</LABL PFORMA-88>
    procedure PorLote(lCabecera, lHeader, lTrailer, lPie: Boolean);
    procedure ConCorteYLote(lCabecera, lHeader, lTrailer, lPie: Boolean; lVacio: Boolean = False);
    function CorteYLote_DT: Variant;
    function CorteYLote_DTP: Variant;
    function CorteYLote_HD: Variant;
    function CorteYLote_HDP: Variant;
    function CorteYLote_HDT: Variant;
    function CorteYLote_HDTP: Variant;
    function CorteYLote_CDT: Variant;
    function CorteYLote_CDTP: Variant;
    function CorteYLote_CHD: Variant;
    function CorteYLote_CHDP: Variant;
    function CorteYLote_CHDTP: Variant;
    function CorteYLote_CHDT: Variant;
    function ConCorteVacio_CD: Variant;
    function ConCorteVacio_CDP: Variant;
    function ConCorteVacio_DP: Variant;
    function CorteYLoteVacio_CHDTP: Variant;
  public
    { Public declarations }
    procedure AddParametrosValores(aValores: array of variant);
    property ArchivosProcesados[Index: Integer]: TArchProc read GetArchivosProcesados;
    property CodigoDiseno: string read FCodigoDiseno write FCodigoDiseno;
    property CantArchivosProcesados: Integer read GetCantArchivosProcesados;
    constructor Create(Owner: TComponent); override;
    destructor Destroy; override;
    procedure LimpioParametrosValores;
    procedure Loaded; override;
    procedure Ejecutar;
    property PARAMETRO_INTERNO: Variant read FPARAMETRO_INTERNO;
    procedure ParametrosCadenas(ListaParametros: array of string);
  published
    { Published declarations }
    property CodigoSistema: integer read FCodigoSistema write FCodigoSistema;
    property Conexion: TADOConnection read FConexion write FConexion;
    property EvaluadorExpre: TClipperMacroExpr read FEvaluadorExpre write FEvaluadorExpre;
    property FinDeLinea: boolean read FFinDeLinea write SetFinDeLinea default True;
    property PathTemporal: string read FPathTemporal write FPathTemporal;
    property OnAntesDeApendearDetalle: TNotifAppend read FOnAntesDeApendearDetalle write FOnAntesDeApendearDetalle;
    property OnInformaRegistro: TNotifRegistros read FOnInformaRegistro write FOnInformaRegistro;
    property OnInformaTotales: TNotifRegistros read FOnInformaTotales write FOnInformaTotales;
    property OnExisteArchivo: TNotifExisteArchivo read FOnExisteArchivo write FOnExisteArchivo;
    property OnCreandoTemporal: TNotifTmp read FOnCreandoTemporal write FOnCreandoTemporal;
    property OnPasoDos: TNotifTmp read FOnPasoDos write FOnPasoDos;
    property OnPasoTres: TNotifTmp read FOnPasoTres write FOnPasoTres;
    property OnTemporalCreado: TNotifTmp read FOnTemporalCreado write FOnTemporalCreado;
  end;


procedure Register;


implementation

procedure Register;
begin
  RegisterComponents('Clipper', [TAdoGeneraArchivo]);
end;

{ TAdoGeneraArchivo }

procedure TAdoGeneraArchivo.ActualizoArchivoLista(nRegDet, nRegHead, nRegTrail, nLotes, nTamano: integer; nImporte: Double; cComplemento: string);
begin
  TArchProc(FListArchivo[FListArchivo.Count - 1]^).CantRegDetalle := nRegDet;
  TArchProc(FListArchivo[FListArchivo.Count - 1]^).CantRegHeader := nRegHead;
  TArchProc(FListArchivo[FListArchivo.Count - 1]^).CantRegTrailer := nRegTrail;
  TArchProc(FListArchivo[FListArchivo.Count - 1]^).CantLotes := nLotes;
  TArchProc(FListArchivo[FListArchivo.Count - 1]^).Tamano := nTamano;
  TArchProc(FListArchivo[FListArchivo.Count - 1]^).ImporteDetalle := nImporte;
  TArchProc(FListArchivo[FListArchivo.Count - 1]^).Complemento := cComplemento;
end;

procedure TAdoGeneraArchivo.AddParametrosValores(aValores: array of variant);
begin
  if not VarIsArray(FParametrosValores) then
    FParametrosValores := VarArrayCreate([0, 0], varVariant)
  else
    VarArrayRedim(FParametrosValores, VarArrayHighBound(FParametrosValores, 1) + 1);

  if VarType(aValores[0]) = 8204 then
    FParametrosValores[VarArrayHighBound(FParametrosValores, 1)] := aValores[0]
  else
    FParametrosValores[VarArrayHighBound(FParametrosValores, 1)] := VarArrayOf(aValores);
end;

procedure TAdoGeneraArchivo.AgregoArchivoLista(pArchivo: string);
var
  pNuevoElemento: pArchProc;
begin
  New(pNuevoElemento);
  pNuevoElemento.Path := ExtractFileDir(pArchivo) + '\';
  pNuevoElemento.Nombre := ExtractFileName(pArchivo);
  pNuevoElemento.CantRegDetalle := 0;
  pNuevoElemento.CantRegHeader := 0;
  pNuevoElemento.CantRegTrailer := 0;
  pNuevoElemento.CantLotes := 0;
  pNuevoElemento.Tamano := 0;
  pNuevoElemento.ImporteDetalle := 0;
  FListArchivo.Add(pNuevoElemento);
end;

constructor TAdoGeneraArchivo.Create(Owner: TComponent);
var
  I: integer;
begin
  for I := 0 to Owner.ComponentCount - 1 do
    if Owner.Components[I] is TAdoGeneraArchivo then
      raise Exception.Create('No se admite mas de un componente de la clase '
        + '"TAdoGeneraArchivo" por formulario.');
  inherited Create(Owner);
  FCtrlFin := #13#10;
  FFinDeLinea := True;
  FCodigoSistema := 0;
  FVector_Sql := TStringList.Create;
  FListArchivo := TList.Create;
  FPARAMETRO_INTERNO := 'XZYRE_interno';
end;

function TAdoGeneraArchivo.CuentaLineas(cTexto: string): integer;
var
  Posi: integer;
begin
  Result := 1;
  Posi := Pos(#13#10, cTexto);
  while Posi <> 0 do
  begin
    Inc(Result);
    cTexto := Copy(cTexto, Posi + 2, MAXSHORT);
    Posi := Pos(#13#10, cTexto);
  end;
end;

destructor TAdoGeneraArchivo.Destroy;
begin
  FVector_Sql.Free;
  FListArchivo.Free;
  inherited Destroy;
end;

procedure TAdoGeneraArchivo.Ejecutar;

  function DirWindowsTmp: string;
  var
    DirTmp: array[0..MAX_PATH - 1] of char;
  begin
    GetTempPAth(MAX_PATH, DirTmp);
    Result := StrPas(DirTmp);
  end;

var
  cProcedimiento: string;
  QryPlantilla: TAdoQuery;
  nCodigoPlantilla: integer;
begin

  if FEvaluadorExpre = nil then
    raise EErrorGeneraArchivo.Create('Falta asignar el Evaluador de Expresiones en ' + Name);

  if FConexion = nil then
    raise EErrorGeneraArchivo.Create('Falta asignar la conexón en ' + Name);

  if FCodigoDiseno = '' then
    raise EErrorGeneraArchivo.Create('Falta asignar el Codigo de Diseño en ' + Name);

  if FCodigoSistema <= 0 then
    raise EErrorGeneraArchivo.Create('Falta asignar el Codigo de Sistema en ' + Name);

  if Trim(FPathTemporal) = '' then
    FNombreArchivoTMP := DirWindowsTmp + 'TMP_' + FormatDateTime('yyyymmddhhnnsszzz', Now)
  else
  begin
    if not DirectoryExists(FPathTemporal) then
      raise EErrorGeneraArchivo.Create('ERROR - Generador de archivos' + #13#10#13#10 + 'El directorio temporal indicado no existe'
        + #13#10 + '"' + FPathTemporal + '".');
    FNombreArchivoTMP := FPathTemporal + '\TMP_' + FormatDateTime('yyyymmddhhnnsszzz', Now);
  end;

  QryPlantilla := TADOQuery.Create(Self);
  try
    QryPlantilla.Connection := FConexion;
    QryPlantilla.CursorLocation := clUseServer;
    QryPlantilla.Prepared := True;
    QryPlantilla.SQL.Text := ' SELECT A.COD_SQL,A.TEXTO_SQL,A.COD_PLANTILLA,P.PROCEDIMIENTO ' +
      ' FROM GIRE.ARMA_ARCHIVOS A,GIRE.PLANTILLAS P ' +
      ' WHERE A.COD_PLANTILLA=P.COD_PLANTILLA AND A.COD_DISENO =''' + FCodigoDiseno + '''' +
      ' AND A.COD_SISTEMA = ' + IntToStr(FCodigoSistema);
    try
      QryPlantilla.Open;
    except
      on E: Exception do
        raise EErrorGeneraArchivo.Create('Error al intentar abrir GIRE.ARMA_ARCHIVOS con mensaje: '
          + #13#10 + E.Message);
    end;

    if QryPlantilla.RecordCount = 0 then
      raise EErrorGeneraArchivo.Create('Código de plantilla indefinido en tablas del sistema.');

    cProcedimiento := QryPlantilla.FieldByName('PROCEDIMIENTO').AsString;
    QryPlantilla.First;

    nCodigoPlantilla := QryPlantilla.FieldByName('COD_PLANTILLA').AsInteger;

    FVector_Sql.Clear;

    while not QryPlantilla.Eof do
    begin
      if nCodigoPlantilla <> QryPlantilla.FieldByName('COD_PLANTILLA').AsInteger then
        raise EErrorGeneraArchivo.Create('El código de diseño "' + FCodigoDiseno
          + '" tiene definida más de una plantilla.');
      FVector_Sql.Add(UpperCase(Trim(QryPlantilla.fieldByName('COD_SQL').asString))
        + '=' + QryPlantilla.fieldByName('TEXTO_SQL').asString);
      QryPlantilla.Next;
    end;

  finally
    QryPlantilla.Free;
  end;

  FContador := 0;
  FComparacion := null;
  FIntComparacion := null;
  FListArchivo.Clear;
  try
    FEvaluadorExpre.EvalVariant(cProcedimiento);
  except
    on E: Exception do
      raise EErrorGeneraArchivo.Create('Error al evaluar la función "' + cProcedimiento
        + '" del componente ' + Name + ' con mensaje:'
        + #13#10 + E.Message);
  end;

end;

function TAdoGeneraArchivo.GetArchivosProcesados(Index: Integer): TArchProc;
begin
  Result := TArchProc(FListArchivo[Index]^);
end;

function TAdoGeneraArchivo.GetCantArchivosProcesados: Integer;
begin
  Result := FListArchivo.Count;
end;

procedure TAdoGeneraArchivo.LimpioParametrosValores;
begin
  VarClear(FParametrosValores);
end;

procedure TAdoGeneraArchivo.Loaded;
begin
  inherited;
  if not (FEvaluadorExpre = nil) then
  begin
    EvaluadorExpre.FuncList.AddIdent('SINCORTE_D', SinCorte_D);
    EvaluadorExpre.FuncList.AddIdent('SINCORTE_CD', SinCorte_CD);
    EvaluadorExpre.FuncList.AddIdent('SINCORTE_CDP', SinCorte_CDP);
    EvaluadorExpre.FuncList.AddIdent('SINCORTE_DP', SinCorte_DP);
    EvaluadorExpre.FuncList.AddIdent('PORLOTE_DT', PorLote_DT);
    EvaluadorExpre.FuncList.AddIdent('PORLOTE_DTP', PorLote_DTP);
    EvaluadorExpre.FuncList.AddIdent('PORLOTE_HD', PorLote_HD);
    EvaluadorExpre.FuncList.AddIdent('PORLOTE_HDP', PorLote_HDP);
    EvaluadorExpre.FuncList.AddIdent('PORLOTE_HDT', PorLote_HDT);
    EvaluadorExpre.FuncList.AddIdent('PORLOTE_HDTP', PorLote_HDTP);
    EvaluadorExpre.FuncList.AddIdent('PORLOTE_CDT', PorLote_CDT);
    EvaluadorExpre.FuncList.AddIdent('PORLOTE_CDTP', PorLote_CDTP);
    EvaluadorExpre.FuncList.AddIdent('PORLOTE_CHD', PorLote_CHD);
    EvaluadorExpre.FuncList.AddIdent('PORLOTE_CHDP', PorLote_CHDP);
    EvaluadorExpre.FuncList.AddIdent('PORLOTE_CHDTP', PorLote_CHDTP);
    EvaluadorExpre.FuncList.AddIdent('PORLOTE_CHDT', PorLote_CHDT);
    EvaluadorExpre.FuncList.AddIdent('CONCORTE_D', ConCorte_D);
    EvaluadorExpre.FuncList.AddIdent('CONCORTE_CD', ConCorte_CD);
    EvaluadorExpre.FuncList.AddIdent('CONCORTE_CDP', ConCorte_CDP);
    //<LABL PFORMA-88>
    EvaluadorExpre.FuncList.AddIdent('CONCORTE1LINEA_CDP', ConCorte1Linea_CDP);
    //</LABL PFORMA-88>
    EvaluadorExpre.FuncList.AddIdent('CONCORTE_DP', ConCorte_DP);
    EvaluadorExpre.FuncList.AddIdent('CORTEYLOTE_DT', CorteyLote_DT);
    EvaluadorExpre.FuncList.AddIdent('CORTEYLOTE_DTP', CorteyLote_DTP);
    EvaluadorExpre.FuncList.AddIdent('CORTEYLOTE_HD', CorteyLote_HD);
    EvaluadorExpre.FuncList.AddIdent('CORTEYLOTE_HDP', CorteyLote_HDP);
    EvaluadorExpre.FuncList.AddIdent('CORTEYLOTE_HDT', CorteyLote_HDT);
    EvaluadorExpre.FuncList.AddIdent('CORTEYLOTE_HDTP', CorteyLote_HDTP);
    EvaluadorExpre.FuncList.AddIdent('CORTEYLOTE_CDT', CorteyLote_CDT);
    EvaluadorExpre.FuncList.AddIdent('CORTEYLOTE_CDTP', CorteyLote_CDTP);
    EvaluadorExpre.FuncList.AddIdent('CORTEYLOTE_CHD', CorteyLote_CHD);
    EvaluadorExpre.FuncList.AddIdent('CORTEYLOTE_CHDP', CorteyLote_CHDP);
    EvaluadorExpre.FuncList.AddIdent('CORTEYLOTE_CHDTP', CorteyLote_CHDTP);
    EvaluadorExpre.FuncList.AddIdent('CORTEYLOTE_CHDT', CorteyLote_CHDT);
    EvaluadorExpre.FuncList.AddIdent('ConCorteVacio_CD', ConCorteVacio_CD);
    EvaluadorExpre.FuncList.AddIdent('ConCorteVacio_CDP', ConCorteVacio_CDP);
    EvaluadorExpre.FuncList.AddIdent('ConCorteVacio_DP', ConCorteVacio_DP);
    EvaluadorExpre.FuncList.AddIdent('CorteYLoteVacio_CHDTP', CorteYLoteVacio_CHDTP);

  end;
end;

procedure TAdoGeneraArchivo.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) and (FConexion <> nil) and (AComponent = FConexion) then
    Conexion := nil;
  if (Operation = opRemove) and (FEvaluadorExpre <> nil) and (AComponent = FEvaluadorExpre) then
    EvaluadorExpre := nil;
end;

procedure TAdoGeneraArchivo.ObtengoTotalDeRegistros(var qSelect: TADOQuery);
var
  TextoAnterior: string;
begin
  if Assigned(FOnInformaTotales) then
  begin
    TextoAnterior := qSelect.SQL.Text;
    {
    if Pos('ORDER',  UpperCase(qSelect.SQL.Text)) <> 0 then
      qSelect.SQL.Text := Copy(qSelect.SQL.Text, 1,
                               Pos('ORDER',  UpperCase(qSelect.SQL.Text)) -1);
    }
    qSelect.SQL.Text := 'SELECT COUNT(1) FROM ( ' + qSelect.SQL.Text + ' )';
    try
      qSelect.Open;
    except
      on E: Exception do
        raise Exception.Create('Código de diseño = "' + FCodigoDiseno + '"' + #13#10
          + 'No se pudo ejecutar el COD_SQL "SDET". Error con mensaje:'
          + #13#10 + E.Message);
    end;
    FOnInformaTotales(qSelect.fieldByName('COUNT(1)').AsInteger);
    qSelect.Close;
    qSelect.SQL.Text := TextoAnterior;
  end;
end;

procedure TAdoGeneraArchivo.ParametrosCadenas(ListaParametros: array of string);
var
  x: integer;
begin
  FParametrosCadenas := VarArrayCreate([0, High(ListaParametros)], varVariant);
  for x := 0 to High(ListaParametros) do
  begin
    FParametrosCadenas[x] := ListaParametros[x];
  end;
end;

function TAdoGeneraArchivo.ReemplazoCadenas(sTexto: string): string;
var
  x: integer;
  sPosicion: string;
begin
  for x := 0 to High(FParametrosCadenas) do
  begin
    if x < 9 then
      sPosicion := '0' + intToStr(x + 1)
    else
      sPosicion := intToStr(x + 1);

    sTexto := StringReplace(sTexto, '@' + sPosicion, FParametrosCadenas[x], [rfReplaceAll]);
  end;
  Result := sTexto;
end;

procedure TAdoGeneraArchivo.ReemplazoParametros(var pQuery: TADOQuery; IDRegistro: string);
var
  nBucle, nCantE: integer;
  cSQLTemp: string;
begin
  // Esto que sige, es para que limpie los valores de los parámetros.
  cSQLTemp := pQuery.SQL.Text;
  pQuery.SQL.Clear;
  pQuery.SQL.Text := cSQLTemp;
  if VarIsArray(FParametrosValores) then
    for nBucle := 0 to VarArrayHighBound(FParametrosValores, 1) do
      if FParametrosValores[nBucle][0] = IDRegistro then
        for nCantE := 1 to VarArrayHighBound(FParametrosValores[nBucle], 1) do
        begin
          try
            if VarAsType(FParametrosValores[nBucle][nCantE], varString) = 'XZYRE_interno' then
              pQuery.Parameters.Items[nCantE - 1].Value := FComparacion
            else
              pQuery.Parameters.Items[nCantE - 1].Value := FParametrosValores[nBucle][nCantE];
          except
            raise Exception.Create('No esta definido el parametro "'
              + intToStr(nCantE) + '" para el COD_SQL "'
              + IDRegistro + '" del diseño "' + FCodigoDiseno + '"');
          end;
        end;
end;

procedure TAdoGeneraArchivo.SetFinDeLinea(const Value: boolean);
begin
  FFinDeLinea := Value;
  if FFinDeLinea then
    FCtrlFin := #13#10
  else
    FCtrlFin := '';
end;

procedure TAdoGeneraArchivo.VerificoArmaArchivo(const aCodSQL: array of string);
var
  nBucle: integer;
begin
  for nBucle := 0 to High(aCodSQL) do
    if FVector_Sql.IndexOfName(aCodSQL[nBucle]) = -1 then
      raise Exception.Create('Falta definir COD_SQL "' + aCodSql[nBucle]
        + '" para el diseño "' + FCodigoDiseno + '"');
end;

procedure TAdoGeneraArchivo.ObtengoNombreArchivo(var cNombre: string);
var
  QryDetalle: TADOQuery;
  lPisaSigue: boolean;
begin
  QryDetalle := TADOQuery.Create(self);

  try
    QryDetalle.Connection := FConexion;
    QryDetalle.CursorLocation := clUseServer;
    QryDetalle.Prepared := True;
    QryDetalle.SQL.Text := ReemplazoCadenas(FVector_Sql.Values['FANO']);
    ReemplazoParametros(QryDetalle, 'FANO');
    try
      QryDetalle.Open;
    except
      on E: Exception do
        raise Exception.Create('No se pudo ejecutar el COD_SQL "FANO". Error con mensaje:'
          + #13#10 + E.Message);
    end;
    cNombre := QryDetalle.Fields.Fields[0].AsString;
    QryDetalle.Close;
  finally
    QryDetalle.Free;
  end;

  if not DirectoryExists(ExtractFileDir(cNombre)) then
    raise Exception.Create('La ruta "' + ExtractFileDir(cNombre)
      + '" para el archivo de salida NO existe.');
  if FileExists(cNombre) then
  begin
    lPisaSigue := False;
    if Assigned(FOnExisteArchivo) then
      FOnExisteArchivo(cNombre, lPisaSigue);
    if not lPisaSigue then
      raise Exception.Create('El archivo "' + cNombre + '" ya existe');
  end;

end;

procedure TAdoGeneraArchivo.ObtengoComplemento(var cComplemento: string);
var
  QryCom: TADOQuery;
begin
  cComplemento := '';
  if FVector_Sql.IndexOfName('SCOM') <> -1 then
  begin

    QryCom := TADOQuery.Create(self);
    try
      QryCom.Connection := FConexion;
      QryCom.CursorLocation := clUseServer;
      QryCom.Prepared := True;
      QryCom.SQL.Text := ReemplazoCadenas(FVector_Sql.Values['SCOM']);
      ReemplazoParametros(QryCom, 'SCOM');
      try
        QryCom.Open;
      except
        on E: Exception do
          raise Exception.Create('No se pudo ejecutar el COD_SQL "SCOM". Error con mensaje:'
            + #13#10 + E.Message);
      end;
      cComplemento := QryCom.Fields.Fields[0].AsString;
      QryCom.Close;
    finally
      QryCom.Free;
    end;

  end;
end;


{*******************************************************************************************
HEADERDETALLETRAILER(lCabecera, lTrailer: boolean);
Esta función, según el valor de los parámetros, genera un archivo de salida solamente con
detalle, cabecera y detalle, cabecera detalle y trailer o detalle y trailer
*******************************************************************************************}

procedure TAdoGeneraArchivo.HeaderDetalleTrailer(lCabecera, lPie: Boolean);
var
  //QryDetalle: TADOQuery;
  QryGeneral: TADOQuery;
  QryDetalle: TADOQuery;
  QryDetalleOrigen: TADOQuery;
  sTexto: string;
  lAppendea: boolean;
  ArchivoSalida: TextFile;
  NombreArchivo: string;
  nTamanio: integer;
  nCantRegDet: integer;
  nCantCabecera: integer;
  nCantTrailer: integer;
  nImporte: Double;
  sComplemento: string;
begin

  nCantCabecera := 0;
  nCantTrailer := 0;

  VerificoArmaArchivo(['FANO', 'SDET']);

  if lCabecera then
    VerificoArmaArchivo(['SCAR']);

  if lPie then
    VerificoArmaArchivo(['SPAR']);

  ObtengoNombreArchivo(NombreArchivo);

  nTamanio := 0;

  ObtengoComplemento(sComplemento);

  AssignFile(ArchivoSalida, NombreArchivo);
  Rewrite(ArchivoSalida);
  AgregoArchivoLista(NombreArchivo); // Funcion que crea el elemento de la lista

  QryGeneral := TADOQuery.Create(self);
  QryDetalle := TADOQuery.Create(Self);
  QryDetalleOrigen := TADOQuery.Create(Self);

  try

    QryGeneral.Connection := FConexion;
    //QryDetalle.Connection := FConexion;
    QryDetalleOrigen.Connection := FConexion;
//    QryDetalle.CursorLocation := clUseServer;
//    QryDetalle.Prepared := True;

    if lCabecera then
    begin
      QryGeneral.SQL.Text := ReemplazoCadenas(FVector_Sql.Values['SCAR']);
      ReemplazoParametros(QryGeneral, 'SCAR');
      try
        QryGeneral.Open;
      except
        on E: Exception do
          raise EErrorGeneraArchivo.Create('Código de diseño = "' + FCodigoDiseno + '"' + #13#10
            + 'No se pudo ejecutar el COD_SQL "SCAR". Error con mensaje:'
            + #13#10 + E.Message);
      end;
      sTexto := QryGeneral.Fields.Fields[0].AsString;
      QryGeneral.Close;

      if sTexto <> '' then
      begin
        Write(ArchivoSalida, sTexto + FCtrlFin);
        nCantCabecera := CuentaLineas(sTexto);
        nTamanio := nTamanio + Length(sTexto + FCtrlFin);
      end

    end;

    QryDetalleOrigen.SQL.Text := ReemplazoCadenas(FVector_Sql.Values['SDET']);
    ReemplazoParametros(QryDetalleOrigen, 'SDET');
    ObtengoTotalDeRegistros(QryDetalleOrigen);
    nCantRegDet := 0;
    nImporte := 0;

    try
      QryDetalle.CursorType := ctOpenForwardOnly;

      if Assigned(FOnCreandoTemporal) then
        FOnCreandoTemporal();

      try
        QryDetalleOrigen.Open;

        if Assigned(FOnPasoDos) then
          FOnPasoDos();

        QryDetalleOrigen.SaveToFile(FNombreArchivoTMP, TPersistFormat(1));
        QryDetalleOrigen.Close;

        if Assigned(FOnPasoTres) then
          FOnPasoTres();

        QryDetalle.LoadFromFile(FNombreArchivoTMP);
        DeleteFile(FNombreArchivoTMP);
      finally
        if Assigned(FOnTemporalCreado) then
          FOnTemporalCreado();
      end;

    except
      on E: Exception do
        raise Exception.Create('Código de diseño = "' + FCodigoDiseno + '"' + #13#10
          + 'No se pudo ejecutar el COD_SQL "SDET". Error con mensaje:'
          + #13#10 + E.Message);
    end;

    QryDetalle.First;

    while not QryDetalle.Eof do
    begin

      if Assigned(FOnInformaRegistro) then
      begin
        Inc(FContador);
        FOnInformaRegistro(FContador);
      end;
      sTexto := QryDetalle.Fields.Fields[0].AsString;

      lAppendea := True;

      if Assigned(FOnAntesDeApendearDetalle) then
      begin
        FOnAntesDeApendearDetalle(sTexto, lAppendea);
      end;

      if lAppendea then
      begin
        Inc(nCantRegDet, CuentaLineas(sTexto));
        Write(ArchivoSalida, sTexto + FCtrlFin);
        nTamanio := nTamanio + Length(sTexto + FCtrlFin);
        if QryDetalle.FieldCount = 2 then
          nImporte := nImporte + QryDetalle.Fields.Fields[1].AsFloat;
      end;

      QryDetalle.DeleteRecords(arCurrent);

      //QryDetalle.Next;

    end;

    QryDetalle.Close;

    if lPie then
    begin
      QryGeneral.SQL.Text := ReemplazoCadenas(FVector_Sql.Values['SPAR']);
      ReemplazoParametros(QryGeneral, 'SPAR');
      try
        QryGeneral.Open;
      except
        on E: Exception do
          raise EErrorGeneraArchivo.Create('Código de diseño = "' + FCodigoDiseno + '"' + #13#10
            + 'No se pudo ejecutar el COD_SQL "SPAR". Error con mensaje:'
            + #13#10 + E.Message);
      end;
      sTexto := QryGeneral.Fields.Fields[0].AsString;
      QryGeneral.Close;
      if sTexto <> '' then
      begin
        Write(ArchivoSalida, sTexto + FCtrlFin);
        nCantTrailer := CuentaLineas(sTexto);
        nTamanio := nTamanio + Length(sTexto + FCtrlFin);
      end;
    end;

    Flush(ArchivoSalida);
    QryGeneral.Close;

    ActualizoArchivoLista(nCantRegDet, nCantCabecera, nCantTrailer, 1, nTamanio, nImporte, sComplemento);

  finally
    QryGeneral.Free;
    QryDetalle.Free;
    QryDetalleOrigen.Free;
    CloseFile(ArchivoSalida);
  end;

end;


{*******************************************************************************************
PORLOTE(lCabecera, lHeader, lTrailer, lPie: Boolean);
Esta función, según el valor de los parámetros, genera un archivo de salida de detalle con
cortes por lote, con cabecera y pie externo e interno y sus variantes.
*******************************************************************************************}

procedure TAdoGeneraArchivo.PorLote(lCabecera, lHeader, lTrailer, lPie: Boolean);
var
  QryCabeza: TADOQuery;
  QryDetalle: TADOQuery;
  QryDetalleOrigen: TADOQuery;
  QryPie: TADOQuery;
  sTexto: string;
  lAppendea: boolean;
  ArchivoSalida: TextFile;
  NombreArchivo: string;
  nTamanio: integer;
  nCantRegDet: integer;
  nCantCabecera: integer;
  nCantTrailer: integer;
  nCantLote: integer;
  nImporte: Double;
  sComplemento: string;
begin

  nCantCabecera := 0;
  nCantTrailer := 0;
  nCantLote := 0;
  nImporte := 0;

  VerificoArmaArchivo(['FANO', 'SDET']);

  if lCabecera then
    VerificoArmaArchivo(['SCAR']);

  if lHeader then
    VerificoArmaArchivo(['SCLO']);

  if lTrailer then
    VerificoArmaArchivo(['SPLO']);

  if lPie then
    VerificoArmaArchivo(['SPAR']);

  ObtengoNombreArchivo(NombreArchivo);
  nTamanio := 0;

  ObtengoComplemento(sComplemento);


  AssignFile(ArchivoSalida, NombreArchivo);
  Rewrite(ArchivoSalida);
  AgregoArchivoLista(NombreArchivo); // Funcion que crea el elemento de la lista

  QryDetalle := TADOQuery.Create(self);
  QryDetalleOrigen := TADOQuery.Create(Self);
  QryCabeza := TADOQuery.Create(Self);
  QryPie := TADOQuery.Create(Self);

  try

    QryDetalle.Connection := FConexion;
    QryDetalleOrigen.Connection := FConexion;
    QryCabeza.Connection := FConexion;
    QryPie.Connection := FConexion;

//    QryDetalle.CursorLocation := clUseServer;
//    QryDetalle.Prepared := True;
    QryCabeza.CursorLocation := clUseServer;
    QryCabeza.Prepared := True;
    QryPie.CursorLocation := clUseServer;
    QryPie.Prepared := True;

    if lCabecera then
    begin
      QryCabeza.SQL.Text := ReemplazoCadenas(FVector_Sql.Values['SCAR']);
      ReemplazoParametros(QryCabeza, 'SCAR');
      try
        QryCabeza.Open;
      except
        on E: Exception do
          raise EErrorGeneraArchivo.Create('Código de diseño = "' + FCodigoDiseno + '"' + #13#10
            + 'No se pudo ejecutar el COD_SQL "SCAR". Error con mensaje:'
            + #13#10 + E.Message);
      end;
      sTexto := QryCabeza.Fields.Fields[0].AsString;
      QryCabeza.Close;
      if sTexto <> '' then
      begin
        Write(ArchivoSalida, sTexto + FCtrlFin);
        Inc(nCantCabecera, CuentaLineas(sTexto));
        nTamanio := nTamanio + Length(sTexto + FCtrlFin);
      end;
    end;

    if lHeader then
      QryCabeza.SQL.Text := ReemplazoCadenas(FVector_Sql.Values['SCLO']);

    if lTrailer then
      QryPie.SQL.Text := ReemplazoCadenas(FVector_Sql.Values['SPLO']);

    QryDetalleOrigen.SQL.Text := ReemplazoCadenas(FVector_Sql.Values['SDET']);
    ReemplazoParametros(QryDetalleOrigen, 'SDET');

    ObtengoTotalDeRegistros(QryDetalleOrigen);
    nCantRegDet := 0;

    try
      QryDetalle.CursorType := ctOpenForwardOnly;

      if Assigned(FOnCreandoTemporal) then
        FOnCreandoTemporal();

      try
        QryDetalleOrigen.Open;

        if Assigned(FOnPasoDos) then
          FOnPasoDos();

        QryDetalleOrigen.SaveToFile(FNombreArchivoTMP, TPersistFormat(1));
        QryDetalleOrigen.Close;

        if Assigned(FOnPasoTres) then
          FOnPasoTres();

        QryDetalle.LoadFromFile(FNombreArchivoTMP);
        DeleteFile(FNombreArchivoTMP);
      finally
        if Assigned(FOnTemporalCreado) then
          FOnTemporalCreado();
      end;

    except
      on E: Exception do
        raise Exception.Create('Código de diseño = "' + FCodigoDiseno + '"' + #13#10
          + 'No se pudo ejecutar el COD_SQL "SDET". Error con mensaje:'
          + #13#10 + E.Message);
    end;

    QryDetalle.First;

    if QryDetalle.Fields.Count < 2 then
      raise Exception.Create('Código de diseño = "' + FCodigoDiseno + '"' + #13#10
        + 'Error en el resultado de la sentencia de "SDET"' + #13#10
        + 'No se localizó la condición para el corte por lote');


    while not QryDetalle.Eof do
    begin

      FComparacion := QryDetalle.Fields.Fields[1].asString;

      if lHeader then
      begin
        if QryCabeza.Parameters.Count = 1 then
          QryCabeza.Parameters.Items[0].Value := FComparacion;

        try
          QryCabeza.Open;
        except
          on E: Exception do
            raise Exception.Create('Código de diseño = "' + FCodigoDiseno + '"' + #13#10
              + 'No se pudo ejecutar el COD_SQL "SCLO". Error con mensaje:'
              + #13#10 + E.Message);
        end;

        sTexto := QryCabeza.Fields.Fields[0].AsString;
        QryCabeza.Close;
        if sTexto <> '' then
        begin
          Write(ArchivoSalida, sTexto + FCtrlFin);
          Inc(nCantCabecera, CuentaLineas(sTexto));
          nTamanio := nTamanio + Length(sTexto + FCtrlFin);
        end;

      end;

      while (FComparacion = QryDetalle.Fields.Fields[1].asString) and (not QryDetalle.Eof) do
      begin

        if Assigned(FOnInformaRegistro) then
        begin
          Inc(FContador);
          FOnInformaRegistro(FContador);
        end;
        sTexto := QryDetalle.Fields.Fields[0].AsString;

        lAppendea := True;

        if Assigned(FOnAntesDeApendearDetalle) then
        begin
          FOnAntesDeApendearDetalle(sTexto, lAppendea);
        end;

        if lAppendea then
        begin
          Inc(nCantRegDet, CuentaLineas(sTexto));
          Write(ArchivoSalida, sTexto + FCtrlFin);
          nTamanio := nTamanio + Length(sTexto + FCtrlFin);
          if QryDetalle.FieldCount >= 3 then
            nImporte := nImporte + QryDetalle.Fields.Fields[2].AsFloat;
        end;

        QryDetalle.DeleteRecords(arCurrent);

        //QryDetalle.Next;

      end;

      if lTrailer then
      begin

        if QryPie.Parameters.Count = 1 then
          QryPie.Parameters.Items[0].Value := FComparacion;

        try
          QryPie.Open;
        except
          on E: Exception do
            raise Exception.Create('Código de diseño = "' + FCodigoDiseno + '"' + #13#10
              + 'No se pudo ejecutar el COD_SQL "SPLO". Error con mensaje:'
              + #13#10 + E.Message);
        end;

        sTexto := QryPie.Fields.Fields[0].AsString;
        QryPie.Close;
        if sTexto <> '' then
        begin
          Write(ArchivoSalida, sTexto + FCtrlFin);
          Inc(nCantTrailer, CuentaLineas(sTexto));
          nTamanio := nTamanio + Length(sTexto + FCtrlFin);
        end;
      end;

      Inc(nCantLote);

    end;

    QryDetalle.Close;

    if lPie then
    begin
      QryPie.SQL.Text := ReemplazoCadenas(FVector_Sql.Values['SPAR']);
      ReemplazoParametros(QryPie, 'SPAR');
      try
        QryPie.Open;
      except
        on E: Exception do
          raise EErrorGeneraArchivo.Create('Código de diseño = "' + FCodigoDiseno + '"' + #13#10
            + 'No se pudo ejecutar el COD_SQL "SPAR". Error con mensaje:'
            + #13#10 + E.Message);
      end;

      sTexto := QryPie.Fields.Fields[0].AsString;
      QryPie.Close;
      if sTexto <> '' then
      begin
        Write(ArchivoSalida, sTexto + FCtrlFin);
        Inc(nCantTrailer, CuentaLineas(sTexto));
        nTamanio := nTamanio + Length(sTexto + FCtrlFin);
      end;
    end;

    Flush(ArchivoSalida);

    ActualizoArchivoLista(nCantRegDet, nCantCabecera, nCantTrailer, nCantLote, nTamanio, nImporte, sComplemento);

  finally
    QryCabeza.Free;
    QryPie.Free;
    QryDetalle.Free;
    QryDetalleOrigen.Free;
    CloseFile(ArchivoSalida);
  end;

end;

{*******************************************************************************************
CONCORTE(lCabecera, lHeader, lTrailer, lPie: Boolean; lVacio: Boolean = False);
Esta función, según el valor de los parámetros, genera varios archivos de salida de detalle
con cabecera y pie .
lVacio permite generar archivos aun cuando el query de detalles no devuelve registros.
*******************************************************************************************}

procedure TAdoGeneraArchivo.ConCorte(lCabecera, lPie: Boolean; lVacio: Boolean = False);
var
  QryCabeza: TADOQuery;
  QryDetalle: TADOQuery;
  QryDetalleOrigen: TADOQuery;
  QryPie: TADOQuery;
  sTexto: string;
  lAppendea: boolean;
  ArchivoSalida: TextFile;
  NombreArchivo: string;
  nCantCabecera: integer;
  nCantTrailer: integer;
  nTamanio: integer;
  nCantRegDet: integer;
  nImporte: double;
  sComplemento: string;
  //NombreArchivoTMP: string;
begin

  VerificoArmaArchivo(['FANO', 'SDET']);

  if lCabecera then
    VerificoArmaArchivo(['SCAR']);

  if lPie then
    VerificoArmaArchivo(['SPAR']);

  QryDetalle := TADOQuery.Create(self);
  QryDetalleOrigen := TADOQuery.Create(self);
  QryCabeza := TADOQuery.Create(Self);
  QryPie := TADOQuery.Create(Self);

  try

    //QryDetalle.Connection := FConexion;
    QryDetalleOrigen.Connection := FConexion;
    QryCabeza.Connection := FConexion;
    QryPie.Connection := FConexion;

//    QryDetalle.CursorLocation := clUseServer;
//    QryDetalle.Prepared := True;
    QryCabeza.CursorLocation := clUseServer;
    QryCabeza.Prepared := True;
    QryPie.CursorLocation := clUseServer;
    QryPie.Prepared := True;

    QryDetalleOrigen.SQL.Text := ReemplazoCadenas(FVector_Sql.Values['SDET']);
    ReemplazoParametros(QryDetalleOrigen, 'SDET');
    ObtengoTotalDeRegistros(QryDetalleOrigen);

    try
      QryDetalle.CursorType := ctOpenForwardOnly;

      if Assigned(FOnCreandoTemporal) then
        FOnCreandoTemporal();

      try
        QryDetalleOrigen.Open;

        if Assigned(FOnPasoDos) then
          FOnPasoDos();

        QryDetalleOrigen.SaveToFile(FNombreArchivoTMP, TPersistFormat(1));
        QryDetalleOrigen.Close;

        if Assigned(FOnPasoTres) then
          FOnPasoTres();

        QryDetalle.LoadFromFile(FNombreArchivoTMP);
        DeleteFile(FNombreArchivoTMP);
      finally
        if Assigned(FOnTemporalCreado) then
          FOnTemporalCreado();
      end;

    except
      on E: Exception do
      begin
        if Assigned(FOnTemporalCreado) then
          FOnTemporalCreado();
        raise Exception.Create('Código de diseño = "' + FCodigoDiseno + '"' + #13#10
          + 'No se pudo ejecutar el COD_SQL "SDET". Error con mensaje:'
          + #13#10 + E.Message);
      end;
    end;

    if QryDetalle.Fields.Count < 2 then
      raise Exception.Create('Código de diseño = "' + FCodigoDiseno + '"' + #13#10
        + 'Error en el resultado de la sentencia de "SDET"' + #13#10
        + 'No se localizó la condición para el corte por archivo');

    QryDetalle.First;

    while ((not QryDetalle.Eof) or lVacio) do
    begin

      FComparacion := QryDetalle.Fields.Fields[1].asString;
      ObtengoNombreArchivo(NombreArchivo);
      ObtengoComplemento(sComplemento);
      AssignFile(ArchivoSalida, NombreArchivo);
      Rewrite(ArchivoSalida);
      AgregoArchivoLista(NombreArchivo); // Funcion que crea el elemento de la lista

      nCantCabecera := 0;
      nCantTrailer := 0;
      nTamanio := 0;
      nCantRegDet := 0;
      nImporte := 0;

      if lCabecera then
      begin

        QryCabeza.SQL.Text := ReemplazoCadenas(FVector_Sql.Values['SCAR']);
        ReemplazoParametros(QryCabeza, 'SCAR');

        try
          QryCabeza.Open;
        except
          on E: Exception do
            raise EErrorGeneraArchivo.Create('Código de diseño = "' + FCodigoDiseno + '"' + #13#10
              + 'No se pudo ejecutar el COD_SQL "SCAR". Error con mensaje:'
              + #13#10 + E.Message);
        end;
        sTexto := QryCabeza.Fields.Fields[0].AsString;
        QryCabeza.Close;
        if sTexto <> '' then
        begin
          Write(ArchivoSalida, sTexto + FCtrlFin);
          Inc(nCantCabecera, CuentaLineas(sTexto));
          nTamanio := nTamanio + Length(sTexto + FCtrlFin);
        end;

      end;

      while (FComparacion = QryDetalle.Fields.Fields[1].asString) and (not QryDetalle.Eof) do
      begin

        if Assigned(FOnInformaRegistro) then
        begin
          Inc(FContador);
          FOnInformaRegistro(FContador);
        end;

        sTexto := QryDetalle.Fields.Fields[0].AsString;
        lAppendea := True;

        if Assigned(FOnAntesDeApendearDetalle) then
        begin
          FOnAntesDeApendearDetalle(sTexto, lAppendea);
        end;

        if lAppendea then
        begin
          Inc(nCantRegDet, CuentaLineas(sTexto));
          Write(ArchivoSalida, sTexto + FCtrlFin);
          nTamanio := nTamanio + Length(sTexto + FCtrlFin);
          if QryDetalle.FieldCount >= 3 then
            nImporte := nImporte + QryDetalle.Fields.Fields[2].AsFloat;
        end;

        QryDetalle.DeleteRecords(arCurrent);

        //QryDetalle.Next;

      end;

      if lPie then
      begin
        QryPie.SQL.Text := ReemplazoCadenas(FVector_Sql.Values['SPAR']);
        ReemplazoParametros(QryPie, 'SPAR');
        try
          QryPie.Open;
        except
          on E: Exception do
            raise EErrorGeneraArchivo.Create('Código de diseño = "' + FCodigoDiseno + '"' + #13#10
              + 'No se pudo ejecutar el COD_SQL "SPAR". Error con mensaje:'
              + #13#10 + E.Message);
        end;

        sTexto := QryPie.Fields.Fields[0].AsString;
        QryPie.Close;
        if sTexto <> '' then
        begin
          Write(ArchivoSalida, sTexto + FCtrlFin);
          Inc(nCantTrailer, CuentaLineas(sTexto));
          nTamanio := nTamanio + Length(sTexto + FCtrlFin);
        end;
      end;

      Flush(ArchivoSalida);
      CloseFile(ArchivoSalida);
      ActualizoArchivoLista(nCantRegDet, nCantCabecera, nCantTrailer, 0, nTamanio, nImporte, sComplemento);

      lVacio := False;
    end;

    QryDetalle.Close;

  finally
    QryCabeza.Free;
    QryPie.Free;
    QryDetalleOrigen.Free;
    QryDetalle.Free;
  end;

end;

{*******************************************************************************************
ConCorteYLote(lCabecera, lHeader, lTrailer, lPie: Boolean);
Esta función, según el valor de los parámetros, genera varios archivos de salida de detalle con
cortes por lote, con cabecera y pie externo e interno y sus variantes.
*******************************************************************************************}

procedure TAdoGeneraArchivo.ConCorteYLote(lCabecera, lHeader, lTrailer, lPie: Boolean; lVacio: Boolean = False);
var
  QryCabeza: TADOQuery;
  QryHeader: TADOQuery;
  QryDetalle: TADOQuery;
  QryDetalleOrigen: TADOQuery;
  QryPie: TADOQuery;
  QryTrailer: TADOQuery;
  sTexto: string;
  lAppendea: boolean;
  ArchivoSalida: TextFile;
  NombreArchivo: string;
  nCantCabecera: integer;
//  nCantHeader: integer;
  nCantTrailer: integer;
//  nCantPie: integer;
  nTamanio: integer;
  nCantRegDet: integer;
  nImporte: double;
  sComplemento: string;
//  nCantLote: integer;
begin


  nCantCabecera := 0;
//  nCantPie := 0;
//  nCantLote := 0;


  VerificoArmaArchivo(['FANO', 'SDET']);

  if lCabecera then
    VerificoArmaArchivo(['SCAR']);

  if lHeader then
    VerificoArmaArchivo(['SCLO']);

  if lTrailer then
    VerificoArmaArchivo(['SPLO']);

  if lPie then
    VerificoArmaArchivo(['SPAR']);

  QryCabeza := TADOQuery.Create(Self);
  QryHeader := TADOQuery.Create(self);
  QryDetalle := TADOQuery.Create(self);
  QryDetalleOrigen := TADOQuery.Create(Self);
  QryTrailer := TADOQuery.Create(self);
  QryPie := TADOQuery.Create(Self);

  try

    //QryDetalle.Connection := FConexion;
    QryDetalleOrigen.Connection := FConexion;
    QryCabeza.Connection := FConexion;
    QryPie.Connection := FConexion;
    QryHeader.Connection := FConexion;
    QryTrailer.Connection := FConexion;

//    QryDetalle.CursorLocation := clUseServer;
//    QryDetalle.Prepared := True;
    QryCabeza.CursorLocation := clUseServer;
    QryCabeza.Prepared := True;
    QryPie.CursorLocation := clUseServer;
    QryPie.Prepared := True;
    QryHeader.CursorLocation := clUseServer;
    QryHeader.Prepared := True;
    QryTrailer.CursorLocation := clUseServer;
    QryTrailer.Prepared := True;

    if lCabecera then
      QryCabeza.SQL.Text := ReemplazoCadenas(FVector_Sql.Values['SCAR']);

    if lHeader then
      QryHeader.SQL.Text := ReemplazoCadenas(FVector_Sql.Values['SCLO']);

    if lTrailer then
      QryTrailer.SQL.Text := ReemplazoCadenas(FVector_Sql.Values['SPLO']);

    if lPie then
      QryPie.SQL.Text := ReemplazoCadenas(FVector_Sql.Values['SPAR']);

    QryDetalleOrigen.SQL.Text := ReemplazoCadenas(FVector_Sql.Values['SDET']);
    ReemplazoParametros(QryDetalleOrigen, 'SDET');
    ObtengoTotalDeRegistros(QryDetalleOrigen);

    try
      QryDetalle.CursorType := ctOpenForwardOnly;

      if Assigned(FOnCreandoTemporal) then
        FOnCreandoTemporal();

      try
        QryDetalleOrigen.Open;

        if Assigned(FOnPasoDos) then
          FOnPasoDos();

        QryDetalleOrigen.SaveToFile(FNombreArchivoTMP, TPersistFormat(1));
        QryDetalleOrigen.Close;

        if Assigned(FOnPasoTres) then
          FOnPasoTres();

        QryDetalle.LoadFromFile(FNombreArchivoTMP);
        DeleteFile(FNombreArchivoTMP);
      finally
        if Assigned(FOnTemporalCreado) then
          FOnTemporalCreado();
      end;

    except
      on E: Exception do
        raise Exception.Create('Código de diseño = "' + FCodigoDiseno + '"' + #13#10
          + 'No se pudo ejecutar el COD_SQL "SDET". Error con mensaje:'
          + #13#10 + E.Message);
    end;

    QryDetalle.First;

    if QryDetalle.Fields.Count < 3 then
      raise Exception.Create('Código de diseño = "' + FCodigoDiseno + '"' + #13#10
        + 'Error en el resultado de la sentencia de "SDET"' + #13#10
        + 'No se localizaron las condiciones necesarias para el corte por lote y archivo');

    while ((not QryDetalle.Eof) or lVacio) do
    begin

      FComparacion := QryDetalle.Fields.Fields[2].asString;
      ObtengoNombreArchivo(NombreArchivo);
      ObtengoComplemento(sComplemento);
      AssignFile(ArchivoSalida, NombreArchivo);
      Rewrite(ArchivoSalida);
      AgregoArchivoLista(NombreArchivo); // Funcion que crea el elemento de la lista

      nCantTrailer := 0;
      nTamanio := 0;
      nCantRegDet := 0;
      nImporte := 0;


      if lCabecera then
      begin
        ReemplazoParametros(QryCabeza, 'SCAR');

        try
          QryCabeza.Open;
        except
          on E: Exception do
            raise EErrorGeneraArchivo.Create('Código de diseño = "' + FCodigoDiseno + '"' + #13#10
              + 'No se pudo ejecutar el COD_SQL "SCAR". Error con mensaje:'
              + #13#10 + E.Message);
        end;

        sTexto := QryCabeza.Fields.Fields[0].AsString;
        QryCabeza.Close;

        if sTexto <> '' then
        begin
          Write(ArchivoSalida, sTexto + FCtrlFin);
          Inc(nCantCabecera, CuentaLineas(sTexto));
          nTamanio := nTamanio + Length(sTexto + FCtrlFin);
        end;

      end;

      while (FComparacion = QryDetalle.Fields.Fields[2].asString) and ((not QryDetalle.Eof) or lVacio) do
      begin

        FIntComparacion := QryDetalle.Fields.Fields[1].asString;

        if lHeader then
        begin
          if QryHeader.Parameters.Count = 1 then
            QryHeader.Parameters.Items[0].Value := FIntComparacion;

          try
            QryHeader.Open;
          except
            on E: Exception do
              raise Exception.Create('Código de diseño = "' + FCodigoDiseno + '"' + #13#10
                + 'No se pudo ejecutar el COD_SQL "SCLO". Error con mensaje:'
                + #13#10 + E.Message);
          end;

          sTexto := QryHeader.Fields.Fields[0].AsString;
          QryHeader.Close;
          if sTexto <> '' then
          begin
            Write(ArchivoSalida, sTexto + FCtrlFin);
//            Inc(nCantHeader, CuentaLineas(sTexto));
            Inc(nCantCabecera, CuentaLineas(sTexto));
            nTamanio := nTamanio + Length(sTexto + FCtrlFin);
          end;

        end;

        while (FIntComparacion = QryDetalle.Fields.Fields[1].asString) and (FComparacion = QryDetalle.Fields.Fields[2].asString) and (not QryDetalle.Eof) do
        begin

          if Assigned(FOnInformaRegistro) then
          begin
            Inc(FContador);
            FOnInformaRegistro(FContador);
          end;

          sTexto := QryDetalle.Fields.Fields[0].AsString;

          lAppendea := True;

          if Assigned(FOnAntesDeApendearDetalle) then
          begin
            FOnAntesDeApendearDetalle(sTexto, lAppendea);
          end;

          if lAppendea then
          begin
            Inc(nCantRegDet, CuentaLineas(sTexto));
            Write(ArchivoSalida, sTexto + FCtrlFin);
            nTamanio := nTamanio + Length(sTexto + FCtrlFin);
            if QryDetalle.FieldCount = 4 then
              nImporte := nImporte + QryDetalle.Fields.Fields[3].AsFloat;
          end;

          QryDetalle.DeleteRecords(arCurrent);

          //QryDetalle.Next;
        end;

        if lTrailer then
        begin

          if QryTrailer.Parameters.Count = 1 then
            QryTrailer.Parameters.Items[0].Value := FIntComparacion;

          try
            QryTrailer.Open;
          except
            on E: Exception do
              raise Exception.Create('Código de diseño = "' + FCodigoDiseno + '"' + #13#10
                + 'No se pudo ejecutar el COD_SQL "SPLO". Error con mensaje:'
                + #13#10 + E.Message);
          end;

          sTexto := QryTrailer.Fields.Fields[0].AsString;
          QryTrailer.Close;
          if sTexto <> '' then
          begin
            Write(ArchivoSalida, sTexto + FCtrlFin);
            Inc(nCantTrailer, CuentaLineas(sTexto));
            nTamanio := nTamanio + Length(sTexto + FCtrlFin);
          end;
        end;

        lVacio := False;

      end;

      if lPie then
      begin

        ReemplazoParametros(QryPie, 'SPAR');
        try
          QryPie.Open;
        except
          on E: Exception do
            raise EErrorGeneraArchivo.Create('Código de diseño = "' + FCodigoDiseno + '"' + #13#10
              + 'No se pudo ejecutar el COD_SQL "SPAR". Error con mensaje:'
              + #13#10 + E.Message);
        end;

        sTexto := QryPie.Fields.Fields[0].AsString;
        QryPie.Close;
        if sTexto <> '' then
        begin
          Write(ArchivoSalida, sTexto + FCtrlFin);
//          Inc(nCantPie, CuentaLineas(sTexto));
          Inc(nCantTrailer, CuentaLineas(sTexto));
          nTamanio := nTamanio + Length(sTexto + FCtrlFin);
        end;
      end;

      Flush(ArchivoSalida);
      CloseFile(ArchivoSalida);
      ActualizoArchivoLista(nCantRegDet, nCantCabecera, nCantTrailer, 0, nTamanio, nImporte, sComplemento);

      //lVacio := False;

    end;

    QryDetalle.Close;

  finally
    QryCabeza.Free;
    QryPie.Free;
    QryDetalleOrigen.Free;
    QryDetalle.Free;
  end;

end;


// Genera archivo de salida sin corte y solamente registros de detalle.

function TAdoGeneraArchivo.SinCorte_D: Variant;
begin
  HeaderDetalleTrailer(False, False);
end;

// Genera archivo de salida sin corte con registros de detalle y trailer

function TAdoGeneraArchivo.SinCorte_DP: Variant;
begin
  HeaderDetalleTrailer(False, True);
end;

// Genera archivo de salida sin corte con registros header y de detalle.

function TAdoGeneraArchivo.SinCorte_CD: Variant;
begin
  HeaderDetalleTrailer(True, False);
end;

// Genera archivo de salida sin corte con registros header, de detalle y trailer.

function TAdoGeneraArchivo.SinCorte_CDP: Variant;
begin
  HeaderDetalleTrailer(True, True);
end;

// Genera archivo de salida por lote con cabecera principal, detalle y trailer por lote.

function TAdoGeneraArchivo.PorLote_CDT: Variant;
begin
  PorLote(True, False, True, False);
end;

// Genera archivo de salida por lote con cabecera principal, detalle, trailer por
// lote y trailer final.

function TAdoGeneraArchivo.PorLote_CDTP: Variant;
begin
  PorLote(True, False, True, True);
end;

// Genera archivo de salida por lote con cabecera principal, cabecera por lote y detalle.

function TAdoGeneraArchivo.PorLote_CHD: Variant;
begin
  PorLote(True, True, False, False);
end;

// Genera archivo de salida por lote con cabecera principal, cabecera por lote, detalle
// y trailer final.

function TAdoGeneraArchivo.PorLote_CHDP: Variant;
begin
  PorLote(True, True, False, True);
end;

// Genera archivo de salida por lote con cabecera principal, cabecera por lote, detalle
// y trailer por lote.

function TAdoGeneraArchivo.PorLote_CHDT: Variant;
begin
  PorLote(True, True, True, False);
end;

// Genera archivo de salida por lote con cabecera principal, cabecera por lote, detalle,
// trailer por lote y trailer final.

function TAdoGeneraArchivo.PorLote_CHDTP: Variant;
begin
  PorLote(True, True, True, True);
end;

// Genera archivo de salida por lote con detalle trailer por lote.

function TAdoGeneraArchivo.PorLote_DT: Variant;
begin
  PorLote(False, False, True, False);
end;

// Genera archivo de salida por lote con detalle, trailer por lote y trailer final.

function TAdoGeneraArchivo.PorLote_DTP: Variant;
begin
  PorLote(False, False, True, True);
end;

// Genera archivo de salida por lote con cabecera por lote y detalle.

function TAdoGeneraArchivo.PorLote_HD: Variant;
begin
  PorLote(False, True, False, False);
end;

// Genera archivo de salida por lote con cabecera por lote, detalle y trailer final.

function TAdoGeneraArchivo.PorLote_HDP: Variant;
begin
  PorLote(False, True, False, True);
end;

// Genera archivo de salida por lote con cabecera por lote, detalle y trailer por lote.

function TAdoGeneraArchivo.PorLote_HDT: Variant;
begin
  PorLote(False, True, True, False);
end;

// Genera archivo de salida por lote con cabecera por lote, detalle, trailer por lote
// y trailer final.

function TAdoGeneraArchivo.PorLote_HDTP: Variant;
begin
  PorLote(True, False, True, True);
end;

// Genera diferentes archivo de salida con detalle y cabecera.

function TAdoGeneraArchivo.ConCorte_CD: Variant;
begin
  ConCorte(True, False);
end;

// Genera diferentes archivo de salida con detalle, cabecera y pie.

function TAdoGeneraArchivo.ConCorte_CDP: Variant;
begin
  ConCorte(True, True);
end;

// Genera diferentes archivo de salida solo con el detalle.

function TAdoGeneraArchivo.ConCorte_D: Variant;
begin
  ConCorte(False, False);
end;

// Genera diferentes archivo de salida con detalle y pie.

function TAdoGeneraArchivo.ConCorte_DP: Variant;
begin
  ConCorte(False, True);
end;

// Genera archivo de salida con corte y lote con cabecera , detalle y trailer.

function TAdoGeneraArchivo.CorteYLote_CDT: Variant;
begin
  ConCorteYLote(True, False, True, False);
end;

// Genera archivo de salida con corte y lote con cabecera , detalle, trailer y pie.

function TAdoGeneraArchivo.CorteYLote_CDTP: Variant;
begin
  ConCorteYLote(True, False, True, True);
end;

// Genera archivo de salida con corte y lote con cabecera y header.

function TAdoGeneraArchivo.CorteYLote_CHD: Variant;
begin
  ConCorteYLote(True, True, False, False);
end;

// Genera archivo de salida con corte y lote con cabecera, header y pie.

function TAdoGeneraArchivo.CorteYLote_CHDP: Variant;
begin
  ConCorteYLote(True, True, False, True);
end;

// Genera archivo de salida con corte y lote con cabecera, header y trailer.

function TAdoGeneraArchivo.CorteYLote_CHDT: Variant;
begin
  ConCorteYLote(True, True, True, False);
end;

// Genera archivo de salida con corte y lote con cabecera, header , trailer y pie.

function TAdoGeneraArchivo.CorteYLote_CHDTP: Variant;
begin
  ConCorteYLote(True, True, True, True);
end;

// Genera archivo de salida con corte y lote con trailer.

function TAdoGeneraArchivo.CorteYLote_DT: Variant;
begin
  ConCorteYLote(False, False, True, False);
end;

// Genera archivo de salida con corte y lote con trailery pie.

function TAdoGeneraArchivo.CorteYLote_DTP: Variant;
begin
  ConCorteYLote(False, False, True, True);
end;

// Genera archivo de salida con corte y lote con header.

function TAdoGeneraArchivo.CorteYLote_HD: Variant;
begin
  ConCorteYLote(False, True, False, False);
end;

// Genera archivo de salida con corte y lote con header y pie.

function TAdoGeneraArchivo.CorteYLote_HDP: Variant;
begin
  ConCorteYLote(True, False, True, False);
end;

// Genera archivo de salida con corte y lote con header y trailer.

function TAdoGeneraArchivo.CorteYLote_HDT: Variant;
begin
  ConCorteYLote(False, True, True, False);
end;

// Genera archivo de salida con corte y lote con header, trailer y pie.

function TAdoGeneraArchivo.CorteYLote_HDTP: Variant;
begin
  ConCorteYLote(True, False, True, True);
end;

// Genera diferentes archivo de salida con detalle y cabecera aunque no tenga registros.

function TAdoGeneraArchivo.ConCorteVacio_CD: Variant;
begin
  ConCorte(True, False, True);
end;

// Genera diferentes archivo de salida con cabecera, detalle y pie aunque no tenga registros.

function TAdoGeneraArchivo.ConCorteVacio_CDP: Variant;
begin
  ConCorte(True, True, True);
end;

// Genera diferentes archivo de salida con detalle y pie aunque no tenga registros.

function TAdoGeneraArchivo.ConCorteVacio_DP: Variant;
begin
  ConCorte(False, True, True);
end;

function TAdoGeneraArchivo.CorteYLoteVacio_CHDTP: Variant;
begin
  ConCorteYLote(True, True, True, True, True);
end;

function TAdoGeneraArchivo.ConCorte1Linea_CDP: Variant;
begin
  ConCorte1Linea(True, True);
end;

//<LABL PFORMA-88>
procedure TAdoGeneraArchivo.ConCorte1Linea(lCabecera, lPie: Boolean; lVacio: Boolean = False);
var
  QryCabeza: TADOQuery;
  QryDetalle: TADOQuery;
  QryDetalleOrigen: TADOQuery;
  QryPie: TADOQuery;
  sTexto: string;
  lAppendea: boolean;
  ArchivoSalida: TextFile;
  NombreArchivo: string;
  nCantCabecera: integer;
  nCantTrailer: integer;
  nTamanio: integer;
  nCantRegDet: integer;
  nImporte: double;
  sComplemento: string;
  //NombreArchivoTMP: string;
begin

  VerificoArmaArchivo(['FANO', 'SDET']);

  if lCabecera then
    VerificoArmaArchivo(['SCAR']);

  if lPie then
    VerificoArmaArchivo(['SPAR']);

  QryDetalle := TADOQuery.Create(self);
  QryDetalleOrigen := TADOQuery.Create(self);
  QryCabeza := TADOQuery.Create(Self);
  QryPie := TADOQuery.Create(Self);

  try

    //QryDetalle.Connection := FConexion;
    QryDetalleOrigen.Connection := FConexion;
    QryCabeza.Connection := FConexion;
    QryPie.Connection := FConexion;

//    QryDetalle.CursorLocation := clUseServer;
//    QryDetalle.Prepared := True;
    QryCabeza.CursorLocation := clUseServer;
    QryCabeza.Prepared := True;
    QryPie.CursorLocation := clUseServer;
    QryPie.Prepared := True;

    QryDetalleOrigen.SQL.Text := ReemplazoCadenas(FVector_Sql.Values['SDET']);
    ReemplazoParametros(QryDetalleOrigen, 'SDET');
    ObtengoTotalDeRegistros(QryDetalleOrigen);

    try
      QryDetalle.CursorType := ctOpenForwardOnly;

      if Assigned(FOnCreandoTemporal) then
        FOnCreandoTemporal();

      try
        QryDetalleOrigen.Open;

        if Assigned(FOnPasoDos) then
          FOnPasoDos();

        QryDetalleOrigen.SaveToFile(FNombreArchivoTMP, TPersistFormat(1));
        QryDetalleOrigen.Close;

        if Assigned(FOnPasoTres) then
          FOnPasoTres();

        QryDetalle.LoadFromFile(FNombreArchivoTMP);
        DeleteFile(FNombreArchivoTMP);
      finally
        if Assigned(FOnTemporalCreado) then
          FOnTemporalCreado();
      end;

    except
      on E: Exception do
      begin
        if Assigned(FOnTemporalCreado) then
          FOnTemporalCreado();
        raise Exception.Create('Código de diseño = "' + FCodigoDiseno + '"' + #13#10
          + 'No se pudo ejecutar el COD_SQL "SDET". Error con mensaje:'
          + #13#10 + E.Message);
      end;
    end;

    if QryDetalle.Fields.Count < 2 then
      raise Exception.Create('Código de diseño = "' + FCodigoDiseno + '"' + #13#10
        + 'Error en el resultado de la sentencia de "SDET"' + #13#10
        + 'No se localizó la condición para el corte por archivo');

    QryDetalle.First;

    while ((not QryDetalle.Eof) or lVacio) do
    begin

      FComparacion := QryDetalle.Fields.Fields[1].asString;
      ObtengoNombreArchivo(NombreArchivo);
      ObtengoComplemento(sComplemento);
      AssignFile(ArchivoSalida, NombreArchivo);
      Rewrite(ArchivoSalida);
      AgregoArchivoLista(NombreArchivo); // Funcion que crea el elemento de la lista

      nCantCabecera := 0;
      nCantTrailer := 0;
      nTamanio := 0;
      nCantRegDet := 0;
      nImporte := 0;

      if lCabecera then
      begin

        QryCabeza.SQL.Text := ReemplazoCadenas(FVector_Sql.Values['SCAR']);
        ReemplazoParametros(QryCabeza, 'SCAR');

        try
          QryCabeza.Open;
        except
          on E: Exception do
            raise EErrorGeneraArchivo.Create('Código de diseño = "' + FCodigoDiseno + '"' + #13#10
              + 'No se pudo ejecutar el COD_SQL "SCAR". Error con mensaje:'
              + #13#10 + E.Message);
        end;
        sTexto := QryCabeza.Fields.Fields[0].AsString;
        QryCabeza.Close;
        if sTexto <> '' then
        begin
          //Write(ArchivoSalida, sTexto + FCtrlFin);
          Inc(nCantCabecera, CuentaLineas(sTexto));
          nTamanio := nTamanio + Length(sTexto + FCtrlFin);
        end;

      end;

      //sTexto := '';
      
      while (FComparacion = QryDetalle.Fields.Fields[1].asString) and (not QryDetalle.Eof) do
      begin

        if Assigned(FOnInformaRegistro) then
        begin
          Inc(FContador);
          FOnInformaRegistro(FContador);
        end;

        sTexto := sTexto + QryDetalle.Fields.Fields[0].AsString;
        lAppendea := True;
 {
        if Assigned(FOnAntesDeApendearDetalle) then
        begin
          FOnAntesDeApendearDetalle(sTexto, lAppendea);
        end;
 }
        if lAppendea then
        begin
          Inc(nCantRegDet, CuentaLineas(QryDetalle.Fields.Fields[0].AsString));
          //Write(ArchivoSalida, sTexto + FCtrlFin);
          nTamanio := nTamanio + Length(QryDetalle.Fields.Fields[0].AsString + FCtrlFin);
          if QryDetalle.FieldCount >= 3 then
            nImporte := nImporte + QryDetalle.Fields.Fields[2].AsFloat;
        end;

        QryDetalle.DeleteRecords(arCurrent);

        //QryDetalle.Next;

      end;


        if Assigned(FOnAntesDeApendearDetalle) then
        begin
          FOnAntesDeApendearDetalle(sTexto, lAppendea);
        end;
  {
        if lAppendea then
        begin

          Write(ArchivoSalida, sTexto + FCtrlFin);

        end;
}

      if lPie then
      begin
        QryPie.SQL.Text := ReemplazoCadenas(FVector_Sql.Values['SPAR']);
        ReemplazoParametros(QryPie, 'SPAR');
        try
          QryPie.Open;
        except
          on E: Exception do
            raise EErrorGeneraArchivo.Create('Código de diseño = "' + FCodigoDiseno + '"' + #13#10
              + 'No se pudo ejecutar el COD_SQL "SPAR". Error con mensaje:'
              + #13#10 + E.Message);
        end;

        sTexto := sTexto + QryPie.Fields.Fields[0].AsString;
        QryPie.Close;
        if sTexto <> '' then
        begin
          //Write(ArchivoSalida, sTexto + FCtrlFin);
          Write(ArchivoSalida, sTexto);
          Inc(nCantTrailer, CuentaLineas(sTexto));
          nTamanio := nTamanio + Length(sTexto + FCtrlFin);
        end;
      end;

      Flush(ArchivoSalida);
      CloseFile(ArchivoSalida);
      ActualizoArchivoLista(nCantRegDet, nCantCabecera, nCantTrailer, 0, nTamanio, nImporte, sComplemento);

      lVacio := False;
    end;

    QryDetalle.Close;

  finally
    QryCabeza.Free;
    QryPie.Free;
    QryDetalleOrigen.Free;
    QryDetalle.Free;
  end;

end;

//</LABL PFORMA-88>

end.

