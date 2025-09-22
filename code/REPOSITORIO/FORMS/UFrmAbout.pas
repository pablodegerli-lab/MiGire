unit UFrmAbout;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls;

type
  TFrmAbout = class(TForm)
    Panel1: TPanel;
    Memo1: TMemo;
    Panel2: TPanel;
    Image1: TImage;
    Image2: TImage;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmAbout: TFrmAbout;

implementation

{$R *.DFM}

end.
