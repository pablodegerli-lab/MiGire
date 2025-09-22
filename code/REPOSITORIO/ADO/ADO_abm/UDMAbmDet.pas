unit UDMAbmDet;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UDmAbm, Db, ADODB;

type
  TDMAbmDet = class(TDMAbm)
    QryDet: TADOQuery;
    procedure QryCabAfterScroll(DataSet: TDataSet);
    procedure QryDetAfterInsert(DataSet: TDataSet);
    procedure QryDetBeforeOpen(DataSet: TDataSet);
    procedure QryDetBeforeClose(DataSet: TDataSet);
    procedure QryDetBeforePost(DataSet: TDataSet);
    procedure QryCabAfterPost(DataSet: TDataSet);
    procedure QryCabBeforePost(DataSet: TDataSet);
  private
    procedure Actualizar_Detalle;
    procedure Asignar_ClaveDetalle;
  protected
  	FCampoClaveCab: Array of String;
  public
    constructor create(AOwner: TComponent); override;
  end;

	TDMABMClassDet = class of TDMABMDet;

implementation

{$R *.DFM}

procedure TDMAbmDet.Actualizar_Detalle;
begin
	case QryCab.State of
  	dsBrowse: begin
							QryDet.Close;
						  QryDet.Open;
					  	end;
    dsInsert: begin
              QryDet.Close;
    					end;
  end;
end;

procedure TDMAbmDet.Asignar_ClaveDetalle;
var
	i: Integer;
begin
 	for i := 0 to QryDet.Parameters.Count - 1 do
  begin
  	QryDet.Parameters[i].Value := QryCab.FieldByName(FCampoClaveCab[i]).Value;
   	QryDet.FieldByName(FCampoClaveCab[i]).Visible := False;
	end;

end;

procedure TDMAbmDet.QryCabAfterScroll(DataSet: TDataSet);
begin
  inherited;
  Actualizar_Detalle;

end;

procedure TDMAbmDet.QryDetAfterInsert(DataSet: TDataSet);
var
	i: Integer;
begin
	for i := 0 to Length(FCampoClaveCab)-1 do
  	QryDet.FieldByname(FCampoClaveCab[i]).Value := QryCab.FieldByname(FCampoClaveCab[i]).Value;

end;

procedure TDMAbmDet.QryDetBeforeOpen(DataSet: TDataSet);
begin
  Asignar_ClaveDetalle;
end;

procedure TDMAbmDet.QryDetBeforeClose(DataSet: TDataSet);
begin
  inherited;
  if QryDet.State in [dsEdit,dsInsert] then
	  QryDet.Post;
end;

procedure TDMAbmDet.QryDetBeforePost(DataSet: TDataSet);
begin
  if Application.MessageBox(PChar('¿ Confirma la actualización del registro ?'),
   												 PChar(Application.Title),
   												 MB_OKCANCEL+MB_DEFBUTTON2+MB_ICONWARNING) <> IDOK then
		Abort;
	inherited;
end;

procedure TDMAbmDet.QryCabAfterPost(DataSet: TDataSet);
begin
  Actualizar_Detalle;
end;

constructor TDMAbmDet.create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  QryDet.Connection := getADOConexion;

end;

procedure TDMAbmDet.QryCabBeforePost(DataSet: TDataSet);
begin
  inherited;
//
end;

end.
