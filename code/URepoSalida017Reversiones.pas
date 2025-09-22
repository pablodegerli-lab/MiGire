unit URepoSalida017Reversiones;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UrepoGemaBaseEmpresa, Db, ADODB, Qrctrls, QuickRpt, ExtCtrls, jpeg;

type
  TRepoSalida017Reversiones = class(TRepoGemaBaseEmpresa)
    QRGEntidad: TQRGroup;
    QRLabel1: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    BandaPiedeGrupo: TQRBand;
    QRSImporte: TQRExpr;
    QRLabel7: TQRLabel;
    QryBaseENTIDAD: TIntegerField;
    QryBaseRAZONSOCIAL: TStringField;
    QryBaseIMPORTE: TBCDField;
    QryBaseCBU_TARJETA: TStringField;
    QryBaseCLIENTE: TStringField;
    QryBaseFH_VENCIMIENTO: TDateTimeField;
    QryBaseFH_DEVOLUCION: TDateTimeField;
  private
  protected
    procedure Ver_Ejecuta_Totales; override;
  public
  end;

implementation

uses UDMGemaConexion;

{$R *.DFM}

{ TRepoSalida017Reversiones }

procedure TRepoSalida017Reversiones.Ver_Ejecuta_Totales;
begin
  EjecutaTotales := True;

end;

end.
