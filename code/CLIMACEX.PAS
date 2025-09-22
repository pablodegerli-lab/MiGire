unit CliMacEx;

{$DEBUGINFO OFF}

interface

uses classes, CliCusEx, ListaID, db, Variants;

type

  TDecimalSeparator = (dsDefault, dsComma, dsPoint);

  TClipperMacroExpr = class(TClipperCustomExpr)
  private
    procedure ReqFunc(Sender: TObject; ident: string; var value: variant; var cancel: boolean);

  protected
    fNewRequestIdentifier: TRequestIdentifier;
    fNewRequestFunction: TRequestFunction;
    fDecimalSeparator: TDecimalSeparator;

    procedure SetNewRequestIdentifier(value: TRequestIdentifier);
    procedure SetNewRequestFunction(value: TRequestFunction);

    function fnAlltrim: Variant;
    function fnAsc: Variant;
    function fnAt: Variant;
    function fnChr: Variant;
    function fnCtoD: Variant;
    function fnDate: Variant;
    function fnTime: Variant;
    function fnDay: Variant;
    function fnMonth: Variant;
    function fnYear: Variant;
    function fnDtoC: Variant;
    function fnDtoS: Variant;
    function fnDow: Variant;
    function fnStoD: Variant;
    function fnCFtoD: Variant;
    function fnEmpty: Variant;
    function fnif: Variant;
    function fnLeft: Variant;
    function fnLen: Variant;
    function fnLower: Variant;
    function fnUpper: Variant;
    function fnPADC: Variant;
    function fnPADL: Variant;
    function fnPADR: Variant;
    function fnRight: Variant;
    function fnSpace: Variant;
    function fnStr: Variant;
    function fnStrTran: Variant;
    function fnStrZero: Variant;
    function fnSubStr: Variant;
    function fnVal: Variant;
    function fnLTrim: Variant;
    function fnMax: Variant;
    function fnMin: Variant;
    function fnRat: Variant;
    function fnReplicate: Variant;
    function fnRTrim: Variant;

  public
    IdentList: THalIdentList;
    FuncList: THalFuncList;

    constructor Create(AOwner: Tcomponent); override;
    destructor Destroy; override;

  published
    property Version;
{
  property OnRequestIdentifier : TRequestIdentifier read fNewRequestIdentifier
                       write SetNewRequestIdentifier;
  property OnRequestFunction : TRequestFunction read fNewRequestFunction
                       write SetNewRequestFunction;
  }
  //property OnRequestIdentifier;
    property OnAsignaValor;
    property DecimalSep: TDecimalSeparator read fDecimalSeparator
      write fDecimalSeparator;
    property SimplificaComilla;
  end;

procedure Register;

implementation

uses SysUtils;

constructor TClipperMacroExpr.Create(AOwner: Tcomponent);
begin
  inherited create(AOwner);
  fDecimalSeparator := dsPoint;

  IdentList := THalIdentList.Create;
  IdentList.EstimatedSize := 500;

  FuncList := THalFuncList.Create;
  FuncList.EstimatedSize := 500;
  FuncList.AddIdent('alltrim', fnAllTrim);
  FuncList.AddIdent('asc', fnAsc);
  FuncList.AddIdent('at', fnAt);
  FuncList.AddIdent('char', fnChr);
  FuncList.AddIdent('ctod', fnCtoD);
  FuncList.AddIdent('date', fnDate);
  FuncList.AddIdent('time', fnTime);
  FuncList.AddIdent('day', fnDay);
  FuncList.AddIdent('dow', fnDow);
  FuncList.AddIdent('month', fnMonth);
  FuncList.AddIdent('year', fnYear);
  FuncList.AddIdent('dtoc', fnDtoC);
  FuncList.AddIdent('dtos', fnDtoS);
  FuncList.AddIdent('stod', fnStoD);
  FuncList.AddIdent('cftod', fnCFtoD);
  FuncList.AddIdent('empty', fnEmpty);
  FuncList.AddIdent('if', fnif);
  FuncList.AddIdent('left', fnLeft);
  FuncList.AddIdent('len', fnLen);
  FuncList.AddIdent('lower', fnLower);
  FuncList.AddIdent('upper', fnUpper);
  FuncList.AddIdent('padc', fnpadc);
  FuncList.AddIdent('padl', fnpadl);
  FuncList.AddIdent('padr', fnpadr);
  FuncList.AddIdent('right', fnRight);
  FuncList.AddIdent('space', fnSpace);
  FuncList.AddIdent('str', fnStr);
  FuncList.AddIdent('strtran', fnStrTran);
  FuncList.AddIdent('strzero', fnStrZero);
  FuncList.AddIdent('substr', fnSubStr);
  FuncList.AddIdent('val', fnVal);
  FuncList.AddIdent('ltrim', fnLTrim);
  FuncList.AddIdent('max', fnMax);
  FuncList.AddIdent('min', fnMin);
  FuncList.AddIdent('Rat', fnRat);
  FuncList.AddIdent('Replicate', fnReplicate);
  FuncList.AddIdent('rtrim', fnRTrim);

  inherited OnRequestFunction := ReqFunc;

  fNewRequestIdentifier := nil;
  fNewRequestFunction := nil;
