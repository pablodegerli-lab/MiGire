unit ProcFile;

{$DEBUGINFO OFF}

interface

uses
  Classes, SysUtils;

type
  TArchivoNotifyEvent = procedure(ANombreArchivo: TFileName) of object;
  TArchivoErrNotifyEvent = procedure(ANombreArchivo: TFileName; E: Exception) of
    object;

  TFileAttribute = (fatReadOnly, fatHidden, fatSysFile, fatVolumeID,
    fatDirectory, fatArchive, fatAnyFile);

  TTipoDeOrden = (ordNo, ordNombre, ordExtencion, ordFecha, ordTamano);

  TClasificacion = (ordAscendente, ordDescendente);

  TFileAttributes = set of TFileAttribute;


  TProcArchivos = class(TComponent)
  private
    FPath: string;
    FMascara: string;
    FOnProcesarArchivo: TArchivoNotifyEvent;
    FOnProcesarArchivoOk: TArchivoNotifyEvent;
    FOnProcesarArchivoErr: TArchivoErrNotifyEvent;
    FOnValidarArchivo: TArchivoNotifyEvent;
    FListaArchivos: TStrings;
    FSizeArchivos: TStrings;
    FDateArchivos: TStrings;
    FAtributos: TFileAttributes;
    FNombreArchivo: TFileName;
    FTamanoArchivo: integer;
    FFechaArchivo: TDateTime;
    FOrdenado: TTipoDeOrden;
    FCountFiles: integer;
    FClasificacion: TClasificacion;
    function AtributosToInteger: Integer;
    function ComparaConMascara(source, pattern: string): Boolean;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure ObtenerListaArchivos;
    procedure Procesar; overload;
    procedure Procesar(APath: string); overload;
    function ListaArchivos: TStrings;
    function ListaFechaArchivos: TStrings;
    function ListaSizeArchivos: TStrings;
    function PathConMascara: string;
    function NombreArchivo: TFileName;
    function TamanoArchivo: integer;
    function FechaArchivo: TDateTime;
    property CountFiles: integer read FCountFiles;
  published
    property Mascara: string read FMascara write FMascara;
    property Path: string read FPath write FPath;
    property Atributos: TFileAttributes read FAtributos write FAtributos;
    property Ordenado: TTipoDeOrden read FOrdenado write FOrdenado;
    property Clasificacion: TClasificacion read FClasificacion write
      FClasificacion;

    property OnProcesarArchivo: TArchivoNotifyEvent read FOnProcesarArchivo write
      FOnProcesarArchivo;
    property OnProcesarArchivoOk: TArchivoNotifyEvent read FOnProcesarArchivoOk
      write FOnProcesarArchivoOk;
    property OnProcesarArchivoErr: TArchivoErrNotifyEvent read
      FOnProcesarArchivoErr write FOnProcesarArchivoErr;
    property OnValidarArchivo: TArchivoNotifyEvent read FOnValidarArchivo write
      FOnValidarArchivo;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Gire', [TProcArchivos]);
end;

{ TProcArchivos }


destructor TProcArchivos.Destroy;
begin
  FListaArchivos.Free;
  FSizeArchivos.Free;
  FDateArchivos.Free;
  inherited;
end;

procedure TProcArchivos.Procesar(APath: string);
begin
  FPath := APath;
  Procesar;
end;

procedure TProcArchivos.Procesar;
var
  i: Integer;
begin
  ObtenerListaArchivos;
  for i := 0 to FListaArchivos.Count - 1 do
  begin
    FNombreArchivo := FListaArchivos[i];
    FTamanoArchivo := StrToInt(FSizeArchivos[i]);
    FFechaArchivo := StrToDateTime(FDateArchivos[i]);
    try
      if Assigned(FOnValidarArchivo) then
        FOnValidarArchivo(FNombreArchivo);

      if Assigned(FOnProcesarArchivo) then
        FOnProcesarArchivo(FNombreArchivo);

      if Assigned(FOnProcesarArchivoOk) then
        FOnProcesarArchivoOk(FNombreArchivo);

    except
      on E: Exception do
        if Assigned(FOnProcesarArchivoErr) then
          FOnProcesarArchivoErr(FNombreArchivo, E)
        else
          raise;
    end;

  end;
end;

