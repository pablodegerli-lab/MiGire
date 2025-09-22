{                   Ayuda para el uso de la conexión

Version 11.0

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
  UsuarioNombre       : Contiene el nombre del usuario que ingreso al sistema.
  UsuarioClave        : Contiene la clave del usuario
  UsuarioSector       : Contiene el sector asignado al usuario.
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
                        el OleDB de Oracle.
  ClaveAplicacion     : Asigna el nombre de aplicacion para activar unicamente los roles de ejecución de esa.
                        por defecto usa el nombre del ejecutable.
  ArchivoLog          : Lugar y archivo para el log de actividad de la conexion y para ser utilizado tambien por las aplicaciones,
                        debe asignarse tambien la propiedad siguiente.
  LogearaDisco        : Activa/Desactiva el guardar la actividad de la conexion/aplicacion en el Log.
  VersionEnTitulo     : Activa/Desactiva que en elk titulo de la ventana ponga el nombre o la ClaveAplicacion  y la version
  CantidadRegDesdeBD  : Especifica el número de filas que el driver traerá a la vez desde la base de datos, por defecto el driver
                        trae 100.
  ActivarConecAux     : Activa/Desactiva la segunda conexion del datamodulo.
  Ambito2             : Entorno para la conexion auxiliar del usuario. Utiliza el mismo usuario que se logueo a la principal.

  Puede recibir por parametro en linea de comando para realizar distintas acciones.
  -e[entorno=ambito]   : Conecta en el entorno al ambito solicitado ej: en DESARROLLO al ambito TEST8i
  -r                   : Activa los roles por los paquetes de seguridad de 11g
  -l[path + nombreLog] : Lugar y archivo para el log de actividad de la conexion y para ser utilizado tambien por las aplicaciones
  -m                   : Activa la memoria desde el archivo ini
  -d                   : Desactiva el bloqueo de configuracion de BD para Produccion
  Ejemplo:

    myejecutable.exe -ePRODUCCION=OL_ALTA -r -m

  y el formulario de conexion mostrara ese entorno y conectara a OL_ALTA con los roles activados por 11g y lo recordara para la proxima
  ejecucion.

  }
unit uADOConexion;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  stdctrls, registry, Db, ADODB, DBTables, FileCtrl, inifiles, define, setearol;

resourcestring
  SEVersion = 'Ver. 11.1.10';
  SEstadoPrim = 'OPEN';
  SEstadoExpi = 'EXPIRED';
  SEstadoExpG = 'EXPIRED(GRACE)';
  SEstadoLock = 'LOCKED';
  SEstadoExpLockT = 'EXPIRED & LOCKED(TIMED)';
  SEstadoExpGLockT = 'EXPIRED(grace) & LOCKED(TIMED)';
  SEstadoExpLock = 'EXPIRED & LOCKED';
  SEstadoExpGLock = 'EXPIRED(GRACE) & LOCKED';

