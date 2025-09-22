unit ManError;

{$DEBUGINFO OFF}

interface

uses
  Windows, Messages, SysUtils, classes, Graphics, Controls, Forms, Dialogs;

type

  TManejaErrorEvent = procedure(Sender: TObject; E: Exception;
                                var GrabaLog: boolean; var ManDefault: boolean) of Object;

  TManejaError = class(TComponent)
  private
    FOnControlError: TManejaErrorEvent;
    FDirArchivoLog: string;
    FIDRegistro: string;
    procedure SetOnControlError(const Value: TManejaErrorEvent);
    procedure SetDirArchivoLog(const Value: string);
    procedure SetIDRegistro(const Value: string);
    { Private declarations }
  protected
    { Protected declarations }
    procedure InterManError(Sender: TObject; E: Exception);
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property IDRegistro: string read FIDRegistro write SetIDRegistro;
  published
    { Published declarations }
    property DirArchivoLog: string read FDirArchivoLog write SetDirArchivoLog;
    property OnControlError: TManejaErrorEvent read FOnControlError write SetOnControlError;
  end;

function HuboError: boolean;
procedure GInterErrorLog(Sender: TObject; const ErrMessage: string; Address: Pointer);
procedure Register;

implementation

const
  vControl             : integer = 0;
  Retorno              : Pointer = nil;
  PathArchivoLog       : string = '';
  SecuenciaError       : integer = 0;

  NAME_CLASS           = 'StartLengthNameClass';
  SEGMENT_MAP          = 'Detailedmapofsegments';
  PUBLICS_BY_NAME      = 'AddressPublicsbyName';
  PUBLICS_BY_VAL       = 'AddressPublicsbyValue';
  LINE_NUMBERS         = 'Linenumbersfor';
  RESOURCE_FILES       = 'Boundresourcefiles';

var
  Units,
  Procedures,
  LineaNumero: TList;
  _CargoArchivoMap: boolean;
  AgregadoAlLog: string;

type

  THeaderType = (htNameClass, htSegmentMap, htPublicsByName, htPublicsByValue,
    htLineaNumero, htResourceFiles);

  PUnitItem = ^TUnitItem;
  TUnitItem = record
    UnitName: string;
    UnitStart,
    UnitEnd: DWORD;
  end;

  PProcedureItem = ^TProcedureItem;
  TProcedureItem = record
    ProcName: string;
    ProcStart: DWORD;
  end;

  PLineNumberItem = ^TLineNumberItem;
  TLineNumberItem = record
    UnitName,
    LineNo: string;
    LineStart: DWORD;
  end;

function HuboError: boolean;
var
  Registro: Pointer;
begin
  asm
    mov Registro, EAX
    mov EAX, [EBP+4]
    mov Retorno, EAX
  end;
  Result := (Registro <> nil);
  if Result then
  begin
    GInterErrorLog(nil, '?', ExceptAddr);
    Inc(SecuenciaError);
  end;
end;

function StripFromString(const Strip: char; var AString: string): string;
var
  Pos: Cardinal;
begin
  Pos := Length(AString);
  while Pos > 0 do
  begin
    if AString[Pos] = Strip then
      Delete(AString, Pos, Length(Strip))
    else
      Dec(Pos);
  end;
  Result := AString;
end;

