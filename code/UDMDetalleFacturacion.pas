unit UDMDetalleFacturacion;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, ADODB;

type
  TDMDetalleFacturacion = class(TDataModule)
    QryCiasGema: TADOQuery;
    QryServiciosXCia: TADOQuery;
    QryDetalle: TADOQuery;
  private
  { Private declarations }
  public
    constructor create (AOwner: TComponent); reintroduce; overload;
    destructor destroy; override;
  end;

implementation

uses UDMGemaConexion;

{$R *.DFM}

{ TDMDetalleFacturacion }

constructor TDMDetalleFacturacion.create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  QryCiasGema.Open;
end;

destructor TDMDetalleFacturacion.destroy;
begin
  QryCiasGema.Close;
  inherited;
end;

end.
