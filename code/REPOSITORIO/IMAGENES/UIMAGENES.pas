unit uImagenes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ImgList;

type
  TImagenes = class(TDataModule)
    Grandes: TImageList;
    Chicas: TImageList;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Imagenes: TImagenes;

implementation

{$R *.DFM}

end.