end;

destructor TClipperMacroExpr.Destroy;
begin
  inherited destroy;
  IdentList.free;
  FuncList.free;
end;

procedure TClipperMacroExpr.ReqFunc(Sender: TObject; ident: string; var value: variant; var cancel: boolean);
var
  Bucle: integer;
  posi: integer;
begin
  posi := FuncList.GetFuncPos(ident);
  try
    if posi >= 0 then
      value := FuncList.FuncArray[posi]
    else
    begin
      if @fNewRequestFunction = nil then
        cancel := true
      else
        fNewRequestFunction(sender, ident, value, cancel)
    end;

  finally
    for Bucle := 0 to 31 do
    begin
      ArgVal[Bucle] := '';
    end;
  end;

end;


// AllTrim

function TClipperMacroExpr.fnAlltrim: Variant;
begin
  if VarType(ArgVal[0]) = VarNull then
    result := ''
  else
    result := Trim(VarAsType(ArgVal[0], VarString))
end;

// Asc

function TClipperMacroExpr.fnAsc: Variant;
var
  param: string;
begin
  param := VarAsType(ArgVal[0], VarString);
  result := Ord(param[1]);
end;

// At

function TClipperMacroExpr.fnAt: Variant;
var
  SubStr, Str: string;
begin
  SubStr := VarAsType(ArgVal[0], VarString);
  Str := VarAsType(ArgVal[1], VarString);
  result := Pos(SubStr, Str)
end;

// Chr

function TClipperMacroExpr.fnChr: Variant;
var
  param: integer;
begin
  param := VarAsType(ArgVal[0], VarInteger);
  result := Char(param)
end;

// CToD

function TClipperMacroExpr.fnCtoD: Variant;
var
  param: string;
begin
  param := VarAsType(ArgVal[0], VarString);
  try
    result := StrToDate(param);
  except
    Result := -DateDelta;
  end;
end;

// Date

function TClipperMacroExpr.fnDate: Variant;
begin
  result := Date
end;

// Time

function TClipperMacroExpr.fnTime: Variant;
var
  tmp: string;
begin
  DateTimeToString(tmp, 'hh:nn:ss', Time);
  result := tmp;
end;

// Day

function TClipperMacroExpr.fnDay: Variant;
var
  param: TDateTime;
  y, m, d: word;
begin
  param := VarAsType(ArgVal[0], VarDate);
  DecodeDate(param, y, m, d);
  result := d
end;

// Dow - Día de la semana.

function TClipperMacroExpr.fnDow: Variant;
var
  param: TDateTime;
begin
  param := VarAsType(ArgVal[0], VarDate);
  result := DayOfWeek(param);
end;

// Month

function TClipperMacroExpr.fnMonth: Variant;
var
  param: TDateTime;
  y, m, d: word;
begin
  param := VarAsType(ArgVal[0], VarDate);
  DecodeDate(param, y, m, d);
  result := m
end;

// Year

function TClipperMacroExpr.fnYear: Variant;
var
  param: TDateTime;
  y, m, d: word;
begin
  param := VarAsType(ArgVal[0], VarDate);
  DecodeDate(param, y, m, d);
  result := y
end;

