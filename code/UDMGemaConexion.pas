unit UDMGemaConexion;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UADOCONEXION, Db, ADODB, ManError, Define, AppEvnts;

type
  TGemaConexion = class(TADOConexion)
    ManejaError1: TManejaError;
    procedure ConexionCreate(Sender: TObject);
  private
    { Private declarations }
  public
  end;

var
  GemaConexion: TGemaConexion;

implementation

{$R *.DFM}


procedure TGemaConexion.ConexionCreate(Sender: TObject);
var
   Lista: TStringList;
begin
  inherited;
  if FileExists( ExtractFilePath(ParamStr(0))+'Desarrollo.Cif' ) then
    begin
     Lista := TStringList.Create;
     try
       Lista.LoadFromFile( ExtractFilePath(ParamStr(0))+'Desarrollo.Cif' );
       NombreUsuario := Cifrado( Lista[0] );
       ClaveUsuario  := Cifrado( Lista[1] );
       Ambito        := Cifrado( Lista[2] );
     finally
        Lista.Free;
     end;
    end;
  CreaArchivoINI := True;
  DirectorioTemporales := 'C:\';
  AsignaRoles := False;
  ClaveAplicacion := 'GEMA';
  Ambito := 'GL_ALTA';
end;

end.