type

  TInfoAplic    = (iaCompanyName, iaFileDescription, iaFileName, iaFileVersion, iaInternalName, iaLegalCopyright, iaOriginalFilename, iaProductName, iaProductVersion );
  TMensajes   = array[iaCompanyName..iaProductVersion] of string;
  TADOConexion = class(TDataModule)
    ADOConec: TADOConnection;
    qUsuarioParams: TADOQuery;
    qModParams: TADOQuery;
    qInsParams: TADOQuery;
    qDelParams: TADOQuery;
    ADOConec2: TADOConnection;
    procedure ConexionDestroy(Sender: TObject);
    procedure ConexionCreate(Sender: TObject);
    procedure qUsuarioParamsWillChangeRecordset(DataSet: TCustomADODataSet;
      const Reason: TEventReason; var EventStatus: TEventStatus);
  private
    ClaveFin: boolean;
    MsgError: string;
    CambioClave: string;
    FClaveUsuario: string;
    FNombreUsuario: string;
    FUsuarioNombre: string;
    FUsuarioClave: string;
    FUsuarioSector: string;
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
    FAmbitoxParam: string;
    FAmbito2xParam: string;    
    FEntornoxParam: string;
    FArchivoLog: string;
    FArchivoClave: String;
    FVersionEnTitulo: boolean;
    FMensajes: TMensajes;
    FCantidadRegDesdeBD: Int64;
    FActivarConecAux: Boolean;
    function VerificaTitulo(Aplicacion: string): string;
    function VerificaStringConexion(Server: string): string;
    procedure ConsultaSector(Usuario: string);
    procedure SetUsuarioClave(const Value: string);
    procedure SetAmbitoxParam(const Value: string);
    procedure SetAmbito2xParam(const Value: string);    
    procedure SetEntornoxParam(const Value: string);
    procedure ExtraerParametros;
    procedure SetArchivoLog(const Value: string);
    function GetCapsLock: Boolean;
    procedure SetCapsLock(const Value: Boolean);
    procedure SetArchivoClave(const Value: String);
    procedure SetVersionEnTitulo(const Value: boolean);
    procedure SetCantidadRegDesdeBD(const Value: Int64);
    procedure SetActivarConecAux(const Value: Boolean);
  protected
    FUsaUsuarioParams: Boolean;
  public
    cLinea_Aux,
    Entorno,
    Ambito,
    Ambito2,
    TituloSeccion: string;
    ListaRoles: tstringlist;
    LogearaDisco: boolean;
    BuscarEnIni: boolean;
    EstaEnProduccion: Boolean;
    procedure AbrirConexion(ACon: TADOConnection);
    procedure ActualizarUsuarioParams(ASourceDataSet: TDataSet);
    constructor Create(AOwner: TComponent); override;
    procedure VerificaVidaContrase;
    procedure VerificaConexion(Usuario: string; Clave: string; Entorno: string);
    function VerificaINI(Sender: TObject): boolean;
    function CargaTNSNames(var TNSName: TComboBox): boolean;
    function BuscaEnRegistro: string;
    function GetInfoAplicacion(pDe:TInfoAplic):string;
    procedure BuscaArchivos(Directorio, Mascara: AnsiString; var ListaNombreArchs: TStringList; Recursivo: Boolean);
    procedure CargaDesdeINI(var pUsuario: string; var pEntorno: string);
    procedure SetUsuarioNombre(const Value: string);
    function DesdeINI(Titulo, Clave: string): String;
    procedure GuardaINI(pSecc, pTit, pCla: string);
    procedure GrabarArchINI(pUsuario, pEntorno: string);
    procedure GrabarLog(cLinea: string; lSeparacion: boolean=False);
    property NombreProveedor: string read FNombreProveedor write FNombreProveedor;
    property ClaveUsuario: string read FClaveUsuario write FClaveUsuario;
    property ClaveAplicacion: string read FClaveAplicacion write FClaveAplicacion;
    property NombreUsuario: string read FNombreUsuario write FNombreUsuario;
    property NombreArchivoINI: string read FNombreArchivoINI write FNombreArchivoINI;
    property DirectorioTemporales: string read FDirectorioTemporales write FDirectorioTemporales;
    property DirectorioArchivoINI: string read FDirectorioArchivoINI write FDirectorioArchivoINI;
    property CreaArchivoINI: Boolean read FCreaArchivoINI write FCreaArchivoINI default False;
    property AsignaRoles: Boolean read FAsignaRoles write FAsignaRoles default False;
    property ConexionDirecta: Boolean read FConexionDirecta write FConexionDirecta default False;
    property Proveedor: string read FProveedor write FProveedor;
    property UsuarioNombre: string read FUsuarioNombre write SetUsuarioNombre;
    property UsuarioClave: string read FUsuarioClave write SetUsuarioClave;
    property UsuarioSector: string read FUsuarioSector;
    property EntornoxParam: string read FEntornoxParam write SetEntornoxParam;
    property AmbitoxParam: string read FAmbitoxParam write SetAmbitoxParam;
    property Ambito2xParam: string read FAmbito2xParam write SetAmbito2xParam;
    property ArchivoLog: string read FArchivoLog write SetArchivoLog;
    property CapsLock: Boolean read GetCapsLock write SetCapsLock stored False;
    property ArchivoClave: String read FArchivoClave write SetArchivoClave;
    property VersionEnTitulo: boolean read FVersionEnTitulo write SetVersionEnTitulo;
    property CantidadRegDesdeBD: int64 read FCantidadRegDesdeBD write SetCantidadRegDesdeBD;
    property ActivarConecAux: Boolean read FActivarConecAux write SetActivarConecAux;
  end;

