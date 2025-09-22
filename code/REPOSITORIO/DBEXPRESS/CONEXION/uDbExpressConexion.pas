{                   Ayuda para el uso de la conexión

Version 8.2

 La conexión necesita para trabajar seguir estos pasos:

 1.Heredar desde el repositorio el DataModule de conexion.
 2.Usar desde el repositorio el formulario de Login.
 3.Usar desde el repositorio el formulario de Cambio de Password.

 Escribir en nuestro proyecto lo siguiente para que la conexion sea lo primero a crear:

  Application.Initialize;                               donde
  try                                                    MyConexion es el nombre que el Prog.
   myConexion:=T????Conexion.Create(application);        le de a la conexion
   if Myconexion.ADOConec.Connected then                 T????Conexion es el nombre que el
   ..                                                    Prog. le de a la conexion que heredó
   ..                                                    por ejemplo:
  finally                                                si le puso SistemaConexion la clase
    MyConexion.Free;                                     se crea asi TSistemaConexion.create
  end;

 La conexion tiene las siguiente propiedades:
  NombreUsuario       : Contiene el nombre del usuario que ingreso al sistema.
  ClaveUsuario        : Contiene la clave del usuario
  Ambito              : A que entorno se conecto el usuario
  CreaArchivoINI      : Esta en falso  por defecto, si se lo activa creara y usara un archivo
                        de inicio
  NombreArchivoINI    : Si esta activada la propiedad anterior, en esta se puede setear
                        el nombre del archivo de inicio, o sino usara el nombre por defecto
                        que es giretmp.ini
  DirectorioTemporales: Si esta activada la propiedad CrearArchivoINI, en esta se puede setear
                        el nombre del archivo del directorio donde se grabaran los temp que
                        genere la aplicacion, sino usara el nombre del directorio corriente.
  DirectorioArchivoINI: Si esta activada la propiedad CrearArchivoINI, seteara el directorio donde
                        dejara el archivo INI, sino usara C:\GIRE.
  AsignaRoles         : Esta en verdadero por defecto, por lo tanto utilizara la asignacion de Roles
                        en ejecucion. Pedir al DBA que asigne los roles y las claves
                        correspondientes para el acceso del usuario
  ConexionDirecta     : Esta en falso por defecto, si se activa la aplicacion se conectara
                        automaticamente a la base de datos sin solicitar usuario y clave.
                        Todos los datos se asignaran en ejecucion sobre las propiedades
                        de usuario(NombreUsuario, ClaveUsuario, Ambito.
  Proveedor           : Asigna el driver que utilizará para conectarse, por defecto utiliza
                        el OleDB de Oracle 8i.
  ClaveAplicacion     : Asigna el nombre de aplicacion para activar unicamente los roles de ejecución de esa.
                        por defecto usa el nombre del ejecutable.

  }
unit uDbExpressConexion;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  stdctrls, registry, Db, ADODB, DBTables, FileCtrl, inifiles, define, setearol,
  DBXpress, FMTBcd, SqlExpr, DBClient, Provider;

resourcestring
  SEstadoPrim = 'OPEN';
  SEstadoExpi = 'EXPIRED';
  SEstadoExpG = 'EXPIRED(GRACE)';
  SEstadoLock = 'LOCKED';
  SEstadoExpLockT = 'EXPIRED & LOCKED(TIMED)';
  SEstadoExpGLockT = 'EXPIRED(grace) & LOCKED(TIMED)';
  SEstadoExpLock = 'EXPIRED & LOCKED';
  SEstadoExpGLock = 'EXPIRED(GRACE) & LOCKED';

const
    { Driver Properties }
    _DProperties = 'Driver Properties';
    _DriverName = 'Oracle';
    _GetDriverFunc = 'getSQLDriverORACLE';
    _LibraryName = 'dbexpora.dll';
    _ConnectionName = 'GIRE';
    _VendorLib = 'oci.dll';
    _LoginPrompt = 'False';

    { Driver Params }
    _DParams = 'Driver Params';
    _RowsetSize = '20';
    _BlobSize = '-1';
    _ErrorResourceFile = '';
    _LocaleCode = '0000';
    _OracleTransIsolation = 'ReadCommited';
    _OSAuthentication = 'False';
    _MultipleTransaction = 'False';
    _TrimChar = 'False';

    { Ini Driver Location }
    _DirectorioDBXIni : Array [0..1] of String = ('T:\DEVELOP\DELPHI7\DBEXPRESS\','V:\PRODUC\EXES\DBEXPRESS\');
    _ArchivoDBXIni = 'DbExpress.ini';

    { URL SrvClaves }
    _URL = '';

type
  TDbExpressConexion = class(TDataModule)
    SQLConnect: TSQLConnection;
    SQLDataSet: TSQLDataSet;
    DataSetProvider: TDataSetProvider;
    ClienteDataSet: TClientDataSet;
    SQLMonitor: TSQLMonitor;
    procedure ConexionDestroy(Sender: TObject);
    procedure ConexionCreate(Sender: TObject);
  private
    ClaveFin: boolean;
    MsgError: string;
    CambioClave: string;
    FClaveUsuario: string;
    FNombreUsuario: string;
    FNombreArchivoINI: string;
    FDirectorioTemporales: string;
    FCreaArchivoINI: Boolean;
    FAsignaRoles: Boolean;
    FConexionDirecta: Boolean;
    Salida: boolean;
    FNombreProveedor: string;
    FProveedor: string;
    FDirectorioArchivoINI: string;
    FClaveAplicacion: string;
    SeteaRoles: TSeteaRoles;
    function VerificaTitulo(Aplicacion: string): string;
    function VerificaStringConexion(Server: string): string;
  protected
    FUsaUsuarioParams: Boolean;
  public
    Ambito,
      TituloSeccion: string;
    ListaRoles: tstringlist;

    constructor Create(AOwner: TComponent); override;

    procedure AbrirConexion(ACon: TSQLConnection);
    procedure VerificaVidaContrase(pUser, pPassw, pServer: String);
    procedure VerificaConexion(Usuario: string; Clave: string; Entorno: string);
    procedure BuscaArchivos(Directorio, Mascara: AnsiString; var ListaNombreArchs: TStringList; Recursivo: Boolean);
    procedure CargaDesdeINI(var pUsuario: string; var pEntorno: string);
    procedure GrabarArchINI(pUsuario, pEntorno: string);
    procedure CreoParamsConect(var Connect: TSQLConnection; pUser, pPassw, pServer: String);

    function VerificaINI(Sender: TObject): boolean;
    function CargaTNSNames(var TNSName: TComboBox): boolean;
    function BuscaEnRegistro: string;
    function GetURLIni:String;


    property NombreProveedor: string read FNombreProveedor write FNombreProveedor;
    property ClaveUsuario: string read FClaveUsuario write FClaveUsuario;
    property ClaveAplicacion: string read FClaveAplicacion write FClaveAplicacion;
    property NombreUsuario: string read FNombreUsuario write FNombreUsuario;
    property NombreArchivoINI: string read FNombreArchivoINI write FNombreArchivoINI;
    property DirectorioTemporales: string read FDirectorioTemporales write FDirectorioTemporales;
    property DirectorioArchivoINI: string read FDirectorioArchivoINI write FDirectorioArchivoINI;
    property CreaArchivoINI: Boolean read FCreaArchivoINI write FCreaArchivoINI default False;
    property AsignaRoles: Boolean read FAsignaRoles write FAsignaRoles default True;
    property ConexionDirecta: Boolean read FConexionDirecta write FConexionDirecta default False;
    property Proveedor: string read FProveedor write FProveedor;

  end;

implementation

uses uFrmGireLogin, uFrmGIRECambioPasw;
{$R *.DFM}

function VerificaDirectorio(const pDir: string): string;
begin
  if (pDir <> '') and (pDir[Length(pDir)] <> '\') then
    Result := pDir + '\'
  else
    Result := pDir;
end;

procedure TDbExpressConexion.AbrirConexion(ACon: TSQLConnection);
begin
  SeteaRoles := TSeteaRoles.Create;
  with SeteaRoles do
  try
    NombreSistema := ClaveAplicacion;
    Usuario := NombreUsuario;
    Clave := ClaveUsuario;
    Ejecutar(ACon);
  finally
    free;
  end;
end;

function TDbExpressConexion.VerificaStringConexion(Server: string): string;
var
  ParamString: string;
begin
  ParamString := FNombreProveedor;
  if ParamString = '' then
    ParamString := 'Provider=' + FProveedor + ';';
  if Pos('data source', LowerCase(ParamString)) = 0 then
    ParamString := ParamString + 'Data Source = ' + Server + '; ';
  if Pos('persist security info', LowerCase(ParamString)) = 0 then
    ParamString := ParamString + 'Persist Security Info=False;';
  result := ParamString + ';Extended Properties="DistribTX=0"';
end;

procedure TDbExpressConexion.ConexionDestroy(Sender: TObject);
begin
  salida := true;
  GrabarArchINI(NombreUsuario, Ambito);
  ListaRoles.Free;
end;

function TDbExpressConexion.VerificaTitulo(Aplicacion: string): string;
begin
  if Pos(' (', Aplicacion) <> 0 then
    Aplicacion := copy(Aplicacion, 1, Pos(' (', Aplicacion));
  result := Aplicacion;
end;

procedure TDbExpressConexion.VerificaConexion(Usuario, Clave, Entorno: string);

  procedure CambiarClave;
  var
    CambioPasw: TFrmGIRECambioPasw;
  begin
    CambioPasw := TFrmGIRECambioPasw.Create(Owner);
    try
      CambioPasw.GireEnlace := Self;
      CambioPasw.ShowModal;
    except
      raise Exception.Create('No se pudo mostrar el formulario.');
    end;
    CambioPasw.Free;
  end;

var
    Server: string;
begin
  Application.Title := VerificaTitulo(Application.Title);
  if UpperCase(Trim(Entorno)) = 'PRODUCCION' then
    Server := 'DBGire'
  else if UpperCase(Trim(Entorno)) = 'DESARROLLO' then
  begin
    Application.Title := Application.Title + ' (' + entorno + ')';
    Server := 'Test8i';
  end
  else if UpperCase(Trim(Entorno)) = 'TEST(GALILEO)' then
  begin
    Application.Title := Application.Title + ' (' + entorno + ')';
    Server := 'GaliTest';
  end
  else
    Server := entorno;
  try
    Ambito := Entorno;
    CreoParamsConect(SQLConnect, Usuario, Clave, Server);
    VerificaVidaContrase(Usuario, Clave, Server);
    if ClaveFin then
      if MessageBox(application.Handle, PChar(msgerror + #13#10 + 'Se recomienda cambiar la clave de ingreso'), PChar(application.title), 49) = 1 then
        CambiarClave;
  except
    on e: exception do
      raise Exception.Create('Usuario o clave incorrecta.' + #13#10 + e.Message);
  end;
end;

procedure TDbExpressConexion.GrabarArchINI(pUsuario, pEntorno: string);
var
  ArchivoINI: TIniFile;
begin
  if CreaArchivoINI then
  begin
    DirectorioTemporales := VerificaDirectorio(DirectorioTemporales);
    DirectorioArchivoINI := VerificaDirectorio(DirectorioArchivoINI);
    ArchivoIni := TIniFile.Create(DirectorioArchivoINI + NombreArchivoINI);
    try
      if Salida then
        CambioClave := CambioClave + DateTimeToStr(Date + time) + ' -> OK';
      ArchivoIni.WriteString(TituloSeccion, 'Usuario', pUsuario);
      ArchivoIni.WriteString(TituloSeccion, 'Entorno', pEntorno);
      ArchivoIni.WriteString(TituloSeccion, 'DirectorioTemporales', DirectorioTemporales);
      ArchivoIni.WriteString(TituloSeccion, 'Driver', FNombreProveedor);
      if pUsuario <> '' then
        ArchivoIni.WriteString('Usuarios ' + TituloSeccion, pUsuario, CambioClave);
    finally
      ArchivoIni.Free;
    end;
  end;
end;

procedure TDbExpressConexion.CargaDesdeINI(var pUsuario: string; var pEntorno: string);
var
  ArchivoIni: TIniFile;
begin
  if CreaArchivoINI then
  begin
    ArchivoIni := TIniFile.Create(DirectorioArchivoINI + NombreArchivoINI);
    try
      pUsuario := ArchivoIni.ReadString(TituloSeccion, 'Usuario', '');
      pEntorno := ArchivoIni.ReadString(TituloSeccion, 'Entorno', '');
      FNombreProveedor := ArchivoIni.ReadString(TituloSeccion, 'Driver', '');
      if pUsuario <> '' then
        CambioClave := ArchivoIni.ReadString('Usuarios ' + TituloSeccion, pUsuario, '');
      if pos('OK', CambioClave) = 0 then
        ArchivoIni.WriteString('Salidas erroneas de ' + TituloSeccion, CambioClave + '-- Usuario', pUsuario);
      CambioClave := 'Ing: ' + DateTimeToStr(Date + time) + ' - Sal: ';
    finally
      ArchivoIni.Free;
    end;
  end;
end;

constructor TDbExpressConexion.Create(AOwner: TComponent);
var
  FArchivoINI: string;
  FrmGIRELogin: TFrmGIRELogin;
begin
  inherited;
  FAsignaRoles := True;
  TituloSeccion := application.title;
  if VerificaINI(AOwner) then
    FArchivoINI := DirectorioArchivoINI + NombreArchivoINI;
  if ConexionDirecta then
  begin
    try
      VerificaConexion(NombreUsuario, ClaveUsuario, ambito);
      AbrirConexion(SQLConnect);
    except
      raise Exception.Create('Faltan parametros para la conexion');
    end;
  end
  else
  begin
    FrmGIRELogin := TFrmGIRELogin.Create(AOwner, SQLConnect, Self, SeteaRoles );
    FrmGIRELogin.lblGetBase.Caption := 'DBExpress';
    FrmGIRELogin.ShowModal;
    NombreUsuario := FrmGIRELogin.EdUsuario.Text;
    ClaveUsuario := FrmGIRELogin.EdPassword.Text;
    Ambito := FrmGIRELogin.cboAmbito.Text;
    FrmGIRELogin.Free;
  end;
end;

procedure TDbExpressConexion.ConexionCreate(Sender: TObject);
begin
  FUsaUsuarioParams := False;
  salida := false;
  ClaveAplicacion := UpperCase(ExtractFileName(StringReplace(ParamStr(0), ExtractFileExt(ParamStr(0)), '', [rfReplaceAll])));
  NombreArchivoINI := 'GIRETMP.INI';
  Proveedor := 'DbExpress';
  DirectorioTemporales := VerificaDirectorio(GetCurrentDir);
  DirectorioArchivoINI := 'C:\GIRE';
end;

function TDbExpressConexion.VerificaINI(Sender: TObject): boolean;

  function GrabarINI(FDirectorioArchivo: string): boolean;
  var
    ArchivoINI: TIniFile;
  begin
    result := true;
    ArchivoIni := TIniFile.Create(FDirectorioArchivo);
    try
      application.Title;
      ArchivoIni.WriteString(TituloSeccion, 'Usuario', '');
      ArchivoIni.WriteString(TituloSeccion, 'DirectorioTemporales', DirectorioTemporales);
      ArchivoIni.WriteString(TituloSeccion, 'Entorno', '');
    except
      result := false
    end;
    ArchivoIni.Free;
  end;

var
  Archivo: string;
begin
  result := true;
  if CreaArchivoINI then
  begin
    Archivo := ExtractFileName(NombreArchivoINI);
    DirectorioTemporales := VerificaDirectorio(DirectorioTemporales);
    if not DirectoryExists(DirectorioTemporales) then
      if not CreateDir(DirectorioTemporales) then
        result := false;
    SetCurrentDir(DirectorioTemporales);
    DirectorioArchivoINI := VerificaDirectorio(DirectorioArchivoINI);
    if not DirectoryExists(DirectorioArchivoINI) then
      if not CreateDir(DirectorioArchivoINI) then
        result := false;
    if not FileExists(DirectorioArchivoINI + Archivo) then
      if not GrabarINI(DirectorioArchivoINI + Archivo) then
        result := false;
  end
  else
    result := false;
end;

function TDbExpressConexion.CargaTNSNames(var TNSName: TComboBox): boolean;
var
  ArchTNS: TextFile;
  Linea: string;
  Archivos: TStringList;
  i: integer;
begin
  result := true;
  Archivos := TStringList.Create;
  try
    TNSName.Clear;
    BuscaArchivos(BuscaEnRegistro, 'TNSNAMES.ORA', Archivos, true);
    for i := 0 to Archivos.Count - 1 do
    begin
      AssignFile(ArchTNS, Archivos.Strings[i]);
      Reset(ArchTNS);
      while not Eof(ArchTNS) do
      begin
        Readln(ArchTNS, Linea);
        if (pos('.WORLD', Linea) > 0) or ((pos('(', Linea) = 0) and (pos('=', Linea) > 0)) then
        begin
          if (pos('DBGIRE', UpperCase(Linea)) > 0) and (pos('TEST', UpperCase(Linea)) = 0) then
            Linea := 'PRODUCCION =';
          if (pos('TEST8I', UpperCase(Linea)) > 0) then
            Linea := 'DESARROLLO =';
          if (pos('GALITEST', UpperCase(Linea)) > 0) then
            Linea := 'TEST(Galileo) =';
          if (pos('.', Linea) > 0) then
            TNSName.Items.Add(copy(linea, 1, pos('.', Linea) - 1))
          else
            TNSName.Items.Add(copy(linea, 1, pos('=', Linea) - 1));
        end;
      end;
      CloseFile(ArchTNS);
    end;
  except
    Exception.Create('No se pudo procesar el archivo de configuración.');
  end;
  Archivos.free;
end;

function TDbExpressConexion.BuscaEnRegistro: string;
var
  Registro: TRegistry;
begin
  result := ' ';
  Registro := TRegistry.Create;
  try
    Registro.RootKey := HKEY_LOCAL_MACHINE;
    if Registro.OpenKey('\Software\ORACLE\ALL_HOMES', True) then
      result := Registro.ReadString('LAST_HOME');
    if Registro.OpenKey('\Software\ORACLE\HOME' + result, True) then
      result := Registro.ReadString('ORACLE_HOME');
  finally
    Registro.CloseKey;
    Registro.Free;
  end;
end;

procedure TDbExpressConexion.BuscaArchivos(Directorio, Mascara: AnsiString;
  var ListaNombreArchs: TStringList; Recursivo: Boolean);
var
  srRes: TSearchRec;
  iFound: Integer;
begin
  if (Recursivo) then
  begin
    if Directorio[Length(Directorio)] <> '\' then
      Directorio := Directorio + '\';
    iFound := FindFirst(Directorio + '*.*', faAnyfile, srRes);
    while iFound = 0 do
    begin
      if (srRes.Name <> '.') and (srRes.Name <> '..') then
        if srRes.Attr and faDirectory > 0 then
          BuscaArchivos(Directorio + srRes.Name, Mascara, ListaNombreArchs, Recursivo);
      iFound := FindNext(srRes);
    end;
    FindClose(srRes);
  end;
  if Directorio[Length(Directorio)] <> '\' then
    Directorio := Directorio + '\';
  iFound := FindFirst(Directorio + Mascara, faAnyFile - faDirectory, srRes);
  while iFound = 0 do
  begin
    if (srRes.Name <> '.') and (srRes.Name <> '..') and (srRes.Name <> '') then
      ListaNombreArchs.Add(Directorio + srRes.Name);
    iFound := FindNext(srRes);
  end;
  FindClose(srRes);
end;

procedure TDbExpressConexion.VerificaVidaContrase(pUser, pPassw, pServer: String);
var
  ConexionPrueba: TSQLConnection;
  qryVerVida: TSQLQuery;
  Mensaje,
    FechaLock,
    DiasExpira: string;
begin
  ConexionPrueba := TSQLConnection.Create(nil);
  try
    CreoParamsConect(ConexionPrueba, pUser, pPassw, pServer);
    ConexionPrueba.Open;
    qryVerVida := TSQLQuery.Create(owner);
    try
      qryVerVida.SQLConnection := ConexionPrueba;
      qryVerVida.SQL.Add('select account_status,');
      qryVerVida.SQL.Add('nvl(lock_date,to_date(' + '''' + '01/01/1900' + '''' + ',' + '''' + 'dd/mm/yyyy' + '''' + ')) as FHLOCK,');
      qryVerVida.SQL.Add('nvl(expiry_date,to_date(' + '''' + '01/01/1900' + '''' + ',' + '''' + 'dd/mm/yyyy' + '''' + ')) as FHEXPIRA');
      qryVerVida.SQL.Add(' from user_users');
      qryVerVida.open;
      if not qryVerVida.Eof then
      begin
        mensaje := qryVerVida.FieldByName('ACCOUNT_STATUS').asstring;
        if mensaje <> SEstadoPrim then
        begin
          FechaLock := qryVerVida.FieldByName('FHLOCK').asstring;
          DiasExpira := inttostr(trunc(qryVerVida.FieldByName('FHEXPIRA').asfloat - date));
          if mensaje = SEstadoExpG then
          begin
            MsgError := 'Su contraseña de ingreso está por caducar.' + #13#10 + 'Tiene ' + DiasExpira + ' dias para ingresar una nueva' + #13#10 + 'Transcurrido este tiempo su usuario será bloqueado.';
            ClaveFin := true;
          end
          else
            raise Exception.Create('Su contraseña de ingreso está bloqueada desde el ' + FechaLock + #13#10 + 'Consulte con el administrador del sistema.');
        end;
      end;
    finally
      qryVerVida.free;
    end
  finally
    ConexionPrueba.Free;
  end;
end;

procedure TDbExpressConexion.CreoParamsConect(var Connect: TSQLConnection; pUser, pPassw, pServer : String);
var IniFileDBX: TIniFile;
    DirFileDBX: String;
begin
    try
        if Connect.Connected then Connect.Close;

        DirFileDBX := Iif(UpperCase(Ambito) = 'DESARROLLO',_DirectorioDBXIni[0],_DirectorioDBXIni[1]);

        if FileExists( DirFileDBX + _ArchivoDBXIni ) then
        begin
            IniFileDBX := TIniFile.Create( DirFileDBX + _ArchivoDBXIni );
            try
                { PROPERTIES }
                Connect.DriverName := IniFileDBX.ReadString(_DProperties, 'DriverName', _DriverName);
                Connect.ConnectionName := IniFileDBX.ReadString(_DProperties, 'ConnectionName', _ConnectionName);
                Connect.GetDriverFunc := IniFileDBX.ReadString(_DProperties, 'GetDriverFunc', _GetDriverFunc);
                Connect.LibraryName := IniFileDBX.ReadString(_DProperties, 'LibraryName', _LibraryName);
                Connect.VendorLib := IniFileDBX.ReadString(_DProperties, 'VendorLib', _VendorLib);
                Connect.LoginPrompt := StrToBool( IniFileDBX.ReadString(_DProperties, 'LoginPrompt', _LoginPrompt) );
                { PARAMS }
                Connect.Params.Values['RowsetSize'] := IniFileDBX.ReadString(_DParams, 'RowsetSize', _RowsetSize);
                Connect.Params.Values['BlobSize'] := IniFileDBX.ReadString(_DParams, 'BlobSize', _BlobSize);
                Connect.Params.Values['ErrorResourceFile'] := IniFileDBX.ReadString(_DParams, 'ErrorResourceFile', _ErrorResourceFile);
                Connect.Params.Values['LocaleCode'] := IniFileDBX.ReadString(_DParams, 'LocaleCode', _LocaleCode);
                Connect.Params.Values['Oracle TransIsolation'] := IniFileDBX.ReadString(_DParams, 'OracleTransIsolation', _OracleTransIsolation);
                Connect.Params.Values['OS Authentication'] := IniFileDBX.ReadString(_DParams, 'OSAuthentication', _OSAuthentication);
                Connect.Params.Values['Multiple Transaction'] := IniFileDBX.ReadString(_DParams, 'MultipleTransaction', _MultipleTransaction);
                Connect.Params.Values['Trim Char'] := IniFileDBX.ReadString(_DParams, 'TrimChar', _TrimChar);
            finally
              IniFileDBX.Free;
            end;
        end
        else
        begin
            Connect.DriverName := _DriverName;
            Connect.ConnectionName := _ConnectionName;
            Connect.GetDriverFunc := _GetDriverFunc;
            Connect.LibraryName := _LibraryName;
            Connect.VendorLib := _VendorLib;
            Connect.LoginPrompt := StrToBool( _LoginPrompt );
            Connect.Params.Values['RowsetSize'] := _RowsetSize;
            Connect.Params.Values['BlobSize'] := _BlobSize;
            Connect.Params.Values['ErrorResourceFile'] := _ErrorResourceFile;
            Connect.Params.Values['LocaleCode'] := _LocaleCode;
            Connect.Params.Values['Oracle TransIsolation'] := _OracleTransIsolation;
            Connect.Params.Values['OS Authentication'] := _OSAuthentication;
            Connect.Params.Values['Multiple Transaction'] := _MultipleTransaction;
            Connect.Params.Values['Trim Char'] := _TrimChar;
        end;

        Connect.Params.Values['DataBase']  := pServer;
        Connect.Params.Values['User_Name'] := pUser;
        Connect.Params.Values['Password']  := pPassw;

    except
        raise;
    end;
end;

function TDbExpressConexion.GetURLIni: String;
var IniFileDBX: TIniFile;
    DirFileDBX: String;
    Retorna   : String;
begin
    try
        Retorna := '';

        DirFileDBX := Iif(UpperCase(Ambito) = 'DESARROLLO',_DirectorioDBXIni[0],_DirectorioDBXIni[1]);

        if FileExists( DirFileDBX + _ArchivoDBXIni ) then
        begin
            IniFileDBX := TIniFile.Create( DirFileDBX + _ArchivoDBXIni );
            try
                { URL }
                Retorna := IniFileDBX.ReadString('SrvClaves', 'URL_' + UpperCase(Trim(Ambito)), _URL);
            finally
              IniFileDBX.Free;
            end;
        end;
        result := Retorna;
    except
        raise;
    end;
end;

end.