function CargaArchivoMap: Boolean;
var
  F: TextFile;
  CurrentLine,
  CurrentUnit: string;
  CurrentHeader: THeaderType;

  function CompareHeaders(AHeader, ALine: string): Boolean;
  begin
    Result := Copy(ALine, 1, Length(AHeader)) = AHeader;
  end;

  procedure SyncHeaders(var Header: THeaderType; Line: string);
  const
    Pfx = Length('Line numbers for ');
  begin
    Line := StripFromString(' ', Line);
    if CompareHeaders(NAME_CLASS, Line)      then Header := htNameClass;
    if CompareHeaders(SEGMENT_MAP, Line)     then Header := htSegmentMap;
    if CompareHeaders(PUBLICS_BY_NAME, Line) then Header := htPublicsByName;
    if CompareHeaders(PUBLICS_BY_VAL, Line)  then Header := htPublicsByValue;
    if CompareHeaders(LINE_NUMBERS, Line)    then
    begin
      Header := htLineaNumero;
      CurrentUnit := Copy(Line, Pfx -2, Pos('(', Line) - Pfx + 2);
    end;
    if CompareHeaders(RESOURCE_FILES, Line)  then Header := htResourceFiles;
  end;

  procedure AddUnit(ALine: string);
  var
    SStart: string;
    SLength: string;
    AUnitItem: PUnitItem;
  begin
    if StrToInt(Trim(Copy(ALine, 1, Pos(':', ALine) -1))) = 1 then
    begin
      SStart  := Copy(ALine, Pos(':', ALine) + 1, 8);
      SLength := Copy(ALine, Pos(':', ALine) + 10, 8);
      New(AUnitItem);
      with AUnitItem^ do
      begin
        UnitStart := StrToInt('$' + SStart);
        UnitEnd   := UnitStart + DWORD(StrToInt('$' + SLength));
        Delete(ALine, 1, Pos('M', ALine) + 1);
        UnitName := Copy(ALine, 1, Pos(' ', ALine) -1);
      end;
      Units.Add(AUnitItem);
    end;
  end;

  procedure AddProcedure(ALine: string);
  var
    SStart: string;
    AProcedureItem: PProcedureItem;
  begin
    if StrToInt(Trim(Copy(ALine, 1, Pos(':', ALine) -1))) = 1 then
    begin
      SStart  := Copy(ALine, Pos(':', ALine) + 1, 8);
      New(AProcedureItem);
      with AProcedureItem^ do
      begin
        ProcStart := StrToInt('$' + SStart);
        Delete(ALine, 1, Pos(':', ALine) + 1);
        ProcName  := Trim(Copy(ALine, Pos(' ', ALine), Length(ALine) - Pos(' ', ALine) + 1));
      end;
      Procedures.Add(AProcedureItem);
    end;
  end;

  procedure AddLineNo(ALine: string);
  var
    ALineNumberItem: PLineNumberItem;
  begin
    while Length(Trim(ALine)) > 0 do
    begin
      New(ALineNumberItem);
      with ALineNumberItem^ do
      begin
        Aline     := Trim(ALine);
        UnitName  := CurrentUnit;
        LineNo    := Copy(ALine, 1, Pos(' ', ALine)-1);
        Delete(ALine, 1, Pos(' ', ALine) + 5);
        LineStart := StrToInt('$' + Copy(ALine, 1, 8));
        Delete(ALine, 1, 8);
      end;
      LineaNumero.Add(ALineNumberItem);
    end;
  end;

  function NombreArchivoMap: string;
  begin
    Result := ChangeFileExt(ParamStr(0), '.map');
  end;

begin
  Units       := TList.Create;
  Procedures  := TList.Create;
  LineaNumero := TList.Create;
  if FileExists(NombreArchivoMap) then
  begin
    AssignFile(F, NombreArchivoMap);
    Reset(F);
    while not EOF(F) do
    begin
      ReadLn(F, CurrentLine);
      SyncHeaders(CurrentHeader, CurrentLine);
      if Length(CurrentLine) > 0 then
        if (Pos(':', CurrentLine) > 0) and (CurrentLine[1] = ' ') then
          case CurrentHeader of
            htSegmentMap:     AddUnit(CurrentLine);
            htPublicsByValue: AddProcedure(CurrentLine);
            htLineaNumero:    AddLineNo(CurrentLine);
          end;
    end;
    CloseFile(F);
    Result :=
      (Units.Count > 0) and
      (Procedures.Count > 0) and
      (LineaNumero.Count > 0);
  end
  else
    Result := False;
end;

procedure LimpioTlist;
begin
  if Units.Count > 0 then
    while Units.Count > 0 do
    begin
      Dispose(PUnitItem(Units.Items[0]));
      Units.Delete(0);
    end;
  if Procedures.Count > 0 then
    while Procedures.Count > 0 do
    begin
      Dispose(PProcedureItem(Procedures.Items[0]));
      Procedures.Delete(0)
    end;
  if LineaNumero.Count > 0 then
    while LineaNumero.Count > 0 do
    begin
      Dispose(PLineNumberItem(LineaNumero.Items[0]));
      LineaNumero.Delete(0);
    end;
  FreeAndNil(Units);
  FreeAndNil(Procedures);
  FreeAndNil(LineaNumero);
end;

function NombreDeLaUnit(const Address: DWORD): string;
var
  i: Integer;
