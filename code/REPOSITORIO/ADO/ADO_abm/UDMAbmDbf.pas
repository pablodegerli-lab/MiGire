unit UDMAbmDbf;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UDMAbm, Db, ADODB, ApoDSet, ApoEnv, Define,Errores;

resourcestring
	sMalEstado = 'PROBLEMAS PARA ACTUALIZAR DATOS (ESTADO NO VALIDO)';
	sNoActualizoDBFs = 'PROBLEMAS PARA ACTUALIZAR REGISTRO (TABLA DBF)';
	sNoEliminoDBFs = 'PROBLEMAS PARA ELIMINAR REGISTRO (TABLA DBF)';
	sYaExisteDBFs = 'REGISTRO DUPLICADO (TABLA DBF) ';

type
	TDataSetUpdates = array[TDataSetState] of TADOQuery;

  TDMAbmDbf = class(TDMAbm)
    DBTABLAS: TApolloDatabase;
    ABMEntorno: TApolloEnv;
    TblCabDBF: TApolloTable;
		procedure QryCabAfterPost(DataSet: TDataSet);
		procedure QryCabBeforePost(DataSet: TDataSet);
    procedure QryCabPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure QryCabBeforeDelete(DataSet: TDataSet);
    procedure QryCabDeleteError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure TblCabDBFPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
  private
		FFieldMapList: TStrings;
		procedure ActualizarCamposDBF;
	protected
    ListaDefReg   : TFieldList;
    ValorCampoReg : Array of Variant;
		FDataSetUpdates: TDataSetUpdates;
		procedure InicFieldMapList(AFiledMapList: TStrings); virtual; abstract;
		function UbicarClave: Boolean; virtual; abstract;
    procedure ValidarCampos; virtual;
  public
		constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

implementation


{$R *.DFM}

{ TDMAbmDbf }

constructor TDMAbmDbf.Create(AOwner: TComponent);
begin
	inherited Create(AOwner);
  DBTABLAS.DataPath := ObtenerPath('SATAN',UpperCase(DBTABLAS.DataPathAlias));
  try
  	TblCabDBF.Open;
  except
      Application.MessageBox(PChar('PROBLEMA PARA ABRIR TABLAS DBF - AVISE A SISTEMAS'),
    												 PChar(Application.Title),
    												 MB_OK+MB_DEFBUTTON2+MB_ICONERROR);
      Abort;
  end;
	FFieldMapList :=  TStringList.Create;
	InicFieldMapList(FFieldMapList);
  ListaDefReg   := TblCabDBF.FieldList;
  SetLength(ValorCampoReg,TblCabDBF.FieldList.Count);

end;

destructor TDMAbmDbf.Destroy;
begin
	FFieldMapList.Free;
  TblCabDBF.Close;
	inherited;

end;

procedure TDMAbmDbf.ActualizarCamposDBF;
var
	i: Integer;
	DestFieldName: String;
	SourceFieldName: String;
begin
	for i := 0 to FFieldMapList.Count -1 do
	begin
		DestFieldName := FFieldMapList.Names[i];
		SourceFieldName := FFieldMapList.Values[DestFieldName];

		TblCabDBF.FieldByName(DestFieldName).Value := QryCab.FieldByName(SourceFieldName).Value;
	end;

end;

procedure TDMAbmDbf.QryCabAfterPost(DataSet: TDataSet);
begin
  TblCabDBF.Commit;

end;

procedure TDMAbmDbf.QryCabBeforePost(DataSet: TDataSet);
begin
	case QryCab.State of
		dsInsert: if UbicarClave then
                Raise Exception.Create(sYaExisteDBFs)
              else
                TblCabDBF.Insert;
		dsEdit:		if UbicarClave then
                if TblCabDBF.RLock(TblCabDBF.RecNo) then
						  		TblCabDBF.Edit
                else
                  Raise Exception.Create(sNoActualizoDBFs)
              else
                Raise Exception.Create(sNoActualizoDBFs);
	end;

  ValidarCampos;

	ActualizarCamposDBF;

  inherited;
end;

procedure TDMAbmDbf.QryCabPostError(DataSet: TDataSet; E: EDatabaseError;
	var Action: TDataAction);
begin
	TblCabDBF.Cancel;
  if E is EDatabaseError then
  begin
    Traducir_Error(E.Message,DataSet);
    Action := daFail;
  end;
end;

procedure TDMAbmDbf.QryCabBeforeDelete(DataSet: TDataSet);
var
  Posicion : Integer;
begin
	if UbicarClave and TblCabDBF.RLock(TblCabDBF.RecNo) then
	begin
 		TblCabDBF.Edit;
    for Posicion := 0 to ListaDefReg.Count - 1 do
      ValorCampoReg[Posicion] := TblCabDBF.FieldList.FieldByName(ListaDefReg.Strings[Posicion]).Value;
		TblCabDBF.Delete;
    TblCabDBF.Commit;
	end
  else
    Raise Exception.Create(sNoEliminoDBFs);
end;

procedure TDMAbmDbf.QryCabDeleteError(DataSet: TDataSet; E: EDatabaseError;
	var Action: TDataAction);
var
  Posicion : Integer;
begin
  TblCabDBF.Insert;
  for Posicion := 0 to ListaDefReg.Count - 1 do
    TblCabDBF.FieldByName(ListaDefReg.Strings[Posicion]).Value := ValorCampoReg[Posicion];
  TblCabDBF.Post;
  TblCabDBF.Commit;

  inherited;
end;

procedure TDMAbmDbf.ValidarCampos;
begin
end;


procedure TDMAbmDbf.TblCabDBFPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  inherited;
  Application.MessageBox(PChar('Ocurrió un error al actualizar la tabla TblCabDBF. Avise a Sistemas.'),
 												 PChar(Application.Title),
 												 MB_OK+MB_DEFBUTTON2+MB_ICONERROR);


end;

end.
