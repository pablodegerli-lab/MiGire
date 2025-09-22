unit UDMPrincipal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, ADODB, UDMGemaConexion, UDMGIREPATH, AdoGenAr, CliCusEx, CliMacEx,
  ADOCtrlP, UGeneral, ApoDSet, ApoEnv, Define, IniFiles, ExtCtrls;
type
  TDMPrincipal = class(TDMGirePath)
    QryDistribuciones: TADOQuery;
    QryDistribucionesEMPRESA: TIntegerField;
    QryDistribucionesPROCESO: TIntegerField;
    QryDistribucionesDESCRIPCION: TStringField;
    QryDistribucionesULTFHPROCESO: TDateTimeField;
    QryDistribucionesABREVIATURA: TStringField;
    QryDistribucionesRAZONSOCIAL: TStringField;
    QryDistribucionesCOPIA_A_TRANSMISION: TStringField;
    QryDistribucionesCOD_MODO: TIntegerField;
    QryDistribucionesPATH_WORK: TStringField;
    QryDistribucionesFH_PROCESO_ANTERIOR: TDateTimeField;
    QryDistribucionesPARAMETRO_DIA_HABIL: TIntegerField;
    QryDistribucionesPROCESO_AU: TBCDField;
    qryAutomatico: TADOQuery;
    QryDistribucionesLOTE_AU: TStringField;
    QryExisteConversion: TADOQuery;
    QryProcesos: TADOQuery;
    QryModos: TADOQuery;
    QryDistribucionesIMPRIME: TBCDField;
    procedure AdoGeneraArchivoGemaExisteArchivo(const Archivo: String;
      var Sigue: Boolean);
  private
    FErrores: String;
    procedure SetErrores(const Value: String);
    function GetLimiteProceso(sNombreServidor:string):integer;
  public
    constructor create (AOwner: TComponent); override;
    destructor destroy; override;
    procedure AdministraAutomatico(pHacer: boolean);
    procedure InsertarAutomatico(pCodCia, pNumProc, pFhDis, pCodArch, pIdLote: string);
    procedure CompletarProceso(pLoteWf, pLote, pStatus, pIdUsr, pIsDel, pIdEnv: string; pFecha: tdate);
    function ControlarSrv(DesactivaTerminal:boolean=False):boolean;
    function LimpiarServidor(pCodArchivo:String):boolean;
    function ControlarPathWorkEmpresa(pPathWork: string):string;
    procedure MarcarProcesoAutomatico(pRes: integer);
    function Existe_Conversion(pCodCia, pNroProc :integer): Boolean;
    function ProcesosRelacionados(pCodCia: integer): integer;
    function Buscar_Modo(pCodCia, pNroProc, pCodMod: integer): integer;
    function ProcesoError: boolean;
    function DesdeINI(Clave: string):string;
    function PermitidoEjecutar(pCodArchivo:String;RegArchivo:String;ServerActivo:boolean=false): Boolean;
    function MarcarProcesoAutomatico2(Estado:Integer): Boolean;
    property Errores: String read FErrores write SetErrores;
//    function Genero_Archivo_Nulo(pCodCia, pNroProc :integer; pCodDiseno:string): Boolean;
  end;

implementation

uses StrUtils, ConvUtils; {uFrmTcp}



{$R *.DFM}

{ TDMPrincipal }

constructor TDMPrincipal.create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  if GemaConexion.ConexionDirecta then
    QryDistribuciones.SQL.Text := StringReplace(QryDistribuciones.SQL.Text,'in (0)','not in (-1,1,2,3)',[rfReplaceAll]);
  QryDistribuciones.Open;

end;

destructor TDMPrincipal.destroy;
begin
  QryDistribuciones.Close;
  inherited;

end;

procedure TDMPrincipal.AdoGeneraArchivoGemaExisteArchivo(
  const Archivo: String; var Sigue: Boolean);
begin
  inherited;
  sigue := True;
end;

procedure TDMPrincipal.InsertarAutomatico(pCodCia, pNumProc, pFhDis, pCodArch, pIdLote: string);
var
  qryAut : TADOQuery;
