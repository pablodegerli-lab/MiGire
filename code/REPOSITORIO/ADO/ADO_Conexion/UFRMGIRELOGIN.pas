unit uFrmGireLogin;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, ADODB,
  UFRMGIREDLG, uADOConexion, StdCtrls, ExtCtrls, ActnList, Buttons,  dbTables,
  inifiles, SeteaRol, jpeg, StrUtils, Commctrl;

type
  TFrmGIRELogin = class(TFrmGIREDlg)
    PanelPrincipal: TPanel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    lblBaseDato: TLabel;
    lblUsuario: TLabel;
    lblPassword: TLabel;
    EdUsuario: TEdit;
    EdPassword: TEdit;
    lblGetBase: TLabel;
    cboEntorno: TComboBox;
    Label1: TLabel;
    Image1: TImage;
    EdCboClave: TEdit;
    lblMensajes: TLabel;
    sbConfigAbrir: TSpeedButton;
    lbConfig: TListBox;
    sbConfigCerrar: TSpeedButton;
    edContexto: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    cbActivaRoles: TCheckBox;
    edAmbito: TEdit;
    Label4: TLabel;
    lblgetVer: TLabel;
    lblgetAmbito: TLabel;
    cbSegundoAmbito: TCheckBox;
    Label5: TLabel;
    Label6: TLabel;
    edAmbito2: TEdit;
    procedure CancelarExecute(Sender: TObject);
    procedure AceptarExecute(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure MuestraMensaje(msg: string);
    procedure Image1DblClick(Sender: TObject);
    procedure sbConfigAbrirClick(Sender: TObject);
    procedure sbConfigCerrarClick(Sender: TObject);
    procedure cboEntornoChange(Sender: TObject);
    procedure edContextoExit(Sender: TObject);
    procedure cbActivaRolesClick(Sender: TObject);
    procedure edContextoChange(Sender: TObject);
    procedure cboEntornoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdPasswordEnter(Sender: TObject);
    procedure EdPasswordKeyPress(Sender: TObject; var Key: Char);
    procedure lbConfigDblClick(Sender: TObject);
    procedure cbSegundoAmbitoClick(Sender: TObject);
  private
    Usuario,
    Entorno : string;
    FConectar   : TADOConnection;
    FDMConexion : TADOConexion;
    function EstaEnLaLista(pEntorno: String): boolean;
    function VerificaUsuario : boolean;
    function VerificaCadenaConexion(pCadena:string):string;
    procedure CargaConfigura(pLista:TListBox);
    procedure BuscarAmbitoINI;
    procedure MostrarMsg(pQuitar: Boolean = False);
    procedure ApuntarMouse(x, y: longint) ;
    procedure WMNCLBUTTONDOWN(var Msg: TWMNCLButtonDown) ; message WM_NCLBUTTONDOWN;
    procedure WMNCLBUTTONUP(var Msg: TWMNCLButtonUp) ; message WM_NCLBUTTONUP;
    procedure habilito2Ambito(bHabilito:boolean);
  protected
    procedure WndProc(var mensaje: TMessage); override;
  public
    FSeteaRol   : Boolean;
    Cambios     : Boolean;
    //hWnd: THandle;
    constructor Create(AOwner: TComponent; AGireADO: TADOConnection; AGireConexion:TADOConexion; var SetearRol: boolean); reintroduce; overload;
  end;
var
  hWndTip: THandle;
  hWnd: THandle;

implementation

{$R *.DFM}
procedure ShowBalloonTip(Control: TWinControl;  Icon: integer;   Title: pchar;   Text: PWideChar;BackCL,   TextCL: TColor);
const
  TOOLTIPS_CLASS = 'tooltips_class32';
  TTS_ALWAYSTIP = $00;
  TTS_NOPREFIX = $02;
  TTS_BALLOON = $40;
  TTF_SUBCLASS = $0010;
  TTF_TRANSPARENT = $0100;
  TTF_CENTERTIP = $0002;
  TTM_ADDTOOL = $0400 + 50;
  TTM_SETTITLE = (WM_USER + 32);
  ICC_WIN95_CLASSES = $000000FF;
type
  TOOLINFO = packed record
       cbSize: Integer;
       uFlags: Integer;
       hwnd: THandle;
       uId: Integer;
       rect: TRect;
       hinst: THandle;
       lpszText: PWideChar;
       lParam: Integer;
  end;
var
  //hWndTip: THandle;
  ti: TOOLINFO;
  //hWnd: THandle;
begin
  hWnd    := Control.Handle;
  hWndTip := CreateWindow(TOOLTIPS_CLASS,
                          nil,
                          WS_POPUP or TTS_NOPREFIX or TTS_BALLOON or TTS_ALWAYSTIP,
                          0,
                          0,
                          0,
                          0,
                          hWnd,
                          0,
                          HInstance,
                          nil);
  if hWndTip <> 0 then
   begin
    SetWindowPos(hWndTip,
                 HWND_TOPMOST,
                 0,
                 0,
                 0,
                 0,
                 SWP_NOACTIVATE or SWP_NOMOVE or SWP_NOSIZE);
    ti.cbSize := SizeOf(ti);
    ti.uFlags := TTF_CENTERTIP or TTF_TRANSPARENT or TTF_SUBCLASS;
    ti.hwnd := hWnd;
    ti.lpszText := Text;
    Windows.GetClientRect(hWnd, ti.rect);
    SendMessage(hWndTip, TTM_SETTIPBKCOLOR, BackCL, 0);
    SendMessage(hWndTip, TTM_SETTIPTEXTCOLOR, TextCL, 0);
    SendMessage(hWndTip, TTM_ADDTOOL, 1, Integer(@ti));
    SendMessage(hWndTip, TTM_SETTITLE, Icon mod 4, Integer(Title));
   end;
end;

procedure TFrmGIRELogin.MostrarMsg(pQuitar: Boolean = False);
begin
 if pQuitar then
   DestroyWindow(hWndTip)
 else
   ShowBalloonTip(EdPassword,
                1,
                'Bloq Mayúsq Activado',
                'Si tiene activada la tecla BloqMayús'+chr(13)+chr(10)+
                'es posible que escriba mal su contraseña.'+chr(13)+chr(10)+chr(13)+chr(10)+
                'Presione la tecla BloqMayús para desactivar'+chr(13)+chr(10)+
                'antes de escribir su contraseña',
                clCream,
                clBlack);

end;

procedure TFrmGIRELogin.CancelarExecute(Sender: TObject);
begin
  inherited;
  Application.Terminate;
end;

procedure TFrmGIRELogin.AceptarExecute(Sender: TObject);
var
msgerror : string;
begin
  MuestraMensaje('Conectando a la Base de Datos...');
  try
   if Cambios then
    begin
     FDMConexion.ClaveAplicacion := edContexto.Text;
     FDMConexion.Ambito := edAmbito.text;
//LABL
     FDMConexion.Ambito2 := edAmbito2.text;
//
     FDMConexion.Entorno := cboEntorno.Text;
    end;
   FDMConexion.AsignaRoles := cbActivaRoles.Checked;
   FDMConexion.VerificaConexion(EdUsuario.Text,EdPassword.Text,cboEntorno.Text);
   MuestraMensaje('Asignando permisos de ingreso...');
   FDMConexion.GrabarLog('Conectando al usuario...' );
   FDMConexion.AbrirConexion(FDMConexion.ADOConec);
   //FDMConexion.ADOConec.Open(EdUsuario.Text,EdPassword.Text);
   //FSeteaRol.Activar(FConectar);
   //FSeteaRol.free;
   if FDMConexion.Ambito <> '' then
    begin
     FDMConexion.GuardaINI(FDMConexion.TituloSeccion,FDMConexion.Entorno,FDMConexion.Ambito);
     FDMConexion.GuardaINI(FDMConexion.TituloSeccion,FDMConexion.Ambito+'_roles', IfThen( FDMConexion.AsignaRoles,'Si','No'));
    end;
   FDMConexion.GrabarArchINI(EdUsuario.Text,cboEntorno.Text);
   FDMConexion.GrabarLog('Conectado!!!!' );
  except
     on e:Exception do
      begin
       ModalResult := mrNone;
       EdPassword.SetFocus;
       lblMensajes.Caption:='Acceso denegado...';
       PanelPrincipal.Repaint;
       msgerror := e.Message;
       FDMConexion.GrabarLog('Error!!!!... '+msgerror );
       raise Exception.Create('No se pudo establecer la conexión con la base de datos. Verifique.'+#13#10+PChar(msgerror));
      end;
  end;
  inherited;
end;

constructor TFrmGIRELogin.Create(AOwner: TComponent; AGireADO: TADOConnection;
AGireConexion:TADOCOnexion; var SetearRol: boolean);
Var
  TempCons: string;
begin
  inherited Create(AOwner);
  Cambios        := False;
  Usuario        := '';
  Entorno        := '';
  FConectar      := AGireADO;
  FDMCOnexion    := AGIREConexion;
  FDMCOnexion.CargaDesdeINI(Usuario , Entorno);
  if Entorno='' then
   if FDMCOnexion.EstaEnProduccion then
     begin
      cboEntorno.Text := 'PRODUCCION';
      Entorno:= 'PRODUCCION';
     end;
  if  FDMConexion.EntornoxParam = '' then
   begin
    if  FDMCOnexion.BuscarEnIni then
     Begin
      FDMConexion.Ambito := UpperCase( FDMCOnexion.DesdeINI(FDMCOnexion.TituloSeccion, Entorno));
      FDMConexion.Ambito2:= UpperCase( FDMCOnexion.DesdeINI(FDMCOnexion.TituloSeccion, 'Ambito Secundario_'+Entorno));
      FDMConexion.AsignaRoles :=strtobool(  IfThen( UpperCase( FDMCOnexion.DesdeINI(FDMCOnexion.TituloSeccion, FDMConexion.Ambito + '_roles'))='SI','True','False'));
    end;
    FDMConexion.Entorno := Entorno;
    TempCons := UpperCase( FDMCOnexion.DesdeINI(FDMCOnexion.TituloSeccion, Entorno));
    if ((TempCons <> FDMConexion.Ambito) and (SetearRol)) then
     begin
      FDMConexion.Ambito := IfThen( TempCons<>'',TempCons,FDMConexion.Ambito) ;
      TempCons := UpperCase( FDMCOnexion.DesdeINI(FDMCOnexion.TituloSeccion, TempCons + '_roles'));
      SetearRol := strtobool( IfThen(TempCons<>'', IfThen(TempCons='SI','true','false') ,booltostr( SetearRol))) ;
	  if Entorno <> 'PRODUCCION' then
         FDMConexion.Ambito2:= UpperCase( FDMCOnexion.DesdeINI(FDMCOnexion.TituloSeccion, 'Ambito Secundario_'+Entorno));
     end;
   end
  else
   begin
     FDMConexion.Ambito := FDMConexion.AmbitoxParam;
     FDMConexion.Entorno:= FDMConexion.EntornoxParam;
     SetearRol  := FDMConexion.AsignaRoles;
     Entorno    := FDMConexion.Entorno;
   end;
  EdUsuario.Text := Usuario;
  if not FDMCOnexion.EstaEnProduccion then
    cboEntorno.Text := Entorno;
  edAmbito.text  := FDMConexion.Ambito;
//LABL
  edAmbito2.text := FDMConexion.Ambito2;
//
  lblgetAmbito.Caption   := FDMConexion.Ambito;
  edContexto.Text := FDMConexion.ClaveAplicacion;
  cbActivaRoles.Checked := SetearRol;
  cbSegundoAmbito.Checked := FDMConexion.ActivarConecAux;
  if FDMConexion.CreaArchivoINI then
    sbConfigAbrir.Visible := true;
  if ( (cboEntorno.Text = 'PRODUCCION')  ) then
   begin
    if FDMCOnexion.EstaEnProduccion then
     begin
      edAmbito.Enabled := False;
      edContexto.Enabled := False;
      cbActivaRoles.Enabled := False;
     end;
   end

end;

procedure TFrmGIRELogin.FormActivate(Sender: TObject);
begin
  inherited;
  if (FDMCOnexion.NombreArchivoINI <> '') and (EdUsuario.Text <> '') then
    EdPassword.SetFocus;
  MuestraMensaje('Cargando configuración del cliente...');
  if not FDMConexion.CargaTNSNames( cboEntorno) then
    MuestraMensaje('No se localizó la configuración del cliente...')
  else
    MuestraMensaje('');
  cboEntorno.Text := Entorno;

end;

procedure TFrmGIRELogin.MuestraMensaje(msg: string);
begin
  lblMensajes.Caption := msg;
  PanelPrincipal.Repaint;
  if not (msg='') then
    sleep(300);
end;

procedure TFrmGIRELogin.Image1DblClick(Sender: TObject);
begin
  inherited;
  if VerificaUsuario then
    FDMConexion.NombreProveedor := VerificaCadenaConexion(PromptDataSource(Handle, FDMConexion.NombreProveedor));
end;

function TFrmGIRELogin.VerificaUsuario: boolean;
begin
  result := false;
  if (EdUsuario.Text = 'sistema') and (EdPassword.text = 'drivergire') then
    result := true;
end;

function TFrmGIRELogin.VerificaCadenaConexion(pCadena: string): string;

 function PosChar(pCad:string;pPI:integer;pC :Char):integer;
 var
   LimS  ,
   LimI  :integer;
 begin
   result := 0;
   LimI   := pPI;
   LimS   := length(pCad);
   while limI <= Lims do
    begin
     if pCad[LimI] = pC then
      begin
       result := LimI;
       LimI      := LimS;
      end;
     Inc(LimI);
    end;
 end;

 function QuitaStr(pCad:string;pPI:integer):string;
 begin
   Delete( pCad, pPI, PosChar(pCad,pPI,';') );
   result := pCad;
 end;

var
  PosInic : integer;
begin
  if pCadena<>'' then
   begin
    if pCadena[Length(pCadena)]<>';' then
      pCadena := pCadena + ';';
    PosInic := pos('user id',LowerCase( pCadena ));
    if PosInic<>0 then
      pCadena := QuitaStr(pCadena,PosInic);
    PosInic := pos('password',LowerCase( pCadena ));
    if PosInic<>0 then
      pCadena := QuitaStr(pCadena,PosInic);
   end
  else
    pCadena := 'Predeterminada';
  result := pCadena;
end;

procedure TFrmGIRELogin.sbConfigAbrirClick(Sender: TObject);
begin
  inherited;
  
//LABL  Height := 400;
 if FDMCOnexion.ActivarConecAux then
    Height := 440
  else
    Height := 400 ;
  lbConfig.Visible := true;
  sbConfigCerrar.Visible := true;
  lbConfig.Items.Add('Configuración archivo inicio:');
  lbConfig.Items.Add('');
  CargaConfigura(lbConfig);
end;

procedure TFrmGIRELogin.sbConfigCerrarClick(Sender: TObject);
begin
  inherited;
  lbConfig.Visible := false;
  Height := 255;
  sbConfigCerrar.Visible := false;
  lbConfig.Items.Clear;
end;

procedure TFrmGIRELogin.CargaConfigura(pLista: TListBox);
var
  ArchivoIni: TIniFile;
begin
   if FDMConexion.CreaArchivoINI then
   begin
    ArchivoIni := TIniFile.Create(FDMConexion.DirectorioArchivoINI+FDMConexion.NombreArchivoINI);
    try
      ArchivoIni.ReadSectionValues(application.title,pLista.Items);
      pLista.Items.Add('Ultimo ingreso        : ');
      //pLista.Items.Add(ArchivoIni.ReadString('Usuarios '+application.title, ArchivoIni.ReadString(application.title, 'Usuario', ''), ''));
    finally
      ArchivoIni.Free;
    end;
   end;
end;

procedure TFrmGIRELogin.cboEntornoChange(Sender: TObject);
Var
  TempCons :String;
begin
  inherited;
  edAmbito.text := UpperCase( FDMCOnexion.DesdeINI(FDMCOnexion.TituloSeccion, cboEntorno.Text));
  TempCons := UpperCase( FDMCOnexion.DesdeINI(FDMCOnexion.TituloSeccion, edAmbito.text + '_roles'));
  if ( (cboEntorno.Text = 'PRODUCCION')  ) then
   begin
    if  (FDMConexion.Ambito <>'') then
      cbActivaRoles.Checked := strtobool( IfThen(TempCons<>'', IfThen(TempCons='SI','true','false') ,booltostr( cbActivaRoles.Checked))) ;
    if FDMCOnexion.EstaEnProduccion then
     begin
      edAmbito.Enabled := False;
      edContexto.Enabled := False;
      cbActivaRoles.Enabled := False;
//LABL
      cbSegundoAmbito.checked := false;
      cbSegundoAmbito.Enabled := False;
      edAmbito2.Enabled := False;
//LABL
     end;

   end
  else
   begin
    edAmbito.Enabled := True;
    edContexto.Enabled := True;
    cbActivaRoles.Enabled := True;
//LABL
    cbSegundoAmbito.Enabled := True;
    edAmbito2.Enabled := True;
    edAmbito2.Enabled := cbSegundoAmbito.checked;
//LABL
   end;
  BuscarAmbitoINI;
end;

procedure TFrmGIRELogin.edContextoExit(Sender: TObject);
begin
  inherited;
  FDMConexion.ClaveAplicacion := edContexto.Text;
end;

procedure TFrmGIRELogin.cbActivaRolesClick(Sender: TObject);
begin
  inherited;
  FDMConexion.AsignaRoles := cbActivaRoles.Checked;
end;

procedure TFrmGIRELogin.edContextoChange(Sender: TObject);
begin
  inherited;
  Cambios := True ;
end;

procedure TFrmGIRELogin.BuscarAmbitoINI;
Var
  TempCons :String;
begin
 edAmbito.text := UpperCase( FDMCOnexion.DesdeINI(FDMCOnexion.TituloSeccion, cboEntorno.Text));
 edAmbito2.Text:= UpperCase( FDMCOnexion.DesdeINI(FDMCOnexion.TituloSeccion, 'Ambito Secundario_'+cboEntorno.Text));
 TempCons := UpperCase( FDMCOnexion.DesdeINI(FDMCOnexion.TituloSeccion, edAmbito.text + '_roles'));
 cbActivaRoles.Checked := strtobool( IfThen(TempCons<>'', IfThen(TempCons='SI','true','false') ,booltostr( cbActivaRoles.Checked))) ;
 FDMConexion.AsignaRoles := cbActivaRoles.Checked;
end;

procedure TFrmGIRELogin.cboEntornoKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if  not EstaEnLaLista(cboEntorno.Text) then
    edAmbito.Text := cboEntorno.Text    ;
end;

function TFrmGIRELogin.EstaEnLaLista(pEntorno: String): boolean;
Var
  Inx: integer;
begin
  Result := False;
  Inx := 0;
  while not ((Result) or  (Inx > cboEntorno.ItemIndex)) do
   begin
    if UpperCase( pEntorno ) =  UpperCase( cboEntorno.Items[Inx] ) then
      Result := true;
    Inc(Inx)
   end;
end;

procedure TFrmGIRELogin.EdPasswordEnter(Sender: TObject);
begin
  inherited;
  if (FDMCOnexion.CapsLock) then
   begin
    MostrarMsg ;
    ApuntarMouse(EdPassword.Left + 10,EdPassword.Top + 10);
   end
  else
    MostrarMsg(True) ;


end;

procedure TFrmGIRELogin.EdPasswordKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if (FDMCOnexion.CapsLock) then
   begin
    MostrarMsg;
    ApuntarMouse(EdPassword.Left + 10,EdPassword.Top + 10);
   end
  else
   MostrarMsg(True) ;
end;

procedure TFrmGIRELogin.ApuntarMouse(x, y: longint) ;
var
  pt:TPoint; // point-structure para getcursorpos()
begin
   pt := ClientToScreen( point(x,y)) ;
   SetCursorPos(pt.x, pt.y)

end;

procedure TFrmGIRELogin.lbConfigDblClick(Sender: TObject);
begin
  inherited;
  if (Pos('Ultimo ', lbConfig.Items[lbConfig.ItemIndex]) <> 0) and (EdPassword.Text = 'desarrollo') then
   begin
    edAmbito.Enabled := not edAmbito.Enabled ;
    edContexto.Enabled := not edContexto.Enabled;
    cbActivaRoles.Enabled := not cbActivaRoles.Enabled;
   end
end;

procedure TFrmGIRELogin.WndProc(var mensaje: TMessage);
begin

  if (mensaje.Msg=WM_SYSCOMMAND) and ((mensaje.WParam and $FFF0) = SC_CLOSE) then
    Application.Terminate
  else
    inherited;
end;

procedure TFrmGIRELogin.WMNCLBUTTONDOWN(var Msg: TWMNCLButtonDown) ;
begin
   if Msg.HitTest = HTHELP then
     Msg.Result := 0 // "eat" the message
   else
     inherited;
end;

procedure TFrmGIRELogin.WMNCLBUTTONUP(var Msg: TWMNCLButtonUp) ;
const
  Linea=Chr(13)+Chr(10);
var
  Mensa: String;
begin
   if Msg.HitTest = HTHELP then
   begin
     Msg.Result := 0;
  Mensa:= 'Puede recibir por parametro en linea de comando para realizar distintas acciones.' + Linea +
        ' -e[entorno=ambito]   : Conecta en el entorno al ambito solicitado ej: en DESARROLLO al ambito TEST8i' + Linea +
        ' -r                   : Activa los roles por los paquetes de seguridad de 11g' + Linea +
        ' -l[path + nombreLog] : Lugar y archivo para el log de actividad de la conexion y para ser utilizado tambien por las aplicaciones' + Linea +
        ' -m                   : Activa la memoria desde el archivo ini' + Linea +
        ' Ejemplo:' + Linea + Linea +
        ' myejecutable.exe -ePRODUCCION=OL_ALTA -r -m' + Linea + Linea +
        ' y el formulario de conexion mostrara ese entorno y conectara a OL_ALTA con los roles activados por 11g y lo recordara para la proxima' + Linea +
        ' ejecucion.' ;
  MessageBox(Handle, PChar(Mensa), PChar('Ayuda para conectar al sistema'), 64 )
   end
   else
     inherited;
end;

procedure TFrmGIRELogin.cbSegundoAmbitoClick(Sender: TObject);
begin
  inherited;
  habilito2Ambito(cbSegundoAmbito.checked);
end;

procedure TFrmGIRELogin.habilito2Ambito(bHabilito: boolean);
begin
  edAmbito2.enabled := bHabilito;
  FDMConexion.GuardaINI(FDMConexion.TituloSeccion,'Ambito Secundario_'+cboEntorno.Text,edAmbito2.Text);
  FDMConexion.GuardaINI(FDMConexion.TituloSeccion,'Conexion Secundaria', IfThen(edAmbito2.enabled,'SI','NO'));
  {if not bHabilito then
    edAmbito2.Text := '';}
end;

end.
