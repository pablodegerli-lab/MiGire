unit SeteaRol;

{$DEBUGINFO OFF}

interface

uses
  Classes, ADODB, SysUtils, dbtables, SqlExpr;

type
  TSeteaRoles = class(TObject)
  private
    { Private declarations }
    FConnection: TADOConnection;
    FConnecBDE: TDatabase;
    FConnecDBX: TSQLConnection;
    FNombreSistema: string;
    FClave: string;
    RolUsu: string;
    FUsuario: string;
    FRoles: boolean;
    procedure CrearLista(pQry: TADOQuery); overload;
    procedure CrearLista(pQry: TQuery); overload;
    procedure CrearLista(pQry: TSQLDataSet); overload;
    procedure RolesConexion;
    function ClaveRol(pRol: string): string;
    procedure SeteaRoles;
    procedure SetUsuario(const Value: string);
    procedure SetRoles(const Value: boolean);
    procedure SetClaveContexto(const Value: string);
  protected
    { Protected declarations }
  public
    { Public declarations }
    ClaveContexto: String;
    procedure Ejecutar(Conexion: TADOConnection); overload;
    procedure Ejecutar(Conexion: TDatabase); overload;
    procedure Ejecutar(Conexion: TSQLConnection); overload;
    procedure ActivarRoles11g(Conexion: TADOConnection); overload;
    procedure ActivarRoles11g(Conexion: TDatabase); overload;
    procedure Activar(Conexion: TADOConnection); overload;
    procedure Activar(Conexion: TDatabase); overload;
    procedure Activar(Conexion: TSQLConnection); overload;
    Procedure Set_11g(Conexion: TADOConnection);

    property NombreSistema: string read FNombreSistema write FNombreSistema;
    property Usuario: string  read FUsuario write SetUsuario;
    property Clave: string read FClave write FClave;
    property Roles: boolean read FRoles write SetRoles;

  end;

implementation

var
  ListaRolesADO: TStringList;
  ListaRolesBDE: TStringList;
  ListaRolesDBX: TStringList;
  { TSeteaRoles }

function TSeteaRoles.ClaveRol(pRol: string): string;
var
  QryPas: TADOQuery;
  QryBDE: TQuery;
  QryDBX: TSQLDataSet;
begin
  result := '';
  if FConnection <> nil then
  begin
    QryPas := TADOQuery.Create(nil);
    try
      QryPas.Connection := FConnection;
      QryPas.SQL.Text := 'Select LeoClaveRol(' + '''' + 'afjlsdña' + '''' + ',' + '''' + pRol + '''' + ') as XEZ from dual';
      QryPas.Open;
      result := QryPas.fieldByName('XEZ').asstring;
    finally
      QryPas.Free;
    end;
  end;
  if FConnecBDE <> nil then
  begin
    QryBDE := TQuery.Create(nil);
    try
      QryBDE.DatabaseName := FConnecBDE.DatabaseName;
      QryBDE.SQL.Text := 'Select LeoClaveRol(' + '''' + 'afjlsdña' + '''' + ',' + '''' + pRol + '''' + ') as XEZ from dual';
      QryBDE.Open;
      result := QryBDE.fieldByName('XEZ').asstring;
    finally
      QryBDE.Free;
    end;
  end;
 if FConnecDBX <> nil then
  begin
    QryDBX := TSQLDataSet.Create(nil);
    try
      QryDBX.SQLConnection := FConnecDBX;
      QryDBX.CommandText  := 'Select LeoClaveRol(' + '''' + 'afjlsdña' + '''' + ',' + '''' + pRol + '''' + ') as XEZ from dual';
      QryDBX.Open;
      result := QryDBX.fieldByName('XEZ').asstring;
    finally
      QryDBX.Free;
    end;
  end;
end;

procedure TSeteaRoles.CrearLista(pQry: TADOQuery);
begin
  ListaRolesADO.Clear;
  while not (pQry.Eof) do
  begin
    ListaRolesADO.Add(pQry.FieldByName('granted_role').Text);
    pQry.Next;
  end;
end;

procedure TSeteaRoles.CrearLista(pQry: TQuery);
begin
  ListaRolesBDE.Clear;
  while not (pQry.Eof) do
  begin
    ListaRolesBDE.Add(pQry.FieldByName('granted_role').Text);
    pQry.Next;
  end;
end;

procedure TSeteaRoles.CrearLista(pQry: TSQLDataSet);
begin
  ListaRolesDBX.Clear;
  while not (pQry.Eof) do
  begin
    ListaRolesDBX.Add(pQry.FieldByName('granted_role').Text);
    pQry.Next;
  end;
end;

