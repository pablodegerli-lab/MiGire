unit UDMConsultaDistribucion;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, ADODB, RxMemDS, ImgList;

type
  TColoresGema = Array[Boolean] of String;

  TDMConsultadistribucion = class(TDataModule)
    QryResumenes: TADOQuery;
    QryNrosCorridaDesde: TADOQuery;
    QryNrosCorridaDesdeNRO_CORRIDA: TIntegerField;
    QryResumenesCOD_CIA: TIntegerField;
    QryResumenesNRO_PROCESO: TIntegerField;
    QryResumenesCOD_TIPO_ARCHIVO: TStringField;
    QryResumenesCOD_DISENO: TStringField;
    QryResumenesNRO_ORDEN: TIntegerField;
    QryResumenesFH_DISTRIBUCION: TDateTimeField;
    QryResumenesNRO_CORRIDA: TIntegerField;
    QryResumenesNOMBRE_ARCHIVO: TStringField;
    QryResumenesCANTIDAD_REGISTROS: TIntegerField;
    QryResumenesCANTIDAD_MOVIMIENTOS: TIntegerField;
    QryResumenesIMPORTE: TBCDField;
    QryResumenesUSUARIO: TStringField;
    QryResumenesFH_ACTUALIZACION: TDateTimeField;
    QryNrosCorridaHasta: TADOQuery;
    BCDField1: TIntegerField;
    QryResumenesDESCRIPCION: TStringField;
    MDResumenes: TRxMemoryData;
    MDResumenesNOMBRE_ARCHIVO: TStringField;
    MDResumenesDESCRIPCION: TStringField;
    MDResumenesCANTIDAD_MOVIMIENTOS: TIntegerField;
    MDResumenesCANTIDAD_REGISTROS: TIntegerField;
    MDResumenesIMPORTE: TFloatField;
    MDResumenesFH_DISTRIBUCION: TDateTimeField;
    MDResumenesCOLOR: TStringField;
    MDResumenesNRO_CORRIDA: TIntegerField;
    QryDistribuciones: TADOQuery;
    QryDistribucionesEMPRESA: TIntegerField;
    QryDistribucionesRAZONSOCIAL: TStringField;
    QryDistribucionesPROCESO: TIntegerField;
    QryDistribucionesDESCRIPCION: TStringField;
    QryDistribucionesULTFHPROCESO: TDateTimeField;
    QryDistribucionesABREVIATURA: TStringField;
    QryDistribucionesCOPIA_A_TRANSMISION: TStringField;
    QryDistribucionesCOD_MODO: TIntegerField;
    QryDistribucionesPATH_WORK: TStringField;
    QryDistribucionesSCOD_CIA: TStringField;
    QryCorridas: TADOQuery;
    QryResumenesCOD_FORMATO: TStringField;
    MDResumenesLOGO: TStringField;
    procedure QryResumenesAfterOpen(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
    procedure QryResumenesAfterClose(DataSet: TDataSet);
    procedure DataModuleDestroy(Sender: TObject);
  private
    FCorrida_Ant: Integer;
    FFh_Distri_Ant: TDate;
    FColores: TColoresGema;
    lCambioColor: Boolean;
  public
//    property lCambioColor: Boolean read FCambioColor write SetCambioColor;
  end;

implementation

uses UDMGemaConexion;

{$R *.DFM}

{ TDMConsultaDistribucion }

procedure TDMConsultadistribucion.QryResumenesAfterOpen(DataSet: TDataSet);
begin
  FFh_Distri_Ant := 0;
  FCorrida_Ant := 0;
  MDResumenes.Open;
  QryResumenes.First;
  while not QryResumenes.Eof do
  begin
    MDResumenes.Insert;
    MDResumenes.FieldByName('NOMBRE_ARCHIVO').Value := QryResumenes.FieldByName('NOMBRE_ARCHIVO').Value;
    MDResumenes.FieldByName('DESCRIPCION').Value := QryResumenes.FieldByName('DESCRIPCION').Value;
    MDResumenes.FieldByName('CANTIDAD_MOVIMIENTOS').Value := QryResumenes.FieldByName('CANTIDAD_MOVIMIENTOS').Value;
    MDResumenes.FieldByName('CANTIDAD_REGISTROS').Value := QryResumenes.FieldByName('CANTIDAD_REGISTROS').Value;
    MDResumenes.FieldByName('IMPORTE').Value := QryResumenes.FieldByName('IMPORTE').Value;
    MDResumenes.FieldByName('FH_DISTRIBUCION').Value := QryResumenes.FieldByName('FH_ACTUALIZACION').Value;
    MDResumenes.FieldByName('NRO_CORRIDA').Value := QryResumenes.FieldByName('NRO_CORRIDA').Value;
    MDResumenes.FieldByName('LOGO').AsString := QryResumenes.FieldByName('COD_FORMATO').AsString;

    if (QryResumenes.FieldByName('FH_DISTRIBUCION').Value <> FFh_Distri_Ant) or
        (QryResumenes.FieldByName('NRO_CORRIDA').Value <> FCorrida_Ant) then
    begin
      FFh_Distri_Ant := QryResumenes.FieldByName('FH_DISTRIBUCION').Value;
      FCorrida_Ant := QryResumenes.FieldByName('NRO_CORRIDA').AsInteger;
      lCambioColor := not lCambioColor;
    end;
    MDResumenes.FieldByName('COLOR').Value := FColores[lCambioColor];
    MDResumenes.Post;
    QryResumenes.Next;
  end;
  MDResumenes.SortOnFields('FH_DISTRIBUCION;NRO_CORRIDA');
  MDResumenes.First;
end;

procedure TDMConsultadistribucion.DataModuleCreate(Sender: TObject);
begin
  FColores[False] := '1';
  FColores[True] := '2';
  QryDistribuciones.Open;

end;

procedure TDMConsultadistribucion.QryResumenesAfterClose(
  DataSet: TDataSet);
begin
  MDResumenes.Close;
end;

procedure TDMConsultadistribucion.DataModuleDestroy(Sender: TObject);
begin
  QryResumenes.Close;
  QryNrosCorridaDesde.Close;
  QryNrosCorridaHasta.Close;
  QryDistribuciones.Close;

end;

end.