begin
  qryAut := TADOQuery.Create(Owner);
  try
    qryAut.Connection := GemaConexion.ADOConec2;
    try
      qryAut.SQL.Text := 'select * '+
                       'from GEMA.DISTRIBUCIONES_AUTOMATICO ' +
                       'where COD_CIA = '+pCodCia+' and '+
                            ' COD_ARCHIVO = '+pCodArch+' and '+
                            ' ESTADO_PROCESO = -1';
      qryAut.open;
      if not qryAut.eof then
       begin
        qryAut.Edit;
        qryAut.FieldByName('NRO_PROCESO').Value :=  pNumProc;
        qryAut.FieldByName('FH_DISTRIBUCION').Value := StrToDate(pFhDis);
        qryAut.FieldByName('ID_LOTE').Value := pIdLote;
        qryAut.FieldByName('ESTADO_PROCESO').Value := 0;
        qryAut.Post;
       end
      else
       begin
        qryAut.Close;
        qryAut.SQL.Text := 'insert into GEMA.DISTRIBUCIONES_AUTOMATICO ' +
                            '(COD_CIA, ' +
                            ' NRO_PROCESO, ' +
                            ' FH_DISTRIBUCION, ' +
                            ' COD_ARCHIVO, ' +
                            ' ID_LOTE, ' +
                            ' ESTADO_PROCESO, ' +
                            ' CABECERA_AUXILIAR) ' +           
                            ' values ' +
                            '('+pCodCia+', ' +
                               pNumProc+', ' +
                              'to_date('''+pFhDis+''',''dd/mm/yyyy'')'+', ' +
                               pCodArch+', ''' +
                               pIdLote +''', ' +
                             ' 0 , ' +
                             '(select count(9) from gema.operaciones_'+ StringOfChar('0',5-Length(pCodCia))+ pCodCia+' where NRO_PROCESO_GEMA = '+pCodArch+') )';
      qryAut.ExecSQL;
     end;
   except
    on e:Exception do
    raise  Exception.Create('No se pudo actualizar la tabla DISTRIBUCIONES AUTOMATICO. Error: '+e.Message+#13#10+'Sentencia: '+qryAut.SQL.Text);
   end
  finally
    qryAut.Free;
  end;
end;

function CargarIni(pClave: String; Valor: string=''):string;
var
  ArchConf: TIniFile;
  pTmpDir,
  ClavesIni: string;
  NumeroTerm: String;
  LimiteProc: String;
  Inicio,
  Final : integer;
begin
  pTmpDir := ExtractFileDir(ParamStr(0))+'\'+StringReplace(ExtractFileName(ParamStr(0)),ExtractFileExt(ExtractFileName(ParamStr(0))),'',[rfReplaceAll]);
  ArchConf := TIniFile.Create( pTmpDir +  '.ini' );
  NumeroTerm := ParamStr(1);
  NumeroTerm := StringOfChar('0',3-Length(NumeroTerm))+ NumeroTerm;
  ClavesIni :=    IfThen( NumeroTerm<>'','Gema '+ NumeroTerm,'Gema Todas');
  Result := '';

  try
    if pClave='Empresas' then
      Result := ArchConf.ReadString(ClavesIni, 'Empresas', 'Todas');
    if pClave='Terminal' then
     begin
      Result := ArchConf.ReadString(ClavesIni, 'Terminal', '');
      if 'SRV' + NumeroTerm <> Result then
         ArchConf.WriteString( ClavesIni, 'Terminal', 'SRV' + NumeroTerm);
     end;
    if pClave = 'Limite Proceso' then
     begin
      LimiteProc := Valor;
      Result := ArchConf.ReadString(ClavesIni, 'Limite Proceso', Valor);
      if (LimiteProc <> '') and (LimiteProc <> Result)  then
         ArchConf.WriteString( ClavesIni, 'Limite Proceso', LimiteProc);
     end;

    if pClave = 'Excluir' then
      Result := ArchConf.ReadString(ClavesIni, 'No Procesar', '');
    if pClave = 'Reintentos' then
      Result := IntToStr( ArchConf.ReadInteger('Gema', 'Reintentos', 0) );
    if pClave = 'ArchivoLOG' then
       Result := ArchConf.ReadString(ClavesIni, 'ArchivoLOG', 'c:\Gema_Auto.log');
    if pClave = 'LstReintento' then
     begin
      Inicio := 4;
      Final := Inicio + ArchConf.ReadInteger('Gema', 'Reintentos', 0);
      While Inicio<Final  do
       begin
        Result := Result + ',' + IntToStr(Inicio);
        Inc(Inicio);
       end;
      Result := Result + ')';
     end;
  finally
    ArchConf.Free;
  end;
end;

procedure TDMPrincipal.AdministraAutomatico(pHacer: boolean);
var
  AgregarCondicion,
  Reintentos : string;
begin
  Reintentos := CargarIni('LstReintento');
  AgregarCondicion:='';
  qryAutomatico.Close;
  if pHacer then
   begin
    qryAutomatico.Close;
    if CargarIni('Terminal') <> '' then
      AgregarCondicion:=''
    else
     begin
      if CargarIni('Excluir') <> '' then
        AgregarCondicion:=' and COD_CIA not in ('+ CargarIni('Excluir') +')';
      if CargarIni('Empresas') <> 'Todas' then
        AgregarCondicion:=' and COD_CIA in ('+ CargarIni('Empresas') +')';
     end;
    qryAutomatico.SQL.Text := 'select * from GEMA.DISTRIBUCIONES_AUTOMATICO where ESTADO_PROCESO in (0' + Reintentos + AgregarCondicion;
    qryAutomatico.Open;
   end;
end;

procedure TDMPrincipal.MarcarProcesoAutomatico(pRes: integer);
var
  Tope: integer;
  MsjTemp : string;
  st: TSystemTime;

begin
Windows.GetSystemTime(st);
MsjTemp := 'INIT MarcarProcesoAutomatico EST:' + IntToStr(pRes) + ' ms:' + IntToStr(st.wMilliseconds);
GemaConexion.GrabarLog(MsjTemp);

  try
      qryAutomatico.Edit;
      Tope := 3 + StrToInt( CargarIni('Reintentos') );
      if pRes = 3 then
       begin
        if qryAutomatico.FieldByName('ESTADO_PROCESO').Value > 3 then
          pRes := qryAutomatico.FieldByName('ESTADO_PROCESO').Value - 1;
        if qryAutomatico.FieldByName('ESTADO_PROCESO').Value < 3 then
          pRes := Tope;
       end;
      if pRes = 2 then
        qryAutomatico.FieldByName('HORA_FIN').value :=  FormatDateTime('hh:mm:ss',now);

      if pRes = 1 then
       begin
        qryAutomatico.FieldByName('HORA_INICIO').value :=  FormatDateTime('hh:mm:ss',now);
        if qryAutomatico.FieldByName('ESTADO_PROCESO').Value > 1 then
          pRes :=  qryAutomatico.FieldByName('ESTADO_PROCESO').Value;
       end;
      qryAutomatico.FieldByName('ESTADO_PROCESO').Value := pRes;
      qryAutomatico.Post;
  except
  end;

Windows.GetSystemTime(st);
MsjTemp :=   'FIN MarcarProcesoAutomatico ms:' +
  IntToStr(st.wMilliseconds);
GemaConexion.GrabarLog(MsjTemp);
end;

function TDMPrincipal.ProcesoError: boolean;
begin
  Result := False;
  if qryAutomatico.FieldByName('ESTADO_PROCESO').Value = 3 then
    Result := True;
end;

procedure TDMPrincipal.CompletarProceso(pLoteWf, pLote, pStatus, pIdUsr, pIsDel, pIdEnv: string; pFecha: TDate);
var
  qryAut : TADOQuery;
begin
  qryAut := TADOQuery.Create(Owner);
  try
    qryAut.Connection := GemaConexion.ADOConec;
    qryAut.SQL.Text := 'update AFIP_FE.FE_LOTE'+
                       ' set WF_STATUS = ''50'','+
                       '     AUD_USER_UPDATE = ''GEMAFE'','+
                       '     AUD_DATE_UPDATE = '''+ FormatDateTime('yyyy-mm-dd hh:mm:ss',pFecha)+'''' +
                       ' where ID_LOTE  = '''+pLote+'''';
    qryAut.ExecSQL;
    qryAut.Close;
    qryAut.SQL.Text := 'insert into AFIP_FE.FE_LOTE_WF ' +
                            '(ID_LOTE_WF, ' +
                            ' ID_LOTE, ' +
                            ' WF_STATUS, ' +
                            ' WF_DATE, ' +
                            ' WF_TIME, ' +
                            ' AUD_USER_INSERT, ' +
                            ' AUD_DATE_INSERT, ' +
                            ' ID_USER, ' +
                            ' IS_DELETED, ' +
                            ' ID_ENV) ' +
                            ' values ' +
                            '(AFIP_FE.NewId, ' +
                               ''''+pLote+''', ' +
                               ''''+pStatus+''', ' +
                               ''''+FormatDateTime('yyyy-mm-dd',pFecha)+''', ' +
                               ''''+FormatDateTime('hh:mm:ss',pFecha)+''', ' +
                               ''''+pIdUsr+''', ' +
                               ''''+FormatDateTime('yyyy-mm-dd',pFecha)+'' + ' ' + ''+FormatDateTime('hh:mm:ss',pFecha)+''', ' +
                               ''''+pIdUsr+''', ' +
                               ''''+pIsDel+''', ' +
                               ''''+pIdEnv +''')';
    qryAut.ExecSQL;
  finally
    qryAut.Free;
  end;