implementation

uses uFrmGireLogin, uFrmGIRECambioPasw, StdConvs, StrUtils, Math,
  ConvUtils;
{$R *.DFM}


function VerificaDirectorio(const pDir: string): string;
begin
  if (pDir <> '') and (pDir[Length(pDir)] <> '\') then
    Result := pDir + '\'
  else
    Result := pDir;
end;

function GetKeyState(Key: Integer): Boolean;
var Buffer: TKeyboardState;
begin
  GetKeyboardState(Buffer);
  Result := Buffer[Key] <> 0;
end;

procedure SetKeyState(Key: Integer; TurnOn: Boolean);
var Buffer: TKeyboardState;
begin
  case Win32Platform of
    VER_PLATFORM_WIN32_WINDOWS: // Win95/98/ME
      begin
        GetKeyboardState(Buffer);
        Buffer[Key] := Ord(TurnOn);
        SetKeyboardState(Buffer)
      end;
    VER_PLATFORM_WIN32_NT: // WinNT/2000/XP
      begin
        if GetKeyState(Key) <> TurnOn then
        begin
          keybd_event(Key, $45, KEYEVENTF_EXTENDEDKEY, 0); // simulate key press
          keybd_event(Key, $45, KEYEVENTF_EXTENDEDKEY or KEYEVENTF_KEYUP, 0); // simulate key release
        end;
      end
  end;
end;

function TADOConexion.GetCapsLock: Boolean;
begin
  Result := GetKeyState(VK_CAPITAL)
end;

procedure TADOConexion.SetCapsLock(const Value: Boolean);
begin
   if not (csLoading in ComponentState) then
    SetKeyState(VK_CAPITAL, Value);
end;


procedure TADOConexion.AbrirConexion(ACon: TADOConnection);
begin
  SeteaRoles := TSeteaRoles.Create;
  GrabarLog('Verificando conexion del Usuario: '+NombreUsuario +' al contexto: '+ClaveAplicacion+' a la BD: '+Ambito+' roles por 11g :'+IfThen(AsignaRoles,'Si','No') );
  try
    SeteaRoles.NombreSistema := ClaveAplicacion;
    SeteaRoles.Usuario := NombreUsuario;
    SeteaRoles.Clave := ClaveUsuario;
    SeteaRoles.Roles :=   AsignaRoles;
    SeteaRoles.Ejecutar(ACon);
  finally
    SeteaRoles.free;
  end;
end;

function TADOConexion.VerificaStringConexion(Server: string): string;
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
  if CantidadRegDesdeBD <> 0 then
    result := ParamString + ';Extended Properties="DistribTX=0;PwdChgDlg=0;FetchSize='+IntToStr( CantidadRegDesdeBD )+';"'
  else
       result := ParamString + ';Extended Properties="DistribTX=0;PwdChgDlg=0;"';
end;

procedure TADOConexion.ConexionDestroy(Sender: TObject);
begin
  if FUsaUsuarioParams then
    qUsuarioParams.UpdateRecord;
  salida := true;
  GrabarArchINI(NombreUsuario, Entorno);
  GrabarLog('El Usuario: '+NombreUsuario +' a salido del contexto: '+ClaveAplicacion );
end;

procedure TADOConexion.ActualizarUsuarioParams(ASourceDataSet: TDataSet);
var
  i: Integer;
  CurField: TField;
begin
  qUsuarioParams.Edit;
  try
    for i := 0 to ASourceDataSet.FieldCount - 1 do
    begin
      CurField := qUsuarioParams.FindField(ASourceDataSet.Fields[i].FieldName);
      if CurField <> nil then
        CurField.Value := ASourceDataSet.Fields[i].Value;
    end;
    qUsuarioParams.Post;
  except
    qUsuarioParams.Cancel;
    raise;
  end;
end;

function TADOConexion.VerificaTitulo(Aplicacion: string): string;
begin
  if Pos(' (', Aplicacion) <> 0 then
    Aplicacion := copy(Aplicacion, 1, Pos(' (', Aplicacion));
  result := Aplicacion;
  if VersionEnTitulo then
   begin
    if ClaveAplicacion <> '' then
      result := ClaveAplicacion
    else
      result := GetInfoAplicacion( iaFileName );
    result := result + '-' + GetInfoAplicacion(iaFileVersion);
   end;
end;

procedure TADOConexion.VerificaConexion(Usuario, Clave, Entorno: string);

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
  ParamUser,
    ParamPass,
    Server: string;
begin
  ParamUser := Usuario;
  ParamPass := Clave;
  Application.Title := VerificaTitulo(Application.Title);
  if UpperCase(Trim(Entorno)) = 'PRODUCCION' then
   begin
    Server := IfThen( Ambito<>'', Ambito, 'DBGire');
    if  Ambito = '' then Ambito:='DBGire';
   end
  else
  begin
   Application.Title := Application.Title + ' (' + entorno + ')';
   if UpperCase(Trim(Entorno)) = 'DESARROLLO' then
    begin
     Server := IfThen( Ambito<>'', Ambito, 'Test8i');
     if  Ambito = '' then Ambito:= 'Test8i';
    end
   else if UpperCase(Trim(Entorno)) = 'TEST(GALILEO)' then
    begin
      Server := IfThen( Ambito<>'', Ambito, 'GaliTest');
      if  Ambito = '' then Ambito:= 'GaliTest';
    end
    else
      Server := entorno;
  end;
  try
//LABL    ADOConec.Close;
//LABL
    if trim(ADOConec.ConnectionString) = '' then
    begin
      ADOConec.Close;
      ADOConec.ConnectionString := VerificaStringConexion(server)
    end
    else
    begin
      ADOConec2.Close;
      ADOConec2.ConnectionString := VerificaStringConexion(server);
    end;
//
    NombreUsuario := ParamUser;
    FUsuarioNombre := NombreUsuario;
    ClaveUsuario := ParamPass;
    FUsuarioClave := ClaveUsuario;
    //Ambito := Entorno;
    VerificaVidaContrase;
    if ClaveFin then
      if MessageBox(application.Handle, PChar(msgerror + #13#10 + 'Se recomienda cambiar la clave de ingreso'), PChar(application.title), 49) = 1 then
        CambiarClave;
  except
    on e: exception do
      raise Exception.Create('Usuario o clave incorrecta.' + #13#10 + e.Message);
  end;
end;

procedure TADOConexion.GrabarArchINI(pUsuario, pEntorno: string);
var
  ArchivoINI: TIniFile;
begin
  if CreaArchivoINI then
  begin
    DirectorioTemporales := VerificaDirectorio(DirectorioTemporales);
    DirectorioArchivoINI := VerificaDirectorio(DirectorioArchivoINI);
    ArchivoIni := TIniFile.Create(DirectorioArchivoINI + NombreArchivoINI);
    try
     try
      if Salida then
        CambioClave := CambioClave + DateTimeToStr(Date + time) + ' -> OK';
      ArchivoIni.WriteString(TituloSeccion, 'Usuario', pUsuario);
      ArchivoIni.WriteString(TituloSeccion, 'Entorno', pEntorno);
      ArchivoIni.WriteString(TituloSeccion, 'DirectorioTemporales', DirectorioTemporales);
      ArchivoIni.WriteString(TituloSeccion, 'Driver', FNombreProveedor);
      ArchivoIni.WriteString(TituloSeccion, 'ClaveAP',FClaveAplicacion);
      if BuscarEnIni then
        ArchivoIni.WriteString(TituloSeccion, 'Activar memoria',IfThen(BuscarEnIni,'Si','No'));
      if ArchivoLog<>'' then
       begin
        ArchivoIni.WriteString(TituloSeccion, 'ArchivoLog',ArchivoLog);
        ArchivoIni.WriteString(TituloSeccion, 'ActivarLog',IfThen(LogearaDisco,'Si','No'));
       end;
      if EntornoxParam <> '' then
        ArchivoIni.WriteString(TituloSeccion, EntornoxParam, AmbitoxParam);
      if pUsuario <> '' then
        ArchivoIni.WriteString('Usuarios ' + TituloSeccion, pUsuario, CambioClave);
     except
        GrabarLog('Ocurrio un error al intentar escribir en el archivo de configuracion: '+DirectorioArchivoINI + NombreArchivoINI );
     end;
    finally
      ArchivoIni.Free;
    end;
  end;
end;

procedure TADOConexion.CargaDesdeINI(var pUsuario: string; var pEntorno: string);
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
      FClaveAplicacion := IfThen(ClaveAplicacion='', ArchivoIni.ReadString(TituloSeccion, 'ClaveAP', ''),ClaveAplicacion);
      if  not LogearaDisco then
        LogearaDisco := StrToBool( IfThen(UpperCase( ArchivoIni.ReadString(TituloSeccion, 'ActivarLog', 'No'))='SI','True','False'));
      if not BuscarEnIni then
        BuscarEnIni := StrToBool( IfThen(UpperCase( ArchivoIni.ReadString(TituloSeccion, 'Activar memoria', 'No'))='SI','True','False'));
      If LogearaDisco then
       begin
        if FArchivoLog ='' then
         begin
          FArchivoLog := ArchivoIni.ReadString(TituloSeccion, 'ArchivoLog', '');
          if FArchivoLog ='' then
            LogearaDisco := False;
         end;
       end;
      if  FClaveAplicacion = '' then
        FClaveAplicacion := UpperCase(ExtractFileName(StringReplace(ParamStr(0), ExtractFileExt(ParamStr(0)), '', [rfReplaceAll])));
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

function TADOConexion.DesdeINI(Titulo, Clave: string): String;
  var
    ArchivoINI: TIniFile;
  begin
    ArchivoIni := TIniFile.Create(DirectorioArchivoINI +'\'+ NombreArchivoINI);
    try
     result := ArchivoIni.ReadString(Titulo,Clave, '');
    except
      result := ''
    end;
    ArchivoIni.Free;
  end;

function TADOConexion.VerificaINI(Sender: TObject): boolean;

  function GrabarINI(FDirectorioArchivo: string): boolean;
  var
    ArchivoINI: TIniFile;
  begin
    result := true;
    ArchivoIni := TIniFile.Create(FDirectorioArchivo);
    try
      try
        application.Title;
        ArchivoIni.WriteString(TituloSeccion, 'Usuario', '');
        ArchivoIni.WriteString(TituloSeccion, 'DirectorioTemporales', DirectorioTemporales);
        ArchivoIni.WriteString(TituloSeccion, 'Entorno', '');
      except
        result := false
      end;
    finally
      ArchivoIni.Free;
    end;
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

procedure TADOConexion.GuardaINI(pSecc, pTit, pCla: string);
var
    ArchivoINI: TIniFile;
begin
  if CreaArchivoINI then
   begin
    ArchivoIni := TIniFile.Create(DirectorioArchivoINI + NombreArchivoINI);
    try
      try
        ArchivoIni.WriteString(pSecc, pTit, pCla);   //TituloSeccion, 'DirectorioTemporales', DirectorioTemporales);
      except
        GrabarLog('Ocurrio un error al intentar escribir en el archivo de configuracion: '+DirectorioArchivoINI + NombreArchivoINI );
      end;
    finally
      ArchivoIni.Free;
    end;
   end;
end;


procedure TADOConexion.ExtraerParametros;
Var
  Recorre: integer;
Begin

for Recorre:= 0 to ParamCount  do
 begin
  if Pos('-e', ParamStr(Recorre))<> 0 then
   begin
     EntornoxParam := UpperCase( substr(ParamStr(Recorre), Pos('-e', ParamStr(Recorre))+2,Pos('=', ParamStr(Recorre))-3) );
     AmbitoxParam  := UpperCase( substr(ParamStr(Recorre), Pos('=', ParamStr(Recorre))+1));
     AsignaRoles   := False;
   end;
  if Pos('-r', ParamStr(Recorre))<> 0 then
     AsignaRoles   := True;
  if Pos('-l', ParamStr(Recorre))<> 0 then
   begin
    ArchivoLog  := UpperCase( substr(ParamStr(Recorre), Pos('-l', ParamStr(Recorre))+2));
    LogearaDisco := True;
   end;
  if Pos('-m', ParamStr(Recorre))<> 0 then
     BuscarEnIni   := True;
  if Pos('-d', ParamStr(Recorre))<> 0 then
     EstaEnProduccion := False;

 end;
 if ((EntornoxParam='') or  (AmbitoxParam='')) then
   begin
     EntornoxParam :='';
     AmbitoxParam  :='';
   end;
end;

constructor TADOConexion.Create(AOwner: TComponent);
var
  FArchivoINI: string;
  FrmGIRELogin: TFrmGIRELogin;
  Lista: TStringList;
begin
  inherited;
  TituloSeccion := application.title;
  ClaveAplicacion :=  IfThen(ClaveAplicacion='',  DesdeINI(TituloSeccion,'ClaveAP'), ClaveAplicacion) ;

  EstaEnProduccion := strtobool(IfThen(DesdeINI(TituloSeccion,'Deploy en V')='Si','true','false'));
  if UpperCase(ExtractFileDrive( ParamStr(0) )) = 'V:' then
      EstaEnProduccion := True;

  ExtraerParametros;
  if (ArchivoLog <> '') and (Pos('_'+TituloSeccion,ArchivoLog)=0) then
    ArchivoLog :=   ExtractFileDir( ArchivoLog) +'\' +copy( ExtractFileName(ArchivoLog),1,pos(',', ExtractFileName(ArchivoLog) )-1)+'_'+TituloSeccion + ExtractFileExt(ArchivoLog)
  else
    ArchivoLog :=  DesdeINI(TituloSeccion,'ArchivoLog');
  FArchivoINI := UpperCase( DesdeINI(TituloSeccion, AmbitoxParam + '_roles'));
  AsignaRoles := strtobool( IfThen(FArchivoINI<>'', IfThen(FArchivoINI='SI','true','false') ,booltostr( AsignaRoles))) ;
  FArchivoINI := '';

  if VerificaINI(AOwner) then
    FArchivoINI := DirectorioArchivoINI + NombreArchivoINI;

  if Ambito2 = '' then
    Ambito2 := UpperCase( DesdeINI(TituloSeccion, 'Ambito Secundario_'+Entorno));
  //if Ambito2 <> '' then
  //  FActivarConecAux := strtobool(IfThen(DesdeINI(TituloSeccion,'Conexion Secundaria')='SI','true','false'));

  LogearaDisco := strtobool(IfThen(DesdeINI(TituloSeccion,'ActivarLog')='Si','true','false'));

  if ConexionDirecta then
    if FileExists( ArchivoClave ) then
     begin
      Lista := TStringList.Create;
      try
        Lista.LoadFromFile( ArchivoClave );
        NombreUsuario := Cifrado( Lista[0] );
        ClaveUsuario  := Cifrado( Lista[1] );
        Ambito        := Cifrado( Lista[2] );
        Try
          AsignaRoles := StrToBool(IfThen( UpperCase(Cifrado(Lista[3]))='SI','True','False') );
        except
        end;
      finally
        Lista.Free;
      end;
   end;

  GrabarLog('Iniciando la conexion.',True);

  if ConexionDirecta then
  begin
    try
      VerificaConexion(NombreUsuario, ClaveUsuario, ambito);
      AbrirConexion(ADOConec);
      GrabarLog('Conexion verificada...');
    except
      on e: exception do
       begin
        GrabarLog('Error!!...'+e.Message);   
        raise Exception.Create('Faltan parametros para la conexion. Error: '+e.Message);
       end;
    end;
  end
  else
  begin
    FrmGIRELogin := TFrmGIRELogin.Create(AOwner, ADOConec, Self, FAsignaRoles );

    FrmGIRELogin.lblGetBase.Caption := 'MDAC - ADO' + ADOConec.Version; //ADOConec.Version;
    FrmGIRELogin.lblgetVer.Caption := SEVersion;
    FrmGIRELogin.ShowModal;
    NombreUsuario := FrmGIRELogin.EdUsuario.Text;
    ClaveUsuario := FrmGIRELogin.EdPassword.Text;
    FUsuarioClave := ClaveUsuario;
    FUsuarioNombre:= NombreUsuario;
    //FAsignaRoles := FrmGIRELogin.AsignaRoles;
    Entorno := FrmGIRELogin.cboEntorno.Text;
    FrmGIRELogin.Free;
    if ADOConec.Connected then
      ConsultaSector(UsuarioNombre);
  end;
  try
    if FUsaUsuarioParams then
      qUsuarioParams.Open;
  except
    on e: exception do
      raise Exception.Create('Faltan parametros para el usuario. Error: '+e.Message);
  end;
end;

procedure TADOConexion.ConexionCreate(Sender: TObject);
begin
  FUsaUsuarioParams := False;
  FUsuarioSector := 'Sin Sector';
  AsignaRoles := False;
  salida := false;
  ArchivoLog:='';
  BuscarEnIni := False;
  NombreArchivoINI := 'GIRETMP.INI';
 // ClaveAplicacion :=   UpperCase(ExtractFileName(StringReplace(ParamStr(0), ExtractFileExt(ParamStr(0)), '', [rfReplaceAll])));
  Proveedor := 'OraOLEDB.Oracle.1';
  DirectorioTemporales := VerificaDirectorio(GetCurrentDir);
  DirectorioArchivoINI := 'C:\GIRE';
  FActivarConecAux := False;
  FVersionEnTitulo := False;
end;



procedure TADOConexion.qUsuarioParamsWillChangeRecordset(DataSet: TCustomADODataSet;
  const Reason: TEventReason; var EventStatus: TEventStatus);
begin
  if EventStatus = esOK then
  try
    if (DataSet.State = dsEdit) and
      (Reason = erUpdate) then
      qModParams.ExecSQL;
    if (DataSet.State = dsInsert) and
      (Reason = erAddNew) then
      qInsParams.ExecSQL;
    if (DataSet.State = dsBrowse) and
      (Reason = erDelete) then
      qDelParams.ExecSQL;
  finally
    begin
      qDelParams.Close;
      qInsParams.Close;
      qModParams.Close;
    end;
  end;
end;

function TADOConexion.CargaTNSNames(var TNSName: TComboBox): boolean;
var
  ArchTNS: TextFile;
  Linea: string;
  Archivos: TStringList;
  i: integer;
begin
  result := true;
 { Archivos := TStringList.Create;
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
  Archivos.free;}
end;

function TADOConexion.BuscaEnRegistro: string;
var
  Registro: TRegistry;
begin
  result := ' ';
  Registro := TRegistry.Create;
  try
    Registro.RootKey := HKEY_LOCAL_MACHINE;
    if Registro.OpenKey('\Software\ORACLE\ALL_HOMES', True) then
      result := Registro.ReadString('LAST_HOME');
    if not (Pos( 'ORACLE', UpperCase(Result)) <> 0) then
     begin
      if Registro.OpenKey('\Software\ORACLE\HOME' + result, True) then
        result := Registro.ReadString('ORACLE_HOME');
     end;
  finally
    Registro.CloseKey;
    Registro.Free;
  end;
end;

procedure TADOConexion.BuscaArchivos(Directorio, Mascara: AnsiString;
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

procedure TADOConexion.VerificaVidaContrase;
var
  ConexionPrueba: TADOConnection;
  qryVerVida: TADOQuery;
  Mensaje,
    FechaLock,
    DiasExpira: string;
begin
  ConexionPrueba := TADOConnection.Create(nil);
  try
    ConexionPrueba.ConnectionString := ADOConec.ConnectionString;
    ConexionPrueba.LoginPrompt := False;
    ConexionPrueba.Open(FNombreUsuario, FClaveUsuario);
    qryVerVida := TADOQuery.Create(owner);
    try
      qryVerVida.Connection := ConexionPrueba;
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

procedure TADOConexion.ConsultaSector(Usuario: string);
var
  qryTemp: TADOQuery;
begin

  qryTemp := TADOQuery.Create(nil);
  try
   try
    qryTemp.Connection := ADOConec;
    qryTemp.SQL.Text := 'select SINCRO.TRAE_SECTOR('''+Usuario+''') as SECTOR from dual';
    qryTemp.Open;
    if qryTemp.FieldByName('SECTOR').AsString <> '' then
      FUsuarioSector := qryTemp.FieldByName('SECTOR').AsString;
   except
   end;
  finally
    qryTemp.Free;
  end;

end;

procedure TADOConexion.GrabarLog(cLinea: string; lSeparacion: boolean=False);
var
  ManejadorFlag: TFileStream;
begin
  if LogearaDisco then
   begin
    if not DirectoryExists( ExtractFileDir(ArchivoLog) ) then
      CrearDirectorio(ExtractFileDir(ArchivoLog));
    ManejadorFlag := nil;
    if lSeparacion then
      cLinea_Aux := cLinea_Aux + '********* <' + DateTimeToStr(now) + '> *********' + #13#10;
     cLinea_Aux := cLinea_Aux + TimeToStr(Time) + ' - ' + cLinea + #13#10;
    try
      if FileExists(ArchivoLog) then
        ManejadorFlag := TFileStream.Create(ArchivoLog, fmOpenReadWrite + fmShareExclusive)
      else
        ManejadorFlag := TFileStream.Create(ArchivoLog, fmCreate);
      ManejadorFlag.Seek(0, soFromEnd);
      ManejadorFlag.Write(Pointer(cLinea_Aux)^, Length(cLinea_Aux));
      cLinea_Aux := '';
    finally
      ManejadorFlag.Free;
    end;
   end;
end;

function TADOConexion.GetInfoAplicacion(pDe:TInfoAplic):string;

  {Se pueden pedir los siguientes datos:
     CompanyName
     FileDescription
     FileVersion
     InternalName
     LegalCopyright
     OriginalFilename
     ProductName
     ProductVersion
  }

type
  PaLeerBuffer = array [0..MAX_PATH] of char;

var
  Size, Size2 : DWord;
  Pt, Pt2     : Pointer;
  Idioma      : string;
const
  FMensajes :array[iaCompanyName..iaProductVersion] of string = ('CompanyName','FileDescription','FileName','FileVersion','InternalName','LegalCopyright','OriginalFilename','ProductName','ProductVersion');
begin
  Result:='';
   Size := GetFileVersionInfoSize(PChar (Application.Exename), Size2);
   if Size > 0 then
     begin
       GetMem (Pt, Size);
       GetFileVersionInfo (PChar (ParamStr (0)), 0, Size, Pt);
       {Obtenemos la cadena de translacion, requerida para obtener el resto
       de datos del Versioninfo}
       VerQueryValue( Pt, '\VarFileInfo\Translation',Pt2, Size2);
       Idioma:=IntToHex( DWord(Pt2^) ,8 );
      {Le damos la vuelta (Es windows, que quieres...}
      Idioma:=Copy(Idioma,5,4)+Copy(Idioma,1,4);

       {Pedimos la info requerida...}
       VerQueryValue( Pt,
                      Pchar('\StringFileInfo\'+
                      Idioma+'\'+
                       FMensajes[pDe] ),
                      Pt2, Size2);
       if Size2 > 0 then
       begin
         {Y la devolvemos}
         Result:=Copy(PaLeerBuffer(Pt2^),1,Size2);
       end else
         Result:= 'No existe esa informacion en el ejecutable';
       FreeMem (Pt);
     end else
       Result:='No hay VersionInfo disponible en este ejecutable.';
end;


procedure TADOConexion.SetUsuarioClave(const Value: string);
begin
  FUsuarioClave := Value;
end;

procedure TADOConexion.SetUsuarioNombre(const Value: string);
begin
  FUsuarioNombre := Value;
end;

procedure TADOConexion.SetAmbitoxParam(const Value: string);
begin
  FAmbitoxParam := Value;
end;

procedure TADOConexion.SetEntornoxParam(const Value: string);
begin
  FEntornoxParam := Value;
end;

procedure TADOConexion.SetArchivoLog(const Value: string);
begin
  FArchivoLog := Value;
end;

procedure TADOConexion.SetArchivoClave(const Value: String);
begin
  FArchivoClave := Value;
end;

procedure TADOConexion.SetVersionEnTitulo(const Value: boolean);
begin
  FVersionEnTitulo := Value;
end;

procedure TADOConexion.SetCantidadRegDesdeBD(const Value: Int64);
begin
    FCantidadRegDesdeBD := Value
end;

procedure TADOConexion.SetAmbito2xParam(const Value: string);
begin
  FAmbito2xParam := Value;
end;

procedure TADOConexion.SetActivarConecAux(const Value: Boolean);
begin
  FActivarConecAux := Value;
end;


end.