procedure TProcArchivos.ObtenerListaArchivos;

  function MiStrZero(Valor: Currency; Longitud: integer; Decimales: integer):
    string;
  var
    Buffer: array[0..66] of char;
    Cadena, CadAux: string;
    x: integer;
  begin
    for x := 0 to 66 do
      buffer[x] := #0;
    FloatToText(Buffer, Valor, fvCurrency, ffFixed, 0, Decimales);
    Cadena := Buffer;
    if length(Cadena) > Longitud then
    begin
      for x := 0 to (Longitud - 1) do
        Buffer[x] := #42;
      Buffer[Longitud] := #0;
      Cadena := Buffer;
    end
    else
    begin
      for x := 0 to ((Longitud - 1) - length(cadena)) do
        Buffer[x] := '0';
      Buffer[Longitud - length(cadena)] := #0;
      CadAux := Buffer;
      Cadena := CadAux + Cadena;
    end;
    result := Cadena;
  end;


  function MiPadr(Cadena: string; Longitud: integer; Caracter: Char): string;
  var
    CadAux: string;
    nX, nCad: integer;
  begin
    nCad := Length(Cadena);
    if nCad < Longitud then
    begin
      for nX := 1 to Longitud - nCad do
        CadAux := CadAux + Caracter;
      CadAux := Cadena + CadAux;
    end
    else
      CadAux := Copy(Cadena, 1, Longitud);
    result := CadAux;
  end;

var
  SearchRec: TSearchRec;
  MoreFiles: Boolean;
  AuxNombre: TStrings;
  AuxSize: TStrings;
  AuxDate: TStrings;
  Temporal: TStrings;
  Ciclo: integer;
  PosAux: integer;
  Texto: string;
