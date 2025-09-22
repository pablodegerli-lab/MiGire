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
                        genere la aplicacion y el archivo de inicio, o sino usara el nombre
                        por defecto c:\giretmp\
  ControlClave        : Esta en falso por defecto, si se la activa la conexion controlara
                        el tiempo de vida de la clave del usuario para conectarse a la Base
                        de Datos
  AsignaRoles         : Esta en verdadero por defecto, si se activa utilizara la asignacion de Roles
                        en ejecucion. Pedir al DBA que asigne los roles y las claves
                        correspondientes para el acceso del usuario
  ConexionDirecta     : Esta en falso por defecto, si se activa la aplicacion se conectara
                        automaticamente a la base de datos sin solicitar usuario y clave.
                        Todos los datos se asignaran en ejecucion sobre las propiedades
                        de usuario(NombreUsuario, ClaveUsuario, Ambito.

  }

unit uGIREConexion;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, Db, FileCtrl, StdCtrls, inifiles, define, registry;

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
    procedure RolesConexion(pUsuario,pEntorno:string);
  private
    FNombreUsuario: string;
    FClaveUsuario: String;
    Salida : boolean;
    CambioClave : String;
    FAsignaRoles: Boolean;
    FControlClave: Boolean;
    ClaveFin  : boolean;
    MsgError  : string;
    function BuscaEnRegistro:string;
    procedure BuscaArchivos(Directorio, Mascara : AnsiString; var ListaNombreArchs : TStringList; Recursivo : Boolean);
    procedure SetNombreUsuario(const Value: string);
    procedure SetClaveUsuario(const Value: String);
    procedure SetAsignaRoles(const Value: Boolean);
    function VerificaTitulo(Aplicacion:string):string;
    procedure SetControlClave(const Value: Boolean);
  protected
    FUsaUsuarioParams: Boolean;
    FCrearArch: Boolean;
    FConecAuto: Boolean;
  public
    Ambito       ,
    TituloSeccion: String;
    ListaRoles: tstringlist;
    DirectorioTemporales : string;
    NombreArchivoINI : string;
    ConAutoUsuario,ConAutoClave,ConAutoEntorno :string;
    procedure ActualizarUsuarioParams(ASourceDataSet: TDataSet);
    constructor Create(AOwner: TComponent); override;
    function CargaTNSNames(var TNSName:TComboBox):boolean;
    procedure CargaDesdeINI(var pUsuario:string;  var pEntorno:string);
    function  VerificaINI(Sender:TObject):boolean;
    function VerificaConexion(Usuario, Clave, Entorno: String): boolean;
    procedure VerificaVidaContrase;     
    procedure SeteaRoles(pUsuario,pEntorno:string); overload;
    procedure SeteaRoles; overload;
    Procedure GrabarArchINI( pUsuario, pEntorno:string);
    property CreaArchivoINI: Boolean read FCrearArch write FCrearArch default False;
    property ConecAutomatic: Boolean read FConecAuto write FConecAuto default False;
    property NombreUsuario:string read FNombreUsuario write SetNombreUsuario;
    property ClaveUsuario:String  read FClaveUsuario write SetClaveUsuario;
    property AsignaRoles: Boolean  read FAsignaRoles write SetAsignaRoles default True;
    property ControlClave: Boolean  read FControlClave write SetControlClave default False;
  end;

var
  Conexion: TGIREConexion;

implementation

uses uFrmGireLogin, uFrmGIRECambioPasw;

{$R *.DFM}

procedure TGIREConexion.ConexionDestroy(Sender: TObject);
begin
  if FUsaUsuarioParams then
    qUsuarioParams.ApplyUpdates;
  salida := true;
  GrabarArchINI(NombreUsuario,Ambito);
  DBPrinc.Close;
end;

procedure TGIREConexion.ActualizarUsuarioParams(ASourceDataSet: TDataSet);
var
  i: Integer;
  CurField: TField;