procedure TSeteaRoles.Ejecutar(Conexion: TADOConnection);
begin
  if Conexion = nil then
    raise Exception.Create('Falta asignar conexión al seteo de roles.');
  if not Roles then
   begin
    FConnection := TADOConnection.Create(nil);
    try
	  // Asigna los roles para 8i ... 
      FConnection.ConnectionString := Conexion.ConnectionString;
      FConnection.LoginPrompt := False;
      FConnection.Open(Usuario, Clave);
      RolesConexion;
      SeteaRoles;
    finally
      FConnection.Free;
    end;
   end;
  Conexion.Open(Usuario, Clave);
  if not Roles then
    Activar(Conexion)
  else
   begin
    //Activa los roles por medio de los paquetes de seguridad de Oracle
    ActivarRoles11g(Conexion);
	// Seteos especiales para 11g y compatibilidad con lo usado en 8i, solo se aplican para la sesion 
	// abierta por el usuario.
    Set_11g(Conexion);
   end;
end;

procedure TSeteaRoles.Ejecutar(Conexion: TDatabase);
begin
  if Conexion = nil then
    raise Exception.Create('Falta asignar conexión al seteo de roles.');
  if not Roles then
   begin
    FConnecBDE := TDatabase.Create(nil);
    try
      FConnecBDE.Params.Text := Conexion.Params.Text;
      FConnecBDE.AliasName := Conexion.AliasName;
      FConnecBDE.DatabaseName := 'Cualquiera';
      FConnecBDE.LoginPrompt := False;
      FConnecBDE.Open;
      RolesConexion;
      SeteaRoles;
    finally
      FConnecBDE.Free;
    end;
   end;
  Conexion.Open;
  if not Roles then
    Activar(Conexion)
  else
    ActivarRoles11g(Conexion);
end;


procedure TSeteaRoles.Ejecutar(Conexion: TSQLConnection);
begin
  if Conexion = nil then
    raise Exception.Create('Falta asignar conexión al seteo de roles.');
  if Roles then
   begin
    FConnecDBX := TSQLConnection.Create(nil);
    try
      FConnecDBX.DriverName := Conexion.DriverName;
      FConnecDBX.ConnectionName := Conexion.ConnectionName;
      FConnecDBX.LibraryName := Conexion.LibraryName;
      FConnecDBX.VendorLib :=  Conexion.VendorLib;
      FConnecDBX.GetDriverFunc := Conexion.GetDriverFunc;
      FConnecDBX.Params.Text := Conexion.Params.Text;
      FConnecDBX.LoginPrompt := False;
      FConnecDBX.Open;
      RolesConexion;
      SeteaRoles;
    finally
      FConnecDBX.Free;
    end;
   end;
  Conexion.Open;
  if Roles then
    Activar(Conexion);
end;


procedure TSeteaRoles.RolesConexion;
var
  QryConsulta: TADOQuery;
  QryConsBDE: TQuery;
  QryConsDBX: TSQLDataSet;
begin
  if FConnection <> nil then
  begin
    QryConsulta := TADOQuery.Create(nil);
    try
      QryConsulta.Connection := FConnection;
      QryConsulta.SQL.Add('select * ' +
        'from sys.user_role_privs urp, gire.activa_roles ar ' +
        'where urp.GRANTED_ROLE=ar.NOMBRE_ROL and ' +
        'ar.NOMBRE_SISTEMA=:pSist');
      QryConsulta.Parameters.ParamByName('pSist').value := UpperCase( FNombreSistema );
      QryConsulta.open;
      CrearLista(qryConsulta);
    finally
      QryConsulta.Free;
    end;
  end;
  if FConnecBDE <> nil then
  begin
    QryConsBDE := TQuery.Create(nil);
    try
      QryConsBDE.DatabaseName := FConnecBDE.DatabaseName;
      QryConsBDE.SQL.Add('select * ' +
        'from sys.user_role_privs urp, gire.activa_roles ar ' +
        'where urp.GRANTED_ROLE=ar.NOMBRE_ROL and ' +
        'ar.NOMBRE_SISTEMA=:pSist');

      QryConsBDE.ParamByName('pSist').value := UpperCase( FNombreSistema );
      QryConsBDE.open;
      CrearLista(qryConsBDE);
    finally
      QryConsBDE.Free;
    end;
  end;
 if FConnecDBX <> nil then
  begin
    QryConsDBX := TSQLDataSet.Create(nil);
    try
      QryConsDBX.SQLConnection := FConnecDBX;
      QryConsDBX.CommandText := 'select * ' +
        'from sys.user_role_privs urp, gire.activa_roles ar ' +
        'where urp.GRANTED_ROLE=ar.NOMBRE_ROL and ' +
        'ar.NOMBRE_SISTEMA=:pSist';

      QryConsDBX.ParamByName('pSist').value := UpperCase( FNombreSistema );
      QryConsDBX.open;
      CrearLista(QryConsDBX);
    finally
      QryConsDBX.Free;
    end;
  end;
end;

procedure TSeteaRoles.SeteaRoles;
var
  I: integer;
  PassRol: string;