// DToC

function TClipperMacroExpr.fnDtoC: Variant;
var
  param: Tdatetime;
begin
  param := VarAsType(ArgVal[0], VarDate);
  result := DateToStr(param)
end;

// DToS

function TClipperMacroExpr.fnDtoS: Variant;
var
  param: Tdatetime;
begin
  param := VarAsType(ArgVal[0], VarDate);
  result := FormatDateTime('yyyymmdd', param);
end;

// SToD

function TClipperMacroExpr.fnStoD: Variant;
var
  param: string;
begin
  param := VarAsType(ArgVal[0], VarString);
  try
    result := EncodeDate(strtoint(Copy(Param, 1, 4)),
      strtoint(Copy(Param, 5, 2)),
      strtoint(Copy(Param, 7, 2)));
  except
    Result := -DateDelta;
  end;
end;

// CFToD

function TClipperMacroExpr.fnCFtoD: Variant;
var
  CadenaFecha, FormatoFecha: string;
  Validar: boolean;
  cAno, cMes, cDia: string;
  cOldForma: string;
  CadAux: string;
  x: integer;
  PosiOri: integer;
begin
  CadenaFecha := VarAsType(ArgVal[0], VarString);
  FormatoFecha := VarAsType(ArgVal[1], VarString);

  if VarType(ArgVal[2]) = varBoolean then
    Validar := VarAsType(ArgVal[2], VarBoolean)
  else
    Validar := True;

  Result := -DateDelta;
  CadAux := '';
  PosiOri := length(CadenaFecha);
  cOldForma := ShortDateFormat;
  if PosiOri < Length(FormatoFecha) then
  begin
    for x := length(FormatoFecha) downto 1 do
      if FormatoFecha[x] in ['Y', 'y', 'M', 'm', 'D', 'd'] then
        if CadenaFecha[PosiOri] in ['0'..'9'] then
        begin
          CadAux := CadenaFecha[PosiOri] + CadAux;
          Dec(PosiOri)
        end
        else
          CadAux := '0' + CadAux
      else
      begin
        CadAux := CadenaFecha[PosiOri] + CadAux;
        Dec(PosiOri)
      end;
  end
  else
    CadAux := CadenaFecha;
  try
    try
      for x := 1 to Length(FormatoFecha) do
      begin
        case FormatoFecha[x] of
          'Y', 'y': cAno := cAno + CadAux[x];
          'M', 'm': cMes := cMes + CadAux[x];
          'D', 'd': cDia := cDia + CadAux[x];
        end;
      end;
      ShortDateFormat := 'dd/mm/yyyy';
      Result := StrToDate(cDia + '/' + cMes + '/' + cAno);
    except
      if Validar then
        raise Exception.Create('Error en conversión de fecha.');
    end;
  finally
    ShortDateFormat := cOldForma;
  end;
end;

// Empty

function TClipperMacroExpr.fnEmpty: Variant;
var
  param: variant;
begin
  if VarType(ArgVal[0]) = VarNull then
    result := true
  else if VarType(ArgVal[0]) = VarString then
  begin
    param := VarAsType(ArgVal[0], VarString);
    result := Trim(param) = ''
  end
  else if VarType(ArgVal[0]) = VarInteger then
  begin
    param := VarAsType(ArgVal[0], VarInteger);
    result := param = 0
  end
  else if VarType(ArgVal[0]) = VarDouble then
  begin
    param := VarAsType(ArgVal[0], VarDouble);
    result := param = 0
  end
end;

// if

function TClipperMacroExpr.fnif: Variant;
var
  cond: Boolean;
begin
  cond := VarAsType(ArgVal[0], VarBoolean);
  if Cond then
    result := ArgVal[1]
  else
    result := ArgVal[2]
end;

// Left

function TClipperMacroExpr.fnLeft: Variant;
var
  param1: string;
  param2: integer;
begin
  param1 := VarAsType(ArgVal[0], VarString);
  param2 := VarAsType(ArgVal[1], VarInteger);
  result := Copy(param1, 1, param2)
end;

// Len

function TClipperMacroExpr.fnLen: Variant;
var
  param: string;
begin
  param := VarAsType(ArgVal[0], VarString);
  result := length(param)
