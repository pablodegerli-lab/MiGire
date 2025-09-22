unit URepoSalida544Cobranzas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UrepoGemaBaseEmpresa, Db, ADODB, Qrctrls, QuickRpt, ExtCtrls, jpeg;

type
  TRepoSalida544Cobranzas = class(TRepoGemaBaseEmpresa)
    QRDBText5: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText2: TQRDBText;
    GrupoTarjetas: TQRGroup;
    BandaSubTotal: TQRBand;
    BandaDeTotales: TQRBand;
    ImportePorTarjeta: TQRExpr;
    ImporteTotal: TQRExpr;
    CantidadTotal: TQRExpr;
    CantidadPorTarjeta: TQRExpr;
    QRDBText4: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRBand2: TQRBand;
    QRLabel13: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel6: TQRLabel;
    QryBaseCOD_ENTIDAD: TIntegerField;
    QryBaseABREVIATURA: TStringField;
    QryBaseCBU_TARJETA: TStringField;
    QryBaseIMPORTE_COBRADO: TBCDField;
    QryBaseNUMERO_CUPON: TIntegerField;
    QryBaseNUMERO_LOTE: TIntegerField;
    QryBaseFH_PRESENTACION: TDateTimeField;
    QryBaseFH_PROCESO: TDateTimeField;
    procedure QRLabel13Print(sender: TObject; var Value: String);
    procedure QRLabel3Print(sender: TObject; var Value: String);
  private
    { Private declarations }
  protected
    procedure Ver_Ejecuta_Totales; override;    
  public
    { Public declarations }
  end;

implementation

uses UDMGemaConexion;


{$R *.DFM}


procedure TRepoSalida544Cobranzas.Ver_Ejecuta_Totales;
begin
  EjecutaTotales := False;

end;

procedure TRepoSalida544Cobranzas.QRLabel13Print(sender: TObject;
  var Value: String);
begin
  inherited;
  value := 'Fecha de Proceso: ' + QryBase.FieldByName('FH_PROCESO').AsString;  
end;

procedure TRepoSalida544Cobranzas.QRLabel3Print(sender: TObject;
  var Value: String);
begin
  inherited;
  value := 'Total Tarjeta: '+ QryBase.fieldbyName('cod_entidad').AsString + ' - ' +
            QryBase.fieldbyName('Abreviatura').AsString ;
end;

end.