end;

function TDMPrincipal.Existe_Conversion(pCodCia, pNroProc :integer): Boolean;
begin
  QryExisteConversion.Close;
  QryExisteConversion.Parameters.ParamByName('pCod_Cia').Value := pCodCia;
  QryExisteConversion.Parameters.ParamByName('pNro_Proceso').Value := pNroProc;
  QryExisteConversion.Open;

	result :=  (not QryExisteConversion.eof);


end;


function TDMPrincipal.ProcesosRelacionados(pCodCia: integer): integer;
begin

  try
    QryProcesos.Close;
    QryProcesos.Parameters.ParamByName('pCod_Cia').Value := pCodCia;
    QryProcesos.Open;
   	Result := QryProcesos.FieldByName('PROCESOS').AsInteger;
  except
    Result := 1;
  end;

end;

function TDMPrincipal.DesdeINI(Clave: string): string;
begin
  Result := CargarIni(Clave);
end;

function TDMPrincipal.Buscar_Modo(pCodCia, pNroProc, pCodMod: integer): integer;
begin

  try
    QryModos.Close;
    QryModos.Parameters.ParamByName('pCod_Cia').Value := pCodCia;
    QryModos.Parameters.ParamByName('pNro_Proceso').Value := pNroProc;
    QryModos.Open;
    if QryModos.RecordCount = 1 then
   	  Result := QryModos.FieldByName('COD_MODO').AsInteger
    else
      Result :=  pCodMod;
  except
    Result := 0;
  end;