begin
  AuxNombre := TStringList.Create;
  AuxSize := TStringList.Create;
  AuxDate := TStringList.Create;
  Temporal := TStringList.Create;
  TStringList(Temporal).Sorted := True;
  FListaArchivos.Clear;
  FSizeArchivos.Clear;
  FDateArchivos.Clear;
  FCountFiles := 0;

  MoreFiles := (FindFirst(PathConMascara, AtributosToInteger, SearchRec) = 0);

  try
    while MoreFiles do
    begin
      if ComparaConMascara(UpperCase(SearchRec.Name), UpperCase(FMascara)) then
      begin
        AuxNombre.Add(UpperCase(SearchRec.Name));
        AuxSize.Add(IntToStr(SearchRec.Size));
        AuxDate.Add(DateTimeToStr(FileDateToDateTime(SearchRec.Time)));

        Inc(FCountFiles);
      end;
      MoreFiles := (FindNext(SearchRec) = 0);
    end;
  finally
    FindClose(SearchRec);
  end;

  case FOrdenado of

    ordNo:
      begin
        TStringList(Temporal).Sorted := False;
        for Ciclo := 0 to AuxNombre.Count - 1 do
        begin
          Texto := MiPadr(' ', 67, #32) + MiStrZero(Ciclo, 6, 0);
          Temporal.Add(Texto);
        end;
      end;

    ordNombre:
      begin
        for Ciclo := 0 to AuxNombre.Count - 1 do
        begin
          PosAux := Pos('.', AuxNombre[Ciclo]);
          if PosAux <> 0 then
          begin
            Texto := MiPadr(Copy(AuxNombre[Ciclo], 1, PosAux - 1), 60, #32) +
              #32;
            Texto := Texto + MiPadr(Copy(AuxNombre[Ciclo], PosAux + 1,
              length(AuxNombre[Ciclo]) - (PosAux - 1)), 6, #32);
          end
          else
          begin
            Texto := MiPadr(AuxNombre[Ciclo], 60, #32) + #32#32#32#32#32#32#32;
          end;
          Texto := Texto + MiStrZero(Ciclo, 6, 0);
          Temporal.Add(Texto);
        end;
      end;

    ordExtencion:
      begin
        for Ciclo := 0 to AuxNombre.Count - 1 do
        begin
          PosAux := Pos('.', AuxNombre[Ciclo]);
          if PosAux <> 0 then
          begin
            Texto := MiPadr(Copy(AuxNombre[Ciclo], PosAux + 1,
              length(AuxNombre[Ciclo]) - (PosAux - 1)), 6, #32) + #32;
            Texto := Texto + MiPadr(Copy(AuxNombre[Ciclo], 1, PosAux - 1), 60,
              #32);
          end
          else
          begin
            Texto := #32#32#32#32#32#32#32 + MiPadr(AuxNombre[Ciclo], 60, #32);
          end;
          Texto := Texto + MiStrZero(Ciclo, 6, 0);
          Temporal.Add(Texto);
        end;
      end;

    ordFecha:
      begin
        for Ciclo := 0 to AuxNombre.Count - 1 do
        begin
          Texto := MiStrZero(StrToDateTime(AuxDate[Ciclo]), 67, 9);
          Texto := Texto + MiStrZero(Ciclo, 6, 0);
          Temporal.Add(Texto);
        end;
      end;

    ordTamano:
      begin
        for Ciclo := 0 to AuxNombre.Count - 1 do
        begin
          Texto := MiStrZero(StrToInt(AuxSize[Ciclo]), 67, 0);
          Texto := Texto + MiStrZero(Ciclo, 6, 0);
          Temporal.Add(Texto);
        end;
      end;

  end;

  if FClasificacion = ordDescendente then
  begin
    for Ciclo := Temporal.Count - 1 downto 0 do
    begin
      PosAux := StrToInt(Copy(Temporal[Ciclo], 68, 6));
      FListaArchivos.Add(AuxNombre[PosAux]);
      FSizeArchivos.Add(AuxSize[PosAux]);
      FDateArchivos.Add(AuxDate[PosAux]);
    end;
  end
  else
  begin
    for Ciclo := 0 to Temporal.Count - 1 do
    begin
      PosAux := StrToInt(Copy(Temporal[Ciclo], 68, 6));
      FListaArchivos.Add(AuxNombre[PosAux]);
      FSizeArchivos.Add(AuxSize[PosAux]);
      FDateArchivos.Add(AuxDate[PosAux]);
    end;
  end;

  AuxNombre.Free;
  AuxSize.Free;
  AuxDate.Free;
  Temporal.Free;

end;

constructor TProcArchivos.Create(AOwner: TComponent);
begin
  inherited;
  FNombreArchivo := '';
  FTamanoArchivo := 0;
  FFechaArchivo := 0;
  FListaArchivos := TStringList.Create;
  FSizeArchivos := TStringList.Create;
  FDateArchivos := TStringList.Create;
  FMascara := '*.*';
  FAtributos := [fatReadOnly, fatArchive, fatAnyFile];
end;

function TProcArchivos.ListaArchivos: TStrings;
begin
  Result := FListaArchivos;
end;


function TProcArchivos.PathConMascara: string;
begin

  Result := FPath;

  if Copy(Result, Length(Result), 1) <> '\' then
    Result := Result + '\';

  Result := Result + FMascara;

end;

function TProcArchivos.AtributosToInteger: Integer;
begin
  Result := 0;

  if fatReadOnly in FAtributos then
    Inc(Result, faReadOnly);

  if fatHidden in FAtributos then
    Inc(Result, faHidden);

  if fatSysFile in FAtributos then
    Inc(Result, faSysFile);

  if fatVolumeID in FAtributos then
    Inc(Result, faVolumeID);

  if fatDirectory in FAtributos then
    Inc(Result, faDirectory);

  if fatArchive in FAtributos then
    Inc(Result, faArchive);

  if fatAnyFile in FAtributos then
    Inc(Result, faAnyFile);

end;

function TProcArchivos.NombreArchivo: TFileName;
begin
  Result := FNombreArchivo;
end;

function TProcArchivos.FechaArchivo: TDateTime;
begin
  Result := FFechaArchivo;
end;

function TProcArchivos.TamanoArchivo: integer;
begin
  Result := FTamanoArchivo;
end;


function TProcArchivos.ComparaConMascara(source, pattern: string): Boolean;
var
  pSource: array[0..255] of Char;
  pPattern: array[0..255] of Char;

  function MatchPattern(element, pattern: PChar): Boolean;
  begin
    if (0 = StrComp(pattern, '*')) or (0 = StrComp(pattern, '*.*')) then
      Result := True
    else if (element^ = Chr(0)) and ((pattern^ <> Chr(0)) and (0 <>
      StrComp(pattern, '.*'))) then
      Result := False
    else if element^ = Chr(0) then
      Result := True
    else
    begin
      case pattern^ of
        '*': if MatchPattern(element, @pattern[1]) then
            Result := True
          else
            Result := MatchPattern(@element[1], pattern);
        '?': Result := MatchPattern(@element[1], @pattern[1]);
      else
        if element^ = pattern^ then
          Result := MatchPattern(@element[1], @pattern[1])
        else
          Result := False;
      end;
    end;
  end;

begin
  StrPCopy(pSource, source);
  StrPCopy(pPattern, pattern);
  Result := MatchPattern(pSource, pPattern);
end;

function TProcArchivos.ListaFechaArchivos: TStrings;
begin
  Result := FDateArchivos;
end;

function TProcArchivos.ListaSizeArchivos: TStrings;
begin
  Result := FSizeArchivos;
end;

end.