begin
  RolUsu := '';//'Connect IDENTIFIED BY begini';
  if FConnection <> nil then
   begin
    try
      if (ListaRolesADO.Count <> 0) then
       begin
        RolUsu := '';
        for I := 0 to ListaRolesADO.Count - 1 do
         begin
          RolUsu := RolUsu + ListaRolesADO[I];
          PassRol := ClaveRol(ListaRolesADO[I]);
          if PassRol <> '' then
            RolUsu := RolUsu + ' IDENTIFIED BY ' + PassRol;
          if I <> ListaRolesADO.Count - 1 then
            RolUsu := RolUsu + ', ';
         end;
       end;
    finally
    end;
   end;
   if FConnecBDE <> nil then
    begin
     try
       PassRol := '';
       if  ListaRolesBDE.Count <> 0 then
         begin
          RolUsu := '';
          for I := 0 to ListaRolesBDE.Count - 1 do
           begin
            RolUsu := RolUsu + ListaRolesBDE[I];
            PassRol := ClaveRol(ListaRolesBDE[I]);
            if PassRol <> '' then
              RolUsu := RolUsu + ' IDENTIFIED BY ' + PassRol;
            if I <> ListaRolesBDE.Count - 1 then
              RolUsu := RolUsu + ', ';
           end;
         end;
      finally

      end;
    end;
   if FConnecDBX <> nil then
    begin
     try
       PassRol := '';
       if  ListaRolesDBX.Count <> 0 then
         begin
          RolUsu := '';
          for I := 0 to ListaRolesDBX.Count - 1 do
           begin
            RolUsu := RolUsu + ListaRolesDBX[I];
            PassRol := ClaveRol(ListaRolesDBX[I]);
            if PassRol <> '' then
              RolUsu := RolUsu + ' IDENTIFIED BY ' + PassRol;
            if I <> ListaRolesDBX.Count - 1 then
              RolUsu := RolUsu + ', ';
           end;
         end;
      finally

      end;
    end;
end;

procedure TSeteaRoles.Activar(Conexion: TADOConnection);
var
  cmdRol : TADOCommand;
begin
  cmdRol := TADOCommand.Create(nil);
  try
   if RolUsu <> '' then
    begin
     cmdRol.Connection := Conexion;
     cmdRol.CommandText := 'set role ' + RolUsu;
     cmdRol.Execute;
	end; 
  finally
    cmdRol.Free;
  end;
end;

procedure TSeteaRoles.Activar(Conexion: TDatabase);
var
  qryRol: TQuery;
begin
  qryRol := TQuery.Create(nil);
  try
    qryRol.DatabaseName := Conexion.DatabaseName;
    qryRol.SQL.Text := 'set role ' + RolUsu;
    qryRol.ExecSQL;
  finally
    qryRol.Free;
  end;
end;

procedure TSeteaRoles.Activar(Conexion: TSQLConnection);
var
  qryRol: TSQLDataSet;
begin
  qryRol := TSQLDataSet.Create(nil);
  try
    qryRol.SQLConnection := Conexion;
    qryRol.CommandType :=  ctQuery;
    qryRol.CommandText := 'set role ' + RolUsu;
    qryRol.ExecSQL(True);
  finally
    qryRol.Free;
  end;
end;


procedure TSeteaRoles.SetUsuario(const Value: string);
begin
  FUsuario := Value;
end;

procedure TSeteaRoles.SetRoles(const Value: boolean);
begin
  FRoles := Value;
end;

procedure TSeteaRoles.ActivarRoles11g(Conexion: TADOConnection);
var
  cmdRol : TADOCommand;
begin
  SetClaveContexto(UpperCase( FNombreSistema ));
  cmdRol := TADOCommand.Create(nil);
  try
    cmdRol.Connection := Conexion;
    cmdRol.CommandText :=  'begin ' + #13#10 + '	sys.role_control.establece_contexto('''+ClaveContexto+''');' + #13#10  + '	gire.habil;' + #13#10 + 'end;';
    cmdRol.Execute;
  finally
    cmdRol.Free;
  end;
end;

procedure TSeteaRoles.SetClaveContexto(const Value: string);
begin
  ClaveContexto := Value;
end;

procedure TSeteaRoles.Set_11g(Conexion: TADOConnection);
var
  cmdSet : TADOCommand;
begin
  cmdSet := TADOCommand.Create(nil);
  try
    cmdSet.Connection := Conexion;
    cmdSet.CommandText :=  'ALTER SESSION SET '+'"'+'_GBY_HASH_AGGREGATION_ENABLED'+'"'+' = FALSE'  ;
    cmdSet.Execute;
  finally
    cmdSet.Free;
  end;
end;

procedure TSeteaRoles.ActivarRoles11g(Conexion: TDatabase);
var
  cmdRol : TQuery;
begin
  SetClaveContexto(UpperCase( FNombreSistema ));
  cmdRol := TQuery.Create(nil);
  try
    cmdRol.DatabaseName := Conexion.DatabaseName;
    cmdRol.SQL.Text :=  'begin ' + #13#10 + '	sys.role_control.establece_contexto('''+ClaveContexto+''');' + #13#10  + '	gire.habil;' + #13#10 + 'end;';
    cmdRol.ExecSQL;
  finally
    cmdRol.Free;
  end;
end;

initialization
  ListaRolesADO := TStringList.Create;
  ListaRolesBDE := TStringList.Create;
  ListaRolesDBX := TStringList.Create;
finalization
  ListaRolesADO.Free;
  ListaRolesBDE.Free;
  ListaRolesDBX.Free;
end.

