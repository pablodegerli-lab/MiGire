unit uFrmGireLoginBDE;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFRMGIREDLG, uGireConexion, StdCtrls, ExtCtrls, ActnList, Buttons, DBTables,
  inifiles;

type
  TFrmGIRELoginBDE = class(TFrmGIREDlg)
    PanelPrincipal: TPanel;
    Bevel1:      TBevel;
    Bevel2:      TBevel;
    lblBaseDato: TLabel;
    lblUsuario:  TLabel;
    lblPassword: TLabel;
    EdUsuario:   TEdit;
    EdPassword:  TEdit;
    lblGetBase:  TLabel;
    cboAmbito:   TComboBox;
    Label1:      TLabel;
    Image1:      TImage;
    lblMensajes: TLabel;
    procedure CancelarExecute(Sender: TObject);
    procedure AceptarExecute(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    Usuario, Entorno: string;
    FDMConexion:      TGIREConexion;
    procedure MuestraMensaje(msg: string);
  public
    constructor Create(AOwner: TComponent; AConecBaseDatos: TGIREConexion); reintroduce; overload;
  end;

implementation

{$R *.DFM}

procedure TFrmGIRELoginBDE.CancelarExecute(Sender: TObject);
begin
  inherited;
  Application.Terminate;
end;

procedure TFrmGIRELoginBDE.AceptarExecute(Sender: TObject);
var
  msgerror: string;
begin
  MuestraMensaje('Conectando a la Base de Datos...');
  try
    FDMConexion.VerificaConexion(EdUsuario.Text, EdPassword.Text, cboAmbito.Text);
    MuestraMensaje('Asignando permisos de ingreso...');
    FDMConexion.AbrirConexion(FDMConexion.DBPrinc);
    //FDMConexion.DBPrinc.Open;
    FDMConexion.GrabarArchINI(EdUsuario.Text, cboAmbito.Text);
  except
    on e: Exception do
    begin
      ModalResult := mrNone;
      EdPassword.SetFocus;
      MuestraMensaje('Acceso denegado...');
      msgerror := e.Message;
      raise Exception.Create('No se pudo establecer la conexión con la base de datos. Verifique.' + #13#10 + PChar(msgerror));
    end;
  end;
  inherited;
end;

constructor TFrmGIRELoginBDE.Create(AOwner: TComponent; AConecBaseDatos: TGIREConexion);
begin
  inherited Create(AOwner);
  Usuario     := '';
  Entorno     := '';
  FDMCOnexion := AConecBaseDatos;
  FDMCOnexion.CargaDesdeINI(Usuario, Entorno);
  EdUsuario.Text := Usuario;
  cboAmbito.Text := Entorno;
end;

procedure TFrmGIRELoginBDE.FormActivate(Sender: TObject);
begin
  inherited;
  if (FDMCOnexion.NombreArchivoINI <> '') and (EdUsuario.Text <> '') then
    EdPassword.SetFocus;
  MuestraMensaje('Cargando configuración del cliente...');
  if not FDMConexion.CargaTNSNames(cboAmbito) then
    MuestraMensaje('No se localizó la configuración del cliente...')
  else
    MuestraMensaje('');
  cboAmbito.Text := Entorno;
end;

procedure TFrmGIRELoginBDE.MuestraMensaje(msg: string);
begin
  lblMensajes.Caption := msg;
  PanelPrincipal.Repaint;
  if not (msg = '') then
    sleep(300);
end;

end.
