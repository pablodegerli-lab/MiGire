unit UFrmProgresoConversion;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, ExtCtrls;

type
  TFrmProgresoConversion = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    GroupBox2: TGroupBox;
    ProgressBar1: TProgressBar;
    LConvirtiendoTabla: TLabel;
  private
    { Private declarations }
  public
    Constructor create (AOwner: TComponent; ACaption: String);reintroduce; overload;
  end;

implementation

{$R *.DFM}

{ TFrmProgresoConversion }

constructor TFrmProgresoConversion.create(AOwner: TComponent;
  ACaption: String);
begin
	inherited Create(AOwner);
  Caption := ACaption;
end;

end.
