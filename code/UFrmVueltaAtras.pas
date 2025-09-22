unit UFrmVueltaAtras;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFRMGIREDLG, ActnList, StdCtrls, Buttons, ExtCtrls, UDMVueltaAtras, UGeneral,
  CheckLst, Define, ComCtrls;
type
  TFrmVueltaAtras = class(TFrmGIREDlg)
    Panel2: TPanel;
    Label1: TLabel;
    LCia: TLabel;
    LRazonSocial: TLabel;
    Label2: TLabel;
    LProc: TLabel;
    LDescProceso: TLabel;
    Label3: TLabel;
    LFh_Distribucion: TLabel;
    Label4: TLabel;
    lNro_Corrida: TLabel;
    Label5: TLabel;
    Panel4: TPanel;
    GroupBox1: TGroupBox;
    ImageCheck: TImage;
    LBServicios: TListBox;
    Label6: TLabel;
    ComboBoxEx1: TComboBoxEx;
    procedure AceptarExecute(Sender: TObject);
    procedure LBServiciosDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
  private
  	FBitmap: TBitmap;
    FDMVueltaAtras: TDMVueltaAtras;
    FRegistroDistribucion: TRegistroDistribucion;
    procedure Cargar_Servicios;
  public
    constructor create (AOwner: TComponent; ARegistroDistribucion: TRegistroDistribucion; ARuta_Distribucion: String); reintroduce; overload;
    destructor destroy; override;
  end;

implementation

uses UDMGemaConexion;



{$R *.DFM}

{ TFrmVueltaAtras }

constructor TFrmVueltaAtras.create(AOwner: TComponent; ARegistroDistribucion: TRegistroDistribucion; ARuta_Distribucion: String);
begin
  inherited create(AOwner);
  FBitmap := TBitmap.Create;
  FBitmap.Assign(ImageCheck.Picture);
  LBServicios.Color := TColor($02CBAA00);
  FRegistroDistribucion := ARegistroDistribucion;
  LCia.Caption := IntToStr(FRegistroDistribucion.Cod_Cia);
  LRazonSocial.Caption := FRegistroDistribucion.RazonSocial;
  LProc.Caption := IntToStr(FRegistroDistribucion.Nro_Proceso);
  LDescProceso.Caption := FRegistroDistribucion.DescProceso;
  FDMVueltaAtras := TDMVueltaAtras.Create(AOwner,FRegistroDistribucion,ARuta_Distribucion,'Progreso de la Vuelta Atras');
  LFh_Distribucion.Caption := DateToStr(FDMVueltaAtras.QryUltimaDistribucionFH_DISTRIBUCION.Value);
  lNro_Corrida.Caption := IntToStr(FDMVueltaAtras.QryUltimaDistribucionNRO_CORRIDA.AsInteger);
  Cargar_Servicios;
end;

destructor TFrmVueltaAtras.destroy;
begin
	FBitmap.Free;
  FDMVueltaAtras.Free;
  inherited;
end;

procedure TFrmVueltaAtras.AceptarExecute(Sender: TObject);
begin
  if Application.MessageBox(PChar('¿ Confirma la "VUELTA ATRAS" para la Empresa: '+LCia.Caption+' - '+LRazonSocial.Caption+#10#13+
                               'Proceso: '+LProc.Caption+' - '+LDescProceso.Caption+' ?'+#10#13+
                               UpperCase('Recuerde que siempre es la ultima generacion de archivos efectuada.')),
                         PChar('Gema - Vuelta Atrás'),
                         MB_OKCANCEL+MB_DEFBUTTON2+MB_ICONWARNING ) = idOK then
  begin
    FDMVueltaAtras.Volver_Atras;
    Application.MessageBox(PChar('VUELTA ATRAS CONCLUIDA'+#13#10+#13#10+'Empresa: '+FRegistroDistribucion.RazonSocial+#13#10+'Proceso: '+FRegistroDistribucion.DescProceso),
	                         PChar('Gema - Vuelta Atrás'),
                           MB_ICONINFORMATION );
  end;

end;

procedure TFrmVueltaAtras.Cargar_Servicios;
var
  sCod_Cia,sLeyenda: String;
begin
  while not FDMVueltaAtras.QryTblDBFaTblOra.Eof do
  begin
    sCod_Cia := PadL(IntToStr(FRegistroDistribucion.Cod_Cia),5,'0');
    sLeyenda := StrTran(FDMVueltaAtras.QryTblDBFaTblOraNOMBRE_TABLA_ORA.AsString,'eeeee',sCod_Cia)+' - '+FDMVueltaAtras.QryTblDBFaTblOraDESCRIPCION.Value;
    LBServicios.Items.Add(sLeyenda);
    LBServicios.Items.Objects[LBServicios.Items.Count - 1] := FBitmap;
    FDMVueltaAtras.QryTblDBFaTblOra.Next;
  end;

end;

procedure TFrmVueltaAtras.LBServiciosDrawItem(Control: TWinControl;
  Index: Integer; Rect: TRect; State: TOwnerDrawState);
var
	Bitmap: TBitmap;
	Offset: Integer;
begin
	(Control as TListBox).Canvas.FillRect(Rect);       { limpia el rectangulo }
	Offset := 2; {desplazamiento por defecto}
  Bitmap := TBitmap((Control as TListBox).Items.Objects[Index]);  { traigo el bitmap }
  (Control as TListBox).Canvas.Font.Color := TColor(clNavy);
	if Bitmap <> nil then
	begin
		(Control as TListBox).Canvas.BrushCopy(Bounds(Rect.Left + 2, Rect.Top, Bitmap.Width, Bitmap.Height),
			Bitmap, Bounds(0, 0, Bitmap.Width, Bitmap.Height), clRed);  {dibuja el bitmap}
		Offset := Bitmap.width + 6;    { agrega 4 pixeles entre el bitmap y el texto }
	end;
	(Control as TListBox).Canvas.TextOut(Rect.Left + Offset, Rect.Top, (Control as TListBox).Items[Index]);  { muestra el texto }
end;

end.
