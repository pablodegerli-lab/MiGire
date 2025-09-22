{                   Ayuda para el uso de la conexión

 La conexión necesita para trabajar seguir estos pasos:

 1.Heredar desde el repositorio el DataModule de conexion.
 2.Usar desde el repositorio el formulario de Login.
 3.Usar desde el repositorio el formulario de Cambio de Password.

 Escribir en nuestro proyecto lo siguiente para que la conexion sea lo primero a crear:

  Application.Initialize;                               donde
  try                                                    MyConexion es el nombre que el Prog.
   myConexion:=T????Conexion.Create(application);        le de a la conexion
   if Myconexion.dbPrinc.Connected then                 T????Conexion es el nombre que el
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
                        genere la aplicacion y el archivo de inicio, o sino usara por defecto
                        el directorio actual
  AsignaRoles         : Esta en Falso por defecto, si se activa utilizara la asignacion de Roles
                        en ejecucion. Pedir al DBA que asigne los roles y las claves
                        correspondientes para el acceso del usuario
  ConecAutomatic      : Esta en falso por defecto, si se activa la aplicacion se conectara
                        automaticamente a la base de datos sin solicitar usuario y clave.
                        Todos los datos se asignaran en ejecucion sobre las propiedades
                        de usuario(NombreUsuario, ClaveUsuario, Ambito.

  }

unit uGIREConexion;

interface

uses
  Windows, Messages, SysUtils, StrUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, DB, FileCtrl, StdCtrls, inifiles, registry, setearol;

resourcestring
  SEstadoPrim      = 'OPEN';
  SEstadoExpi      = 'EXPIRED';
  SEstadoExpG      = 'EXPIRED(GRACE)';
  SEstadoLock      = 'LOCKED';
  SEstadoExpLockT  = 'EXPIRED & LOCKED(TIMED)';
  SEstadoExpGLockT = 'EXPIRED(grace) & LOCKED(TIMED)';
  SEstadoExpLock   = 'EXPIRED & LOCKED';
  SEstadoExpGLock  = 'EXPIRED(GRACE) & LOCKED';

type

  TGIREConexion = class(TDataModule)
    DBPrinc: TDatabase;
    qUsuarioParams: TQuery;
    updUsuarioParams: TUpdateSQL;
    procedure ConexionDestroy(Sender: TObject);
    procedure ConexionCreate(Sender: TObject);
  private
    FNombreUsuario: string;
    FClaveUsuario: string;
    Salida:      boolean;
    CambioClave: string;
    FControlClave: boolean;
    ClaveFin:    boolean;
    MsgError:    string;
    FDirectorioArchivoINI: string;
    FClaveAplicacion: string;
    function BuscaEnRegistro: string;
    procedure BuscaArchivos(Directorio, Mascara: ansistring; var ListaNombreArchs: TStringList; Recursivo: boolean);
    function VerificaTitulo(Aplicacion: string): string;
  protected
    FUsaUsuarioParams: boolean;
    FCrearArch: boolean;
    FConecAuto: boolean;
  public
    Ambito, TituloSeccion: string;
    ListaRoles: TStringList;
    DirectorioTemporales: string;
    NombreArchivoINI: string;
    FAsignaRoles: boolean;
    ConAutoUsuario, ConAutoClave, ConAutoEntorno: string;
    procedure AbrirConexion(ACon: TDatabase);
    procedure ActualizarUsuarioParams(ASourceDataSet: TDataSet);
    constructor Create(AOwner: TComponent); override;
    function CargaTNSNames(var TNSName: TComboBox): boolean;
    procedure CargaDesdeINI(var pUsuario: string; var pEntorno: string);
    function VerificaINI(Sender: TObject): boolean;
    function VerificaConexion(Usuario, Clave, Entorno: string): boolean;
    procedure VerificaVidaContrase;
    procedure GrabarArchINI(pUsuario, pEntorno: string);
    function BuscarConfiguracionINI(Clave,Valor: String): string;
    property AsignaRoles: Boolean read FAsignaRoles write FAsignaRoles default False;    
    property CreaArchivoINI: boolean Read FCrearArch Write FCrearArch default False;
    property ConecAutomatic: boolean Read FConecAuto Write FConecAuto default False;
    property NombreUsuario: string Read FNombreUsuario Write FNombreUsuario;
    property ClaveUsuario: string Read FClaveUsuario Write FClaveUsuario;
    property ControlClave: boolean Read FControlClave Write FControlClave default False;
    property DirectorioArchivoINI: string Read FDirectorioArchivoINI Write FDirectorioArchivoINI;
    property ClaveAplicacion: string Read FClaveAplicacion Write FClaveAplicacion;
  end;

implementation

uses uFrmGIRECambioPaswBDE, uFrmGireLoginBDE;

{$R *.DFM}

function VerificaDirectorio(const pDir: string): string;
begin
  if (pDir <> '') and (pDir[Length(pDir)] <> '\') then
    Result := pDir + '\'
  else
    Result := pDir;
end;

procedure TGIREConexion.AbrirConexion(ACon: TDatabase);
var
  BDERoles:  TSeteaRoles;
begin
   BDERoles := TSeteaRoles.Create;
    try
      BDERoles.NombreSistema := ClaveAplicacion;
      BDERoles.Usuario := NombreUsuario;
      BDERoles.Clave   := ClaveUsuario;
      BDERoles.Roles := FAsignaRoles;
      BDERoles.Ejecutar(ACon);
    finally
      BDERoles.Free;
    end;
end;

procedure TGIREConexion.ConexionDestroy(Sender: TObject);
begin
  if FUsaUsuarioParams then
    qUsuarioParams.ApplyUpdates;
  salida := True;
  GrabarArchINI(NombreUsuario, Ambito);
  DBPrinc.Close;
end;

procedure TGIREConexion.ActualizarUsuarioParams(ASourceDataSet: TDataSet);
var
  i: integer;
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

constructor TGIREConexion.Create(AOwner: TComponent);
var
  FArchivoINI:  string;
  FrmGIRELogin: TFrmGIRELoginBDE;
begin
  inherited;
  TituloSeccion := application.title;
  if VerificaINI(AOwner) then
    FArchivoINI := DirectorioTemporales + NombreArchivoINI;
  if FConecAuto then
  begin
    try
      VerificaConexion(ConAutoUsuario, ConAutoClave, ConAutoEntorno);
      AbrirConexion(DBPrinc);
      //DBPrinc.Open;
    except
      raise Exception.Create('Faltan parametros para la conexion');
    end;
  end
  else
  begin
    FrmGIRELogin := TFrmGIRELoginBDE.Create(self, self);
    FrmGIRELogin.lblGetBase.Caption := 'Oracle - BDE=' + DBPrinc.DatabaseName;
    FrmGIRELogin.ShowModal;
    FrmGIRELogin.Free;
  end;
  try
    if FUsaUsuarioParams then
      qUsuarioParams.Open;
  except
    raise Exception.Create('Faltan parametros para el usuario.');
  end;
end;

procedure TGIREConexion.ConexionCreate(Sender: TObject);
begin
  FAsignaRoles  := False;
  FUsaUsuarioParams := False;
  Salida := False;
  ClaveAplicacion := UpperCase(ExtractFileName(StringReplace(ParamStr(0), ExtractFileExt(ParamStr(0)), '', [rfReplaceAll])));
  NombreArchivoINI := 'GIRETMP.INI';
  DirectorioTemporales := VerificaDirectorio(GetCurrentDir);
  DirectorioArchivoINI := 'C:\GIRE';
end;

function TGIREConexion.VerificaINI(Sender: TObject): boolean;

  function GrabarINI(FDirectorioArchivo: string): boolean;
  var
    ArchivoINI: TIniFile;
  begin
    Result     := True;
    ArchivoIni := TIniFile.Create(FDirectorioArchivo);
    try
      try
        ArchivoIni.WriteString('Configuracion', 'Usuario', '');
        ArchivoIni.WriteString('Configuracion', 'DirectorioTemporales',  DirectorioTemporales);
        ArchivoIni.WriteString('Configuracion', 'Entorno', '');
      except
        Result := False
      end;
    finally
      ArchivoIni.Free;
    end;
  end;

var
  Archivo: string;
begin
  Result := True;
  if FCrearArch then
  begin
    Archivo := ExtractFileName(NombreArchivoINI);
    DirectorioTemporales := VerificaDirectorio(DirectorioTemporales);
    if not DirectoryExists(DirectorioTemporales) then
      if not CreateDir(DirectorioTemporales) then
        Result := False;
    SetCurrentDir(DirectorioTemporales);
    if not FileExists(DirectorioTemporales + Archivo) then
      if not GrabarINI(DirectorioTemporales + Archivo) then
        Result := False;
  end
  else
    Result := False;
end;

procedure TGIREConexion.GrabarArchINI(pUsuario, pEntorno: string);
var
  ArchivoINI: TIniFile;
begin
  if CreaArchivoINI then
  begin
    DirectorioTemporales := VerificaDirectorio(DirectorioTemporales);
    ArchivoIni := TIniFile.Create(DirectorioTemporales + NombreArchivoINI);
    try
      if Salida then
        CambioClave := CambioClave + DateTimeToStr(Date + time) + ' -> OK';
        ArchivoIni.WriteString(TituloSeccion, 'Usuario', pUsuario);
        ArchivoIni.WriteString(TituloSeccion, 'Entorno', pEntorno);
        ArchivoIni.WriteString(TituloSeccion, 'DirectorioTemporales',
        DirectorioTemporales);
      ArchivoIni.WriteString('Usuarios ' + TituloSeccion, pUsuario, CambioClave);
    finally
      ArchivoIni.Free;
    end;
  end;
end;

function TGIREConexion.CargaTNSNames(var TNSName: TComboBox): boolean;
var
  ArchTNS: TextFile;
  Linea: string;
  Archivos: TStringList;
  i: integer;
begin
  Result   := True;
{  Archivos := TStringList.Create;
  try
    TNSName.Clear;
    BuscaArchivos(BuscaEnRegistro, 'TNSNAMES.ORA', Archivos, True);
    for i := 0 to Archivos.Count - 1 do
    begin
      AssignFile(ArchTNS, Archivos.Strings[i]);
      Reset(ArchTNS);
      while not EOF(ArchTNS) do
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
  Archivos.Free;}
end;

function TGIREConexion.BuscaEnRegistro: string;
var
  Registro: TRegistry;
begin
  Result   := ' ';
  Registro := TRegistry.Create;
  try
    Registro.RootKey := HKEY_LOCAL_MACHINE;
    if Registro.OpenKey('\Software\ORACLE\ALL_HOMES', True) then
      Result := Registro.ReadString('LAST_HOME');
    if Registro.OpenKey('\Software\ORACLE\HOME' + Result, True) then
      Result := Registro.ReadString('ORACLE_HOME');
  finally
    Registro.CloseKey;
    Registro.Free;
  end;

end;

procedure TGIREConexion.BuscaArchivos(Directorio, Mascara: ansistring; var ListaNombreArchs: TStringList; Recursivo: boolean);
var
  srRes:  TSearchRec;
  iFound: integer;
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

function TGIREConexion.VerificaConexion(Usuario, Clave, Entorno: string): boolean;

  procedure ExistenParametrosLogin;
  var
    Indice:   integer;
    finlista: integer;
  begin
    indice   := 0;
    finlista := DBPrinc.Params.Count;
    while indice < finlista do
    begin
      if (Pos('USER NAME=', UpperCase(DBPrinc.Params[indice])) <> 0) or (Pos('PASSWORD=', UpperCase(DBPrinc.Params[indice])) <> 0) then
      begin
        finlista := finlista - 1;
        DBPrinc.Params.Delete(indice);
      end
      else
        indice := indice + 1;
    end;
  end;

  procedure CambiarClave;
  var
    CambioPasw: TFrmGIRECambioPaswBDE;
  begin
    CambioPasw := TFrmGIRECambioPaswBDE.Create(Owner);
    try
      CambioPasw.GireEnlace := Self;
      CambioPasw.ShowModal;
    except
      raise Exception.Create('No se pudo mostrar el formulario.');
    end;
    CambioPasw.Free;
  end;

begin
  ExistenParametrosLogin;
  DBPrinc.Params.Add('USER NAME=' + Usuario);
  DBPrinc.Params.Add('PASSWORD=' + Clave);
  Application.Title := VerificaTitulo(Application.Title);

  if strUpper(PChar(Trim(Entorno))) = 'PRODUCCION' then
    DBPrinc.AliasName :=  IfThen( Ambito<>'', Ambito, 'DBGire')
  else if strUpper(PChar(Trim(Entorno))) = 'DESARROLLO' then
  begin
    Application.Title := Application.Title + ' (' + entorno + ')';
    DBPrinc.AliasName :=  IfThen( Ambito<>'', Ambito, 'Test8i');
  end
  else if UpperCase(Trim(Entorno)) = 'TEST(GALILEO)' then
  begin
    Application.Title := Application.Title + ' (' + entorno + ')';
    DBPrinc.AliasName :=  IfThen( Ambito<>'', Ambito, 'GaliTest');
  end
  else
    DBPrinc.AliasName := entorno;
  try
    Result := True;
    NombreUsuario := Usuario;
    ClaveUsuario := Clave;
    //Ambito := entorno;
    //VerificaVidaContrase;
    if ClaveFin then
      if MessageBox(application.Handle, PChar(msgerror + #13#10 + 'Se recomienda cambiar la clave de ingreso'), PChar(application.title), 49) = 1 then
        CambiarClave;
  except
    on e: Exception do
    begin
      raise Exception.Create(e.Message);
      Result := False;
    end;
  end;
end;

function TGIREConexion.VerificaTitulo(Aplicacion: string): string;
begin
  if Pos(' (', Aplicacion) <> 0 then
    Aplicacion := copy(Aplicacion, 1, Pos(' (', Aplicacion));
  Result := Aplicacion;
end;

procedure TGIREConexion.CargaDesdeINI(var pUsuario, pEntorno: string);
var
  ArchivoIni: TIniFile;
begin
  if CreaArchivoINI then
  begin
    ArchivoIni := TIniFile.Create(DirectorioTemporales + NombreArchivoINI);
    try
      pUsuario := ArchivoIni.ReadString(TituloSeccion, 'Usuario', '');
      pEntorno := ArchivoIni.ReadString(TituloSeccion, 'Entorno', '');
      if pos('OK', CambioClave) = 0 then
        ArchivoIni.WriteString('Salidas erroneas de ' + TituloSeccion,
          CambioClave + '-- Usuario', pUsuario);
      CambioClave := 'Ing: ' + DateTimeToStr(Date + time) + ' - Sal: ';
    finally
      ArchivoIni.Free;
    end;
  end;
end;

procedure TGIREConexion.VerificaVidaContrase;
var
  qryVerVida: TQuery;
  Mensaje, FechaLock, DiasExpira: string;
begin
  qryVerVida := TQuery.Create(owner);
  try
    qryVerVida.DatabaseName := DBPrinc.DatabaseName;
    qryVerVida.SQL.Add('select account_status,');
    qryVerVida.SQL.Add('nvl(lock_date,to_date(' + '''' + '01/01/1900' + '''' + ',' + '''' + 'dd/mm/yyyy' + '''' + ')) as FHLOCK,');
    qryVerVida.SQL.Add('nvl(expiry_date,to_date(' + '''' + '01/01/1900' + '''' + ',' + '''' + 'dd/mm/yyyy' + '''' + ')) as FHEXPIRA');
    qryVerVida.SQL.Add(' from user_users');
    qryVerVida.Open;
    if not qryVerVida.EOF then
    begin
      mensaje := qryVerVida.FieldByName('ACCOUNT_STATUS').AsString;
      if mensaje <> SEstadoPrim then
      begin
        FechaLock  := qryVerVida.FieldByName('FHLOCK').AsString;
        DiasExpira := IntToStr(trunc(qryVerVida.FieldByName('FHEXPIRA').AsFloat - date));
        if mensaje = SEstadoExpG then
        begin
          MsgError := 'Su contraseña de ingreso está por caducar.' + #13#10 + 'Tiene ' + DiasExpira + ' dias para ingresar una nueva' + #13#10 + 'Transcurrido este tiempo su usuario será bloqueado.';
          ClaveFin := True;
        end
        else
          raise Exception.Create('Su contraseña de ingreso está bloqueada desde el ' + FechaLock + #13#10 + 'Consulte con el administrador del sistema.');
      end;
    end;
  finally
    qryVerVida.Free;
  end;
end;

function TGIREConexion.BuscarConfiguracionINI(Clave, Valor: String): string;
var
  ArchivoIni: TIniFile;
begin
  Result := '';
  ArchivoIni := TIniFile.Create(DirectorioTemporales + NombreArchivoINI);
  try
    Result := ArchivoIni.ReadString(Clave, Valor, '');
  finally
    ArchivoIni.Free;
  end;

end;

end.
