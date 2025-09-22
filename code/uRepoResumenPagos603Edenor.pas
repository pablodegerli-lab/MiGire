(*Backup consulta SQL de totales

select cod_cia_citi, cod_entidad,nombre_entidad,nombre_cia_citi,cuit_cia_citi,'('||prestacion||')' as prestacion,
            col01, col02, col03, col04, col05, col06,col07, col08, col09, col10, (col04-col08) as col11, 
           round(((col04-col08)*0.08),2) as col12, round(( (col04-col08) - (col04-col08)*0.08),2) as col13, 0 as col14,
           0 as col15, 0 as col16, fh_compensacion, '('||cod_cia_citi||')' as empresa, 
rpad(nombre_entidad,10,' ') ||' '||
lpad(TO_CHAR(col01),5,' ') ||' '||
lpad(trim(to_char(col02,'99999990.00')),11,' ') ||' '||
lpad(TO_CHAR(col03),5,' ') ||' '||
lpad(trim(to_char(col04,'99999990.00')),11,' ') ||' '||
lpad(TO_CHAR(col05),5,' ') ||' '||
lpad(trim(to_char(col06,'999990.00')),9,' ') ||' '||
lpad(trim(TO_CHAR(col07,'99990')),5,' ') ||' '||
lpad(trim(to_char(col08,'999990.00')),9,' ') ||' '||
lpad(TO_CHAR(col09),5,' ') ||' '||
lpad(trim(to_char(col10,'999990.00')),9,' ') ||' '||
lpad(trim(to_char((col04-col08),'99999990.00')),11,' ') ||' '||
 lpad(trim(to_char(((col04-col08)*0.08),'999990.00')),9,' ') ||' '||
 lpad(trim(to_char(( (col04-col08) - (col04-col08)*0.08),'99999990.00')),11,' ') ||' '||
lpad(trim(to_char(0,'999990.00')),9,' ') ||' '||
lpad(trim(to_char(0,'999990.00')),9,' ') ||' '||
lpad(trim(to_char(0,'999990.00')),9,' ') as DETALLE 
from (   SELECT    sum(col01) as col01, sum(col02) as col02, sum(col03) as col03,
                            sum(col04) as col04, sum(col05) as col05, sum(col06) as col06,
                            sum(col07) as col07, sum(col08) as col08, sum(col09) as col09,
                            sum(col10) as col10, sum(col11) as col11, sum(col12) as col12,
                            sum(col13) as col13, sum(col14) as col14, sum(col15) as col15,
                            sum(col16) as col16,  cod_cia_citi, cod_entidad,nombre_entidad,nombre_cia_citi,cuit_cia_citi,prestacion, fh_compensacion                                                                                                
            from((SELECT sum(cantidad_aceptados + cantidad_rechazados) as col01,
                            sum(importe_aceptados + importe_rechazados) as col02,
                            sum(cantidad_aceptados) as col03,
                            sum(importe_aceptados) as col04,
                            sum(cantidad_rechazados) as col05,
                            sum(importe_rechazados) as col06,
                            0 as col07,0 as col08,0 as col09,0 as col10,0 as col11,0 as col12,0 as col13,0 as col14,
                            0 as col15,0 as col16,cod_cia_citi, cod_entidad,nombre_entidad,nombre_cia_citi,cuit_cia_citi,prestacion, max(trunc(FH_COMPENSACION)) as fh_compensacion              
                            FROM GEMA.RESUMEN_PAGOS_00603
                            WHERE FH_PROCESO <= :P1  
                            and Trim(COD_TRX) = '1'
                            and COD_CIA_CITI = 967
                            GROUP BY cod_cia_citi, cod_entidad,nombre_entidad,nombre_cia_citi,cuit_cia_citi,prestacion)
                           UNION ALL
                           (SELECT 0 as col01,0 as col02,0 as col03,0 as col04,0 as col05,0 as col06,sum(CANTIDAD_ACEPTADOS) as col07,
                           sum(IMPORTE_ACEPTADOS) as col08,sum(CANTIDAD_RECHAZADOS) as col09,sum(IMPORTE_RECHAZADOS) as col10,
                           0 as col11,0 as col12,0 as col13,0 as col14,0 as col15,0 as col16,
                           cod_cia_citi, cod_entidad,nombre_entidad,nombre_cia_citi,cuit_cia_citi,prestacion, max(trunc(FH_COMPENSACION)) as fh_compensacion
                           FROM GEMA.RESUMEN_PAGOS_00603
                           WHERE FH_PROCESO <= :P2
                           and  Trim(COD_TRX) in ( '4','2')
                           and COD_CIA_CITI = 967
                           GROUP BY cod_cia_citi, cod_entidad,nombre_entidad,nombre_cia_citi,cuit_cia_citi,prestacion)
                )
        GROUP BY cod_cia_citi, cod_entidad,nombre_entidad,nombre_cia_citi,cuit_cia_citi,prestacion, fh_compensacion
        ORDER BY cod_cia_citi, cod_entidad
)
order by cod_cia_citi, cod_entidad,nombre_entidad,nombre_cia_citi,cuit_cia_citi,prestacion


*)

unit URepoResumenPagos603Edenor;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UrepoGemaBaseEmpresa, Db, ADODB, Qrctrls, QuickRpt, ExtCtrls, jpeg,define,
  QRExport;