end;

function TDMPrincipal.ControlarPathWorkEmpresa(pPathWork: string):string;
begin
  Result := pPathWork;
  try
    if not DirectoryExists( pPathWork ) then
      if not ForceDirectories(pPathWork ) then
        Raise Exception.Create('Imposible crear el directorio especificado') ;
  except
   on e: exception do
     Result := 'No está parametrizado el path de la empresa ->'+e.Message
  end;
end;

function TDMPrincipal.MarcarProcesoAutomatico2(Estado:Integer): Boolean;
var
MsjTemp : string;
st: TSystemTime;

begin

Windows.GetSystemTime(st);
MsjTemp := 'INIT MarcarProcesoAutomatico2 ms:' + IntToStr(st.wMilliseconds);
GemaConexion.GrabarLog(MsjTemp);

    try
      GemaConexion.ADOConec.BeginTrans;
      MarcarProcesoAutomatico(Estado);
      GemaConexion.ADOConec.CommitTrans;
      Result := True;
    except
      GemaConexion.ADOConec.RollbackTrans;
      Result := False;
      MsjTemp :=   MsjTemp +  #13#10 + 'MarcarProcesoAutomatico2 ' +
        'Salio por RollbackTrans';
      GemaConexion.GrabarLog(MsjTemp);
    end;

