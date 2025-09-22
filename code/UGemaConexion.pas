unit UDMGemaConexion;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UADOCONEXION, Db, ADODB;

type
  TDMGemaConexion = class(TADOConexion)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMGemaConexion: TDMGemaConexion;

implementation

{$R *.DFM}

end.
