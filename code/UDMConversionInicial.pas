unit UDMConversionInicial;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UDMGirePath, Db, ADODB, ApoDSet, UGeneral, Define, ApoEnv, UFrmProgresoConversion,
  CliCusEx, CliMacEx, ApCommon;

type
  TDMConversionInicial = class(TDMGirePath)
    TblDBF: TApolloTable;
    QryDistConversion: TADOQuery;
    QryDistConversionCOD_CIA: TIntegerField;
    QryDistConversionNRO_PROCESO: TIntegerField;
    QryDistConversionCOD_TIPO_ARCHIVO: TStringField;
    QryDistConversionCOD_TIPO_ARCHIVO_DBF: TStringField;
    QryDistConversionCAMPO_ORIGEN: TStringField;
    QryDistConversionCAMPO_DESTINO: TStringField;
    QryDistConversionCAMPO_TIPO: TStringField;
    QryDistConversionEVALUADOR: TStringField;
    QryDistConversionEJECUTA: TIntegerField;
    TblORA: TADOTable;
    QryTblDBFaTblOra: TADOQuery;
    QryTblDBFaTblOraNOMBRE_TABLA_DBF: TStringField;
    QryTblDBFaTblOraNOMBRE_TABLA_ORA: TStringField;
    QryTblDBFaTblOraCOD_TIPO_ARCHIVO_DBF: TStringField;
    QryTblDBFaTblOraCOD_TIPO_ARCHIVO: TStringField;
    QryTblDBFaTblOraTIPO_INDICE_DBF: TStringField;
    QryTblDBFaTblOraDESCRIPCION: TStringField;
    QryExisteConversion: TADOQuery;
    EvaluaConversion: TClipperMacroExpr;

    protected
    FRegistroDistribucion: TRegistroDistribucion;
    FFieldMapList,FFunctionMapList: TStringList;
    procedure Abrir_QryDBFORA;
  private
    FFrmProgresoConversion: TFrmProgresoConversion;
    procedure Pasaje_A_ORA;
    procedure Inserto_en_TblORA(cCampo: String);
    procedure InicializarBarraProgreso(ALeyenda: String; AMax: Integer);
    procedure ActualizarBarraProgreso;
    procedure Respladar_DBFs;
    function Existe_Conversion: Boolean;
    function Cliente_LUA: Variant;
    function Cliente_CHEVRO: Variant;
    function Factura_AguasArg: Variant;
  protected
    function Asigna_TipoIndice(Indice: String): TApolloTableType;
  public
    procedure Iniciar_Conversion;
    procedure DesHacer_Conversion;
    constructor Create(AOwner: TComponent; ARegistroDistribucion: TRegistroDistribucion; ACaption: String); reintroduce; overload;
    destructor destroy; override;
  end;

implementation

uses UDMGemaConexion;

{$R *.DFM}

{ TDMConversionInicial }

constructor TDMConversionInicial.Create(AOwner: TComponent;
  ARegistroDistribucion: TRegistroDistribucion; ACaption: String);
begin
  inherited Create(AOwner);
  FRegistroDistribucion := ARegistroDistribucion;
  EvaluaConversion.FuncList.AddIdent('CLIENTE_LUA'  , CLIENTE_LUA);
  EvaluaConversion.FuncList.AddIdent('CLIENTE_CHEVRO'  , CLIENTE_CHEVRO);
  EvaluaConversion.FuncList.AddIdent('FACTURA_AGUASARG'  , FACTURA_AGUASARG);
  Abrir_QryDBFORA;
  FFrmProgresoConversion := TFrmProgresoConversion.Create(Self,ACaption);
  FFrmProgresoConversion.Show;
end;

procedure TDMConversionInicial.DesHacer_Conversion;
var
  cTablaAnterior: String;
