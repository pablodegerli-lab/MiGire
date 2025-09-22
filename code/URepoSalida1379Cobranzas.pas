unit URepoSalida1379Cobranzas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UrepoGemaBaseEmpresa, Db, ADODB, Qrctrls, QuickRpt, ExtCtrls, jpeg, UGeneral,
  define;

type
  TRepoSalida1379Cobranzas = class(TRepoGemaBaseEmpresa)
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    TARJ_GLOB: TQRDBText;
    FH_VENTA: TQRDBText;
    FH_PRESENT: TQRDBText;
    COD_TARJE: TQRDBText;
    NRO_OPERAC: TQRDBText;
    C_ACCION: TQRDBText;
    QRLabel9: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel10: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel11: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    procedure BandaEncabezadoBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRDBText5Print(sender: TObject; var Value: String);
    procedure FH_VENTAPrint(sender: TObject; var Value: String);
    procedure QRDBText3Print(sender: TObject; var Value: String);
  private
    { Private declarations }
  protected
    procedure Ver_Ejecuta_Totales; override;
    procedure Asignar_ParTotales; override;
  public
    { Public declarations }
    constructor create( AOwner: TComponent; ANombreArchivo,ATipoListado: String; ARegistroDistribucion: TRegistroDistribucion; AParamRepor,AReempRepor: Variant); reintroduce; overload;
  end;

implementation

uses UDMGemaConexion, Variants;

{$R *.DFM}

procedure TRepoSalida1379Cobranzas.Asignar_ParTotales;
begin
  QryTotales.Parameters.ParamByName('pFh_Proceso').Value := FRegistroDistribucion.FMaxFh_Proceso_Actual;

end;

procedure TRepoSalida1379Cobranzas.BandaEncabezadoBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  PrintBand := False;
end;

procedure TRepoSalida1379Cobranzas.Ver_Ejecuta_Totales;
begin
  EjecutaTotales := True;

end;

procedure TRepoSalida1379Cobranzas.QRDBText5Print(sender: TObject;
  var Value: String);
var sAux:string;
begin
//  inherited;
  value := ''''+value;
end;

procedure TRepoSalida1379Cobranzas.FH_VENTAPrint(sender: TObject;
  var Value: String);
var sAux:string;
begin
//  inherited;
end;

procedure TRepoSalida1379Cobranzas.QRDBText3Print(sender: TObject;
  var Value: String);
begin
  inherited;
  value := ''''+value;
end;

constructor TRepoSalida1379Cobranzas.create(AOwner: TComponent;
  ANombreArchivo, ATipoListado: String;
  ARegistroDistribucion: TRegistroDistribucion; AParamRepor,
  AReempRepor: Variant);
begin
  inherited;
  if ARegistroDistribucion.Cod_Cia = 57 then
  begin
    qryBase.sql.text := ' Select DESC_TARJETA, '+
                        ' to_char(GIRE.PKG_ENCRIP.LEOTARJETA(ID_CBU_TARJETA)) as ID_CBU_TARJETA, '+
                        ' TO_CHAR(CLIENTE) as CLIENTE, '+
                        ' ID_TRANSACCION, '+
                        ' COD_AUTORIZACION, '+
                        ' To_Char(IMPORTE_COBRADO,''99999990.00'') as IMPORTE_COBRADO, '+
                        ' To_Char(FH_COBRO,''dd/mm/yyyy'') as FH_COBRO1, '+
                        ' To_Char(FH_COBRO,''yyyymmdd'') as FH_COBRO2, '+
                        ' NUMERO_OPERACION, '+
                        ' TERMINAL, '+
                        ' To_Char(NUMERO_LOTE) as NUMERO_LOTE '+
                        ' From GEMA.COBRANZAS_ '+ padl(IntToStr(ARegistroDistribucion.Cod_Cia),5,'0') +' '+
                        ' Where FH_PROCESO <= :pFh_Proceso '+
                        ' and TIPO_COBRANZA = ''V'' and COD_ENTIDAD = 815 ';

  end
  else if ARegistroDistribucion.Cod_Cia = 1379 then
  begin

  end;

end;

end.
