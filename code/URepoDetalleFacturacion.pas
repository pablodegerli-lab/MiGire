unit URepoDetalleFacturacion;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UREPOGIREBASEEMPRESA, Qrctrls, QuickRpt, ExtCtrls, DB, jpeg;

type
  TRepoDetalleFacturacion = class(TRepoGIREBaseEmpresa)
    BandaGrupoTipoDBF: TQRGroup;
    QR_COD_TIPO_DESCRIP: TQRDBText;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    BandaPieTipoArchivo: TQRBand;
    QRLabel6: TQRLabel;
    QR_SUBT_CANTIDAD: TQRExpr;
    QRBand1: TQRBand;
    QRLabel7: TQRLabel;
    QRExpr2: TQRExpr;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QR_COD_TIPO: TQRDBText;
    QR_NOMBRE_ARCHIVO: TQRDBText;
    QR_CANTIDAD: TQRDBText;
    QR_IMPORTE: TQRDBText;
    QR_FH_DISTRIBUCION: TQRDBText;
    QR_SUBT_IMPORTE: TQRExpr;
    QRExpr1: TQRExpr;
    QRLEmpresa: TQRLabel;
    QRLRangoFecha: TQRLabel;
  private
    FDataSetBase: TDataSet;
    procedure Asignar_DataSet;
  public
    { Public declarations }
    constructor create (AOwner: TComponent; ADataSet: TDataSet;
                                            AFechaDesde: String;
                                            AFechaHasta: String); reintroduce; overload;
    destructor destroy; override;
  end;

implementation


{$R *.DFM}

{ TRepoDetalleFacturacion }

procedure TRepoDetalleFacturacion.Asignar_DataSet;
begin
  QR_COD_TIPO.DataSet := FDataSetBase;
  QR_COD_TIPO_DESCRIP.DataSet := FDataSetBase;
  QR_NOMBRE_ARCHIVO.DataSet := FDataSetBase;
  QR_CANTIDAD.DataSet := FDataSetBase;
  QR_IMPORTE.DataSet := FDataSetBase;
  QR_FH_DISTRIBUCION.DataSet := FDataSetBase;
end;

constructor TRepoDetalleFacturacion.create(AOwner: TComponent;
                                           ADataSet: TDataSet;
                                           AFechaDesde: String;
                                           AFechaHasta: String) ;

begin
  inherited Create(AOwner);
  DecimalSeparator := ',';

  FDataSetBase := ADataSet;
  DataSet := FDataSetBase;
  Asignar_DataSet;

  QRLEmpresa.Caption := QRLEmpresa.Caption +
                        FDataSetBase.FieldByName('COD_CIA').AsString + '  -  ' +
                        FDataSetBase.FieldByName('DESCRIPCION_CIA').AsString;
  QRLRangoFecha.Caption := QRLRangoFecha.Caption +
                           AFechaDesde + '      ' +
                           'Hasta: '+ AFechaHasta;
end;


destructor TRepoDetalleFacturacion.destroy;
begin
  DecimalSeparator := ',';
  inherited;

end;

end.