begin
  qUsuarioParams.Edit;
  try
    for i := 0 to ASourceDataSet.FieldCount -1  do
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
  FArchivoINI:string;
  FrmGIRELogin:TFrmGIRELogin;
begin
  inherited;
  if ControlClave then
    CreaArchivoINI := true;
  TituloSeccion := application.title;
  if VerificaINI(AOwner) then
   begin
    FArchivoINI:=DirectorioTemporales;
    if Copy(FArchivoINI,Length(FArchivoINI), Length(FArchivoINI))<> '\' then
      FArchivoINI:=FArchivoINI+'\';
    FArchivoINI:= FArchivoINI+NombreArchivoINI;
   end;
  if FConecAuto then
   begin
    try
      VerificaConexion(ConAutoUsuario,ConAutoClave,ConAutoEntorno);
      RolesConexion(ConAutoUsuario,ConAutoEntorno);
      SeteaRoles(ConAutoUsuario,ConAutoEntorno);
    except
      raise Exception.Create('Faltan parametros para la conexion');
    end;
   end
  else
   begin
    FrmGIRELogin:=TFrmGIRELogin.Create(self,self);
    FrmGIRELogin.lblGetBase.Caption:='Oracle - BDE='+DBPrinc.DatabaseName;
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
  FAsignaRoles:= True; 
  FUsaUsuarioParams    := False;
  Salida               := false;
  NombreArchivoINI     := 'GIRETMP.INI';
  DirectorioTemporales := 'C:\GIRETMP\';
end;


Function TGIREConexion.VerificaINI(Sender:TObject):boolean;
  Function GrabarINI(FDirectorioArchivo:string):boolean;
  var
    ArchivoINI: TIniFile;
  begin
    result:=true;
    ArchivoIni := TIniFile.Create(FDirectorioArchivo);
    try
      ArchivoIni.WriteString('Configuracion', 'Usuario', '');
      ArchivoIni.WriteString('Configuracion', 'DirectorioTemporales',DirectorioTemporales);
      ArchivoIni.WriteString('Configuracion', 'Entorno', '');
    except
      result:=false
    end;
    ArchivoIni.Free;
  end;
  function Rat(aBuscar:char;aDonde:string):integer;
  var
    i:integer;
  begin
    result := 0;
    i      := length(aDonde);
    while i >= 1 do
     begin
      if aDonde[i] = aBuscar then
       begin
        result := i;
        i      := 0;
       end;
      i := i-1;
     end;
  end;
var
  Archivo:string;
  Directorio:string;