end;

// Padc

function TClipperMacroExpr.fnPadc: Variant;
var
  param1: string;
  param2: Integer;
  param3: string;
  dif: integer;

begin
  param1 := VarAsType(ArgVal[0], VarString);
  param2 := VarAsType(ArgVal[1], VarInteger);
  if ArgCnt > 2 then
    param3 := VarAsType(ArgVal[2], VarString)
  else
    param3 := ' ';

  dif := param2 - length(param1);

  if odd(dif) then
    result := StringOfChar(param3[1], dif div 2 + 1) + param1 + StringOfChar(param3[1], dif div 2)
  else
    result := StringOfChar(param3[1], dif div 2) + param1 + StringOfChar(param3[1], dif div 2)

end;

// Padl

function TClipperMacroExpr.fnPadl: Variant;
var
  param1: string;
  param2: Integer;
  param3: string;
  dif: integer;
begin
  param1 := VarAsType(ArgVal[0], VarString);
  param2 := VarAsType(ArgVal[1], VarInteger);
  if ArgCnt > 2 then
    param3 := VarAsType(ArgVal[2], VarString)
  else
    param3 := ' ';

  dif := param2 - length(param1);
  result := Copy(StringOfChar(param3[1], dif) + param1, 1, param2)

end;

// Padr

function TClipperMacroExpr.fnPadr: Variant;
var
  param1: string;
  param2: Integer;
  param3: string;
  dif: integer;
begin
  param1 := VarAsType(ArgVal[0], VarString);
  param2 := VarAsType(ArgVal[1], VarInteger);
  if ArgCnt > 2 then
    param3 := VarAsType(ArgVal[2], VarString)
  else
    param3 := ' ';

  dif := param2 - length(param1);
  result := Copy(param1 + StringOfChar(param3[1], dif), 1, param2)

end;

// Lower

function TClipperMacroExpr.fnLower: Variant;
var
  param: string;
begin
  param := VarAsType(ArgVal[0], VarString);
  result := LowerCase(param);
end;

// Upper

function TClipperMacroExpr.fnUpper: Variant;
var
  param: string;
begin
  param := VarAsType(ArgVal[0], VarString);
  result := UpperCase(param);
end;

// Right

function TClipperMacroExpr.fnRight: Variant;
var
  param1: string;
  param2,
    l: integer;
begin
  param1 := VarAsType(ArgVal[0], VarString);
  param2 := VarAsType(ArgVal[1], VarInteger);
  l := length(param1);
  result := Copy(param1, l - param2 + 1, param2);
end;

// Space

function TClipperMacroExpr.fnSpace: Variant;
var
  param1: integer;
begin
  param1 := VarAsType(ArgVal[0], VarInteger);
  result := StringOfChar(' ', param1)
end;

// Str

function TClipperMacroExpr.fnStr: Variant;
var
  Numero: Double;
  Len, Dec: integer;
begin
  Numero := VarAsType(ArgVal[0], VarDouble);
  if ArgCnt > 1 then
    Len := VarAsType(ArgVal[1], VarInteger)
  else
    Len := 10;

  if ArgCnt > 2 then
    Dec := VarAsType(ArgVal[2], VarInteger)
  else
    Dec := 0;

  result := Format('%' + IntToStr(Len) + '.' + IntToStr(Dec) + 'f', [Numero])
end;

// StrTran

function TClipperMacroExpr.fnStrTran: Variant;
var
  param1, param2, param3: string;
begin
  param1 := VarAsType(ArgVal[0], VarString);
  param2 := VarAsType(ArgVal[1], VarString);
  param3 := VarAsType(ArgVal[2], VarString);
  result := StringReplace(param1, param2, param3, [rfReplaceAll]);
end;

// StrZero

function TClipperMacroExpr.fnStrZero: Variant;
var
  Numero: Double;
  Len, Dec: integer;
begin
  Numero := VarAsType(ArgVal[0], VarDouble);
  if ArgCnt > 1 then
    Len := VarAsType(ArgVal[1], VarInteger)
  else
    Len := 10;

  if ArgCnt > 2 then
    Dec := VarAsType(ArgVal[2], VarInteger)
  else
    Dec := 0;

  result := StringReplace(Format('%' + IntToStr(Len) + '.' + IntToStr(Dec) + 'f', [Numero]),
    ' ', '0', [rfReplaceAll])
