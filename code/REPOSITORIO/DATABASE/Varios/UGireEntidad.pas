unit UGireEntidad;

interface

uses
	Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
	DBTables, Db;

ResourceString
	sClaveInvalida = 'No existe %s en %s con clave %s';
	sQuiereBorrar = '¿Confirma la eliminación del registro?';
	sErrorEnApply = 'Se ha producido un error. Valide que todos los datos esten completos';

type
	TDataSetAAplicar = array of TBDEDataSet;
	EGireEntidad = class(Exception);
	EGireEntidadClaveInvalida = class(EGireEntidad);

	TGireEntidad = class(TDataModule)
		QryCab: TQuery;
		UpdCab: TUpdateSQL;
		DsCab: TDataSource;
		QryDet1: TQuery;
		UpdDet1: TUpdateSQL;
		procedure QryDetNewRecord(DataSet: TDataSet);
		procedure QryCabBeforeDelete(DataSet: TDataSet);
	private
		procedure AplicarDataSets;
		procedure CommitDataSets;
	public
		FDataSetAAplicar : TDataSetAAplicar;
		procedure AbrirQuerys;
		procedure GuardarDatos;
		procedure CancelarDatos;
		constructor Create(AOnwer: TComponent); override;
	protected
		procedure AsignarClave(AQuery: TQuery) ;
		procedure ValidarClave(const AKeyFields: String; const AKeyValues: Variant; ADataSet: TDataSet = nil);
		procedure ArmarDataSets; virtual;
	end;

	TGireEntidadClass = Class of TGireEntidad;
var
	GireEntidad: TGireEntidad;

implementation

Uses UWincoCONEXION;

{$R *.DFM}

{ TGireEntidad }

procedure TGireEntidad.AbrirQuerys;
begin
  QryCab.Open;

  if Trim(QryDet1.SQL.Text) <> '' then
  begin
    QryDet1.Prepare;
    QryDet1.Open;
  end;

end;

procedure TGireEntidad.AsignarClave(AQuery: TQuery);
Var
	 i: Integer ;
	 Field: TField ;
begin
  with AQuery do
  begin
    for i := 0 to ParamCount - 1 do
    begin
      Field := FindField(Params[i].Name) ;
			If Field <> nil then
				Field.Value := Params[i].Value ;
    end;
  end;
End;

procedure TGireEntidad.QryDetNewRecord(DataSet: TDataSet);
begin
  AsignarClave(DataSet as TQuery);
end;

procedure TGireEntidad.ValidarClave(const AKeyFields: String;
	const AKeyValues: Variant; ADataSet: TDataSet);
begin
	 if ADataSet = nil then
		 ADataSet:=QryCab;

	if not ADataSet.Locate(AKeyFields, AKeyValues, []) then
    raise EGireEntidadClaveInvalida.CreateFmt(sClaveInvalida, [AKeyValues, ADataSet.Name, AKeyFields]);

end;

procedure TGireEntidad.QryCabBeforeDelete(DataSet: TDataSet);
begin
	if Application.MessageBox(Pchar(sQuiereBorrar),PChar('Atención'),MB_YESNO+MB_DEFBUTTON2+MB_ICONWARNING) = idNo then
		Abort;
end;


procedure TGireEntidad.CancelarDatos;
begin
	QryCab.CancelUpdates;
end;

procedure TGireEntidad.GuardarDatos;
begin
	Conexion.DBPrinc.StartTransaction;
	try
		AplicarDataSets;
		Conexion.DBPrinc.Commit;
	except
		Conexion.DBPrinc.Rollback;
		Raise Exception.Create(sErrorEnApply);
	end;
	CommitDataSets;
end;

procedure TGireEntidad.ArmarDataSets;
begin

end;

procedure TGireEntidad.AplicarDataSets;
var
 i : Integer;
begin
	for i := 0 to Length(FDataSetAAplicar) - 1 do
	begin
		FDataSetAAplicar[i].Tag := 1;
		FDataSetAAplicar[i].ApplyUpdates;
	end;
end;

procedure TGireEntidad.CommitDataSets;
var
 i : Integer;
begin
	for i := 0 to Length(FDataSetAAplicar) - 1 do
	begin
		FDataSetAAplicar[i].Tag := 2;
		FDataSetAAplicar[i].CommitUpdates;
	end;

end;

constructor TGireEntidad.Create(AOnwer: TComponent);
begin
	inherited;
  ArmarDataSets;
end;

end.
