unit uFrmGireLogin;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, ADODB,
  UFRMGIREDLG, uDbExpressConexion, StdCtrls, ExtCtrls, ActnList, Buttons,  dbTables,
  inifiles, SeteaRol, jpeg, DBXpress, FMTBcd, SqlExpr, DBClient;

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
    cboAmbito: TComboBox;
    Label1: TLabel;
    Image1: TImage;
    EdCboClave: TEdit;
    lblMensajes: TLabel;
    procedure CancelarExecute(Sender: TObject);
    procedure AceptarExecute(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure MuestraMensaje(msg: string);
    procedure Image1DblClick(Sender: TObject);
  private
    Usuario,
    Entorno : string;
    FConectar   : TSQLConnection;
    FDMConexion : TDbExpressConexion;
    FSeteaRol   : TSeteaRoles;
    function VerificaUsuario : boolean;
    function VerificaCadenaConexion(pCadena:string):string;
  protected
    procedure WndProc(var mensaje: TMessage); override;
  public
    constructor Create(AOwner: TComponent; AGireDBExpress: TSQLConnection; AGireConexion:TDbExpressConexion; SetearRol: TSeteaRoles); reintroduce; overload;
  end;

implementation

{$R *.DFM}

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
   FDMConexion.VerificaConexion(EdUsuario.Text,EdPassword.Text,cboAmbito.Text);
   MuestraMensaje('Asignando permisos de ingreso...');
   FDMConexion.AbrirConexion(FDMConexion.SQLConnect);
   FDMConexion.GrabarArchINI(EdUsuario.Text,cboAmbito.Text);
  except
     on e:Exception do
      begin
       ModalResult := mrNone;
       EdPassword.SetFocus;
       lblMensajes.Caption:='Acceso denegado...';
       PanelPrincipal.Repaint;
       msgerror := e.Message;
       raise Exception.Create('No se pudo establecer la conexión con la base de datos. Verifique.'+#13#10+PChar(msgerror));
      end;
  end;
  inherited;
end;

constructor TFrmGIRELogin.Create(AOwner: TComponent; AGireDBExpress: TSQLConnection;
AGireConexion:TDbExpressConexion; SetearRol: TSeteaRoles);
begin
  inherited Create(AOwner);
  Usuario        := '';
  Entorno        := '';
  FConectar      := AGireDBExpress;
  FDMCOnexion    := AGIREConexion;
  FSeteaRol      := SetearRol;
  FDMCOnexion.CargaDesdeINI(Usuario , Entorno);
  EdUsuario.Text := Usuario;
  cboAmbito.Text := Entorno;
end;

procedure TFrmGIRELogin.FormActivate(Sender: TObject);
begin
  inherited;
  if (FDMCOnexion.NombreArchivoINI <> '') and (EdUsuario.Text <> '') then
    EdPassword.SetFocus;
  MuestraMensaje('Cargando configuración del cliente...');
  if not FDMConexion.CargaTNSNames( cboAmbito ) then
    MuestraMensaje('No se localizó la configuración del cliente...')
  else
    MuestraMensaje('');
  cboAmbito.Text := Entorno;
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

procedure TFrmGIRELogin.WndProc(var mensaje: TMessage);
begin
  if (mensaje.Msg=WM_SYSCOMMAND) and ((mensaje.WParam and $FFF0) = SC_CLOSE) then
    Application.Terminate
  else
    inherited;
end;

end.
