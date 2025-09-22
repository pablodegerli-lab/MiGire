{                  Ayuda para el uso del cambio de Password

Cuando se heredo la conexión al proyecto se uso el formulario asi que en el formulario donde
se necesita el cambio de password solo hay que usar la units y hacer lo siguiente:

Procedure CambiarClave ;
var
  CambioPasw:TFrmGIRECambioPasw;                     donde
                                                      MyConexion es el nombre de la variable
begin                                                 que le puso el Programador a la conex.
  CambioPasw:=TFrmGIRECambioPasw.Create(Owner);       de su proyecto.
  CambioPasw.GireEnlace:=MyConexion;
  CambioPasw.ShowModal;
end;

}
unit uFrmGIRECambioPasw;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFRMGIREDLG, StdCtrls, ExtCtrls, ActnList, Buttons,  dbTables, inifiles, define,
  Db, uGIREConexion;

type
  TFrmGIRECambioPasw = class(TFrmGIREDlg)
    qryCambioPasw: TQuery;
  private
    FGireEnlace: TGIREConexion;
    procedure SetGireEnlace(const Value: TGIREConexion);
  published
    PanelPrincipal: TPanel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    lblBaseDato: TLabel;
    lblPaswAnterior: TLabel;
    lblPaswNueva: TLabel;
    edPaswAnterior: TEdit;
    edPaswNueva: TEdit;
    lblGetBase: TLabel;
    lblConfirmaPasw: TLabel;
    Image1: TImage;
    lblUsuario: TLabel;
    edPaswConfirma: TEdit;
    lblNomBD: TLabel;
    lblNomUsu: TLabel;
    Label1: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure edPaswAnteriorExit(Sender: TObject);
    procedure AceptarExecute(Sender: TObject);
    procedure edPaswAnteriorEnter(Sender: TObject);
    function VerificaClaves(Sender: TObject) : boolean;
    property GireEnlace:TGIREConexion   read FGireEnlace write SetGireEnlace;

  private

  public

  end;

implementation



{$R *.DFM}

procedure TFrmGIRECambioPasw.FormActivate(Sender: TObject);
begin
  inherited;
  try
   lblNomBD.Caption  := GireEnlace.Ambito;
   lblNomUsu.Caption := UpperCase(GireEnlace.NombreUsuario);
   if edPaswAnterior.Text <> '' then
    edPaswAnterior.SetFocus;
  except
    raise Exception.Create('No existe conexión para cambiar la contraseña');
  end;
end;

procedure TFrmGIRECambioPasw.edPaswAnteriorExit(Sender: TObject);
begin
  inherited;
  if (edPaswAnterior.Text<>'') and (ModalResult <> mrNone) then
   begin
    edPaswNueva.Color      := clWindow;
    edPaswConfirma.color   := clWindow;
    edPaswNueva.Enabled    := true;
    edPaswConfirma.Enabled := true;
    edPaswNueva.SetFocus;
   end;
end;


function TFrmGIRECambioPasw.VerificaClaves(Sender: TObject) : boolean;
begin
 result:=true;
 if UpperCase(edPaswAnterior.Text)<>UpperCase(GireEnlace.ClaveUsuario) then
  begin
    ShowMessage('Contraseña anterior incorrecta');
    edPaswAnterior.SetFocus;
    result:=false;
  end
 else
  if (edPaswConfirma.Text='') and (edPaswNueva.text='') then
   begin
    edPaswAnteriorExit(Sender);
    result:=false;
   end;
 if result and (edPaswConfirma.Text='') and (edPaswNueva.text<>'') then
  begin
    edPaswConfirma.SetFocus;
    result:=false;
  end;

 if result and (UpperCase(edPaswConfirma.Text)<>UpperCase(edPaswNueva.text)) then
  begin
    ShowMessage('Verificación incorrecta de contraseña nueva');
    edPaswNueva.SetFocus;
    result:=false;
  end;

end;

procedure TFrmGIRECambioPasw.AceptarExecute(Sender: TObject);

begin
 inherited;
 if not verificaClaves(Sender) then
    ModalResult := mrNone
 else
   begin
    try
     qryCambioPasw.DatabaseName := GireEnlace.DBPrinc.DatabaseName;
     qryCambioPasw.sql.Clear;
     qryCambioPasw.sql.Add('alter user '+lblNomUsu.Caption );
     qryCambioPasw.sql.Add(' identified by "'+edPaswNueva.Text+'"');
     qryCambioPasw.ExecSQL;
     GireEnlace.ClaveUsuario := edPaswNueva.Text;
     GireEnlace.GrabarArchINI(GireEnlace.NombreUsuario,GireEnlace.Ambito);
     ShowMessage('Contraseña cambiada con éxito');
    except
     on e:Exception do
     raise Exception.Create('No se pudo cambiar la contraseña'+chr(13)+e.Message);
    end;
   end;
end;

procedure TFrmGIRECambioPasw.edPaswAnteriorEnter(Sender: TObject);
begin
  inherited;

  if (edPaswNueva.Text='') or (edPaswConfirma.Text='') then
   begin
     edPaswNueva.Color      := clSilver;
     edPaswConfirma.color   := clSilver;
     edPaswNueva.Text       :='';
     edPaswConfirma.Text    :='';
     edPaswNueva.Enabled    := False;
     edPaswConfirma.Enabled := False;
   end;
end;

procedure TFrmGIRECambioPasw.SetGireEnlace(const Value: TGIREConexion);
begin
  FGireEnlace := Value;
end;

end.

