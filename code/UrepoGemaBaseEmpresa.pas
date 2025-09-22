unit UrepoGemaBaseEmpresa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UREPOGIREBASEEMPRESA, Qrctrls, QuickRpt, ExtCtrls, Db, DBTables, ADODB, UGeneral,
	UDMGemaConexion, Define, jpeg;

type
  TRepoGemaBaseEmpresa = class(TRepoGIREBaseEmpresa)
    QryBase: TADOQuery;
    QRLTitulo2: TQRLabel;
    QRLGire: TQRLabel;
    QryTotales: TADOQuery;
    procedure BandaEncabezadoBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    FCantMovim: Integer;
    FEjecutaTotales: Boolean;
    FImporte: Real;
    FParamRepor,FReempRepor: Variant;
    FCantReg: Integer;
    procedure SetCantMovim(const Value: Integer);
    procedure SetEjecutaTotales(const Value: Boolean);
    procedure SetImporte(const Value: Real);
    procedure Asignar_Parametros;
    procedure Asignar_Reemplazos;
    procedure SetCantReg(const Value: Integer);
  protected
    FRegistroDistribucion: TRegistroDistribucion;
    procedure Ver_Ejecuta_Totales; virtual;
    procedure Asignar_ParTotales; virtual;
    procedure Asignar_ReempTotales; virtual;
  public
    property EjecutaTotales: Boolean read FEjecutaTotales write SetEjecutaTotales default False;
    property CantMovim: Integer read FCantMovim write SetCantMovim;
    property CantReg: Integer read FCantReg write SetCantReg;
    property Importe: Real read FImporte write SetImporte;
  	constructor create( AOwner: TComponent; ANombreArchivo,ATipoListado: String; ARegistroDistribucion: TRegistroDistribucion; AParamRepor,AReempRepor: Variant); reintroduce; overload;
    destructor destroy; override;
  end;

var
  RepoGemaBaseEmpresa: TRepoGemaBaseEmpresa;

implementation

uses QRPrgres;


{$R *.DFM}

{ TRepoGemaBaseEmpresa }

constructor TRepoGemaBaseEmpresa.create(AOwner: TComponent; ANombreArchivo,
  ATipoListado: String; ARegistroDistribucion: TRegistroDistribucion; AParamRepor,AReempRepor: Variant);
begin
	inherited Create (AOwner);
  ShowProgress := True;
  FParamRepor := AParamRepor;
  FReempRepor := AReempRepor;
  FCantMovim := 0;
  FImporte := 0;
  MuestraUsuario := False;
  FRegistroDistribucion := ARegistroDistribucion;
  lblNombreEmpresa.Caption := FRegistroDistribucion.RazonSocial;
  Asignar_Parametros;
  Asignar_Reemplazos;
  Ver_Ejecuta_Totales;
  if EjecutaTotales then
  begin
    Asignar_ParTotales;
    Asignar_ReempTotales;
    QryTotales.Open;
    FCantMovim := 0;
    //Se agrego nuevo contador de registros y se saco de movimientos.
    FCantReg   := QryTotales.FieldByName('CANTIDAD').AsInteger;
    FImporte   := QryTotales.FieldByName('IMPORTE').AsFloat;
  end;
  QryBase.Open;
end;

destructor TRepoGemaBaseEmpresa.destroy;
begin
  if EjecutaTotales then
    QryTotales.Close;
  QryBase.Close;
  inherited;

end;

procedure TRepoGemaBaseEmpresa.BandaEncabezadoBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  QRLTitulo2.Caption := 'Fecha de Proceso: '+DateToStr(FRegistroDistribucion.FMaxFh_Proceso_Actual);

end;

procedure TRepoGemaBaseEmpresa.SetCantMovim(const Value: Integer);
begin
	FCantMovim := Value;
end;

procedure TRepoGemaBaseEmpresa.SetEjecutaTotales(const Value: Boolean);
begin
  FEjecutaTotales := Value;
end;

procedure TRepoGemaBaseEmpresa.Asignar_ParTotales;
var
	i: integer;
begin
	for i := 1 to QryTotales.Parameters.Count do
    QryTotales.Parameters[i-1].Value := FParamRepor[i];

end;

procedure TRepoGemaBaseEmpresa.SetImporte(const Value: Real);
begin
  FImporte := Value;
end;

procedure TRepoGemaBaseEmpresa.Asignar_Parametros;
var
	i: integer;
begin
	for i := 1 to QryBase.Parameters.Count do
    QryBase.Parameters[i-1].Value := FParamRepor[i];
end;

procedure TRepoGemaBaseEmpresa.Ver_Ejecuta_Totales;
begin

end;

procedure TRepoGemaBaseEmpresa.Asignar_Reemplazos;
var
	nPos,nSub: Integer;
  nCad: String;
begin
	nPos := Pos('@',QryBase.SQL.Text);
	while nPos > 0 do
  begin
  	nCad := Substr(QryBase.SQL.Text,nPos,3);
  	nSub := StrToInt(Substr(QryBase.SQL.Text,nPos+1,2))-1;
	  QryBase.SQL.Text := StrTran(QryBase.SQL.Text,nCad,FReempRepor[nSub]);
		nPos := Pos('@',QryBase.SQL.Text);
  end;

end;

procedure TRepoGemaBaseEmpresa.Asignar_ReempTotales;
var
	nPos,nSub: Integer;
  nCad: String;
begin
	nPos := Pos('@',QryTotales.SQL.Text);
	while nPos > 0 do
  begin
  	nCad := Substr(QryTotales.SQL.Text,nPos,3);
  	nSub := StrToInt(Substr(QryTotales.SQL.Text,nPos+1,2))-1;
	  QryTotales.SQL.Text := StrTran(QryTotales.SQL.Text,nCad,FReempRepor[nSub]);
		nPos := Pos('@',QryTotales.SQL.Text);
  end;

end;

procedure TRepoGemaBaseEmpresa.SetCantReg(const Value: Integer);
begin
  FCantReg := Value;
end;

end.
