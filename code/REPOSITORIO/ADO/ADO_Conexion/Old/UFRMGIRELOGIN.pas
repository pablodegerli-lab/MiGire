unit uFrmGireLogin;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, ADODB,
  UFRMGIREDLG, uADOConexion, StdCtrls, ExtCtrls, ActnList, Buttons,  dbTables,
  inifiles;

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
  private
    Usuario,
    Entorno : string;
    FConectar   : TADOConnection;
    FDMConexion : TADOConexion;
  public
    constructor Create(AOwner: TComponent; AGireADO: TADOConnection; AGireConexion:TADOConexion); reintroduce; overload;

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
   MuestraMensaje('Consultando permisos de ingreso...');
   FDMCOnexion.RolesConexion(EdUsuario.Text,cboAmbito.Text);
   MuestraMensaje('Asignando permisos...');
   FDMCOnexion.SeteaRoles(EdUsuario.Text,cboAmbito.Text);
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

constructor TFrmGIRELogin.Create(AOwner: TComponent;
  AGireADO: TADOConnection; AGireConexion:TADOCOnexion);

begin
  inherited Create(AOwner);

  Usuario:='';
  Entorno:='';
  FConectar:=AGireADO;
  FDMCOnexion:=AGIREConexion;
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

end.

