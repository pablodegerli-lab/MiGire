unit UDMAbm;

interface

uses
	Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
	Db, ADODB, Errores, Variants;

type
	TDataSetUpdates = array[TDataSetState] of TADOQuery;

  TParametros = Array of Variant;

	TDMAbm = class(TDataModule)
		QryCab: TADOQuery;
    QryGirePath: TADOQuery;
    QryLog: TADOQuery;
    qVistaMat: TADOQuery;
    procedure QryCabBeforePost(DataSet: TDataSet);
    procedure QryCabPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure QryCabDeleteError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure QryCabEditError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure QryCabBeforeDelete(DataSet: TDataSet);
	private
    FClave_VM: String;
//    FUsuario: String;

    procedure BuscarClavesVM(aConnec: TADOConnection);
    procedure RefrescarVM(aConnec: TADOConnection);
  protected
    function getADOConexion: TADOConnection; virtual; abstract;
    procedure Validar_PorSioNO(Campo: TField);
    procedure Registrar_Log(DataSetOrigen,DataSetDestino: TDataSet; Operacion: String);
    procedure Transferir_Campos(DataSetOrigen,DataSetDestino: TDataSet);
    procedure Setear_Campos_Log(DataSetOrigen,DataSetDestino: TDataSet; Operacion: String);
	public
    function ObtenerPath(ACodPath: String): String; overload;
    function ObtenerPath(ASistema: String; ACodPath: String): String; overload;
    constructor create(AOwner: TComponent); override;
    destructor destroy; override;
    // PARA ACTUALIZAR VISTAS MATERIALIZADAS
    property Clave_VM: String read FClave_VM  Write FClave_vm   ;
    procedure ActualizarVMs; virtual;

	end;

	TDMABMClass = class of TDMABM;

implementation

{$R *.DFM}


{ TDMAbm }

function TDMAbm.ObtenerPath(ACodPath: String): String;
begin
  Result := ObtenerPath(Application.Name, ACodPath);

end;

constructor TDMAbm.create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Clave_VM := '';
  QryLog.Connection := getADOConexion;
  QryCab.Connection := getADOConexion;
  qVistaMat.Connection := getADOConexion;
  QryGirePath.Connection := getADOConexion;
  QryGirePath.Open;

end;

destructor TDMAbm.destroy;
begin
    QryGirePath.Close;
    inherited;
end;

function TDMAbm.ObtenerPath(ASistema, ACodPath: String): String;
begin
  QryGirePath.Open;

  Result := QryGirePath.Lookup('SISTEMA;CODPATH',
                              VarArrayOf([ASistema, ACodPath]),
                              'PATH');
end;


procedure TDMAbm.Validar_PorSioNO(Campo: TField);
begin
  if (Campo.Value <> 'S') and (Campo.Value <> 'N') then
    raise Exception.Create('DEBE INDICAR S o N');
end;

procedure TDMAbm.Registrar_Log(DataSetOrigen, DataSetDestino: TDataSet; Operacion: String);
begin
  try
    Transferir_Campos(DataSetOrigen,DataSetDestino);
    Setear_Campos_Log(DataSetOrigen,DataSetDestino,Operacion);
    QryLog.ExecSQL;
  except
    ShowMessage ('NO SE PUDO ACTUALIZAR LA TABLA DE LOG - AVISE A SISTEMAS')
  end;
end;

procedure TDMAbm.Setear_Campos_Log(DataSetOrigen,
  DataSetDestino: TDataSet; Operacion: String);
begin
  (DataSetDestino as TADOQuery).Parameters.ParamByName('OPERACION').Value       := Operacion;
//  (DataSetDestino as TADOQuery).Parameters.ParamByName('MODIFICADO_POR').Value  := FUsuario;
  (DataSetDestino as TADOQuery).Parameters.ParamByName('FH_MODIFICACION').Value := Date;

end;