Windows.GetSystemTime(st);
MsjTemp :=   'MarcarProcesoAutomatico2 ' + 'FIN ms:' + IntToStr(st.wMilliseconds);
GemaConexion.GrabarLog(MsjTemp);
end;

function TDMPrincipal.PermitidoEjecutar(pCodArchivo:String;RegArchivo:String;ServerActivo:boolean=false): Boolean;
var
  QueryTemp: TADOQuery;
  ADOEstados: TADOCommand;
  lControl: Boolean;
  Contador: integer;
  FormInfo: TForm;
  TextoInfo: TPanel;
  TextoTime: TPanel;
  PanelFondo: TPanel;
  NombreArchivo: String;
  NroEmp: Integer;
  NombreSrv: String;
  RegMaxArchivo: String;

  MsjTemp : String;
  st: TSystemTime;
begin
  Windows.GetSystemTime(st);
  MsjTemp := 'INIT PermitidoEjecutar ms:' + IntToStr(st.wMilliseconds) ;
  GemaConexion.GrabarLog(MsjTemp);

  FormInfo := nil;
  TextoTime := nil;
  lControl := True;
  Contador := 0;
  Result := True;
  NombreSrv := CargarIni('Terminal');
  RegMaxArchivo := CargarIni('Limite Proceso', intToStr(GetLimiteProceso(NombreSrv)));
  ADOEstados := TADOCommand.Create(Self);

  try
    try
      ADOEstados.Connection := GemaConexion.ADOConec;
      GemaConexion.ADOConec.BeginTrans;


      ADOEstados.CommandType := cmdText;
      ADOEstados.CommandText := 'Lock Table GEMA.DISTRIBUCIONES_AU_ESTADO_SRV in Exclusive Mode NoWait';

      while lControl do
      begin
        try
          ADOEstados.Execute;
          lControl := False;
        except
          if Contador = 0 then
          begin
            FormInfo := TForm.Create(Application);
            FormInfo.Width := 300;
            FormInfo.Height := 100;
            FormInfo.FormStyle := fsStayOnTop;
            FormInfo.Position := poScreenCenter;
            FormInfo.BorderStyle := bsNone;
            PanelFondo := TPanel.Create(FormInfo);
            PanelFondo.Parent := FormInfo;
            PanelFondo.BorderStyle := bsSingle;
            PanelFondo.Align := alClient;
            PanelFondo.BorderWidth := 4;
            PanelFondo.Color := clRed;
            TextoInfo := TPanel.Create(PanelFondo);
            TextoInfo.Parent := PanelFondo;
            TextoInfo.Height := 50;
            TextoInfo.Font.Size := 10;
            TextoInfo.Font.Style := [fsBold];
            TextoInfo.BevelInner := bvLowered;
            TextoInfo.Caption := 'Intentando bloquear la tabla DISTRIBUCIONES_AU_ESTADO_SRV';
            TextoInfo.Align := alTop;
            TextoInfo.Color := clAqua;
            TextoTime := TPanel.Create(PanelFondo);
            TextoTime.Parent := PanelFondo;
            TextoTime.Height := 50;
            TextoTime.Font.Size := 10;
            TextoTime.Font.Style := [fsBold];
            TextoTime.BevelInner := bvLowered;
            TextoTime.Align := alBottom;
            TextoTime.Color := clAqua;
            FormInfo.Show;
          end;

          TextoTime.Caption := 'Tiempo transcurrido : ' + IntToStr(Contador) + ' segundos.';
          FormInfo.Refresh;
          sleep(1000);
          Inc(Contador);

          if contador > 15 then
          begin
            lControl := False;
            Result := False;
          end;
        end;
      end;

      if FormInfo <> nil then
      begin
        FormInfo.Close;
        FormInfo.Free;
      end;

      //LABL Si es tcpIp=1 y se trata de un archivo grande, no lo tomamos.
      //en lugar de RegMaxArchivo deberíamos usar DISTRIBUCIONES_AU_EST_SRV.LIMITE_PROCESO
      //result := not ((RegArchivo > RegMaxArchivo) and  FrmTCP.EsServidorActivo);
      if result then 
        result := not ((RegArchivo > RegMaxArchivo) and  ServerActivo);

      if (Result) then
      begin
        QueryTemp := TADOQuery.Create(nil);

        try
          QueryTemp.Connection := GemaConexion.ADOConec;
          QueryTemp.SQL.Text := ' select distinct DA.COD_CIA, DA.COD_ARCHIVO, case when da.id_lote = 0 then '''' else CNA.NOMBRE_ARCHIVO end as NOMBRE_ARCHIVO, DA.ID_LOTE '+
                                ' from GEMA.DISTRIBUCIONES_AUTOMATICO DA, GIRE.CONVERSION_NOMBRE_ARCHIVO CNA '+
                                ' Where DA.COD_ARCHIVO = ' + pCodArchivo +
                                ' and (case when da.id_lote = 0 then 1 else DA.COD_ARCHIVO end) = '+
                                '     (case when da.id_lote = 0 then 1 else CNA.COD_ARCHIVO end) '+
                                ' and DA.ESTADO_PROCESO <> 2 ';
          QueryTemp.Open;

          if QueryTemp.Eof then
            Result := False
          else
            begin
              if (trim(QueryTemp.FieldByName('ID_LOTE').asString) = '0') and
                 (trim(QueryTemp.FieldByName('COD_ARCHIVO').asString) <> '') then
                //LABL en el caso de no ser FE y procesarse por GEMA_AU utilizamos el cod_archivo como si fuera NombreArchivo
                NombreArchivo := QueryTemp.FieldByName('COD_ARCHIVO').asString
              else
                NombreArchivo :=  QueryTemp.FieldByName('NOMBRE_ARCHIVO').AsString;

              NroEmp :=  QueryTemp.FieldByName('COD_CIA').AsInteger;
            end;

          if (Result) then
          begin
            // Controla si ya no se esta procesando ese archivo
            QueryTemp.Close;
            QueryTemp.SQL.Text := 'Select * From GEMA.DISTRIBUCIONES_AU_ESTADO_SRV '
                                 + 'Where ARCHIVO_PROCESO = ''' + NombreArchivo + '''';
            QueryTemp.Open;

            if not QueryTemp.Eof then
              Result := False;
          end;

          if (Result) then
          begin
          if ((RegArchivo > RegMaxArchivo) {or (RegArchivo = '0')}) then
            begin
              QueryTemp.Close;
              QueryTemp.SQL.Text := 'Select Count(1) As DISPONIBLES From GEMA.DISTRIBUCIONES_AU_ESTADO_SRV '
                + 'Where TERMINAL_HABILITADA = 1 And TERMINAL_ACTIVA = 1 And TIPO_PROCESO = 0';
              QueryTemp.Open;

              if QueryTemp.FieldByName('DISPONIBLES').AsInteger < 2 then
                Result := False;
            end;
          end;

          if Result then
          begin
            QueryTemp.Close;
            QueryTemp.SQL.Text := 'Update GEMA.DISTRIBUCIONES_AU_ESTADO_SRV Set INICIO_PROCESO = SYSDATE, TIPO_PROCESO = '
              + IntToStr(integer(RegArchivo > RegMaxArchivo))
              + ', COD_CIA = ' + IntToStr(NroEmp)

              + ', ARCHIVO_PROCESO = ''' + NombreArchivo + ''''
              + ', CANTIDAD_REGISTROS = ' + RegArchivo
              + ' Where TERMINAL = ''' + NombreSrv +'''';

            //LABL agregamos la cantidad de registros insertados (RegArchivo ya viene cargada)
            QueryTemp.ExecSQL;
            MarcarProcesoAutomatico(1);
          end;
        finally
          QueryTemp.Free;
        end;
      end;
      GemaConexion.ADOConec.CommitTrans;
    except
      GemaConexion.ADOConec.RollbackTrans;
      MsjTemp :=   'PermitidoEjecutar Salio por RollbackTrans';
      GemaConexion.GrabarLog(MsjTemp);
    end;
  finally
    ADOEstados.Free;
  end;

Windows.GetSystemTime(st);
MsjTemp :=   'FIN PermitidoEjecutar ms:' +
  IntToStr(st.wMilliseconds);
GemaConexion.GrabarLog(MsjTemp);
end;

function TDMPrincipal.ControlarSrv(DesactivaTerminal:boolean=False): boolean;
var
  QueryTemp: TADOQuery;
  NombreSrv : String;
begin
  Result := True;
  QueryTemp := TADOQuery.Create(nil);
  NombreSrv := CargarIni('Terminal');
  try
    try
      QueryTemp.Connection := GemaConexion.ADOConec;
      QueryTemp.SQL.Text := 'Select TERMINAL_HABILITADA,  TERMINAL_ACTIVA, LIMITE_PROCESO From GEMA.DISTRIBUCIONES_AU_ESTADO_SRV '
                          + 'Where  TERMINAL='''+ NombreSrv +'''';
      QueryTemp.Open;

      if QueryTemp.Eof then
       begin
        Errores := 'No se encontro el servidor en la tabla de parametros.';
        Result := False;
       end;
      if Result and (QueryTemp.FieldByName('TERMINAL_HABILITADA').AsInteger = 0) then
       begin
        Errores := 'No está habilitado el servidor en la tabla de parametros.';
        Result := False;
       end;
      if not DesactivaTerminal then
        if Result  and (QueryTemp.FieldByName('TERMINAL_ACTIVA').AsInteger = 1) then
         begin
            Errores := 'Este nombre de terminal ya esta ejecutandose en otro servidor.';
            Result := False;
         end;
       if Result then
        begin
           if Errores = '' then
            begin
            CargarIni('Limite Proceso', QueryTemp.FieldByName('LIMITE_PROCESO').Value);
            QueryTemp.Close;
            QueryTemp.SQL.Text := 'Update GEMA.DISTRIBUCIONES_AU_ESTADO_SRV Set TERMINAL_ACTIVA =  '+ IfThen(DesactivaTerminal,'0','1')
                              + ' Where TERMINAL ='''+ NombreSrv +'''';

            QueryTemp.ExecSQL;
            end;
        end;
    except
      on e: exception do
      begin
         Result := False;
         Errores := e.message;
      end;
    end;
  finally
    QueryTemp.Free;
  end;
end;

procedure TDMPrincipal.SetErrores(const Value: String);
begin
  FErrores := Value;
end;

function TDMPrincipal.LimpiarServidor(pCodArchivo: String): boolean;
var
  QueryTemp: TADOQuery;
  NombreSrv : String;
begin
  Result := True;
  QueryTemp := TADOQuery.Create(nil);
  NombreSrv := CargarIni('Terminal');
  try
    try
      QueryTemp.Connection := GemaConexion.ADOConec;
      QueryTemp.SQL.Text := 'Update GEMA.DISTRIBUCIONES_AU_ESTADO_SRV Set TIPO_PROCESO =  0, INICIO_PROCESO = null, ARCHIVO_PROCESO = null, COD_CIA = null, CANTIDAD_REGISTROS = null '
                          + ' Where TERMINAL ='''+ NombreSrv +'''';
      QueryTemp.ExecSQL;
    except
       Result := False;
    end;
  finally
    QueryTemp.Free;
  end;


end;

function TDMPrincipal.GetLimiteProceso(sNombreServidor: string): integer;
var qLimite:TADOQuery;
begin
  try
    try
      qLimite := TADOQuery.create(nil);
      with qLimite do
      begin
        connection := GemaConexion.ADOConec;
        sql.Clear;
        sql.add(' select LIMITE_PROCESO ');
        sql.add(' from GEMA.DISTRIBUCIONES_AU_ESTADO_SRV ');
        sql.add(' where trim(TERMINAL) = ' + QuotedStr(trim(sNombreServidor)));
        sql.add(' and TERMINAL_HABILITADA = 1 ');        
        open;
        if recordCount = 1 then
          result := fieldByName('LIMITE_PROCESO').asInteger
        else
          result := 99999;
        close;
      end;
    except
      on e:Exception do
        raise Exception.create(e.message);
    end;
  finally
    FreeAndNil(qLimite);
  end;
end;

end.