begin
  for i := Units.Count -1 downto 0 do
    if ((PUnitItem(Units.Items[i])^.UnitStart <= Address) and
       (PUnitItem(Units.Items[i])^.UnitEnd >= Address)) then
    begin
      Result := PUnitItem(Units.Items[i])^.UnitName;
      Break;
    end;
end;

function NombrelDelProcedimiento(const Address: DWORD): string;
var
  i: Integer;
begin
  for i := Procedures.Count -1 downto 0 do
    if (PProcedureItem(Procedures.Items[i])^.ProcStart <= Address) then
    begin
      Result := PProcedureItem(Procedures.Items[i])^.ProcName;
      Break;
    end;
end;

function NumeroDeLinea(const Address: DWORD): string;
var
  i: Cardinal;
  LastLineNo: string;
  UnitName: string;
begin
  Result     := '';
  LastLineNo := '';
  UnitName   := NombreDeLaUnit(Address);
  for i := 0 to LineaNumero.Count -1 do
    if PLineNumberItem(LineaNumero.Items[i])^.UnitName = UnitName then
      if (PLineNumberItem(LineaNumero.Items[i])^.LineStart >= Address) then
      begin
        Result := LastLineNo;
        Break;
      end
      else
        LastLineNo := PLineNumberItem(LineaNumero.Items[i])^.LineNo;
end;

function DireccionReal(const Address: DWORD): DWORD;
const
  CodeBase = $1000;
var
  OffSet: DWORD;
  ImageBase: DWORD;
begin
  ImageBase := hInstance;
  OffSet := ImageBase + CodeBase;
  Result := Address - OffSet;
end;

function GetComponentFullName(Component: TComponent): string;
begin
  if Component.Name <> '' then
    Result := Component.Name
  else
    Result := Component.ClassName;
  Component := Component.Owner;
  while Component <> nil do begin
    if Component.Name <> '' then
      Result := Component.Name + '.' + Result
    else if not (Component is TApplication) then
      Result := Component.ClassName + '.' + Result;
    Component := Component.Owner;
  end;
end;

procedure GInterErrorLog(Sender: TObject; const ErrMessage: string; Address: Pointer);
var
  ErrorMssg, LogFile: string;
  ErrorsLog: TFileStream;
  UnitName,
  ProcedureName,
  LineNumber: string;
  MapFileAddress: DWORD;
  Mantengo: Pointer;