begin
	if Existe_Conversion then
  begin
	  TblDBF.Close;
  	cTablaAnterior := '';
	  QryTblDBFaTblOra.First;
  	while not QryTblDBFaTblOra.Eof do
	  begin
  	  TblDBF.TableName := FRegistroDistribucion.Path_Cia+Trim(QryTblDBFaTblOraNOMBRE_TABLA_DBF.Value)+'.DBF';
	    if FileExists(TblDBF.TableName) then
  	    if cTablaAnterior <> TblDBF.TableName then
	      begin
  	      Recuperar_DBFBCK(TblDBF.TableName);
    	    TblDBF.IndexName := FRegistroDistribucion.Path_Cia+Trim(QryTblDBFaTblOraNOMBRE_TABLA_DBF.Value)+'.'+QryTblDBFaTblOraTIPO_INDICE_DBF.Value;
          TblDBF.TableType := Asigna_TipoIndice(QryTblDBFaTblOraTIPO_INDICE_DBF.Value);
      	  TblDBF.Open;
	        TblDBF.Reindex;
  	      TblDBF.Commit;
    	    TblDBF.Close;
      	  cTablaAnterior := TblDBF.TableName;
	      end;
  	  QryTblDBFaTblOra.Next;
	  end;
  end;

end;

destructor TDMConversionInicial.destroy;
begin
  QryTblDBFaTblOra.Close;
  FFrmProgresoConversion.Free;
  inherited;
end;

procedure TDMConversionInicial.Iniciar_Conversion;
var
  Campo_Origen, Campo_Destino: String;
begin
  if Existe_Conversion then
	begin
	  Respladar_DBFs;

	  { Conversion tabla a tabla }
	  QryTblDBFaTblOra.First;
  	while not QryTblDBFaTblOra.Eof do
	  begin
  	  QryDistConversion.Close;
    	QryDistConversion.Parameters.ParamByName('pCod_Cia').Value := FRegistroDistribucion.Cod_Cia;
	    QryDistConversion.Parameters.ParamByName('pNro_Proceso').Value := FRegistroDistribucion.Nro_Proceso;
  	  QryDistConversion.Parameters.ParamByName('pTipo_Archivo').Value := QryTblDBFaTblOraCOD_TIPO_ARCHIVO.Value;
    	QryDistConversion.Parameters.ParamByName('pTipo_Archivo_DBF').Value := QryTblDBFaTblOraCOD_TIPO_ARCHIVO_DBF.Value;
	    QryDistConversion.Open;

  	  { Mapeo de Campos }
	    FFieldMapList := TStringList.Create;
	    FFunctionMapList := TStringList.Create;
  	  while not QryDistConversion.Eof do
      begin
 		    Campo_Destino := Trim(QryDistConversionCAMPO_DESTINO.Value);
				if QryDistConversionEVALUADOR.Value = '' then
        begin
		      Campo_Origen  := Trim(QryDistConversionCAMPO_ORIGEN.Value);
	  		  FFieldMapList.Add(Campo_Destino+'='+Campo_Origen);
        end
        else
        begin
		      Campo_Origen  := Trim(QryDistConversionEVALUADOR.Value);
	  		  FFunctionMapList.Add(Campo_Destino+'='+Campo_Origen);
        end;
	      QryDistConversion.Next;
  	  end;

	   { Pasaje de Datos }
  	  if (FFieldMapList.Count > 0) or (FFunctionMapList.Count > 0) then
    	  Pasaje_A_ORA;

	    FFieldMapList.Free;

  	  QryTblDBFaTblOra.Next;
	  end;
  end;

end;

procedure TDMConversionInicial.Pasaje_A_ORA;
var
  i: Integer;