procedure TDMAbm.Transferir_Campos(DataSetOrigen,
  DataSetDestino: TDataSet);
var
  i: Integer;
  CampoOrigen: String;
begin
  for i := 0 to DataSetOrigen.FieldCount - 1 do
  begin
    CampoOrigen  := DataSetOrigen.Fields[i].FieldName;
    (DataSetDestino as TADOQuery).Parameters.ParamByName(CampoOrigen).Value := DataSetOrigen.FieldByName(CampoOrigen).Value;
  end;
end;

procedure TDMAbm.QryCabBeforePost(DataSet: TDataSet);
begin
  if Application.MessageBox(PChar('¿ Confirma la actualización del registro ?'),
   												 PChar(Application.Title),
   												 MB_OKCANCEL+MB_DEFBUTTON2+MB_ICONWARNING) <> IDOK then
		Abort;

//  Desactivado por la implementación de Triger de Base de Datos.
{  case DataSet.State of
    dsEdit:    Registrar_Log(DataSet,QryLog,'M');
    dsInsert:  Registrar_Log(DataSet,QryLog,'I');
  else
    Registrar_Log(DataSet,QryLog,'?');
    }
end;

procedure TDMAbm.QryCabBeforeDelete(DataSet: TDataSet);
begin
//  Desactivado por la implementación de Triger de Base de Datos.
//  Registrar_Log(DataSet,QryLog,'B');

end;

procedure TDMAbm.QryCabPostError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
begin
  if E is EDatabaseError then
  begin
    Action := daFail;
    Traducir_Error(E.Message,DataSet);
  end;
end;

procedure TDMAbm.QryCabDeleteError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
var
  nRegistro: TBookmark;
begin
  if E is EDatabaseError then
  begin
    nRegistro := QryCab.GetBookmark;
    QryCab.Close;
    QryCab.Open;
    QryCab.GotoBookmark(nRegistro);
    Action := daFail;
    Traducir_Error(E.Message,DataSet);
  end;
end;

procedure TDMAbm.QryCabEditError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
begin
  if E is EDatabaseError then
  begin
    Action := daFail;
    Traducir_Error(E.Message,DataSet);
  end;
end;

procedure TDMAbm.ActualizarVMs;
begin
  if Clave_VM <> '' then
  begin
     try
       RefrescarVM(getADOConexion);
     except
       raise;
     end;
  end;
end;

procedure TDMAbm.BuscarClavesVM (aConnec: TADOConnection);
begin
// qVistaMat.Connection := AConnec;
 qVistaMat.close; 
 qVistaMat.Parameters.ParamByName('CLAVE').Value := Clave_VM;
 Try
  qVistaMat.Open;
 except
    on e:exception do
    Traducir_Error(e.Message,qVistaMat);
 end;

end;

procedure TDMAbm.RefrescarVM;
var
qry: TADOQuery;
sentencia: string;
begin
  qry := TADOQuery.Create(Self);
  try
    try
      BuscarClavesVM(getADOConexion);
      If qVistaMat.RecordCount > 0 then
      begin
        qry.Connection := getADOConexion;
        while not qVistaMat.Eof do
        begin
         sentencia := 'GIRE.REFRESH_VISTA'+qVistaMat.fieldByname('NOMBRE_DBLINK').AsString+'('''+ qVistaMat.fieldByname('NOMBRE_VISTA').AsString+'''); ';
         //ShowMessage(Sentencia);
         qry.SQL.Clear;
         qry.SQL.add('begin');
         qry.SQL.add(sentencia);
         qry.SQL.add('end;');
         try
            qry.ExecSQL;
            qVistaMat.Next;
         except
           on e:exception do
            Traducir_Error(e.Message + #13#10 + sentencia, qry );
         end;
        end;
      end;
    finally
      qry.close;
      qry.Free;
      qVistaMat.close;
    end;
  except
     on e: exception do
      ShowMessage(e.Message);
  end;
end;

end.