end;

// SubStr

function TClipperMacroExpr.fnSubStr: Variant;
var
  Cadena: string;
  Pos, Cnt: integer;
begin
  Cadena := VarAsType(ArgVal[0], VarString);
  if ArgCnt > 1 then
    Pos := VarAsType(ArgVal[1], VarInteger)
  else
    Pos := 1;

  if ArgCnt > 2 then
    Cnt := VarAsType(ArgVal[2], VarInteger)
  else
    Cnt := 32000;

  result := Copy(Cadena, Pos, Cnt)
end;

// Val

function TClipperMacroExpr.fnVal: Variant;
var
  param, tmp: string;
  i: integer;
  TmpDecimalSeparator: Char;
begin
  param := Trim(VarAsType(ArgVal[0], VarString));
  TmpDecimalSeparator := DecimalSeparator;

  if DecimalSep = dsPoint then
    DecimalSeparator := '.'
  else if DecimalSep = dsComma then
    DecimalSeparator := ',';


  for i := 1 to length(param) do
    if param[i] in ['0'..'9', DecimalSeparator, 'e', 'E', '+', '-'] then
      tmp := tmp + param[i]
    else
      break;

  result := StrToFloat(tmp);

  DecimalSeparator := TmpDecimalSeparator
end;

// LTrim

function TClipperMacroExpr.fnLTrim: Variant;
var
  param: string;
begin
  param := VarAsType(ArgVal[0], VarString);
  result := TrimLeft(param);
end;

// Max

function TClipperMacroExpr.fnMax: Variant;
var
  param1, param2: double;
begin
  param1 := VarAsType(ArgVal[0], VarDouble);
  param2 := VarAsType(ArgVal[1], VarDouble);
  if param1 > param2 then
    result := param1
  else
    result := param2;
end;

// Min

function TClipperMacroExpr.fnMin: Variant;
var
  param1, param2: double;
begin
  param1 := VarAsType(ArgVal[0], VarDouble);
  param2 := VarAsType(ArgVal[1], VarDouble);
  if param1 < param2 then
    result := param1
  else
    result := param2;
end;

// Rat

function TClipperMacroExpr.fnRat: Variant;
var
  SubStr, Str, Cadena, SubCad: string;
  nSubStr, nStr, Bucle: integer;
begin
  SubStr := VarAsType(ArgVal[0], VarString);
  Str := VarAsType(ArgVal[1], VarString);
  if Pos(SubStr, Str) = 0 then
    result := 0
  else
  begin
    nSubStr := Length(SubStr);
    SubCad := SubStr;
    for Bucle := 1 to nSubStr do
    begin
      SubCad[nSubStr - (Bucle - 1)] := SubStr[Bucle];
    end;

    nStr := Length(Str);
    Cadena := Str;
    for Bucle := 1 to nStr do
    begin
      Cadena[nStr - (Bucle - 1)] := Str[Bucle];
    end;
    result := (nStr + 2) - (Pos(SubCad, Cadena) + nSubStr);
  end;
end;

// Replicate

function TClipperMacroExpr.fnReplicate: Variant;
var
  nX, Veces: integer;
  CadAux, Cadena: string;
begin
  CadAux := '';
  Cadena := VarAsType(ArgVal[0], VarString);
  Veces := VarAsType(ArgVal[1], VarInteger);
  for nX := 1 to Veces do
    CadAux := CadAux + Cadena;
  result := CadAux;
end;

// RTrim

function TClipperMacroExpr.fnRTrim: Variant;
var
  param: string;
begin
  param := VarAsType(ArgVal[0], VarString);
  result := TrimRight(param);
end;

procedure TClipperMacroExpr.SetNewRequestIdentifier(value: TRequestIdentifier);
begin
  fNewRequestIdentifier := value;
end;

procedure TClipperMacroExpr.SetNewRequestFunction(value: TRequestFunction);
begin
  fNewRequestFunction := value;
end;

procedure Register;
begin
  RegisterComponents('Clipper', [TClipperMacroExpr]);
end;

end.