begin
  { Abrir tablas ORA y DBF}
  TblDBF.TableName := FRegistroDistribucion.Path_Cia+Trim(QryTblDBFaTblOraNOMBRE_TABLA_DBF.Value)+'.DBF';
  TblDBF.TableType := Asigna_TipoIndice(QryTblDBFaTblOraTIPO_INDICE_DBF.Value);
  TblDBF.IndexName := FRegistroDistribucion.Path_Cia+Trim(QryTblDBFaTblOraNOMBRE_TABLA_DBF.Value)+'.'+QryTblDBFaTblOraTIPO_INDICE_DBF.Value;
  TblDBF.Open;

  { Elimino los borrados }
  TblDBF.Pack;
  TblDBF.Reindex;
  TblDBF.First;

  TblORA.TableName := 'GEMA.'+Trim(StrTran(QryTblDBFaTblOraNOMBRE_TABLA_ORA.Value, 'eeeee', StrZero(FRegistroDistribucion.Cod_Cia, 5, 0)));
  TblORA.Open;

  InicializarBarraProgreso('Convirtiendo',TblDBF.RecCount);

  i := 0;
  while not TblDBF.Eof do
  begin
    { Convierto solamente lo que tiene FH_PROCESO <= a la de pantalla.
      Si el campo FH_PRESTAL no existe en la tabla DBF busco FH_PRESENT,
      (es obligatorio que esté alguno de los dos) }
    if TblDBF.FindField('FH_PRESTAL') <> nil then
      Inserto_en_TblORA('FH_PRESTAL')
    else
      if TblDBF.FindField('FH_PRESENT') <> nil then
        Inserto_en_TblORA('FH_PRESENT')
      else
        Raise Exception.Create(' Falta campo FH_PRESTAL o FH_PRESENT en tabla '+TblDBF.TableName);

    i := i + 1;
    if i mod FFrmProgresoConversion.ProgressBar1.Step = 0 then
      ActualizarBarraProgreso;

    TblDBF.Next;
  end;

  ActualizarBarraProgreso;

  TblORA.Close;
  { Elimino los borrados }
  TblDBF.Pack;
  TblDBF.Reindex;
  TblDBF.Commit;
  TblDBF.Close;

end;

procedure TDMConversionInicial.Abrir_QryDBFORA;
begin
  QryTblDBFaTblOra.Parameters.ParamByName('pCod_Cia').Value := FRegistroDistribucion.Cod_Cia;
  QryTblDBFaTblOra.Parameters.ParamByName('pNro_Proceso').Value := FRegistroDistribucion.Nro_Proceso;
  QryTblDBFaTblOra.Parameters.ParamByName('pCod_Cia2').Value := FRegistroDistribucion.Cod_Cia;
  QryTblDBFaTblOra.Parameters.ParamByName('pNro_Proceso2').Value := FRegistroDistribucion.Nro_Proceso;
  QryTblDBFaTblOra.Open;
end;

procedure TDMConversionInicial.Inserto_en_TblORA(cCampo: String);
var
	i: Integer;
	DestFieldName, SourceFieldName: String;
begin
  if TblDBF.FieldByName(cCampo).Value <= FRegistroDistribucion.Fh_Proceso then
  begin
    try
      TblORA.Insert;

      { Resuelvo asignación campoORA = campoDBF }
      for i := 0 to FFieldMapList.Count -1 do
      begin
	  	  DestFieldName := FFieldMapList.Names[i];
  	  	SourceFieldName := FFieldMapList.Values[DestFieldName];
    	  TblORA.FieldByName(DestFieldName).Value := TblDBF.FieldByName(SourceFieldName).Value;
    	end;

      { Resuelvo asignación campoORA = funcion() }
      for i := 0 to FFunctionMapList.Count -1 do
      begin
	  	  DestFieldName := FFunctionMapList.Names[i];
  	  	SourceFieldName := FFunctionMapList.Values[DestFieldName];
    	  TblORA.FieldByName(DestFieldName).Value := EvaluaConversion.EvalString(SourceFieldName);
    	end;

      { Si la empresa no tiene conversion de DBF no necesito este campo }
      if TblORA.FindField('COD_TIPO_ARCHIVO') <> nil then
      	TblORA.FieldByName('COD_TIPO_ARCHIVO').Value := QryTblDBFaTblOraCOD_TIPO_ARCHIVO_DBF.Value;

      TblORA.Post;
      TblDBF.Delete;
    except
      on E:Exception do
      begin
        Application.MessageBox(PChar('Error en Conversion: '+UpperCase(E.Message)),
                               PChar('Gema - Conversion Inicial'),
                               MB_ICONERROR );
        Raise Exception.Create('Error en Conversion: '+UpperCase(E.Message));
      end;
    end;
  end;

