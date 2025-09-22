unit ADOCtrlM;

{$DEBUGINFO OFF}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActnList, ADODB;

type
  TPropietario = (prGire, prCronos);
  ENoAutorizado = class(Exception);
  TADOCtrlMenu = class(TComponent)
  private
    FActionList: TActionList;
    FConexion: TADOConnection;
    FUsuario: string;
    FCodigoProceso: integer;
    FReferencia: string;
    FMiQuery: TADOQuery;
    FPropietario: TPropietario;
    FCadenaOwner: string;
    function ComparoClave(sClave, sMascara: string): boolean;
    procedure Execute;
    procedure SetUsuario(const Value: string);
    procedure SetReferencia(const Value: string);
    procedure SetPropietario(const Value: TPropietario);
    { Private declarations }
  protected
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    { Protected declarations }
  public
    procedure Autorizado(Clave: string);
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Loaded; override;
    property Usuario: string read FUsuario write SetUsuario;
    { Public declarations }
  published
    property ActionList: TActionList read FActionList write FActionList;
    property Referencia: string read FReferencia write SetReferencia;
    property Conexion: TADOConnection read FConexion write FConexion;
    property CodigoProceso: integer read FCodigoProceso write FCodigoProceso;
    property Propietario: TPropietario read FPropietario write SetPropietario default prGire;
    { Published declarations }
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Gire Controles', [TADOCtrlMenu]);
end;

{ TADOCtrlMenu }

procedure TADOCtrlMenu.Autorizado(Clave: string);
var
  lOk: boolean;
begin
  lOk := False;
  FMiQuery.SQL.Clear;
  FMiQuery.SQL.Text := 'SELECT CLAVE_CONCATENACION'
    + ' FROM ' + FCadenaOwner + '.CLAVE_FORMULARIO'
    + ' WHERE COD_PROCESO = :CERO'
    + ' AND REFERENCIA = :UNO'
    + ' AND USUARIO_AUTORIZACION = :DOS';

  FMiQuery.Parameters.Items[0].Value := FCodigoProceso;
  FMiQuery.Parameters.Items[1].Value := FReferencia;
  FMiQuery.Parameters.Items[2].Value := UpperCase(FUsuario);

  try
    FMiQuery.Open;
  except
    raise;
  end;

  FMiQuery.First;

  while (not (lOk) and not (FMiQuery.Eof)) do
  begin
    if ComparoClave(Clave, FMiQuery.fieldByName('CLAVE_CONCATENACION').value) then
      lOk := True;
    FMiQuery.Next;
  end;

  FMiQuery.Close;

  if not lOk then
    raise ENoAutorizado.Create('Usuario no habilitado');
end;

function TADOCtrlMenu.ComparoClave(sClave, sMascara: string): boolean;
var
  i: integer;
begin
  i := 1;
  result := True;

  while (((i <= length(sMascara)) or (i <= length(sClave))) and (result)) do
  begin
    if (copy(sMascara, i, 1) = '*') then
      break
    else
    begin
      if (((copy(sMascara, i, 1) = '?') or (copy(sMascara, i, 1) = copy(sClave, i, 1))) and (copy(sClave, i, 1) <> '')) then
        Inc(i)
      else
        result := False;
    end;
  end;

end;

constructor TADOCtrlMenu.Create(AOwner: TComponent);
var
  I: Integer;
begin
  for I := 0 to AOwner.ComponentCount - 1 do
  begin
    if AOwner.Components[I] is TADOCtrlMenu then
      raise Exception.Create('No se admite mas de un componente de la clase '
        + '"TADOCtrlMenu" por formulario.');
  end;
  inherited Create(AOwner);
  FCodigoProceso := 0;
  FPropietario := prGire;
  FCadenaOwner := 'GIRE';
  FMiQuery := TADOQuery.Create(self);
end;

destructor TADOCtrlMenu.Destroy;
begin
  FMiQuery.free;
  inherited Destroy;
end;

procedure TADOCtrlMenu.Execute;
var
  x: integer;
begin
  for x := 0 to FActionList.ActionCount - 1 do
  begin
    TAction(FActionList.Actions[x]).Enabled := False;
  end;
end;

procedure TADOCtrlMenu.Loaded;
begin
  inherited;
  if not (csDesigning in ComponentState) then
  begin
    if FActionList = nil then
      raise Exception.Create('El Componente ' + Name + ' no tiene asignado su Action List');
    Execute;

    if FConexion = nil then
      raise Exception.Create('El Componente ' + Name + ' no tiene "Conexión" asignada');

    if FCodigoProceso = 0 then
      raise Exception.Create('El Componente ' + Name + ' no tiene "Codigo de Proceso" asignada');

    FMiQuery.Connection := FConexion;
  end;
end;

procedure TADOCtrlMenu.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) and (FActionList <> nil) and (AComponent = FActionList) then
    ActionList := nil;
  if (Operation = opRemove) and (FConexion <> nil) and (AComponent = FConexion) then
    Conexion := nil;
end;

procedure TADOCtrlMenu.SetPropietario(const Value: TPropietario);
begin
  FPropietario := Value;
  case FPropietario of
    prCronos: FCadenaOwner := 'CRONOS';
    prGire: FCadenaOwner := 'GIRE';
  end;
end;

procedure TADOCtrlMenu.SetReferencia(const Value: string);
var
  cCopia: string;
begin
  cCopia := Value;
  if Length(Trim(Value)) > 30 then
  begin
    ShowMessage('La propiedad referencia no puede exceder los 30 caracteres');
    cCopia := Copy(cCopia, 1, 30);
  end;
  FReferencia := UpperCase(cCopia);
end;

procedure TADOCtrlMenu.SetUsuario(const Value: string);
var
  CompAux: TComponent;
begin

  if FUsuario = Trim(Value) then exit;

  FUsuario := Value;

  FMiQuery.SQL.Clear;
  FMiQuery.SQL.Text := 'SELECT NOMBRE_ACTION_LIST'
    + ' FROM ' + FCadenaOwner + '.AUTORIZACION_ACTION A,' + FCadenaOwner + '.NIVELES_AUTORIZACION  B'
    + ' WHERE A.COD_PROCESO = :CERO'
    + ' AND A.REFERENCIA= :UNO'
    + ' AND A.COD_PROCESO = B.COD_PROCESO'
    + ' AND B.USUARIO_AUTORIZACION = :DOS'
    + ' AND A.NIVEL_AUTORIZACION<=B.NIVEL_AUTORIZACION';

  FMiQuery.Parameters.Items[0].Value := FCodigoProceso;
  FMiQuery.Parameters.Items[1].Value := FReferencia;
  FMiQuery.Parameters.Items[2].Value := UpperCase(FUsuario);

  try
    FMiQuery.Open;
  except
    raise;
  end;

  Execute;

  FMiQuery.First;

  while not (FMiQuery.Eof) do
  begin
    CompAux := Owner.FindComponent(FMiQuery.FieldByName('NOMBRE_ACTION_LIST').Value);
    if (CompAux <> nil) and (CompAux is TAction) then
      TAction(CompAux).Enabled := True;
    FMiQuery.Next;
  end;

  FMiQuery.Close;
end;

end.

