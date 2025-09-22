unit Define;


{$R 'SucesosWindows.RES'}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, shellapi, CommDlg, ComCtrls, Math,
  Db, DBTables, ADOdb, Printers, WinsPool, ComObj, Variants, Registry, IniFiles;

const
  A_INIFILE_MAIL = '.\Mail.ini';

type
  TTiempoEncendido = record
    Dias: integer;
    Horas: integer;
    Minutos: integer;
    Segundos: integer;
  end;

  TTipoDeSuceso = (tdsInformacion, tdsAdvertencia, tdsError);

procedure Pausa(Segundos: integer);
function Usuario: string;
function Contenido(cCad1, cCad2: string): Boolean;
function subStr(cCad: string; nPos, nCant: integer): string; overload;
function subStr(cCad: string; nPos: integer): string; overload;
function StrZero(Valor: Currency; Longitud: integer = 13; Decimales: integer = 2): string;
function StrTran(Cadena: string; Busqueda: string; Sustituir: string = ''): string;
function Replicate(Caracterer: string; Veces: integer): string;
function Padr(Cadena: string; Longitud: integer; Caracter: Char = #32): string;
function Padl(Cadena: string; Longitud: integer; Caracter: Char = #32): string;
function StrRight(Cadena: string; Longitud: integer): string;
function StrLeft(Cadena: string; Longitud: integer): string;
function WCopyFile(ArchivoFuente, ArchivoDestino: string; SobreEscribe: boolean = False; OcultaForm: boolean = False): integer;
function Busca_Path(Base: string): string;
function YaCorreApli(ActivaVentana: Boolean = True; Mensaje: Boolean = True): integer;
function IsValidDate(TextFecha: string; Separador: char = '/'; DigYear: integer = 4;
  Desde: string = '01/01/1990'; Hasta: string = '31/12/2100'): integer;
function MyTempFile(cPath: string = ''; cExt: string = ''; lPath: boolean = False): string;
function Envio_Mensa(aDestinos: array of string; cProposito: string; cMensaje: string;
  cPathCorreo: string = 'F:\PUBLIC\MENURED\'; cSistema: string = 'cProposito'): Boolean;
function CorreoGire(aDestinos: array of string; cProposito: string; cMensaje: string;
  aCCopia: array of string; cSistema: string; aArchivo: array of string; aGUID: String = ''; aLogFolder: String = ''): Boolean;
function CorreoGrupoGire(oConexion: TADOConnection; cGrupo, cMotivo, cMensaje,
  cSistema: string; aArchivos: array of string; aGUID: String = ''; aLogFolder: String = ''): boolean;
function Day(Fecha: TDate): Word;
function Month(Fecha: Tdate): Word;
function Year(Fecha: Tdate): Word;
function DateToString(Fecha: TDate): string;
function TiempoTrans(tHoraDesde, tHoraHasta: TTime): TTime;
function Iif(lExp: Boolean; xVerdadero, xFalso: string): string; overload;
function Iif(lExp: Boolean; xVerdadero, xFalso: Integer): Integer; overload;
function Iif(lExp: Boolean; xVerdadero, xFalso: Double): Double; overload;
function GetEnv(Variable: string): string;
function ValidarCuit(Cuit: string): Boolean;
function CryptNUMEROS(Cadena: string): string;
function CryptREDUNDANCY(Cadena: string): string;
function CryptTIME(Cadena: string): string;
function CryptDATE(Cadena: string): string;
function Cifrado(Cadena: string): string;
function FileToCrc16(NombreArchivo: string): integer;
function ExeExclusivoDOS(Fichero: string; Parametros: string = '';
  OcultaPantalla: boolean = False; PathUser: string = ''): Boolean;
function ComparaFloats(Valor1, Valor2: Double; Decimales: integer = 2): Boolean;
//procedure EjecutaYEspera(Ejecutable: string; Argumentos: string = '';
//  Accion: string = 'Abrir'; Visibilidad: integer = 1);
function EjecutaYEspera(Ejecutable: string; Argumentos: string = '';
  Accion: string = 'Abrir'; Visibilidad: integer = 1): HINST;
function Empty(Valor: Variant): Boolean;
function Rat(cBusqueda, cDestino: string): integer;
procedure KeyTab();
function DateLine: string;
procedure SendControlCode(S: string);
function CadenaEnFecha(cCadena, cFormato: string; lValidar: Boolean = True): TDate;
function LeoCadenaEnDbf(cBase: string; nRegistro, nCampo: integer): string;
procedure GraboCadenaEnDbf(cBase: string; nRegistro, nCampo: integer; cCadena: string);
function DateToJul(Fecha: TDate): integer;
procedure CopiarArchivo(Origen, Destino: string; FallaSiExiste: boolean = True);
procedure BorrarArchivo(Archivo: string);
procedure MoverArchivo(Origen, Destino: string; FallaSiExiste: boolean = True);
procedure CrearDirectorio(Directorio: string);
procedure BorrarDirectorio(const Directorio: TFileName; BorraSubDir: boolean = False);
function RegistrarArchivo(Conexion: TADOConnection; Archivo, Sistema: string): string;
function NumeroSemana(Fecha: TDate): integer;
function MmEnPxc(Milimetros: double): integer;
procedure AgregarDBF(Origen, Destino: string);
procedure AgregarTXT(Origen, Destino: string);
procedure VerificarUsoArchivo(const Archivo: string);
function SegundosEnTTime(Segundos: integer): TTime;
function DiaHabil(Conexion: TADOConnection; Fecha: TDate; Dias: integer = 0): TDate;
function BuscaGirePath(Conexion: TADOConnection; Sistema: integer; Codigo: string): string;
function TiempoEncendido(var Registro: TTiempoEncendido): string;
function RPos(SubCadena, Cadena: string): integer;
function PosDesde(const SubCadena, Cadena: string; Desde: Integer): Integer;
function TamanoArchivo(Archivo: string): DWord;
function RoundClipp(Numero: Extended; Decimales: Integer): Extended;
function GrabarSucesoWindows(TipoDeSuceso: TTipoDeSuceso; Suceso: integer; Mensaje: string; Aplicacion: string = ''): boolean;
procedure Log(Filename: String; Mensaje: String; E: Exception = nil);
function GetGUID: String;
//PLF-63
function LoadFileFolderFromIniFile(aIniFileName: String; aKey: String): String;

implementation

//uses FNetGire;

function TamanoArchivo(Archivo: string): DWord;
var
  FHandle: integer;
begin
  FHandle := FileOpen(Archivo, 0);
  try
    Result := getfilesize(FHandle, nil);
    if Result = $FFFFFFFF then
      raise Exception.Create(SysErrorMessage(GetLastError));
  finally
    FileClose(FHandle);
  end;
end;

procedure BorrarArchivo(Archivo: string);
begin
  if not DeleteFile(Archivo) then
    raise Exception.Create(SysErrorMessage(GetLastError));
end;

function Usuario: string;
var
  LocalName: string;
  BuffSize: dword;
begin
  buffSize := 10;
  Localname := '          ';
  WNetGetUser(PChar(''), PChar(LocalName), BuffSize);
  Result := LocalName;
end;

procedure Pausa(Segundos: integer);
begin
  Sleep(Segundos * 1000);
end;

function Contenido(cCad1, cCad2: string): Boolean;
begin
  if (strpos(Pchar(cCad2), Pchar(cCad1)) = nil) then
    result := false
  else
    result := true;
end;

function SubStr(cCad: string; nPos, nCant: integer): string;
begin
  result := copy(cCad, nPos, nCant);
end;

function subStr(cCad: string; nPos: integer): string;
begin
  result := copy(cCad, nPos, length(cCad) - (nPos - 1));
end;

function StrZero(Valor: Currency; Longitud: integer = 13; Decimales: integer = 2): string;
var
  Buffer: array[0..36] of char;
  Cadena, CadAux: string;
  x: integer;
  IsNegativo: boolean;
begin
  IsNegativo := False;
  for x := 0 to 36 do
    buffer[x] := #0;
  FloatToText(Buffer, Valor, fvCurrency, ffFixed, 0, Decimales);
  if Buffer[0] = '-' then
  begin
    Buffer[0] := '0';
    IsNegativo := True;
  end;
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
    if IsNegativo then
      Cadena[1] := '-';
  end;
  result := Cadena;
end;

function StrTran(Cadena, Busqueda, Sustituir: string): string;
var
  CadAux: string;
begin
  CadAux := '';
  while Pos(Busqueda, Cadena) > 0 do
  begin
    CadAux := CadAux + Copy(Cadena, 1, Pos(Busqueda, Cadena) - 1) + Sustituir;
    Cadena := Copy(Cadena, Pos(Busqueda, Cadena) + Length(Busqueda), Length(Cadena) + Length(Busqueda) - 1);
  end;
  CadAux := CadAux + Cadena;
  result := CadAux;
end;

function Replicate(Caracterer: string; Veces: integer): string;
var
  nX: integer;
  CadAux: string;
begin
  CadAux := '';
  for nX := 1 to Veces do
    CadAux := CadAux + Caracterer;
  result := CadAux;
end;

function Padr(Cadena: string; Longitud: integer; Caracter: Char): string;
var
  CadAux: string;
  nX, nCad: integer;
begin
  nCad := Length(Cadena);
  CadAux := '';
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

function Padl(Cadena: string; Longitud: integer; Caracter: Char): string;
var
  CadAux: string;
  nX, nCad: integer;
begin
  nCad := Length(Cadena);
  CadAux := '';
  if nCad < Longitud then
  begin
    for nX := 1 to Longitud - nCad do
      CadAux := CadAux + Caracter;
    CadAux := CadAux + Cadena;
  end
  else
    CadAux := Copy(Cadena, (nCad - Longitud + 1), Longitud);
  result := CadAux;
end;

function StrRight(Cadena: string; Longitud: integer): string;
begin
  result := Copy(Cadena, (Length(Cadena) - Longitud + 1), Longitud);
end;

function StrLeft(Cadena: string; Longitud: integer): string;
begin
  result := Copy(Cadena, 1, Longitud);
end;

function WCopyFile(ArchivoFuente, ArchivoDestino: string; SobreEscribe: boolean = False; OcultaForm: boolean = False): integer;
var
  Form: TForm;
  Prompt, prompt1: TLabel;
  Barra: TProgressBar;
  Pelicula: TAnimate;
  VentanaPre: HWnd;
  ScrFile, DestFile: file;
  RescRead: Integer;
  Buffer: array[1..2048] of Byte;
  LongArchi, Contador, Acumulador: integer;

begin
  if (not FileExists(ArchivoDestino)) or SobreEscribe then
  begin
    Acumulador := 0;
    Form := TForm.Create(Application);
    with Form do
    try
      Canvas.Font := Font;
      BorderStyle := bsDialog;
      FormStyle := fsStayOnTop;
      BorderIcons := [];
      Caption := 'Copiando...';
      Height := 150;
      Position := poScreenCenter;
      Pelicula := TAnimate.Create(Form);
      with Pelicula do
      begin
        Parent := Form;
        CommonAVI := aviCopyFile;
        Left := 5;
        Top := -10;
        Active := true;
      end;
      Prompt := TLabel.Create(Form);
      with Prompt do
      begin
        Parent := Form;
        AutoSize := True;
        Left := 10;
        Top := 55;
        Font.Style := [fsBold];
        Font.Name := 'Small Fonts';
        Font.Size := 6;
        Caption := UpperCase(ArchivoFuente);
      end;
      Prompt1 := TLabel.Create(Form);
      with Prompt1 do
      begin
        Parent := Form;
        AutoSize := True;
        Left := 10;
        Top := 70;
        Font.Style := [fsBold];
        Font.Name := 'Small Fonts';
        Font.Size := 6;
        Caption := 'EN ' + UpperCase(ArchivoDestino);
      end;
      Barra := TProgressBar.Create(Form);
      with Barra do
      begin
        Parent := Form;
        BorderWidth := 2;
        Left := 10;
        Top := 95;
      end;
      Barra.Width := Max(Pelicula.Width, Max(Prompt.Width, Prompt1.Width));
      Form.Width := Barra.Width + 30;
      VentanaPre := GetActiveWindow;
      if OcultaForm then
        ShowWindow(VentanaPre, SW_HIDE)
      else
        EnableWindow(VentanaPre, False);
      show;
      Form.Refresh;
      Form.Repaint;
      AssignFile(ScrFile, ArchivoFuente);
      try
        Contador := 0;
        Reset(ScrFile, 1);
        LongArchi := FileSize(ScrFile);
        Barra.Max := Round(LongArchi / 2048);
        AssignFile(DestFile, ArchivoDestino);
        Rewrite(DestFile, 1);
        BlockRead(ScrFile, Buffer, SizeOf(Buffer), RescRead);
        while RescRead > 0 do
        begin
          BlockWrite(DestFile, Buffer, RescRead);
          Acumulador := Acumulador + RescRead;
          Barra.Position := Contador;
          inc(Contador);
          BlockRead(ScrFile, Buffer, SizeOf(Buffer), RescRead);
        end;
      finally
        CloseFile(ScrFile);
        CloseFile(DestFile);
      end;
      if OcultaForm then
        ShowWindow(VentanaPre, SW_RESTORE)
      else
        EnableWindow(VentanaPre, True);
    except;
      Form.Free;
    end;
    Form.Close;
    Form.Free;
    result := Acumulador;
  end
  else
    result := -1;
end;

procedure KeyTab;
begin
  Keybd_event(9, 15, 0, 0);
  Keybd_event(9, 15, 2, 0);
end;

function Busca_Path(Base: string): string;
var
  TBases: TTable;
  TBasesDB_NAME: TStringField;
  TBasesDB_UBICA: TStringField;

begin
  if FileExists('DB_NAMES.DBF') then
  begin
    TBases := TTable.Create(Application);
    with TBases do
    try
      TableName := 'DB_NAMES.DBF';
      TBasesDB_NAME := TStringField.Create(TBases);
      with TBasesDB_NAME do
      begin
        FieldName := 'DB_NAME';
        Size := 8;
      end;
      TBasesDB_UBICA := TStringField.Create(TBases);
      with TBasesDB_UBICA do
      begin
        FieldName := 'DB_UBICA';
        Size := 60;
      end;
      TBases.Active := True;
      if TBases.Locate('DB_NAME', UpperCase(Base), []) then
        result := TBases.FieldByName('DB_UBICA').asstring
      else
        result := '';
      TBases.Active := False;
    finally
      TBases.Free
    end;
  end
  else
    Application.MessageBox('No existe DB_NAMES.DBF en el directorio corriente.',
      'Error - Función Busca_Path.', MB_OK);
end;

function YaCorreApli(ActivaVentana: Boolean; Mensaje: Boolean): integer;
var
  Modulo: TApplication;
  ventana: string;
begin
  Modulo := Application;
  ventana := Modulo.Title;
  Modulo.Title := '´¨´';
  result := FindWindow(nil, PChar(ventana));
  Modulo.Title := ventana;
  if ActivaVentana and (result <> 0) then
  begin
    if Mensaje then
      Modulo.MessageBox(PChar('"' + ventana + '" se está ejecutando en otra ventana.'),
        'Control de Aplicaciones', MB_ICONWARNING);
    BringWindowToTop(result);
    ShowWindow(result, SW_RESTORE);
    Modulo.Terminate;
  end;
end;

function IsValidDate(TextFecha: string; Separador: char;
  DigYear: integer; Desde, Hasta: string): integer;
const
  DiasPorMes: array[1..12] of integer =
  (31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
var
  nDia, nMes, nAno, nPosi1, nPosi2, nBucle: integer;
  cDia, cMes, cAno: string;
begin
  result := 0;
  for nBucle := 1 to Length(TextFecha) do
  begin
    if not (TextFecha[nBucle] in ['0'..'9', ' '])
      and (TextFecha[nBucle] <> Separador) then
      result := -1;
  end;
  nPosi1 := Pos(Separador, TextFecha);
  nPosi2 := Pos(Separador, Copy(TextFecha, nPosi1 + 1,
    Length(TextFecha) - nPosi1)) + nPosi1;
  if (nPosi1 <> 0) and (nPosi1 <> nPosi2) and
    (DigYear = (Length(TextFecha) - nPosi2)) then
  begin
    cDia := Copy(TextFecha, 1, nPosi1 - 1);
    nDia := Length(Trim(cDia));
    cMes := Copy(TextFecha, nPosi1 + 1, nPosi2 - nPosi1 - 1);
    nMes := Length(Trim(cMes));
    cAno := Copy(TextFecha, nPosi2 + 1, DigYear);
    nAno := Length(Trim(cAno));
    if (nDia <> 0) and (nMes <> 0) and (nAno <> 0) then
    begin
      nAno := StrToInt(Trim(cAno));
      if DigYear = 2 then
        nAno := nAno + 2000;
      nMes := StrToInt(Trim(cMes));
      nDia := StrToInt(Trim(cDia));
      if ((nMes > 12) or (nMes < 1)) or (nDia < 1) then
        result := -1;
      if (nMes = 2) and ((nAno mod 4 = 0) and
        ((nAno mod 100 <> 0) or (nAno mod 400 = 0))) then
        Dec(nDia);
      if nDia > DiasPorMes[nMes] then
        result := -1;
      if result = 0 then
        if (StrToDate(TextFecha) < StrToDate(Desde)) or
          (StrToDate(TextFecha) > StrToDate(Hasta)) then
          result := 1;
    end
    else
      result := -1;
  end
  else
    result := -1;
end;

function MyTempFile(cPath: string = ''; cExt: string = '';
  lPath: boolean = False): string;
var
  cRet: string;
  NomArchi: string;
  lSeguir: boolean;
  NewArchi: file;
  Contador: integer;
  MensajeError: string;
begin
  if Length(cPath) <> 0 then
    if Copy(cPath, Length(cPath) - 1, 1) <> '\' then
      cPath := cPath + '\';
  if Length(cExt) <> 0 then
    cExt := '.' + cExt;
  lSeguir := True;
  Contador := 0;
  MensajeError := '';
  while lSeguir do
  begin
    cRet := 'TMP' + Copy(FloatToStr(Time()), 3, 5) + cExt;
    NomArchi := cPath + cRet;
    if not FileExists(NomArchi) then
    begin
      try
        AssignFile(NewArchi, NomArchi);
        Rewrite(NewArchi, 1);
        CloseFile(NewArchi);
      except
        Inc(Contador);
        if Contador < 5 then
        begin
          MensajeError := MensajeError + SysErrorMessage(GetLastError) + #13#10;
          Sleep(100);
          Continue;
        end;
        MensajeError := MensajeError + SysErrorMessage(GetLastError);
        raise Exception.Create(MensajeError);
      end;
      lSeguir := False;
    end;
  end;
  if lPath then
    cRet := NomArchi;
  Result := cRet;
end;

function Envio_Mensa(aDestinos: array of string;
  cProposito: string; cMensaje: string;
  cPathCorreo: string; cSistema: string): Boolean;
var
  GwMail: TTable;
  GwMailDB_NAME: TStringField;
  GwMailDB_UBICA: TStringField;
  cPathCabecera: string;
  cPathMensaje: string;
  nDestinos, nI: integer;
  nTxt, nTxt1: TextFile;
  lSeguir: boolean;
  cNomCab: string;
  cNomMsg: string;
  cLinea: string;
begin
  if cSistema = 'cProposito' then
    cSistema := cProposito;
  if FileExists(cPathCorreo + 'DB_NAMES.DBF') then
  begin
    GwMail := TTable.Create(Application);
    with GwMail do
    try
      TableName := cPathCorreo + 'DB_NAMES.DBF';
      GwMailDB_NAME := TStringField.Create(GwMail);
      with GwMailDB_NAME do
      begin
        FieldName := 'DB_NAME';
        Size := 8;
      end;
      GwMailDB_UBICA := TStringField.Create(GwMail);
      with GwMailDB_UBICA do
      begin
        FieldName := 'DB_UBICA';
        Size := 60;
      end;
      GwMail.Active := True;
      if GwMail.Locate('DB_NAME', 'CABECERA', []) then
        cPathCabecera := GwMail.FieldByName('DB_UBICA').asstring
      else
      begin
        Application.MessageBox('Problema para ubicar directorio Cabeceras de Mails.',
          'Error - Función Envia_Mensa.', MB_OK);
        Result := False;
        GwMail.Active := False;
        Exit;
      end;
      if GwMail.Locate('DB_NAME', 'MENSAJE', []) then
        cPathMensaje := GwMail.FieldByName('DB_UBICA').asstring
      else
      begin
        Application.MessageBox('Problema para ubicar directorio Mensajes de Mails.',
          'Error - Función Envia_Mensa.', MB_OK);
        Result := False;
        GwMail.Active := False;
        Exit;
      end;
    finally
      GwMail.Free
    end;
  end
  else
    raise Exception.Create('Error - Función Envia_Mensa. No existe DB_NAMES.DBF en el directorio del Correo.');

  nDestinos := High(aDestinos);
  if nDestinos <> -1 then
  begin
    lSeguir := True;
    while lSeguir do
    begin
      cNomCab := MyTempFile(cPathCabecera);
      cNomMsg := cNomCab;
      if not FileExists(cPathCabecera + cNomCab + '.TXT') then
      begin
        AssignFile(nTxt, cPathCabecera + cNomCab + '.TXT');
        try
          Rewrite(nTxt);
        except
          raise Exception.Create(SysErrorMessage(GetLastError));
        end;
        lSeguir := False;
      end;
    end;
    try
      Writeln(nTxt, 'WPC-API=1.2;');
      Writeln(nTxt, 'MSG-TYPE=MAIL;');
      cLinea := 'TO=';
      for nI := 0 to High(aDestinos) do
      begin
        if nI = High(aDestinos) then
          cLinea := cLinea + aDestinos[nI]
        else
          cLinea := cLinea + aDestinos[nI] + ',';
      end;
      cLinea := cLinea + ';';
      Writeln(nTxt, cLinea);
      Writeln(nTxt, 'FROM-TEXT=' + Trim(cSistema) + ';');
      //Writeln( nTxt, 'FROM=GRPWISE;' );
      Writeln(nTxt, 'FROM=' + StringReplace(ExtractFileName(ParamStr(0)), '.', '-', [rfReplaceAll]) + ';');
      Writeln(nTxt, 'SUBJECT=' + Trim(cProposito) + ';');
      Writeln(nTxt, 'MSG-FILE=' + cNomMsg + '.TXT;');
      Writeln(nTxt, ';');
      Writeln(nTxt, '-END-');
    finally
      CloseFile(nTxt);
    end;

    AssignFile(nTxt1, cPathMensaje + cNomMsg + '.TXT');
    try
      Rewrite(nTxt1);
    except
      raise Exception.Create(SysErrorMessage(GetLastError));
    end;

    try
      Writeln(nTxt1, cMensaje);
    finally
      CloseFile(nTxt1);
    end;
    BorrarArchivo(cPathCabecera + cNomCab);
  end;
  Result := True;
end;

function Day(Fecha: TDate): Word;
var
  Year, Month, Day: Word;
begin
  DecodeDate(Fecha, Year, Month, Day);
  result := Day;
end;

function Month(Fecha: Tdate): Word;
var
  Year, Month, Day: Word;
begin
  DecodeDate(Fecha, Year, Month, Day);
  result := Month;
end;

function Year(Fecha: Tdate): Word;
var
  Year, Month, Day: Word;
begin
  DecodeDate(Fecha, Year, Month, Day);
  result := Year;
end;

function DateToString(Fecha: Tdate): string;
var
  Year, Month, Day: Word;
begin
  DecodeDate(Fecha, Year, Month, Day);
  result := IntToStr(Year) + StrZero(Month, 2, 0) + StrZero(Day, 2, 0);
end;

function TiempoTrans(tHoraDesde, tHoraHasta: TTime): TTime;
begin
  if tHoraDesde > tHoraHasta then
    result := (1 - tHoraDesde) + tHoraHasta
  else
    result := tHoraDesde - tHoraHasta;

  if result < 0 then
    result := (result * -1);
end;

function Iif(lExp: Boolean; xVerdadero, xFalso: string): string; overload;
begin
  if lExp then
    Result := xVerdadero
  else
    result := xFalso;
end;

function Iif(lExp: Boolean; xVerdadero, xFalso: Integer): Integer; overload;
begin
  if lExp then
    Result := xVerdadero
  else
    result := xFalso;
end;

function Iif(lExp: Boolean; xVerdadero, xFalso: Double): Double; overload;
begin
  if lExp then
    Result := xVerdadero
  else
    result := xFalso;
end;

function GetEnv(Variable: string): string;
var
  Env: PChar;
  PosEq: Integer;
  PosLi: Integer;
  Lista: TStringList;
  Lista2: TStringList;
begin
  Result := '';
  Lista := TStringList.Create;
  Lista2 := TStringList.Create;
  try
    Env := GetEnvironmentStrings;
    while Env^ <> #0 do
    begin
      PosEq := Pos('=', Env);
      Lista.Add(Copy(Env, 1, PosEq - 1));
      Lista2.Add(Copy(Env, PosEq + 1, Length(Env)));
      inc(Env, Length(Env) + 1);
    end;
    PosLi := Lista.IndexOf(Trim(Variable));
    if PosLi >= 0 then
      Result := Trim(Lista2[PosLi]);
  finally
    Lista.Destroy;
    Lista2.Destroy;
  end;
end;

function ValidarCuit(Cuit: string): Boolean;
var
  verif, i, factor: Integer;
begin
  verif := 0;
  factor := 2;

  for i := 10 downto 1 do
  begin
    if factor > 7 then
      factor := 2;
    verif := verif + StrToInt(copy(Cuit, i, 1)) * factor;
    factor := factor + 1;
  end;
  verif := 11 - verif mod 11;

  case verif of
    10: verif := 9;
    11: verif := 0;
  end;

  Result := (verif = StrToInt(copy(Cuit, 11, 1)))

end;

function CryptNUMEROS(Cadena: string): string;
const
  Alog: array[1..20] of integer = (106, 107, 166, 207, 110, 137, 206, 235, 203,
    153, 175, 104, 23, 80, 216, 189, 106, 185, 4, 146);
var
  Bucle: integer;
  CadAux: string;
begin
  CadAux := '';
  for Bucle := 1 to length(Cadena) do
    CadAux := CadAux + Chr(ord(Cadena[Bucle]) xor Alog[Bucle]);
  result := CadAux;
end;

function CryptREDUNDANCY(Cadena: string): string;
const
  Alog: array[1..20] of integer = (206, 28, 243, 57, 117, 39, 210, 27, 37, 68,
    99, 76, 219, 250, 63, 130, 67, 133, 83, 16);
var
  Bucle: integer;
  CadAux: string;
begin
  CadAux := '';
  for Bucle := 1 to length(Cadena) do
    CadAux := CadAux + Chr(ord(Cadena[Bucle]) xor Alog[Bucle]);
  result := CadAux;
end;

function CryptTIME(Cadena: string): string;
const
  Alog: array[1..10] of integer = (112, 145, 227, 174, 79, 18, 22, 151, 198, 149);
var
  Bucle: integer;
  CadAux: string;
begin
  CadAux := '';
  for Bucle := 1 to length(Cadena) do
    CadAux := CadAux + Chr(ord(Cadena[Bucle]) xor Alog[Bucle]);
  result := CadAux;
end;

function CryptDATE(Cadena: string): string;
const
  Alog: array[1..10] of integer = (169, 215, 38, 53, 66, 7, 37, 224, 250, 108);
var
  Bucle: integer;
  CadAux: string;
begin
  CadAux := '';
  for Bucle := 1 to length(Cadena) do
    CadAux := CadAux + Chr(ord(Cadena[Bucle]) xor Alog[Bucle]);
  result := CadAux;
end;

function Cifrado(Cadena: string): string;
var
  nLong: integer;
  Bucle: integer;
  CadAux: string;
  Caracter: integer;
begin
  CadAux := '';
  nLong := Length(Cadena);
  for Bucle := 1 to nLong do
  begin
    Caracter := Ord(Cadena[Bucle]);
    CadAux := CadAux + Chr(Caracter xor (Bucle mod 10));
  end;

  Result := CadAux;
end;

function FileToCrc16(NombreArchivo: string): integer;
var
  InputFile: file;
  LongLeida: Integer;
  Buffer: array[1..32768] of Byte;

  function Crc16(CrcAcumulado: integer; cCadena: array of Byte; nLong: integer): integer;
  var
    val: integer;
    i: integer;
    Tabla_256: array[0..255] of integer;
    temp: integer;
    bucle: integer;

  begin
    Result := CrcAcumulado;
    for val := 0 to 255 do
    begin
      temp := val;
      for i := 1 to 8 do
      begin
        if (temp and 1) <> 0 then
          temp := (temp shr 1) xor $A001
        else
          temp := (temp shr 1)
      end;
      Tabla_256[val] := temp;
    end;
    for bucle := 0 to nLong - 1 do
    begin
      Result := (Result shr 8) xor Tabla_256[(Result and $FF) xor Ord(cCadena[bucle])];
    end;
  end;

begin
  Result := 0;
  if FileExists(NombreArchivo) then
  begin
    Assign(InputFile, NombreArchivo);
    Reset(InputFile, 1);
    repeat
      BlockRead(InputFile, Buffer, 32768, LongLeida);
      Result := Crc16(Result, Buffer, LongLeida);
    until Eof(InputFile);
    Close(InputFile);
  end;
end;

function ExeExclusivoDOS(Fichero: string; Parametros: string = '';
  OcultaPantalla: boolean = False;
  PathUser: string = ''): Boolean;

  function WinExecAndWait32(FileName: string): integer;
  var
    zAppName: array[0..512] of char;
    zCurDir: array[0..255] of char;
    WorkDir: string;
    StartupInfo: TStartupInfo;
    ProcessInfo: TProcessInformation;
    Resultado, exitCode: DWord;
    kk: DWord;
  begin
    StrPCopy(zAppName, FileName);
    GetDir(0, WorkDir);
    StrPCopy(zCurDir, WorkDir);
    FillChar(StartupInfo, Sizeof(StartupInfo), #0);
    StartupInfo.cb := Sizeof(StartupInfo);

    StartupInfo.dwFlags := STARTF_USESHOWWINDOW;
    StartupInfo.wShowWindow := Sw_ShowNormal;
    CreateProcess(nil, zAppName, nil, nil, false, CREATE_NEW_CONSOLE or
      NORMAL_PRIORITY_CLASS, nil, nil, StartupInfo, ProcessInfo);
    repeat
      exitCode := WaitForSingleObject(ProcessInfo.hProcess, 1000);
      Application.ProcessMessages;
      GetExitCodeThread(ProcessInfo.hProcess, kk);

    until (exitCode <> WAIT_TIMEOUT);
    GetExitCodeProcess(ProcessInfo.hProcess, Resultado);
    MessageBeep(0);
    CloseHandle(ProcessInfo.hProcess);
    Result := Resultado;
  end;

var
  f: file;
  PathPif,
    DirTrabajo,
    DP: string;
  ErrorIO: integer;

begin
  DP :=
    #0#120#32#32#32#32#32#32#32#32#32#32#32#32#32#32#32#32#32#32#32#32#32#32 +
    #32#32#32#32#32#32#32#32#128#2#0#0#0#58#92#80#71#80#92#68#101#99#114#105 +
    #112#46#98#97#116#0#104#105#110#103#46#101#120#101#0#0#0#0#0#0#0#0#0#0#0 +
    #0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#16#0#0#58#92#80#71 +
    #80#92#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0 +
    #0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#101#99#105#51#50#48#49 +
    #46#112#103#112#0#58#92#42#46#42#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0 +
    #0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#1#0#255#25#80#0#0 +
    #7#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0 +
    #0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0 +
    #0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0 +
    #0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#77#73#67#82#79#83#79#70 +
    #84#32#80#73#70#69#88#0#135#1#0#0#113#1#87#73#78#68#79#87#83#32#51#56#54 +
    #32#51#46#48#0#5#2#157#1#104#0#128#2#0#0#100#0#50#0#255#255#0#0#255#255 +
    #0#0#234#15#0#0#159#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#101#99#105#51 +
    #50#48#49#46#112#103#112#0#58#92#42#46#42#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0 +
    #0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#87#73#78 +
    #68#79#87#83#32#86#77#77#32#52#46#48#0#255#255#27#2#172#1#0#0#0#0#0#0#0 +
    #0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0 +
    #0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0 +
    #0#0#0#0#0#0#0#0#0#80#73#70#77#71#82#46#68#76#76#0#0#0#0#0#0#0#0#0#0#0#0 +
    #0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0 +
    #0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#34#0#0#0#0#0#0#0#0#0#0 +
    #0#0#0#129#1#0#0#0#0#0#0#0#0#0#0#224#15#0#0#5#0#25#0#3#0#200#0#232#3#2#0 +
    #10#0#1#0#0#0#0#0#0#0#28#0#0#0#0#0#0#0#8#0#12#0#84#101#114#109#105#110#97 +
    #108#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#76#117#99#105#100#97 +
    #32#67#111#110#115#111#108#101#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#3 +
    #0#0#0#80#0#25#0#128#2#44#1#0#0#0#0#22#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0 +
    #0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0 +
    #0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0 +
    #0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#1#0;

  if OcultaPantalla then
  begin
    DP[432] := #16;
    DP[848] := #75;
  end;

  Fichero := copy(Fichero, 1, 63) + #0;
  move(Fichero[1], DP[$24 + 1], length(Fichero));

  Parametros := copy(Parametros, 1, 63) + #0;
  move(Parametros[1], DP[$A5 + 1], length(Parametros));
  move(Parametros[1], DP[$1C5 + 1], length(Parametros));

  if PathUser = '' then
    DirTrabajo := Copy(extractfilepath(Fichero), 1, 63) + #0
  else
    DirTrabajo := Copy(PathUser, 1, 63) + #0;

  move(DirTrabajo[1], DP[$65 + 1], length(DirTrabajo));

  Result := false;
  PathPif := 'C:\GirePif.pif';
  assignfile(f, PathPif);
  rewrite(f, 1);
  ErrorIO := ioresult;
  blockwrite(f, DP[1], length(DP), ErrorIO);
  closefile(f);
  if ErrorIO <> length(DP) then
    exit;

  Result := (WinExecAndWait32(PathPif) = 0);

  DeleteFile(PathPif);

end;

function ComparaFloats(Valor1, Valor2: Double; Decimales: integer = 2): Boolean;
begin
  Result := FloatToStrF(Valor1, ffNumber, 15, Decimales) =
    FloatToStrF(Valor2, ffNumber, 15, Decimales)
end;

//procedure EjecutaYEspera(Ejecutable, Argumentos, Accion: string; Visibilidad: integer);
function EjecutaYEspera(Ejecutable, Argumentos, Accion: string; Visibilidad: integer): HINST;
var
  Info: TShellExecuteInfo;
  pInfo: PShellExecuteInfo;
  exitCode: DWord;
  //HINST
begin
  pInfo := @Info;
  with Info do
  begin
    cbSize := SizeOf(Info);
    fMask := SEE_MASK_NOCLOSEPROCESS;
    wnd := Application.Handle;
    if UpperCase(Accion) = 'ABRIR' then
      lpVerb := PChar('Open')
    else if UpperCase(Accion) = 'IMPRIMIR' then
      lpVerb := PChar('Print')
    else
      lpVerb := PChar(Accion);
    lpFile := PChar(Ejecutable);
    lpParameters := Pchar(Argumentos + #0);
    lpDirectory := nil;
    nShow := Visibilidad;
    hInstApp := 0;
  end;
  ShellExecuteEx(pInfo);
  repeat
    exitCode := WaitForSingleObject(Info.hProcess, 500);
    Application.ProcessMessages;
  until (exitCode <> WAIT_TIMEOUT);
  Result := pInfo.hInstApp;
end;

function Empty(Valor: Variant): Boolean;
var
  param: variant;
begin
  result := False;
  if VarType(Valor) = VarNull then
    result := true
  else if VarType(Valor) = varEmpty then
    result := true
  else if VarType(Valor) = VarString then
  begin
    param := VarAsType(Valor, VarString);
    result := Trim(param) = ''
  end
  else if VarType(Valor) = VarInteger then
  begin
    param := VarAsType(Valor, VarInteger);
    result := param = 0
  end
  else if VarType(Valor) = VarDouble then
  begin
    param := VarAsType(Valor, VarDouble);
    result := param = 0
  end
end;

function CorreoGire(aDestinos: array of string; cProposito: string;
  cMensaje: string; aCCopia: array of string;
  cSistema: string; aArchivo: array of string; aGUID: String = ''; aLogFolder: String = ''): Boolean;
var
  cPathCabecera: string;
  cPathMensaje: string;
  cPathAttach: string;
  nDestinos: integer;
  nPos, nI: integer;
  nTxt, nTxt1: TextFile;
  lSeguir: boolean;
  cNomCab: string;
  cNomMsg: string;
  cNomAtt: string;
  cLinea: string;
  nFileMan: file of byte;

  aLogFile: String;
  aOwnedGuid: TGUID;
  aFolder: String;
begin
  cPathCabecera := 'V:\API\API_IN\';
  cPathMensaje := 'V:\API\ATT_IN\';
  cPathAttach := 'V:\API\ATT_IN\';
  //PLF-63
  if(aLogFolder <> '')then
  begin
    if not(aLogFolder[Length(aLogFolder)] = '\')then
      aLogFolder := aLogFolder + '\';

    if not(DirectoryExists(aLogFolder))then
      ForceDirectories(aLogFolder);

    if(aGUID <> '')then
        aLogFile := aLogFolder + aGUID + FormatDateTime('ddmmyyyy', Now) + '.txt'
    else
    begin
      OleCheck(CreateGUID(aOwnedGuid));
      aLogFile := aLogFolder + GUIDToString(aOwnedGuid) + FormatDateTime('ddmmyyyy', Now) + '.txt';
    end;
  end;

  Log(aLogFile, 'CorreoGire - INICIO');
  Log(aLogFile, 'CorreoGire - cPathCabecera := ' + cPathCabecera);
  Log(aLogFile, 'CorreoGire - cPathMensaje := ' + cPathMensaje);
  Log(aLogFile, 'CorreoGire - cPathAttach := ' + cPathAttach);
  try
    nDestinos := High(aDestinos);
    Log(aLogFile, 'CorreoGire - nDestinos := ' + IntToStr(nDestinos));

    if nDestinos = -1 then
    begin
      Log(aLogFile, 'CorreoGire - nDestinos = -1', Exception.Create('Función "CorreoGire" - El destino no puede estar vacío.'));
      raise Exception.Create('Función "CorreoGire" - El destino no puede estar vacío.');
    end;

    lSeguir := True;
    Log(aLogFile, 'CorreoGire - while lSeguir do');
    while lSeguir do
    begin
      cNomCab := MyTempFile(cPathCabecera);
      cNomMsg := cNomCab;
      if (not FileExists(cPathCabecera + cNomCab + '.TXT')) and
        (not FileExists(cPathMensaje + cNomMsg + '.TXT')) then
      begin
        Log(aLogFile, 'CorreoGire - AssignFile(nTxt, ' + cPathCabecera + cNomCab + '.TXT'')');
        AssignFile(nTxt, cPathCabecera + cNomCab + '.TXT');
        Rewrite(nTxt);
        Log(aLogFile, 'CorreoGire - AssignFile(nTxt1, ' + cPathCabecera + cNomCab + '.TXT'')');
        AssignFile(nTxt1, cPathMensaje + cNomMsg + '.TXT');
        Rewrite(nTxt1);
        lSeguir := False;
      end
      else
      begin
        Log(aLogFile, 'CorreoGire - DeleteFile('+cPathCabecera + cNomCab+')');
        DeleteFile(cPathCabecera + cNomCab);
      end;
    end;
    Log(aLogFile, 'CorreoGire -   Writeln(nTxt, ''WPC-API=1.2;'')');
    Writeln(nTxt, 'WPC-API=1.2;');
    Log(aLogFile, 'CorreoGire -   Writeln(nTxt, ''MSG-TYPE=MAIL;'')');
    Writeln(nTxt, 'MSG-TYPE=MAIL;');
    cLinea := 'TO=';
    for nI := 0 to nDestinos do
    begin
      if Pos('@', aDestinos[nI]) <> 0 then
        cLinea := cLinea + 'GWGIRE.GWIA("' + aDestinos[nI] + '")'
      else
        cLinea := cLinea + aDestinos[nI];
      if nI = nDestinos then
        cLinea := cLinea + ';'
      else
        cLinea := cLinea + ',';
    end;
    Log(aLogFile, 'CorreoGire - Writeln(nTxt, ' + cLinea + ')');
    Writeln(nTxt, cLinea);

    Log(aLogFile, 'CorreoGire - if (High(aCCopia) <> -1) and (Trim(aCCopia[0]) <> '''') then');
    if (High(aCCopia) <> -1) and (Trim(aCCopia[0]) <> '') then
    begin
      cLinea := 'TO-CC=';
      for nI := 0 to High(aCCopia) do
      begin
        if Pos('@', aCCopia[nI]) <> 0 then
          cLinea := cLinea + 'GWGIRE.GWIA("' + aCCopia[nI] + '")'
        else
          cLinea := cLinea + aCCopia[nI];
        if nI = High(aCCopia) then
          cLinea := cLinea + ';'
        else
          cLinea := cLinea + ',';
      end;

      Writeln(nTxt, cLinea);
    end;

    Writeln(nTxt, 'FROM-TEXT=' + Trim(cSistema) + ';');
    //Writeln( nTxt, 'FROM=GRPWISE;' );
    Writeln(nTxt, 'FROM=' + StringReplace(ExtractFileName(ParamStr(0)), '.', '-', [rfReplaceAll]) + ';');
    Writeln(nTxt, 'SUBJECT=' + Trim(cProposito) + ';');
    Writeln(nTxt, 'MSG-FILE=' + cNomMsg + '.TXT;');

    Log(aLogFile, 'CorreoGire - if (High(aArchivo) <> -1) and (Trim(aArchivo[0]) <> '''') then');
    if (High(aArchivo) <> -1) and (Trim(aArchivo[0]) <> '') then
    begin
      Writeln(nTxt, 'ATTACH-FILE=');
      for nI := 0 to High(aArchivo) do
      begin

        lSeguir := True;

        while lSeguir do
        begin
          Log(aLogFile, 'CorreoGire - cNOmAtt := MyTempFile('+cPathAttach+')');
          cNOmAtt := MyTempFile(cPathAttach);

          Log(aLogFile, 'CorreoGire - if not FileExists('+cPathAttach + cNomAtt + '.ATH) then');
          if not FileExists(cPathAttach + cNomAtt + '.ATH') then
            lSeguir := False
          else
          begin
            Log(aLogFile, 'CorreoGire - DeleteFile('+cPathAttach + cNomAtt+')');
            DeleteFile(cPathAttach + cNomAtt);
          end;
        end;

        Writeln(nTxt, '  current-file=' + cNomAtt + '.ATH;');
        AssignFile(nFileMan, aArchivo[nI]);
        Reset(nFileMan);
        Writeln(nTxt, '  size=' + IntToStr(FileSize(nFileMan)) + ';');
        CloseFile(nFileMan);
        cLinea := '  original-file=';
        nPos := Rat('\', aArchivo[nI]);
        cLinea := cLinea + SubStr(aArchivo[nI], nPos + 1) + ';';
        Writeln(nTxt, cLinea);

        if nI = High(aArchivo) then
          cLinea := '  date=' + DateToStr(Date) + ' ' + TimeToStr(Time) + ';'
        else
          cLinea := '  date=' + DateToStr(Date) + ' ' + TimeToStr(Time) + ';,';

        Writeln(nTxt, cLinea);

        Log(aLogFile, 'CorreoGire - CopyFile(PChar(aArchivo[nI]), PChar(' + cPathAttach + cNomAtt + '.ATH), False)');
        CopyFile(PChar(aArchivo[nI]), PChar(cPathAttach + cNomAtt + '.ATH'), False);

        Log(aLogFile, 'CorreoGire - DeleteFile('+cPathAttach + cNomAtt+')');
        DeleteFile(cPathAttach + cNomAtt);

      end;

    end;
    Log(aLogFile, 'CorreoGire - Writeln(nTxt, ''-END-'')');
    Writeln(nTxt, '-END-');

    Log(aLogFile, 'CorreoGire - Writeln(nTxt1, ' + cMensaje +')');
    Writeln(nTxt1, cMensaje);

    CloseFile(nTxt);
    CloseFile(nTxt1);

    Log(aLogFile, 'CorreoGire - DeleteFile('+cPathCabecera + cNomCab+')');
    DeleteFile(cPathCabecera + cNomCab);
    Log(aLogFile, 'CorreoGire - FIN');
    Result := True;
  except
    on E: Exception do
    begin
      Log(aLogFile, 'CorreoGire - Exception', E);
      Abort;
    end;
  end;
end;

{  Esta es la que se utilizaría con el MAPI del GroupWise.
function CorreoGire(aDestinos: array of string; cProposito: string;
  cMensaje: string; aCCopia: array of string;
  cSistema: string; aArchivo: array of string): Boolean;
var
  nDestinos: integer;
  vGroupWise: Variant;
  vCuentaGW: Variant;
  vCorreoGW: Variant;
  x: integer;
  NoEncontrados: TStringList;
  NoAttachados: TStringList;
  cMensajeAux: string;
  AvisoError: boolean;
begin

  nDestinos := High(aDestinos);

  if nDestinos = -1 then
    raise Exception.Create('Funcion "CorreoGire" - El destino no puede estar vacío.');

  AvisoError := False;

  try
    vGroupWise := CreateOleObject('NovellGroupWareSession');
    vCuentaGW := vGroupWise.MultiLogin('MAILAUTO', '/pwd=MAILAUTO');
  except
    vGroupWise := null;
    raise Exception.Create('Problemas al conectar con el cliente para el envio de correo.')
  end;

  vCorreoGW := vCuentaGW.MailBox.Messages.add('GW.MESSAGE.MAIL', 4);

  NoEncontrados := TStringList.Create;
  NoAttachados := TStringList.Create;
  try

    for x := 0 to nDestinos do
    begin
      vCorreoGW.Recipients.add(Trim(aDestinos[x]), '', 0);
      try
        vCorreoGW.Recipients.resolve;
      except
        NoEncontrados.Add(Trim(aDestinos[x]));
        vCorreoGW.Recipients.Item(vCorreoGW.Recipients.Count).Delete
      end;
    end;

    if (High(aCCopia) <> -1) and (Trim(aCCopia[0]) <> '') then
    begin
      for x := 0 to High(aCCopia) do
      begin
        vCorreoGW.Recipients.add(Trim(aCCopia[x]), '', Integer(vCorreoGW.Recipients.Count <> 0));
        try
          vCorreoGW.Recipients.resolve;
        except
          NoEncontrados.Add(Trim(aCCopia[x]));
          vCorreoGW.Recipients.Item(vCorreoGW.Recipients.Count).Delete
        end;
      end;
    end;

    if vCorreoGW.Recipients.Count = 0 then
    begin
      vCorreoGW.Recipients.add('MAILAUTO', '', 0);
      vCorreoGW.Recipients.resolve;
      cSistema := 'ERROR - ' + Trim(cSistema);
      cMensajeAux := 'Este corro no fue enviado...' + #13#10
        + 'No se pudo resolver la casilla de correo de ';
      if NoEncontrados.Count > 1 then
        cMensajeAux := cMensajeAux + 'los siguientes destinatarios:' + #13#10;
      cMensajeAux := cMensajeAux + NoEncontrados.Text + #13#10
        + '>>> CORREO AUTOMATICO GIRE <<<';
      cMensaje := cMensajeAux + #13#10 + cMensaje;
      AvisoError := True;
    end;

    if (High(aArchivo) <> -1) and (Trim(aArchivo[0]) <> '') then
      for x := 0 to High(aArchivo) do
        if FileExists(Trim(aArchivo[x])) then
          vCorreoGW.Attachments.Add(Trim(aArchivo[x]))
        else
          NoAttachados.Add(Trim(aArchivo[x]));

    if NoAttachados.Count <> 0 then
    begin
      if not AvisoError then
      begin
        vCorreoGW.Recipients.add('MAILAUTO', '', 2);
        vCorreoGW.Recipients.resolve;
      end;
      if NoAttachados.Count = 1 then
        cMensajeAux := 'No se pudo adjuntar el archivo: '
      else
        cMensajeAux := 'No se pudieron adjuntar los archivos:' + #13#10;
      cMensajeAux := cMensajeAux + NoAttachados.Text;
      cMensaje := cMensaje + #13#10 + cMensajeAux;
    end;

    vCorreoGW.Subject := Trim(cSistema) + ' - ' + Trim(cProposito);
    vCorreoGW.BodyText := cMensaje;
    vCorreoGW.Send;

    if (NoEncontrados.Count <> 0) and (not AvisoError) then
    begin
      vCorreoGW := vCuentaGW.MailBox.Messages.add('GW.MESSAGE.MAIL', 4);
      vCorreoGW.Recipients.add('MAILAUTO', '', 0);
      vCorreoGW.Recipients.resolve;
      vCorreoGW.Subject := 'ERROR - ' + Trim(cSistema) + ' - ' + Trim(cProposito);

      cMensajeAux := 'No se pudo resolver la casilla de correo de ';
      if NoEncontrados.Count > 1 then
        cMensajeAux := cMensajeAux + 'los siguientes destinatarios:' + #13#10;
      cMensajeAux := cMensajeAux + NoEncontrados.Text;

      if (High(aArchivo) <> -1) and (Trim(aArchivo[0]) <> '') then
      begin
        cMensajeAux := cMensajeAux + #13#10 + 'Adjuntos:' + #13#10;
        for x := 0 to High(aArchivo) do
          cMensajeAux := cMensajeAux + aArchivo[x] + #13#10;
      end;

      cMensajeAux := cMensajeAux + #13#10 + '>>> CORREO AUTOMATICO GIRE <<<';
      cMensaje := cMensajeAux + #13#10 + cMensaje;
      vCorreoGW.BodyText := cMensaje;
      vCorreoGW.Send;
    end;

    vCorreoGW := null;
    vGroupWise := null;
    vCuentaGW := null;

  finally
    NoAttachados.Free;
    NoEncontrados.Free;
  end;

  Result := True;
end;
}

{  Esta es la que se utilizaría con el MAPI del GroupWise.
function Envio_Mensa(aDestinos: array of string;
  cProposito: string; cMensaje: string;
  cPathCorreo: string; cSistema: string): Boolean;
begin
  Result := CorreoGire(aDestinos, cProposito, cMensaje, [''], cSistema, ['']);
end;
}

function Rat(cBusqueda, cDestino: string): integer;
var
  SubStr, Str, Cadena, SubCad: string;
  nSubStr, nStr, Bucle: integer;
begin
  SubStr := cBusqueda;
  Str := cDestino;
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

function CorreoGrupoGire(oConexion: TADOConnection; cGrupo, cMotivo, cMensaje,
  cSistema: string; aArchivos: array of string;
  aGUID: String = ''; aLogFolder: String = ''): boolean;
type
  TVarMensa = array of string;
  function ConvierteArrary(aMatriz: Variant): TVarMensa;
  begin
    if Empty(aMatriz) then
      Result := nil
    else
      Result := aMatriz;
  end;
var
  MiQuery: TADOQuery;
  aTitular: Variant;
  aCopias: Variant;
  nContar1: integer;
  nContar2: integer;

  aLogFile: String;
  aOwnedGuid: TGUID;
 begin
  ///PLF-63
  if(aLogFolder <> '')then
  begin
    if not(aLogFolder[Length(aLogFolder)] = '\')then
      aLogFolder := aLogFolder + '\';

    if not(DirectoryExists(aLogFolder))then
      ForceDirectories(aLogFolder);

    if(aGUID <> '')then
      aLogFile := aLogFolder + aGuid + FormatDateTime('ddmmyyyy', Now) + '.txt'
    else
    begin
      OleCheck(CreateGUID(aOwnedGuid));
      aLogFile := aLogFolder + 'Mail_' + GUIDToString(aOwnedGuid) + FormatDateTime('ddmmyyyy', Now) + '.txt';
    end;
  end;
  Log(aLogFile, 'CorreoGrupoGire - cGrupo= ' + cGrupo +' cSistema='+cSistema);
  result := True;
  if Length(Trim(cGrupo)) = 0 then
    cGrupo := 'DEFAULT';
  cSistema := cSistema + ' (' + GetEnv('NOMBRE') + ')';

  Log(aLogFile, 'CorreoGrupoGire - cGrupo= ' + cGrupo +' cSistema='+cSistema);
  MiQuery := TADOQuery.Create(Application);
  try
    MiQuery.Connection := oConexion;
    MiQuery.SQL.Text := 'Select * From GIRE.RECIBE_MAILS Where GRUPO = '
      + '''' + UpperCase(cGrupo) + ''''
      + ' and USUARIO_DELETE is null';

    Log(aLogFile, 'CorreoGrupoGire - MiQuery.SQL.Text := ' + MiQuery.SQL.text);

    try
      Log(aLogFile, 'CorreoGrupoGire - MiQuery.Open');
      MiQuery.Open;
      Log(aLogFile, 'CorreoGrupoGire - MiQuery.RecordCount = '+ IntToStr(MiQuery.RecordCount));
      if MiQuery.RecordCount = 0 then
      begin
        MiQuery.Close;
        MiQuery.SQL.Clear;
        MiQuery.SQL.Text := 'Select * From GIRE.RECIBE_MAILS Where GRUPO = '
          + '''' + 'DEFAULT' + '''';
        Log(aLogFile, 'CorreoGrupoGire - RecordCount=0 MiQuery.sql.text = '+ MiQuery.sql.text);
        MiQuery.Open;
        if MiQuery.RecordCount = 0 then
        begin
          Log(aLogFile, 'CorreoGrupoGire -  if MiQuery.RecordCount = 0 then',Exception.create('visar a sistemas que '
            + 'no existe el grupo "DEFAULT" para los correos.'));
          MessageBox(Application.Handle, PChar('Avisar a sistemas que '
            + 'no existe el grupo "DEFAULT" para los correos.'),
            PChar('Atención'), 48);
          raise Exception.Create('');
        end;
      end;
      MiQuery.First;
      nContar1 := 0;
      nContar2 := 0;
      Log(aLogFile, 'CorreoGrupoGire - while not MiQuery.Eof do');
      while not MiQuery.Eof do
      begin
        Log(aLogFile, 'CorreoGrupoGire - if MiQuery.FieldByName(''TITULAR'').Value <> 0 then');
        if MiQuery.FieldByName('TITULAR').Value <> 0 then
        begin
          if nContar1 = 0 then
            aTitular := VarArrayCreate([0, 0], varVAriant)
          else
            VarArrayRedim(aTitular, nContar1);
          Log(aLogFile, 'CorreoGrupoGire - aTitular[nContar1] := ' + MiQuery.FieldByName('USUARIO_ENVIO').Value);
          aTitular[nContar1] := MiQuery.FieldByName('USUARIO_ENVIO').Value;
          Inc(nContar1);
        end
        else
        begin
          if nContar2 = 0 then
            aCopias := VarArrayCreate([0, 0], varVAriant)
          else
            VarArrayRedim(aCopias, nContar2);
          aCopias[nContar2] := MiQuery.FieldByName('USUARIO_ENVIO').Value;
          Inc(nContar2);
        end;
        MiQuery.Next;
      end;

      if Empty(aTitular) then
      begin
        aTitular := aCopias;
        aCopias := null;
      end;
      if Empty(aCopias) then
      begin
        aCopias := VarArrayCreate([0, 0], varVAriant);
        aCopias[0] := '';
      end;
      MiQuery.Close;
      Log(aLogFile, 'CorreoGrupoGire - CorreoGire(ConvierteArrary(aTitular), '+cMotivo+', '+cMensaje+',ConvierteArrary(aCopias), '+cSistema+', aArchivos)');
      CorreoGire(ConvierteArrary(aTitular), cMotivo, cMensaje, ConvierteArrary(aCopias), cSistema, aArchivos, aGUID, aLogFolder);
    except
      on E: Exception do
      begin
        Log(aLogFile, 'CorreoGrupoGire - Exception', E);
        result := False;
      end;
    end;
  finally
    MiQuery.Free;
  end;
end;

function DateLine: string;
var
  DatosArchivo: TSearchRec;
  FechaArchivo: string;
  FechaActual: string;
  HoraArchivo: string;
  HoraActual: string;
  SetFecha: string;
  SetHora: string;
begin
  SetFecha := ShortDateFormat;
  ShortDateFormat := 'dd/mm/yyyy';
  SetHora := LongTimeFormat;
  LongTimeFormat := 'HH:mm:ss';
  FindFirst(ParamStr(0), faAnyFile, DatosArchivo);
  FechaArchivo := DateToStr(FileDateToDateTime(DatosArchivo.Time));
  HoraArchivo := TimeToStr(FileDateToDateTime(DatosArchivo.Time));
  FindClose(DatosArchivo);
  FechaActual := DateToStr(Date);
  HoraActual := TimeToStr(Time);

  Result := 'F' + Copy(FechaActual, 9, 4) + Copy(FechaActual, 4, 2)
    + Copy(FechaActual, 1, 2) + Copy(HoraActual, 1, 2)
    + Copy(HoraActual, 4, 2) + '/P' + Copy(FechaArchivo, 9, 4)
    + Copy(FechaArchivo, 4, 2) + Copy(FechaArchivo, 1, 2)
    + Copy(HoraArchivo, 1, 2) + Copy(HoraArchivo, 4, 2);

  ShortDateFormat := SetFecha;
  LongTimeFormat := SetHora;
end;

procedure SendControlCode(S: string);
var
  Handle, hDeviceMode: THandle;
  N: DWORD;
  DocInfo1: TDocInfo;
  Device, Driver, Port: array[0..255] of char;
  PrinterName: string;
  buf: array[0..255] of char;
  lbuf: integer;
begin
  Printer.GetPrinter(Device, Driver, Port, hDeviceMode);
  PrinterName := Format('%s', [Device]);
  if not OpenPrinter(PChar(PrinterName), Handle, nil) then
    RaiseLastWin32Error;
  try
    DocInfo1.lpszDocName := PChar('Control');
    DocInfo1.lpszOutput := nil;
    DocInfo1.lpszDatatype := PChar('RAW');
    StartDocPrinter(Handle, 1, @DocInfo1);
    try
      lbuf := length(s);
      copymemory(@buf, Pchar(s), lbuf);
      if not WritePrinter(Handle, @buf, lbuf, N) then
        RaiseLastWin32Error;
    finally
      EndDocPrinter(Handle);
    end;
  finally
    ClosePrinter(Handle);
  end;
end;

function CadenaEnFecha(cCadena, cFormato: string; lValidar: Boolean = True): TDate;
var
  cAno, cMes, cDia: string;
  x: integer;
  cOldForma: string;
begin
  Result := 0;
  cOldForma := ShortDateFormat;
  for x := 1 to Length(cFormato) do
  begin
    case cFormato[x] of
      'Y', 'y': cAno := cAno + cCadena[x];
      'M', 'm': cMes := cMes + cCadena[x];
      'D', 'd': cDia := cDia + cCadena[x];
    end;
  end;
  ShortDateFormat := 'dd/mm/yyyy';
  try
    try
      Result := StrToDate(cDia + DateSeparator + cMes + DateSeparator + cAno);
    except
      if lValidar then
        raise Exception.Create('Error en conversión de fecha.');
    end;
  finally
    ShortDateFormat := cOldForma;
  end;
end;

function LeoCadenaEnDbf(cBase: string; nRegistro, nCampo: integer): string;
type
  TArrayDeByte = array[0..65000] of Byte;
var
  nMan: file;
  cStringVal: TArrayDeByte;
  nCantReg: integer;
  nLongReg: integer;
  nLongEnc: integer;
  nCantCampos: integer;
  nBucle: integer;
  nPosicion: integer;
  nLongDato: integer;
begin
  Result := '';
  if not FileExists(cBase) then
  begin
    raise Exception.Create('No existe el archivo : ' + cBase);
  end;
  AssignFile(nMan, cBase);
  Reset(nMan, 1);
  try
    BlockRead(nMan, cStringVal, 32);
    if cStringVal[0] <> 3 then
      raise Exception.Create('Cabecera DBF inválida en el archivo ' + cBase);
    nCantReg := cStringVal[4];
    nCantReg := nCantReg + (cStringVal[5] * 256);
    nCantReg := nCantReg + (cStringVal[6] * (256 * 256));
    nCantReg := nCantReg + (cStringVal[7] * (256 * 256 * 256));
    if (nCantReg = 0) or (nCantReg < nRegistro) then
      raise Exception.Create('Registro inexistente en ' + cBase);
    nLongReg := cStringVal[10];
    nLongReg := nLongReg + (cStringVal[11] * 256);
    nLongEnc := cStringVal[8];
    nLongEnc := nLongEnc + (cStringVal[9] * 256);
    nCantCampos := Trunc(((nLongEnc - 2) / 32) - 1);
    if nCantCampos < nCampo then
      raise Exception.Create('Campo [' + IntToStr(nCampo) + '] inexistente en ' + cBase);
    nPosicion := nLongEnc + (nLongReg * (nRegistro - 1)) + 1;
    for nBucle := 1 to nCampo do
    begin
      BlockRead(nMan, cStringVal, 32);
      nPosicion := nPosicion + cStringVal[16];
    end;
    if Char(ord(cStringVal[11])) <> 'C' then
      raise Exception.Create('Tipo de dato no soportado por la función.');
    nLongDato := cStringVal[16];
    nPosicion := nPosicion - nLongDato;
    Seek(nMan, nPosicion);
    BlockRead(nMan, cStringVal, nLongDato);
    for nBucle := 0 to nLongDato - 1 do
      Result := Result + Char(ord(cStringVal[nBucle]));
  finally
    CloseFile(nMan);
  end;
end;

procedure GraboCadenaEnDbf(cBase: string; nRegistro, nCampo: integer; cCadena: string);
type
  TArrayDeByte = array[0..65000] of Byte;
var
  nMan: file;
  cStringVal: TArrayDeByte;
  nCantReg: integer;
  nLongReg: integer;
  nLongEnc: integer;
  nCantCampos: integer;
  nBucle: integer;
  nPosicion: integer;
  nLongDato: integer;
begin
  if not FileExists(cBase) then
  begin
    raise Exception.Create('No existe el archivo : ' + cBase);
  end;
  AssignFile(nMan, cBase);
  Reset(nMan, 1);
  try
    BlockRead(nMan, cStringVal, 32);
    if cStringVal[0] <> 3 then
      raise Exception.Create('Cabecera DBF inválida en el archivo ' + cBase);
    nCantReg := cStringVal[4];
    nCantReg := nCantReg + (cStringVal[5] * 256);
    nCantReg := nCantReg + (cStringVal[6] * (256 * 256));
    nCantReg := nCantReg + (cStringVal[7] * (256 * 256 * 256));
    if (nCantReg = 0) or (nCantReg < nRegistro) then
      raise Exception.Create('Registro inexistente en ' + cBase);
    nLongReg := cStringVal[10];
    nLongReg := nLongReg + (cStringVal[11] * 256);
    nLongEnc := cStringVal[8];
    nLongEnc := nLongEnc + (cStringVal[9] * 256);
    nCantCampos := Trunc(((nLongEnc - 2) / 32) - 1);
    if nCantCampos < nCampo then
      raise Exception.Create('Campo [' + IntToStr(nCampo) + '] inexistente en ' + cBase);
    nPosicion := nLongEnc + (nLongReg * (nRegistro - 1)) + 1;
    for nBucle := 1 to nCampo do
    begin
      BlockRead(nMan, cStringVal, 32);
      nPosicion := nPosicion + cStringVal[16];
    end;
    if Char(ord(cStringVal[11])) <> 'C' then
      raise Exception.Create('Tipo de dato no soportado por la función.');
    nLongDato := cStringVal[16];
    nPosicion := nPosicion - nLongDato;
    for nBucle := 0 to nLongDato - 1 do
      cStringVal[nBucle] := 32;
    for nBucle := 0 to Length(cCadena) - 1 do
      cStringVal[nBucle] := Ord(cCadena[nBucle + 1]);
    Seek(nMan, nPosicion);
    BlockWrite(nMan, cStringVal, nLongDato);
  finally
    CloseFile(nMan);
  end;
end;

function DateToJul(Fecha: TDate): integer;
var
  SetFecha: string;
begin
  SetFecha := ShortDateFormat;
  ShortDateFormat := 'dd/mm/yyyy';
  Result := Trunc(Fecha - StrToDate('01/01/' + IntToStr(Year(Fecha)))) + 1;
  ShortDateFormat := SetFecha;
end;

procedure CopiarArchivo(Origen, Destino: string; FallaSiExiste: boolean = True);
begin
  if not CopyFile(PChar(Origen), PChar(Destino), FallaSiExiste) then
    raise Exception.Create(SysErrorMessage(GetLastError));
end;

procedure MoverArchivo(Origen, Destino: string; FallaSiExiste: boolean = True);
begin
  if not CopyFile(PChar(Origen), PChar(Destino), FallaSiExiste) then
    raise Exception.Create(SysErrorMessage(GetLastError));
  if not DeleteFile(Origen) then
    raise Exception.Create(SysErrorMessage(GetLastError));
end;

function RegistrarArchivo(Conexion: TADOConnection; Archivo, Sistema: string): string;
var
  CodigoRegistro: string;
  Insertar: boolean;
  QueryTmp: TADOQuery;
  Intentos: integer;
begin
  Insertar := true;
  Intentos := 0;
  Result := '';
  if Trim(Archivo) = '' then
    raise Exception.Create('Error en la función "RegistrarArchivo".' + #13#10
      + 'Falta indicar el nombre del archivo de origen.');
  if Trim(Sistema) = '' then
    raise Exception.Create('No se pudo registrar el archivo "' + Archivo + '".' + #13#10
      + 'Falta indicar el sistema que solicita el registro.');
  QueryTmp := TADOQuery.Create(nil);
  try
    QueryTmp.Connection := Conexion;
    while Insertar do
    begin
//      CodigoRegistro := DateToString(date) + '0000';
      CodigoRegistro := DateToString(Date) + '0000';
      QueryTmp.SQL.Text := 'Select Max(COD_ARCHIVO)+1 ' + '"' + 'SECUENCIA' + '"'
        + ' From GIRE.CONVERSION_NOMBRE_ARCHIVO '
        + ' Where COD_ARCHIVO >= ' + CodigoRegistro;
      QueryTmp.Open;
      if QueryTmp.FieldByName('SECUENCIA').asstring <> '' then
        CodigoRegistro := QueryTmp.FieldByName('SECUENCIA').asstring;
      QueryTmp.Close;

      QueryTmp.SQL.Text := 'DECLARE' + #13#10
        + 'PRAGMA AUTONOMOUS_TRANSACTION;' + #13#10
        + 'BEGIN' + #13#10
        + 'Insert Into GIRE.CONVERSION_NOMBRE_ARCHIVO '
        + ' (COD_ARCHIVO, NOMBRE_ARCHIVO, FH_PROCESO, PROCESO_ORIGINANTE)'
        + ' Values(' + CodigoRegistro + ', ' + '''' + UpperCase(Archivo)
        + '''' + ', ' + 'sysdate, ' + '''' + UpperCase(Sistema) + ''');' + #13#10
        + 'COMMIT;' + #13#10
        + 'END;';

      try
        QueryTmp.ExecSQL;
        Result := CodigoRegistro;
        Insertar := False;
      except
        on E: Exception do
        begin
          Inc(Intentos);
          if Pos('ORA-00001', UpperCase(E.Message)) = 0 then
            raise Exception.Create('No se pudo registrar el archivo "' + Archivo + '".' + #13#10
              + 'Error con mensaje :' + #13#10
              + E.Message);
          if Intentos > 25 then
            raise Exception.Create('No se pudo registrar el archivo "' + Archivo + '".' + #13#10
              + 'Error con mensaje :' + #13#10
              + E.Message);
        end;
      end;
    end;
  finally
    QueryTmp.Free;
  end;
end;

function NumeroSemana(Fecha: TDate): integer;
var
  FechaBase: TDate;
begin
  FechaBase := EncodeDate(Year(Fecha), 1, 1);
  FechaBase := (FechaBase - DayOfWeek(FechaBase)) + 1;
  Result := Trunc((Fecha - FechaBase) / 7) + 1;
end;

function MmEnPxc(Milimetros: double): integer;
begin
  Result := Trunc(Milimetros * 23.65);
end;

procedure AgregarDBF(Origen, Destino: string);
var
  BaseUno: TFileStream;
  BaseDos: TFileStream;
  cStringVal1: array[0..65000] of Byte;
  nCantReg1: integer;
  nLongReg1: integer;
  nLongEnc1: integer;
  nCantCampos1: integer;
  nCantReg2: integer;
  nLongReg2: integer;
  nLongEnc2: integer;
  nCantCampos2: integer;
  Bucle: integer;
  nCalculo: integer;
  Year, Month, Day: Word;
begin
  BaseUno := TFileStream.Create(Destino, fmOpenReadWrite + fmShareExclusive);
  try
    BaseDos := TFileStream.Create(Origen, fmOpenReadWrite + fmShareExclusive);
    try
      BaseUno.Read(cStringVal1, 32);

      nCantReg1 := cStringVal1[4];
      nCantReg1 := nCantReg1 + (cStringVal1[5] * 256);
      nCantReg1 := nCantReg1 + (cStringVal1[6] * (256 * 256));
      nCantReg1 := nCantReg1 + (cStringVal1[7] * (256 * 256 * 256));

      nLongReg1 := cStringVal1[10];
      nLongReg1 := nLongReg1 + (cStringVal1[11] * 256);
      nLongEnc1 := cStringVal1[8];
      nLongEnc1 := nLongEnc1 + (cStringVal1[9] * 256);
      nCantCampos1 := Trunc(((nLongEnc1 - 2) / 32) - 1);

      BaseUno.Position := nLongEnc1 + (nCantReg1 * nLongReg1);
      {
      if nCantReg1 = 0 then
        BaseUno.Position := BaseUno.Size - 1
      else
        BaseUno.Position := BaseUno.Size;
        }

      BaseDos.Read(cStringVal1, 32);

      nCantReg2 := cStringVal1[4];
      nCantReg2 := nCantReg2 + (cStringVal1[5] * 256);
      nCantReg2 := nCantReg2 + (cStringVal1[6] * (256 * 256));
      nCantReg2 := nCantReg2 + (cStringVal1[7] * (256 * 256 * 256));

      nLongReg2 := cStringVal1[10];
      nLongReg2 := nLongReg2 + (cStringVal1[11] * 256);
      nLongEnc2 := cStringVal1[8];
      nLongEnc2 := nLongEnc2 + (cStringVal1[9] * 256);
      nCantCampos2 := Trunc(((nLongEnc2 - 2) / 32) - 1);

      if (nCantCampos1 <> nCantCampos2)
        or (nLongEnc1 <> nLongEnc2) or (nLongReg1 <> nLongReg2) then
        raise Exception.Create('Las bases no son iguales.');

      BaseDos.Position := nLongEnc2;

      for Bucle := 1 to nCantReg2 do
      begin
        BaseDos.Read(cStringVal1, nLongReg2);
        BaseUno.Write(cStringVal1, nLongReg2);
      end;

      BaseUno.Position := 0;
      BaseUno.Read(cStringVal1, 32);
      BaseUno.Position := 0;

      nCantReg1 := nCantReg1 + nCantReg2;

      cStringVal1[4] := nCantReg1 mod 256;
      nCalculo := Trunc(nCantReg1 / 256);
      cStringVal1[5] := nCalculo mod 256;
      nCalculo := Trunc(nCalculo / 256);
      cStringVal1[6] := nCalculo mod 256;
      nCalculo := Trunc(nCalculo / 256);
      cStringVal1[7] := nCalculo mod 256;

      DecodeDate(Date, Year, Month, Day);

      cStringVal1[1] := StrToInt(Copy(IntToStr(Year), 3, 2));
      cStringVal1[2] := Month;
      cStringVal1[3] := Day;

      BaseUno.Write(cStringVal1, 32);
    finally
      BaseDos.Free;
    end;
  finally
    BaseUno.Free;
  end;
end;

procedure AgregarTXT(Origen, Destino: string);
var
  TextoUno: TFileStream;
  TextoDos: TStringList;
  Bucle: integer;
begin
  TextoUno := TFileStream.Create(Destino, fmOpenReadWrite + fmShareExclusive);
  try
    TextoDos := TStringList.Create;
    try
      TextoDos.LoadFromFile(Origen);
      TextoUno.Position := TextoUno.Size;
      for Bucle := 0 to TextoDos.Count - 1 do
        TextoUno.Write(Pointer(TextoDos[Bucle] + #13#10)^, Length(TextoDos[Bucle]) + 2);
    finally
      TextoDos.Free;
    end;
  finally
    TextoUno.Free;
  end;
end;

procedure VerificarUsoArchivo(const Archivo: string);
var
  Man: Integer;
begin
  Man := FileOpen(Archivo, fmShareExclusive);
  if Man > 0 then
    FileClose(Man)
  else
    raise Exception.Create(SysErrorMessage(GetLastError));
end;

function SegundosEnTTime(Segundos: integer): TTime;
var
  Horas: Word;
  Minutos: Word;
begin
  if Segundos > 86399 then
    raise Exception.Create('"SenundosEnTTime" - Cantidad de segundos, excede las 24 horas.');
  Horas := 0;
  Minutos := 0;
  if Segundos > 59 then
  begin
    Minutos := Trunc(Segundos / 60);
    Segundos := Segundos mod 60;
    if Minutos > 59 then
    begin
      Horas := Trunc(Minutos / 60);
      Minutos := Minutos mod 60;
    end;
  end;
  Result := EncodeTime(Horas, Minutos, Segundos, 0);
end;

function DiaHabil(Conexion: TADOConnection; Fecha: TDate; Dias: integer = 0): TDate;

  function FechaOk(uConexion: TADOConnection; cFecha: TDate): boolean;
  var
    Q: TADOQuery;
  begin
    Result := False;
    if DayOfWeek(cFecha) in [2..6] then
    begin
      Q := TADOQuery.Create(nil);
      try
        Q.Connection := uConexion;
        Q.SQL.Text := 'Select FH_FERIADO From GIRE.FERIADOS_ENTIDADES '
          + 'Where FH_FERIADO = :Fecha';
        Q.Parameters.Items[0].Value := FormatDateTime('yyyy/mm/dd', cFecha);
        Q.Open;
        if Q.Eof then
          Result := True;
      finally
        Q.Free;
      end;
    end;
  end;

var
  nDiasHab: integer;
  SQL: TADOQuery;
begin
  SQL := TADOQuery.Create(nil);
  try
    SQL.Connection := Conexion;
    nDiasHab := 0;
    if Dias = 0 then
      if not FechaOk(Conexion, Fecha) then
        Inc(Dias);
    while nDiasHab < Abs(Dias) do
    begin
      if Dias > 0 then
        Fecha := Fecha + 1
      else
        Fecha := Fecha - 1;
      if FechaOk(Conexion, Fecha) then
        Inc(nDiasHab);
    end;
    Result := Fecha;
  finally
    SQL.Free;
  end;
end;

function BuscaGirePath(Conexion: TADOConnection; Sistema: integer; Codigo: string): string;
var
  QueryTemp: TADOQuery;
begin
  Result := '';
  QueryTemp := TADOQuery.Create(nil);
  try
    QueryTemp.Connection := Conexion;
    QueryTemp.SQL.Clear;
    QueryTemp.SQL.Text := 'Select * From Gire.Paths where Cod_Sistema = :CERO and Cod_path = :UNO';
    QueryTemp.Parameters.Items[0].Value := Sistema;
    QueryTemp.Parameters.Items[1].Value := Codigo;
    QueryTemp.Open;
    if QueryTemp.RecordCount <> 1 then
      raise Exception.Create('Error al buscar la ruta de "' + Codigo + '"');
    Result := QueryTemp.fieldbyname('PATH').asstring;
  finally
    QueryTemp.Free;
  end;
end;

function TiempoEncendido(var Registro: TTiempoEncendido): string;
var
  Contador: int64;
begin
  Result := '';
  Contador := GetTickCount();
  Contador := Contador div 1000;
  Registro.Dias := Contador div (24 * 3600);
  if Registro.Dias > 0 then
  begin
    Contador := Contador - (24 * 3600 * Registro.Dias);
    Result := IntToStr(Registro.Dias);
    if Registro.Dias > 1 then
      Result := Result + ' días, '
    else
      Result := Result + ' día, '
  end;
  Registro.Horas := Contador div 3600;
  if Registro.Horas > 0 then
  begin
    Contador := Contador - (3600 * Registro.Horas);
    Result := Result + IntToStr(Registro.Horas);
    if Registro.Horas > 1 then
      Result := Result + ' horas, '
    else
      Result := Result + ' hora, '
  end;
  Registro.Minutos := Contador div 60;
  Registro.Segundos := Contador mod 60;
  Result := Result + IntToStr(Registro.Minutos) + ' minutos, ' +
    IntToStr(Registro.Segundos) + ' segundos.';
end;

function RPos(SubCadena, Cadena: string): integer;
var
  CadenaAux, SubCad: string;
  nSubStr, nStr, Bucle: integer;
begin
  if Pos(SubCadena, Cadena) = 0 then
    result := 0
  else
  begin
    nSubStr := Length(SubCadena);
    SubCad := SubCadena;
    for Bucle := 1 to nSubStr do
    begin
      SubCad[nSubStr - (Bucle - 1)] := SubCadena[Bucle];
    end;

    nStr := Length(Cadena);
    CadenaAux := Cadena;
    for Bucle := 1 to nStr do
    begin
      CadenaAux[nStr - (Bucle - 1)] := Cadena[Bucle];
    end;
    result := (nStr + 2) - (Pos(SubCad, CadenaAux) + nSubStr);
  end;
end;

function PosDesde(const SubCadena, Cadena: string; Desde: Integer): Integer;
asm
        PUSH    ESI
        PUSH    EDI
        PUSH    EBX
        PUSH    EDX
        TEST    EAX,EAX
        JE      @@qt
        TEST    EDX,EDX
        JE      @@qt0
        MOV     ESI,EAX
        MOV     EDI,EDX
        MOV     EAX,[EAX-4]
        MOV     EDX,[EDX-4]
        DEC     EAX
        SUB     EDX,EAX
        DEC     ECX
        SUB     EDX,ECX
        JNG     @@qt0
        MOV     EBX,EAX
        XCHG    EAX,EDX
        NOP
        ADD     EDI,ECX
        MOV     ECX,EAX
        MOV     AL,BYTE PTR [ESI]
@@lp1:  CMP     AL,BYTE PTR [EDI]
        JE      @@uu
@@fr:   INC     EDI
        DEC     ECX
        JNZ     @@lp1
@@qt0:  XOR     EAX,EAX
        JMP     @@qt
@@ms:   MOV     AL,BYTE PTR [ESI]
        MOV     EBX,EDX
        JMP     @@fr
@@uu:   TEST    EDX,EDX
        JE      @@fd
@@lp2:  MOV     AL,BYTE PTR [ESI+EBX]
        XOR     AL,BYTE PTR [EDI+EBX]
        JNE     @@ms
        DEC     EBX
        JNE     @@lp2
@@fd:   LEA     EAX,[EDI+1]
        SUB     EAX,[ESP]
@@qt:   POP     ECX
        POP     EBX
        POP     EDI
        POP     ESI
end;

procedure BorrarDirectorio(const Directorio: TFileName; BorraSubDir: boolean = False);
var
  DrivesPathsBuff: array[0..1024] of char;
  DrivesPaths: string;
  len: longword;
  ShortPath: array[0..MAX_PATH] of char;
  dir: TFileName;

  procedure rDelTree(const Directorio: TFileName);
  var
    SearchRec: TSearchRec;
    Attributes: LongWord;
    ShortName, FullName: TFileName;
    pname: pchar;
  begin
    if FindFirst(Directorio + '*', faAnyFile and not faVolumeID,
      SearchRec) = 0 then
    begin
      try
        repeat
          if SearchRec.FindData.cAlternateFileName[0] = #0 then
            ShortName := SearchRec.Name
          else
            ShortName := SearchRec.FindData.cAlternateFileName;
          FullName := Directorio + ShortName;
          if (SearchRec.Attr and faDirectory) <> 0 then
          begin
            if (ShortName <> '.') and (ShortName <> '..') then
              rDelTree(FullName + '\');
          end
          else
          begin
            pname := PChar(FullName);
            Attributes := GetFileAttributes(pname);
            if Attributes = $FFFFFFFF then
              raise EInOutError.Create(SysErrorMessage(GetLastError));
            if (Attributes and FILE_ATTRIBUTE_READONLY) <> 0 then
              SetFileAttributes(pname, Attributes and not
                FILE_ATTRIBUTE_READONLY);
            if Windows.DeleteFile(pname) = False then
              raise EInOutError.Create(SysErrorMessage(GetLastError));
          end;
        until FindNext(SearchRec) <> 0;
      except
        FindClose(SearchRec);
        raise;
      end;
      FindClose(SearchRec);
    end;
    if Pos(#0 + Directorio + #0, DrivesPaths) = 0 then
    begin
      pname := PChar(Directorio);
      Attributes := GetFileAttributes(pname);
      if Attributes = $FFFFFFFF then
        raise EInOutError.Create(SysErrorMessage(GetLastError));
      if (Attributes and FILE_ATTRIBUTE_READONLY) <> 0 then
        SetFileAttributes(pname, Attributes and not
          FILE_ATTRIBUTE_READONLY);
      if Windows.RemoveDirectory(pname) = False then
      begin
        raise EInOutError.Create(SysErrorMessage(GetLastError));
      end;
    end;
  end;

begin

  if BorraSubDir then
  begin
    DrivesPathsBuff[0] := #0;
    len := GetLogicalDriveStrings(1022, @DrivesPathsBuff[1]);
    if len = 0 then
      raise EInOutError.Create(SysErrorMessage(GetLastError));
    SetString(DrivesPaths, DrivesPathsBuff, len + 1);
    DrivesPaths := Uppercase(DrivesPaths);
    len := GetShortPathName(PChar(Directorio), ShortPath, MAX_PATH);
    if len = 0 then
      raise EInOutError.Create(SysErrorMessage(GetLastError));
    SetString(dir, ShortPath, len);
    dir := Uppercase(dir);
    rDelTree(IncludeTrailingBackslash(dir));
  end
  else
  begin
    if not RemoveDirectory(PChar(Directorio)) then
      raise Exception.Create(SysErrorMessage(GetLastError));
  end;

end;

procedure CrearDirectorio(Directorio: string);
begin
  if not CreateDirectory(PChar(Directorio), nil) then
    raise Exception.Create(SysErrorMessage(GetLastError));
end;

function RoundClipp(Numero: Extended; Decimales: Integer): Extended;
const
  t: array[0..12] of int64 = (1, 10, 100, 1000, 10000, 100000,
    1000000, 10000000, 100000000, 1000000000, 10000000000,
    100000000000, 1000000000000);
begin
  if Abs(Decimales) > 12 then
    raise ERangeError.Create('RoundClipp: valor de decimales debe estar en -12..12');
  if Decimales = 0 then
    Result := Int(Numero) + Int(Frac(Numero) * 2)
  else if Decimales > 0 then begin
    Numero := Numero * t[Decimales];
    Result := (Int(Numero) + Int(Frac(Numero) * 2)) / t[Decimales];
  end else begin
    Numero := Numero / t[-Decimales];
    Result := (Int(Numero) + Int(Frac(Numero) * 2)) * t[-Decimales];
  end;
end;

function GrabarSucesoWindows(TipoDeSuceso: TTipoDeSuceso; Suceso: integer; Mensaje: string; Aplicacion: string = ''): boolean;

  procedure EscribirClavesNecesarias(AppName: string);
  var
    Reg: TRegistry;
    RegKey: string;
    AppPath: string;
    NumCategories: Integer;
  begin
    Reg := TRegistry.Create;
    try
      AppPath := ParamStr(0); //Application.ExeName;
      NumCategories := 2;
      RegKey := Format('SYSTEM\CurrentControlSet\Services\Eventlog\Application\%s', [AppName]);
      Reg.RootKey := HKEY_LOCAL_MACHINE;
      Reg.OpenKey(RegKey, True);
      Reg.WriteString('CategoryMessageFile', AppPath);
      Reg.WriteString('EventMessageFile', AppPath);
      Reg.WriteInteger('CategoryCount', NumCategories); //número máximo de categorías
      Reg.WriteInteger('TypesSupported', EVENTLOG_SUCCESS or EVENTLOG_ERROR_TYPE or EVENTLOG_WARNING_TYPE or EVENTLOG_INFORMATION_TYPE); //permitimos cualquier tipo
      Reg.CloseKey;
    finally
      Reg.Free;
    end;
  end;

var
  AppNombre: string;
  EventLog: Thandle;
  MyMsg: PChar;
  TextoAgregado: string;
  Memoria: TMemoryStatus;
  eValor: Extended;
begin

  Result := False;

  try
    if Aplicacion = '' then
    begin
      AppNombre := ExtractFileName(ParamStr(0));
      Delete(AppNombre, Length(AppNombre) - 3, 4);
    end
    else
      AppNombre := Aplicacion;

    Memoria.dwLength := SizeOf(Memoria);
    GlobalMemoryStatus(Memoria);

    TextoAgregado := Mensaje + #13#10#13#10;
    TextoAgregado := TextoAgregado + 'Datos del entorno.' + #13#10;
    TextoAgregado := TextoAgregado + 'Aplicación originante: ' + ParamStr(0) + #13#10;
    TextoAgregado := TextoAgregado + 'Iniciada desde: ' + GetCurrentDir + #13#10;
    TextoAgregado := TextoAgregado + 'Estado de la memoria en uso: ' + Format('%d', [Memoria.dwMemoryLoad]) + '%' + #13#10;
    eValor := Memoria.dwAvailPhys;
    TextoAgregado := TextoAgregado + 'Total de memoria disponible: ' + Format('%d', [Trunc(eValor / 1024 / 1024)]) + ' MB' + #13#10;

    MyMsg := PChar(TextoAgregado);

    EscribirClavesNecesarias(AppNombre);

    EventLog := RegisterEventSource(nil, PChar(AppNombre));

    case TipoDeSuceso of
      tdsInformacion: ReportEvent(EventLog, EVENTLOG_INFORMATION_TYPE, 0, Suceso, nil, 1, 0, @MyMsg, nil);
      tdsAdvertencia: ReportEvent(EventLog, EVENTLOG_WARNING_TYPE, 0, Suceso, nil, 1, 0, @MyMsg, nil);
      tdsError: ReportEvent(EventLog, EVENTLOG_ERROR_TYPE, 0, Suceso, nil, 1, 0, @MyMsg, nil);
    end;

    Result := True;

  except
    // No hace nada.....
  end;

end;

procedure Log(Filename: String; Mensaje: String; E: Exception = nil);
var
  //Filename: string;
  LogFile: TextFile;
  LogPath:String;
begin
  {CODIGO Luis Barrios
  LogPath := ExtractFilePath(Application.ExeName);
  Filename :=  FormatDateTime('yyyymmdd', DATE) + '_' + copy(ExtractFileName(Application.exename),0,length(ExtractFileName(Application.exename))-4) + '_EnviaCorreo.log';

  if not DirectoryExists(LogPath) then
    ForceDirectories(LogPath);


  AssignFile (LogFile, LogPath+Filename);
  if FileExists (LogPath+Filename) then
    Append (LogFile) // open existing file
  else
    Rewrite (LogFile); // create a new one
  try
    // write to the file and show error
    if E = nil then
      Writeln (LogFile, 'INFO - ' + FormatDateTime('yyyy/mm/dd hh:nn:ss.z', now) + ':' + Mensaje)
    else
      begin
        Writeln (LogFile, 'ERROR - ' + FormatDateTime('yyyy/mm/dd hh:nn:ss.z', now) + ':' + Mensaje + ' @@@ ERROR -> ' + E.message);
      end;

  finally
    // close the file
    CloseFile (LogFile);
  end;}
  if(Filename = '')then
    Exit;
  LogPath := ExtractFilePath(Filename);
  if not DirectoryExists(LogPath) then
    ForceDirectories(LogPath);


  AssignFile (LogFile, Filename);
  if FileExists (Filename) then
    Append (LogFile) // open existing file
  else
    Rewrite (LogFile); // create a new one
  try
    // write to the file and show error
    if E = nil then
      Writeln (LogFile, 'INFO - ' + FormatDateTime('yyyy/mm/dd hh:nn:ss.z', now) + ':' + Mensaje)
    else
      begin
        Writeln (LogFile, 'ERROR - ' + FormatDateTime('yyyy/mm/dd hh:nn:ss.z', now) + ':' + Mensaje + ' @@@ ERROR -> ' + E.message);
      end;

  finally
    // close the file
    CloseFile (LogFile);
  end;

end;
function GetGUID: String;
var
  Guid: TGUID;
begin
  OleCheck(CreateGUID(Guid));
  Result := GUIDToString(Guid);
end;

function LoadFileFolderFromIniFile(aIniFileName: String; aKey: String): String;
var
  aIniFile: TIniFile;
begin
  aIniFile := TIniFile.Create(aIniFileName);
  try
    Result := aIniFile.ReadString('Log', aKey, '');
  finally
    aIniFile.Free;
  end;
end;

end.