end;

procedure TDMConversionInicial.ActualizarBarraProgreso;
begin
  FFrmProgresoConversion.ProgressBar1.Position := FFrmProgresoConversion.ProgressBar1.Position + FFrmProgresoConversion.ProgressBar1.Step;
  Application.ProcessMessages;
end;

procedure TDMConversionInicial.InicializarBarraProgreso(ALeyenda: String; AMax: Integer);
begin
  FFrmProgresoConversion.LConvirtiendoTabla.Caption := ALeyenda+' '+QryTblDBFaTblOraDESCRIPCION.Value;
  FFrmProgresoConversion.ProgressBar1.Max := AMax;
  FFrmProgresoConversion.ProgressBar1.Position := 0;
  ActualizarBarraProgreso;

end;

procedure TDMConversionInicial.Respladar_DBFs;
var
  cTablaAnterior: String;
begin
  TblDBF.Close;
  cTablaAnterior := '';
  QryTblDBFaTblOra.First;
  while not QryTblDBFaTblOra.Eof do
  begin
    TblDBF.TableName := FRegistroDistribucion.Path_Cia+Trim(QryTblDBFaTblOraNOMBRE_TABLA_DBF.Value)+'.DBF';
    if FileExists(TblDBF.TableName) then
      if cTablaAnterior <> TblDBF.TableName then
      begin
	      { Respaldo de la DBF como '.BCK' }
	      InicializarBarraProgreso('Respaldando',100);
  	    Respaldar_TablaDbf(FRegistroDistribucion.Path_Cia+QryTblDBFaTblOraNOMBRE_TABLA_DBF.Value+'.DBF');
	      InicializarBarraProgreso('Respaldando',0);
        cTablaAnterior := TblDBF.TableName;
      end;
    QryTblDBFaTblOra.Next;
  end;

end;

function TDMConversionInicial.Existe_Conversion: Boolean;
begin
  QryExisteConversion.Close;
  QryExisteConversion.Parameters.ParamByName('pCod_Cia').Value := FRegistroDistribucion.Cod_Cia;
  QryExisteConversion.Parameters.ParamByName('pNro_Proceso').Value := FRegistroDistribucion.Nro_Proceso;
  QryExisteConversion.Open;

	if QryExisteConversion.RecordCount > 0 then
		Result := True
  else
		Result := False;

end;

function TDMConversionInicial.Asigna_TipoIndice(
  Indice: String): TApolloTableType;
begin
	if Indice = 'CDX' then
  	result := ttSXFOX
  else
  	result := ttSXNTX;
end;

function TDMConversionInicial.Cliente_LUA: Variant;
begin
	Result := PadL(TblDBF.FieldByName('SECCION').Value,2,'0')+
            PadL(TblDBF.FieldByName('POLIZA').Value,9,'0')+
            PadL(TblDBF.FieldByName('ENDOSO').Value,6,'0');
end;

function TDMConversionInicial.Cliente_CHEVRO: Variant;
begin
	Result := PadL(TblDBF.FieldByName('GRUPO').Value,5,'0')+
            PadL(TblDBF.FieldByName('ORDEN').Value,3,'0')+
            PadL(TblDBF.FieldByName('SOLICITUD').Value,6,'0');

end;

function TDMConversionInicial.Factura_AguasArg: Variant;
begin
  Result := TblDBF.FieldByName('TIPO_COMP').Value+
            TblDBF.FieldByName('NRO_COMP').Value;
end;

end.