begin
  result:=true;
  if FCrearArch then
   begin
    Archivo:=Copy(NombreArchivoINI,Rat('\',NombreArchivoINI)+1,Length(NombreArchivoINI));
    Directorio:=DirectorioTemporales;
    if Copy(Directorio,Length(Directorio), Length(Directorio))<> '\' then
      Directorio:=Directorio+'\';
    if not DirectoryExists(Directorio) then
       if not CreateDir(Directorio) then
          result:=false;
    SetCurrentDir(Directorio);
    if not FileExists(Directorio+Archivo) then
       if not GrabarINI(Directorio+Archivo)then
           result:=false;
   end
  else
    result:=false;
end;

procedure TGIREConexion.SetNombreUsuario(const Value: string);
begin
  FNombreUsuario := Value;
end;

procedure TGIREConexion.SetClaveUsuario(const Value: String);
begin
  FClaveUsuario := Value;
end;

procedure TGIREConexion.GrabarArchINI(pUsuario,pEntorno:string);
 var
   FechaCaduca : string;
   ArchivoINI: TIniFile;
 begin
  FechaCaduca := datetostr(now+45);
  ArchivoIni := TIniFile.Create(DirectorioTemporales+NombreArchivoINI);
  try
    if Salida then CambioClave := CambioClave + DateTimeToStr(Date+time)+ ' -> OK';
    ArchivoIni.WriteString(TituloSeccion, 'Usuario', pUsuario);
    ArchivoIni.WriteString(TituloSeccion, 'Entorno', pEntorno);
    ArchivoIni.WriteString(TituloSeccion, 'DirectorioTemporales', DirectorioTemporales);
    ArchivoIni.WriteString('Usuarios '+TituloSeccion, pUsuario, CambioClave);
    //if ClaveFin then
    //   ArchivoIni.WriteString('Usuarios '+TituloSeccion, pUsuario,cifrado(FechaCaduca));
  except
  end;
  ArchivoIni.Free;
 end;

function TGIREConexion.CargaTNSNames(var TNSName: TComboBox): boolean;
var
  ArchTNS    : TextFile;
  Linea      : String;
  Archivos   : TStringList;
  i          : integer;
begin
  result:=true;
  Archivos := TStringList.Create;
  try
    TNSName.Clear;
    BuscaArchivos(BuscaEnRegistro,'TNSNAMES.ORA',Archivos,true);
    for i:=0 to Archivos.Count - 1 do
     begin
      AssignFile(ArchTNS,Archivos.Strings[i]);
      Reset(ArchTNS);
      while not Eof(ArchTNS) do
       begin
        Readln(ArchTNS, Linea);
         if (pos('.WORLD',Linea)>0) or ((pos('(',Linea)=0) and (pos('=',Linea)>0)) then
          begin
           if (pos('DBGIRE',Linea)>0) then
           if (pos('-TEST',Linea)>0) then
             Linea := 'DESARROLLO ='
           else
             Linea := 'PRODUCCION =';
           if (pos('.',Linea)>0) then
             TNSName.Items.Add(copy(linea,1,pos('.',Linea)-1))
           else
             TNSName.Items.Add(copy(linea,1,pos('=',Linea)-1));
          end;
       end;
      CloseFile(ArchTNS);
    end;
  except
    Exception.Create('No se pudo procesar el archivo de configuración.');
  end;
  Archivos.free;
end;


function TGIREConexion.BuscaEnRegistro: string;
var
  Registro: TRegistry;
begin
  result := ' ';
  Registro := TRegistry.Create;
  try
    Registro.RootKey := HKEY_LOCAL_MACHINE;
    if Registro.OpenKey('\Software\ORACLE',True) then
      result := Registro.ReadString('ORACLE_HOME');
  finally
    Registro.CloseKey;
    Registro.Free;
  end;

end;

procedure TGIREConexion.BuscaArchivos(Directorio, Mascara : AnsiString;
         var ListaNombreArchs : TStringList; Recursivo : Boolean);
var
  srRes : TSearchRec;
  iFound : Integer;
begin
  if ( Recursivo ) then
   begin
    if Directorio[Length(Directorio)] <> '\' then Directorio := Directorio +'\';
      iFound := FindFirst( Directorio + '*.*', faAnyfile, srRes );
    while iFound = 0 do
     begin
      if ( srRes.Name <> '.' ) and ( srRes.Name <> '..' ) then
        if srRes.Attr and faDirectory > 0 then
          BuscaArchivos( Directorio + srRes.Name, Mascara, ListaNombreArchs, Recursivo );
      iFound := FindNext(srRes);
     end;
    FindClose(srRes);
   end;
  if Directorio[Length(Directorio)] <> '\' then Directorio := Directorio +'\';
    iFound := FindFirst(Directorio+Mascara, faAnyFile-faDirectory, srRes);
  while iFound = 0 do
   begin
    if ( srRes.Name <> '.' ) and ( srRes.Name <> '..' ) and ( srRes.Name <> '' ) then
      ListaNombreArchs.Add(Directorio+srRes.Name);
    iFound := FindNext(srRes);
   end;
  FindClose( srRes );
end;




function TGIREConexion.VerificaConexion(Usuario, Clave,
  Entorno: String): boolean;
  Procedure ExistenParametrosLogin ;
  var
    Indice:Integer;
    finlista:integer;
  begin
    indice :=0;
    finlista   := DBPrinc.Params.Count;
    while indice<finlista do
     begin
      if  ( Contenido('USER NAME=',DBPrinc.Params[indice]) ) or ( Contenido('PASSWORD=',DBPrinc.Params[indice]) ) then
       begin
        finlista := finlista - 1;
        DBPrinc.Params.Delete(indice);
       end
      else
       indice := indice + 1;
     end;
  end;
  Procedure CambiarClave ;
  var
    CambioPasw:TFrmGIRECambioPasw;

  begin
    CambioPasw:=TFrmGIRECambioPasw.Create(Owner);
    try
      CambioPasw.GireEnlace:=Self;
      CambioPasw.ShowModal;
    except
      raise Exception.Create('No se pudo mostrar el formulario.');
    end;
    CambioPasw.Free;
 end;

begin

  ExistenParametrosLogin;
  DBPrinc.Params.Add('USER NAME='+Usuario);
  DBPrinc.Params.Add('PASSWORD='+Clave);
  Application.Title:=VerificaTitulo(Application.Title);

  if strUpper(PChar(Trim(Entorno)))='PRODUCCION' then
    DBPrinc.AliasName:='DBGire'
  else if strUpper(PChar(Trim(Entorno)))='DESARROLLO' then
    begin
      Application.Title:=Application.Title+' ('+entorno+')';
      DBPrinc.AliasName:='DBGire-Test';
    end
   else
     DBPrinc.AliasName:=entorno;
  try
    DBPrinc.Open;
    Result:=True;
    NombreUsuario:=Usuario;
    ClaveUsuario:=Clave;
    Ambito:=entorno;
    VerificaVidaContrase;
    if ClaveFin then
      if MessageBox(application.Handle, PChar(msgerror+#13#10+'Se recomienda cambiar la clave de ingreso'), PChar(application.title), 49 ) = 1 then
        CambiarClave;
  except
   on e:Exception do
    begin
     raise Exception.Create(e.Message);
     Result:=False;
    end;
  end;
end;

function TGIREConexion.VerificaTitulo(Aplicacion:string):string;
begin

  if Pos(' (',Aplicacion)<>0 then
    Aplicacion:=copy(Aplicacion,1,Pos(' (',Aplicacion));
  result:=Aplicacion;

end;

procedure TGIREConexion.RolesConexion(pUsuario, pEntorno: string);
 procedure CrearLista(pQry : TQuery );
 begin
  listaRoles := TStringList.create;
  while not(pQry.Eof) do
   begin
    listaRoles.Add( pqry.FieldByName('granted_role').text );
    pqry.Next;
   end;
 end;
var
 qryConsulta:TQuery;
begin
 if AsignaRoles then
  begin
   qryConsulta:=tQuery.Create(owner);
   ListaRoles:=TStringList.Create;
   try
    qryConsulta.DatabaseName := 'DBPrinc';
    qryConsulta.SQL.Add('select * from sys.user_role_privs');
    qryConsulta.open;
    CrearLista(qryConsulta);
   except
    raise;
   end;
    qryConsulta.Free;
  end;
end;

procedure TGIREConexion.SetAsignaRoles(const Value: Boolean);
begin
  FAsignaRoles := Value;
end;

procedure TGIREConexion.SeteaRoles(pUsuario,pEntorno: string);

var
  I     : integer;
  cmdRol: TQuery;
  RolUsu: string;
begin
 if (ListaRoles<>nil) and (ListaRoles.Count<>0) then
  begin
   cmdRol := TQuery.Create(owner);
   cmdRol.DatabaseName:='DBPrinc';
   try
     for I := 0 to ListaRoles.Count - 1 do
      begin
       RolUsu   := RolUsu + ListaRoles[I]+' IDENTIFIED BY begini' ;
       if I<>ListaRoles.Count - 1 then
         RolUsu:=RolUsu+', ';
      end;
     cmdRol.SQL.Text := 'set role '+RolUsu;
     cmdRol.ExecSQL;
   except
     Exception.Create('Error al setear los roles de '+pUsuario+' a '+pEntorno);
   end;
   cmdRol.Free
  end;
end;

procedure TGIREConexion.SeteaRoles;
var
  I     :integer;
  cmdRol:TQuery;
begin
  if (ListaRoles<>nil) and (ListaRoles.Count<>0) then
   begin
    cmdRol := TQuery.Create(owner);

    try
      cmdRol.DatabaseName:='DBPrinc';
      for I := 0 to ListaRoles.Count - 1 do
       begin
        cmdRol.SQL.Text :='set role all except '+ListaRoles[I];
        cmdRol.ExecSQL;
       end;
    except
      Exception.Create('Error al quitar los roles del usuario');
    end;
    cmdRol.Free;
   end;
end;

procedure TGIREConexion.CargaDesdeINI(var pUsuario, pEntorno: string);
var
  ArchivoIni: TIniFile;
begin
  if CreaArchivoINI then
   begin
    ArchivoIni := TIniFile.Create(DirectorioTemporales+NombreArchivoINI);
    try
      pUsuario    := ArchivoIni.ReadString(TituloSeccion, 'Usuario', '');
      pEntorno    := ArchivoIni.ReadString(TituloSeccion, 'Entorno', '');
      CambioClave := ArchivoIni.ReadString('Usuarios '+TituloSeccion, pUsuario, '');
      if pos('OK',CambioClave)=0 then
        ArchivoIni.WriteString('Salidas erroneas de '+TituloSeccion, CambioClave + '-- Usuario', pUsuario);
      CambioClave := 'Ing: '+DateTimeToStr(Date+time)+ ' - Sal: ';

      //if (CambioClave='') or (strtodate(Cifrado(CambioClave))<=now) then
      //  ClaveFin:=true;
    except
    end;
    ArchivoIni.Free;
   end;

end;

procedure TGIREConexion.SetControlClave(const Value: Boolean);
begin
  FControlClave := Value;
end;

procedure TGIREConexion.VerificaVidaContrase;
var
  qryVerVida : TQuery;
  Mensaje    ,
  FechaLock  ,
  DiasExpira : string;
begin

  qryVerVida := TQuery.Create(owner);
  try
    qryVerVida.DatabaseName := DBPrinc.DatabaseName;
    qryVerVida.SQL.Add('select account_status,');
    qryVerVida.SQL.Add('nvl(lock_date,to_date('+''''+'01/01/1900'+''''+','+''''+'dd/mm/yyyy'+''''+')) as FHLOCK,');
    qryVerVida.SQL.Add('nvl(expiry_date,to_date('+''''+'01/01/1900'+''''+','+''''+'dd/mm/yyyy'+''''+')) as FHEXPIRA');
    qryVerVida.SQL.Add(' from user_users');
    qryVerVida.open;
    if not qryVerVida.Eof then
     begin
      mensaje := qryVerVida.FieldByName('ACCOUNT_STATUS').asstring;
      if mensaje <> SEstadoPrim then
       begin
        FechaLock := qryVerVida.FieldByName('FHLOCK').asstring;
        DiasExpira:= inttostr(trunc(qryVerVida.FieldByName('FHEXPIRA').asfloat - date) );
        if mensaje = SEstadoExpG then
         begin
          MsgError :=  'Su contraseña de ingreso está por caducar.'+#13#10+'Tiene '+DiasExpira+' dias para ingresar una nueva'+#13#10+'Transcurrido este tiempo su usuario será bloqueado.';
          ClaveFin := true;
         end
        else
         raise Exception.Create('Su contraseña de ingreso está bloqueada desde el '+FechaLock+#13#10+'Consulte con el administrador del sistema.');
       end;
     end;
  finally
    qryVerVida.free;
  end

end;

end.
