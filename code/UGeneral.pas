unit UGeneral;

interface

Uses SysUtils, FileCtrl, Define, Windows, ADODb, UDMGemaConexion, Classes,
     Dialogs, Variants,  TLHelp32;

type
  TRegistroDistribucion = Record
    Cod_Cia: Integer;
    RazonSocial: String;
    Nro_Proceso: Integer;
    Procesos_Relacionados: integer;
    DescProceso: String;
    Cod_Tipo_Archivo: String;
    Cod_Diseno: string;
    Nro_Orden: Integer;
    Nombre_Archivo: String;
    Path_Cia: String;
    Path_Work: String;
    Condicion_Corte_Archivo: String;
    Fh_Proceso: Double;	// Fecha de proceso que ingresa el operador por pantalla
    Fh_Distribucion: Double;
    Nro_Corrida: Integer;
    FMaxFh_Proceso_Actual: Double; // Maxima fecha de proceso de la distribución en curso
    Copia_A_Trx: String;
    Fh_Proceso_Anterior: Double; // Anteúltima fecha de proceso ejecutada (DISTRIBUCIONES.FH_PROCESO_ANTERIOR)
    Cod_Modo: Integer;
    Fh_Proceso_Ultima: Double;	// Ultima fecha de proceso ejecutada (DISTRIBUCIONES.FH_PROCESO)
    Parametro_Dia_habil: Integer;
    Nro_Proceso_AU: Int64;
    Lote_AU: String;
    Es_AU : boolean;
    Existe_Conversion: boolean;
    Log_Proceso: String;
    Genera_Nulos:boolean;
    ValueTMP:integer;
    EsServidorActivo:boolean;
    Imprime:boolean;
  end;

  TMiArraydeFechas = Array of Double;

Function NombreDiaSemana(ADate: TDateTime): String;
Procedure SortArray(var AArray: TMiArraydeFechas);
Procedure Verificar_Directorios(ARuta_Salida, ARuta_Trx: String);
Function Usuario_Novell: String;
Procedure Verificar_ApolloDlls(AOwner: TComponent);
function YaCorre(FileName, Nombre:String):boolean;

implementation

Function NombreDiaSemana(ADate: TDateTime): String;
var
  days: array[1..7] of string;
begin
  days[1] := 'Domingo';
  days[2] := 'Lunes';
  days[3] := 'Martes';
  days[4] := 'Miércoles';
  days[5] := 'Jueves';
  days[6] := 'Viernes';
  days[7] := 'Sábado';
  Result := days[DayOfWeek(ADate)];
end;

Procedure SortArray(var AArray: TMiArraydeFechas);
var
  dSwap: Double;
  pasadaS,j,tope: Integer;
  intercambio: boolean;
begin
  intercambio := True;
  tope := Length(AArray);
  pasadas := 1;
  while (pasadas <= tope-1) and intercambio do
  begin
    intercambio := False;
    for j := 0 to tope-1-pasadas do
      if AArray[j] > AArray[j +1] then
      begin
        intercambio := True;
        dSwap := AArray[j];
        AArray[j] := AArray[j+1];
        AArray[j+1] := dSwap;
      end;
    pasadas := pasadas + 1;
  end;

end;

Procedure Verificar_Directorios(ARuta_Salida, ARuta_Trx: String);
begin
  { Verifico que sean distintas las rutas de Salida y Transmisión }
  if ARuta_Salida = ARuta_Trx then
    Raise Exception.Create(' Las rutas de Salida y transmision de los archivos son idénticas ');

  { Verifico exista la ruta de salida }
  if not DirectoryExists(ARuta_Salida) then
 	  Raise Exception.Create('No existe el Directorio de Salida especificado ('+ARuta_Salida+')');

  { Verifico exista la ruta de transmisión }
	  if not DirectoryExists(ARuta_Trx) then
  	  Raise Exception.Create('No existe el Directorio de Transmision especificado ('+ARuta_Trx+')');
end;

Function Usuario_Novell: String;
begin
	Result := Trim(GetEnv('NOMBRE'));
end;

Procedure Verificar_ApolloDlls(AOwner: TComponent);
var
	Path_Windows,Path_ApolloDlls: String;
  AApolloDlls: Array [0..2] of string;
  Path_Win: Array [0..50] of Char;
  i: Integer;
  QryGirePath: TADOQuery;
begin
  //AApolloDlls[0] := 'SDE50.DLL';
  //AApolloDlls[1] := 'SDECDX50.DLL';
  //AApolloDlls[2] := 'SDENTX50.DLL';
  //if GetWindowsDirectory(Path_Win,50) = 0 then
  //  Raise Exception.Create(' GEMA no puede obtener el directorio de WINDOWS. Avise a Sistemas');

  i := 0;
  while (i <= 50) and (Path_Win[i] <> #0) do
  begin
	  Path_Windows := Path_Windows + Path_Win[i];
    i := i + 1;
  end;
  Path_Windows := Path_Windows + '\';
  QryGirePath := TADOQuery.Create(AOwner);
  QryGirePath.Connection := GemaConexion.ADOConec;
  QryGirePath.SQL.Add('Select A.COD_SISTEMA,B.DESCRIPCION AS SISTEMA,A.COD_PATH AS CODPATH,');
  QryGirePath.SQL.Add('A.PATH,A.USUARIO,A.FH_ACTUALIZACION');
  QryGirePath.SQL.Add('from GIRE.PATHS A, GIRE.SISTEMAS B');
  QryGirePath.SQL.Add('where A.COD_SISTEMA = B.COD_SISTEMA');
  QryGirePath.Open;
	Path_ApolloDlls := QryGirePath.Lookup('SISTEMA;CODPATH',VarArrayOf(['GEMA','APOLLODLLS']),'PATH');
  QryGirePath.Close;

  i := 0;
  while i <= Length(AApolloDlls)-1 do
  begin
	  if not FileExists(Path_Windows+AApolloDlls[i]) then
		  if not FileExists(Path_ApolloDlls+AApolloDlls[i]) then
	  	  Raise Exception.Create(' GEMA no puede iniciar porque falta la siguiente librería: '+AApolloDlls[i]+'. Avise a Sistemas')
	    else
  	    CopiarArchivo(Path_ApolloDlls+AApolloDlls[i],Path_Windows+AApolloDlls[i]);
    i := i + 1;
  end;

end;

 function YaCorre(FileName, Nombre:String):boolean;
 var
     ContinueLoop:BOOL;
     FSnapshotHandle:THandle;
     FProcessEntry32:TProcessEntry32;
     Cuantos: Integer;
 begin
  Result:= false;
  Cuantos := 0 ;
  FSnapshotHandle:=CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS,0);
  FProcessEntry32.dwSize:=Sizeof(FProcessEntry32);
  ContinueLoop:=Process32First(FSnapshotHandle,FProcessEntry32);
  while integer(ContinueLoop)<>0 do
   begin
    if ((UpperCase(ExtractFileName(FProcessEntry32.szExeFile))=UpperCase(FileName)) or (UpperCase(FProcessEntry32.szExeFile)=UpperCase(FileName))) then
      Inc(Cuantos);
    ContinueLoop:=Process32Next(FSnapshotHandle,FProcessEntry32);
   end;
   CloseHandle(FSnapshotHandle);

  if Cuantos > 1 then
   begin
    Result := True;
    ShowMessage('Solo está permitido ejecutar una sola instancia de "'+UpperCase( Nombre )+'".' );
   end;

 end;

end.