begin
  Mantengo := Retorno;
  Retorno := nil;
  if Mantengo = nil then
    Mantengo := Address;
  MapFileAddress := DireccionReal(DWORD(Mantengo));
  ErrorMssg := '';
  if _CargoArchivoMap then
  begin
    UnitName := NombreDeLaUnit(MapFileAddress);
    ProcedureName := NombrelDelProcedimiento(MapFileAddress);
    LineNumber := NumeroDeLinea(MapFileAddress);
  end
  else
  begin
    UnitName := '';
    ProcedureName := '';
    LineNumber := '';
  end;
  ErrorsLog := nil;
  try
    LogFile := ChangeFileExt(Application.ExeName, '.err');
    if Length(PathArchivoLog) <> 0 then
      LogFile := PathArchivoLog + ExtractFileName(LogFile);
    if FileExists(LogFile) then
      ErrorsLog := TFileStream.Create(LogFile, fmOpenReadWrite + fmShareExclusive)
    else
      ErrorsLog := TFileStream.Create(LogFile, fmCreate);
    if ErrorsLog.Size = 0 then
      ErrorsLog.Position := ErrorsLog.Size
    else
      ErrorsLog.Position := ErrorsLog.Size - 81;
    if SecuenciaError = 0 then
    begin
      if not _CargoArchivoMap then
        ErrorMssg := 'Informe limitado - Falta "'
                   + ExtractFileName(ChangeFileExt(Application.ExeName, '.map'))
                   + '" o el mismo no contiene los detalles.' + #13#10;
      ErrorMssg := ErrorMssg + FormatDateTime('dd/mm/yyyy hh:nn:ss', Now);
      if AgregadoAlLog <> '' then
        ErrorMssg := ErrorMssg + ' - ID: [' + AgregadoAlLog + ']'
      else
        ErrorMssg := ErrorMssg + ' - ID: [Desconocido]';
      ErrorMssg := ErrorMssg + #13#10;
    end;
    if Sender <> nil then
    begin
      ErrorMssg := ErrorMssg + 'Owner: [';
      if Sender is TComponent then
        ErrorMssg := ErrorMssg + GetComponentFullName(TComponent(Sender))
      else
        ErrorMssg := ErrorMssg + Sender.ClassName;
      ErrorMssg := ErrorMssg + ']';
    end
    else
      ErrorMssg := ErrorMssg + '*';
    if UnitName <> '' then
      ErrorMssg := ErrorMssg + ' - Unit: [' + UnitName + ']';
    if ProcedureName <> '' then
      ErrorMssg := ErrorMssg + ' - Evento: [' + ProcedureName + ']';
    if LineNumber <> '' then
      ErrorMssg := ErrorMssg + ' - Linea: [' + LineNumber + ']';
    if Mantengo <> nil then
      ErrorMssg := ErrorMssg + ' - @: [' + IntToHex(Integer(Mantengo), 1) + ']';
    ErrorMssg := ErrorMssg + #13#10;
    if ErrMessage <> '?' then
    begin
      ErrorMssg := ErrorMssg + ErrMessage;
      ErrorMssg := ErrorMssg + #13#10;
    end;
    if SecuenciaError = 0 then
      ErrorMssg := StringOfChar('*', 79) + #13#10 + ErrorMssg;
    ErrorMssg := ErrorMssg + StringOfChar('*', 79) + #13#10 ;
    ErrorsLog.Write(Pointer(ErrorMssg)^, Length(ErrorMssg));
  except
    Application.MessageBox(PChar('Ha ocurrido un error y el programa no pudo '
                + 'grabar en el archivo de errores.'
                + #13#10 + 'Por favor, tome nota de los siguientes datos y avise a Sistemas'
                + #13#10 + #13#10 + LogFile + #13#10
                + 'Programa         : ' + ExtractFileName(ParamStr(0))
                + #13#10 + 'Módulo fuente : ' + UnitName + #13#10
                + 'Procedimiento : ' + ProcedureName + #13#10
                + 'Línea del error : ' + LineNumber + #13#10#13#10 + 'Gracias...'
                + #9#9 + 'GIRE S.A - Departamento de Sistemas.'),
                PChar('Control de errores'), MB_ICONERROR);
  end;
  ErrorsLog.Free;
end;

procedure Register;
begin
  RegisterComponents('Gire', [TManejaError]);
end;

{ TManejaError }

constructor TManejaError.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Inc(vControl);
  if vControl > 1 then
    Raise Exception.Create('No se admite mas de un componente "TManejaError" por aplicación.');
  if not (csDesigning in ComponentState) then
  begin
    Application.OnException := InterManError;
    _CargoArchivoMap := CargaArchivoMap;
  end;
end;

destructor TManejaError.Destroy;
begin
  Dec(vControl);
  if not (csDesigning in ComponentState) then
    LimpioTlist;
  inherited Destroy;
end;

procedure TManejaError.InterManError(Sender: TObject; E: Exception);
var
  Graba, Sige: boolean;
begin
  Graba := True;
  Sige := True;
  if Assigned(FOnControlError) then
    FOnControlError(Sender, E, Graba, Sige);
  if Sige then
    Application.MessageBox(PChar(E.Message),
                           PChar(Application.Title), MB_ICONERROR);
  if Graba then
    GInterErrorLog(Sender, 'Clase: [' + E.ClassName + '] - Mensaje: ['
                  + E.Message + ']', ExceptAddr);
  SecuenciaError := 0;
end;

procedure TManejaError.SetDirArchivoLog(const Value: string);
begin
  if FDirArchivoLog <> Value then
  begin
    FDirArchivoLog := UpperCase(Value);
    if (Copy(FDirArchivoLog, Length(FDirArchivoLog), 1) <> '\')
        and (Length(FDirArchivoLog) <> 0) then
      FDirArchivoLog := FDirArchivoLog + '\';
  end;
  PathArchivoLog := FDirArchivoLog;
end;

procedure TManejaError.SetIDRegistro(const Value: string);
begin
  FIDRegistro := Value;
  AgregadoAlLog := FIDRegistro;
end;

procedure TManejaError.SetOnControlError(const Value: TManejaErrorEvent);
begin
  FOnControlError := Value;
end;

end.