type
  TRepoResumenPagos603Edenor = class(TRepoGemaBaseEmpresa)
    ChildBand1: TQRChildBand;
    QRGroup1: TQRGroup;
    QRLabel1: TQRLabel;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRLabel5: TQRLabel;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRBand1: TQRBand;
    QRBand2: TQRBand;
    QRSysData4: TQRSysData;
    QRLabel21: TQRLabel;
    QRDBText11: TQRDBText;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    lblTotales: TQRLabel;
    QRTextFilter1: TQRTextFilter;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    qrlDateLine: TQRLabel;
    qrlNombreSistema: TQRLabel;
    qrlDetalle: TQRLabel;
    procedure BandaDetalleBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure BandaEncabezadoBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
  private
    cCol01,cCol02,cCol03,cCol04,cCol05,cCol06,cCol07,cCol08,cCol09,cCol10,cCol11,
    cCol12,cCol13,cCol14,cCol15,cCol16:Currency;
    procedure InicializoVariables;
  protected
    procedure Ver_Ejecuta_Totales; override;
  public
  end;

implementation

uses UDMGemaConexion, uRepoGIREBaseLogo;

{$R *.DFM}

{ TRepoResumenPagos603Edenor }

procedure TRepoResumenPagos603Edenor.Ver_Ejecuta_Totales;
begin
  EjecutaTotales := True;
end;

procedure TRepoResumenPagos603Edenor.BandaDetalleBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  qrlDetalle.Caption := qryBase.fieldByName('detalle').asString;
//  inherited;
//acumulo totales del lote
  cCol01 := cCol01 + qryBase.FieldByName('Col01').value;
  cCol02 := cCol02 + qryBase.FieldByName('Col02').value;
  cCol03 := cCol03 + qryBase.FieldByName('Col03').value;
  cCol04 := cCol04 + qryBase.FieldByName('Col04').value;
  cCol05 := cCol05 + qryBase.FieldByName('Col05').value;
  cCol06 := cCol06 + qryBase.FieldByName('Col06').value;
  cCol07 := cCol07 + qryBase.FieldByName('Col07').value;
  cCol08 := cCol08 + qryBase.FieldByName('Col08').value;
  cCol09 := cCol09 + qryBase.FieldByName('Col09').value;
  cCol10 := cCol10 + qryBase.FieldByName('Col10').value;
  cCol11 := cCol11 + qryBase.FieldByName('Col11').value;
  cCol12 := cCol12 + qryBase.FieldByName('Col12').value;
  cCol13 := cCol13 + qryBase.FieldByName('Col13').value;
  cCol14 := cCol14 + qryBase.FieldByName('Col14').value;
  cCol15 := cCol15 + qryBase.FieldByName('Col15').value;
  cCol16 := cCol16 + qryBase.FieldByName('Col16').value;

end;

procedure TRepoResumenPagos603Edenor.BandaEncabezadoBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  lblUsuario.caption := GemaConexion.UsuarioNombre;
  //  QRLTitulo2.Caption := 'Fecha de Proceso: '+DateToStr(FRegistroDistribucion.FMaxFh_Proceso_Actual);
  QRLTitulo2.Caption := 'Fecha de compensación : '+DateToStr(FRegistroDistribucion.FMaxFh_Proceso_Actual)+' - La fecha de vto. es igual a la fecha de comp. menos 24 hs. hábiles.';
  lblNombreSistema.caption := 'GIRE S.A.';
  qrlDateLine.Caption := trim(lblDateLine.Caption);
  qrlNombreSistema.Caption := trim(lblNombreSistema.caption);
  lblDateLine.enabled := false;
  lblNombreSistema.enabled := false;
  qrlGire.enabled := false;
  InicializoVariables;
end;

procedure TRepoResumenPagos603Edenor.QRBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;

  lblTotales.Caption :=  'TOTAL GRAL'+
  padl(formatFloat('#####0',cCol01),6,' ')+
  padl(formatFloat('###########0.00',cCol02),13,' ')+
  padl(formatFloat('#######0',cCol03),5,' ')+
  padl(formatFloat('###########0.00',cCol04),13,' ')+
  padl(formatFloat('#######0',cCol05),6,' ')+
  padl(formatFloat('############0.00',cCol06),10,' ')+
  padl(formatFloat('#######0',cCol07),6,' ')+
  padl(formatFloat('##########0.00',cCol08),10,' ')+
  padl(formatFloat('#######0',cCol09),6,' ')+
  padl(formatFloat('#####0.00',cCol10),09,' ')+
  padl(formatFloat('###########0.00',cCol11),13,' ')+
  padl(formatFloat('############0.00',cCol12),10,' ')+
  padl(formatFloat('##########0.00',cCol13),12,' ')+
  padl(formatFloat('#####0.00',cCol14),9,' ')+
  padl(formatFloat('######0.00',cCol15),10,' ')+
  padl(formatFloat('######0.00',cCol16),10,' ');

end;

procedure TRepoResumenPagos603Edenor.InicializoVariables;
begin
  cCol01 := 0;
  cCol02 := 0;
  cCol03 := 0;
  cCol04 := 0;
  cCol05 := 0;
  cCol06 := 0;
  cCol07 := 0;
  cCol08 := 0;
  cCol09 := 0;
  cCol10 := 0;
  cCol11 := 0;
  cCol12 := 0;
  cCol13 := 0;
  cCol14 := 0;
  cCol15 := 0;
  cCol16 := 0;
end;

procedure TRepoResumenPagos603Edenor.QRBand1AfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  inherited;
  InicializoVariables;
end;

end.
