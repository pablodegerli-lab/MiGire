unit UFrmConfirmacion;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFRMGIREDLG, ActnList, StdCtrls, Buttons, ExtCtrls, ComCtrls, UGeneral,
  Mask, ToolEdit;

type
  TFrmConfirmacion = class(TFrmGIREDlg)
    Panel2: TPanel;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    DEFh_Proceso: TDateEdit;
    procedure AceptarExecute(Sender: TObject);
  private
  public
    constructor create (aowner: tcomponent; aRegistro: TRegistroDistribucion); reintroduce; overload;
  end;

implementation


{$R *.DFM}

{ TFrmConfirmacion }

constructor TFrmConfirmacion.create(aowner: tcomponent;
  aRegistro: TRegistroDistribucion);
begin
  Inherited create (AOwner);
  Label2.Caption := IntToStr(ARegistro.Cod_Cia)+' '+ARegistro.RazonSocial;
  Label3.Caption := IntToStr(ARegistro.Nro_Proceso)+' '+ARegistro.DescProceso;
  DEFh_Proceso.Date := Date;
end;

procedure TFrmConfirmacion.AceptarExecute(Sender: TObject);
begin
  inherited;
  if DEFh_Proceso.Date > Date then
    Raise Exception.Create(' Ingrese una fecha de presentación menor a la del día en curso ');

end;

end.
