unit UDMGirePath;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, ADODB, ApoDSet, ApoEnv, Define, Variants;

type
  TDMGirePath = class(TDataModule)
    QryGirePath: TADOQuery;
    QryGirePathSISTEMA: TStringField;
    QryGirePathCODPATH: TStringField;
    QryGirePathPATH: TStringField;
    Entorno: TApolloEnv;
    DBDisemp: TApolloDatabase;
    TblCaminos: TApolloTable;
    TblGireCtrl: TApolloTable;
    SPRBSGrande: TADOStoredProc;
    function ObtenerPathCiaDBF(ACod_Cia: Double): String;
    procedure Respaldar_TablaDbf(AArchivo: String);
    procedure Recuperar_TablaDbf(AArchivo: String);
    procedure Recuperar_DBFNEW(AArchivo: String);
    procedure Recuperar_DBFBCK(AArchivo: String);
  private
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function ObtenerPath(ACodPath: String): String; overload;
    function ObtenerPath(ASistema: String; ACodPath: String): String; overload;
  end;

var
  DMGirePath: TDMGirePath;

implementation

uses UDMGemaConexion;

{$R *.DFM}

{ TDataModule3 }

function TDMGirePath.ObtenerPath(ACodPath: String): String;
begin
  Result := ObtenerPath(Application.Name, ACodPath);

end;

constructor TDMGirePath.Create(AOwner: TComponent);
begin
  Inherited;
  QryGirePath.Open;
  GemaConexion.ManejaError1.DirArchivoLog := ObtenerPath('ERRORLOG');

  // JIRA - GEMAU-32 (Error en el H) //
  // Disemp.DataPath := ObtenerPath('TBLCAMINOS');
  // TblCaminos.Open;
end;

function TDMGirePath.ObtenerPath(ASistema, ACodPath: String): String;
var
  Resultado : Variant;
begin
  Resultado := QryGirePath.Lookup('SISTEMA;CODPATH',
                          VarArrayOf([ASistema, ACodPath]),
                          'PATH');

  if Resultado = null then
    Result := ''
  else
    Result := Resultado;
end;

destructor TDMGirePath.Destroy;
begin
  QryGirePath.Close;
  TblCaminos.Close;
  inherited;

end;

function TDMGirePath.ObtenerPathCiaDBF(ACod_Cia: Double): String;
begin
  if TblCaminos.Locate('EMPRESA',FloatToStr(ACod_Cia),[]) then
    Result := TblCaminos.FieldByname('CAMINO').Value
  else
    Raise Exception.Create('IMPOSIBLE ENCONTRAR EL PATH PARA LA EMPRESA '+FloatToStr(ACod_Cia));


end;

procedure TDMGirePath.Respaldar_TablaDbf(AArchivo: String);
var
  cBak: String;
begin
  { Resplado la GireCtrl y cualquier otra DBF como '.BCK' para la vuelta atrás
    tanto en la Generación de Archivos como por menú }
  cBak := Copy( AArchivo,0,Pos('.',AArchivo)-1)+'.BCK';
  if FileExists(AArchivo) then
    if not CopyFile(PChar(AArchivo),PChar(cBak),False) then
      Raise Exception.Create('No se pudo respaldar la tabla '+AArchivo+'. Error: '+IntToStr(GetLastError));
end;

procedure TDMGirePath.Recuperar_TablaDbf(AArchivo: String);
var
  cBak, cNew: String;
begin
  { Respaldo la GireCtrl y cualquier otra DBF con '.NEW' por si falla
    la vuelta atrás por menú. Luego piso la GireCtrl y cualquier otra
    DBF con los '.BCK' }
  cBak := Copy( AArchivo,0,Pos('.',AArchivo)-1)+'.BCK';
  cNew := Copy( AArchivo,0,Pos('.',AArchivo)-1)+'.NEW';
  if FileExists(cBak) then
  begin
    if not CopyFile(PChar(AArchivo),PChar(cNew),False) then
      Raise Exception.Create('No se pudo recuperar la tabla '+AArchivo+'. Error: '+IntToStr(GetLastError));
    if not CopyFile(PChar(cBak),PChar(AArchivo),False) then
      Raise Exception.Create('No se pudo recuperar la tabla '+AArchivo+'. Error: '+IntToStr(GetLastError));
  end;
end;

procedure TDMGirePath.Recuperar_DBFNEW(AArchivo: String);
var
  cBak, cNew: String;
begin
  { Falló la vuelta atrás por menú: las '.DBF' pasan como '.BCK' y las '.NEW'
    como '.DBF' }
  cBak := Copy( AArchivo,0,Pos('.',AArchivo)-1)+'.BCK';
  cNew := Copy( AArchivo,0,Pos('.',AArchivo)-1)+'.NEW';
  if FileExists(cBak) then
  begin
    if not CopyFile(PChar(AArchivo),PChar(cBak),False) then
      Raise Exception.Create('No se pudo recuperar la tabla '+AArchivo+'. Error: '+IntToStr(GetLastError));
    if not CopyFile(PChar(cNew),PChar(AArchivo),False) then
      Raise Exception.Create('No se pudo recuperar la tabla '+AArchivo+'. Error: '+IntToStr(GetLastError));
  end;

end;

procedure TDMGirePath.Recuperar_DBFBCK(AArchivo: String);
var
  cBck: String;
begin
  { Recupero cualquier BCK como '.DBF' para la vuelta atrás en la Generación de Archivos }
  cBck := Copy( AArchivo,0,Pos('.',AArchivo)-1)+'.BCK';
  if FileExists(cBck) then
    if not CopyFile(PChar(cBck),PChar(AArchivo),False) then
      Raise Exception.Create('No se pudo recuperar la tabla '+AArchivo+'. Error: '+IntToStr(GetLastError));

end;

end.
