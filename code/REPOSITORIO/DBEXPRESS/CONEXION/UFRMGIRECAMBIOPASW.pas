{                  Ayuda para el uso del cambio de Password

Cuando se heredo la conexión al proyecto se uso el formulario asi que en el formulario donde
se necesita el cambio de password solo hay que usar la units y hacer lo siguiente:

Procedure CambiarClave ;
var
  CambioPasw:TFrmGIRECambioPasw;                     donde
                                                      MyConexion es el nombre de la variable
begin                                                 que le puso el Programador a la conex.
  CambioPasw:=TFrmGIRECambioPasw.Create(Owner);       de su proyecto.
  CambioPasw.GireEnlace:=MyConexion;
  CambioPasw.ShowModal;
end;

}
unit uFrmGIRECambioPasw;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFRMGIREDLG, StdCtrls, ExtCtrls, ActnList, Buttons,  dbTables, inifiles, define,
  Db, uDbExpressConexion, ADODB, winInet, jpeg, FMTBcd, SqlExpr;

type

  arStr = array of string;

  TIEHTTP = class(TObject)
  private
    buffer : array of char;
    s1, s2, s3 : array[1..INTERNET_MAX_PATH_LENGTH] of char;
    size3_multipart : integer;

    procedure ReadUrl(hSession: HInternet; const UrlAddr: string; Dest: TStream);
    procedure CrackURL;
    procedure ProcessReadRequest;

    procedure SetGetStr(const Value: string);
    procedure SetPostStr(const Value: string);
    procedure SetRequestMethod(const Value: string);
    procedure SetMultipart(value: boolean);
    procedure SetURL(value: string);
    procedure ConvertToMultiPart;
    procedure ReadCookiesAndHeaders(hFile:HInternet);

    /////////////////////////////////////////////
    procedure findRepl(var s:string; f,r:string);
    function findRepl2(s:string; f,r:string): string;
    function split(s:string; char:char): arstr;
    procedure DecompressStream(inpStream,outStream: TStream);
    procedure CheckAndDecompress(var inpStream: TMemoryStream);
    function Stream_Replace(var astream: tmemorystream; s1: string; s2:string): integer;
    function Stream2_Replace(var astream: tstream; s1: string; s2:string): integer;
    function Stream_ToText(astream: TMemoryStream) : string;
    function Stream_ToText2(astream: TMemoryStream) : string;
    function EncodeURL(s:string):string;
    function Bin2Hex(s :string) : string;
    function Hex2Bin(s :string) : string;
    function breakuu(s:string) : string;
    { Base64 encode and decode a string }
    {** Written by David Barton (davebarton@bigfoot.com) **************************}
    {** http://www.scramdisk.clara.net/ *******************************************}
    function B64Encode(const S: string): string;
    function B64Decode(const S: string): string;

  protected
    FpostStr : string;
    FgetStr : string;
    FRequestMethod : string;
    FMultipartPOST : boolean;
    FUrl: string;
    FOnPacketRead: TNotifyEvent;
  public
    headers : string;
    error: integer;
    http_agent_string : string;
    sl : TStringList;
    CamposTexto: TStringList;
    result_sl : TStringList;
    result_ms : tmemorystream;
    cookies : tstringlist;
    response_headers : tstringlist;

    bytes_read_total : integer;
    content_type : string;
    ContentSize : DWORD;
    multipartVars : array of record f:shortstring; v : string end;
    aURLC2 : TURLComponents;
    username : string;
    password : string;
    procedure Execute;
    procedure ExecuteURL(url: string);

    function get_url(url : string): String;
    constructor Create(AOwner: TComponent); reintroduce;
    function GetStringPercentage: string;
    function ExtraerCamposTexto:String;


    property postStr : string read FPostStr write SetPostStr;
    property getStr : string read FGetStr write SetGetStr;
    property URL : string read FUrl write SetURL;
    property RequestMethod : string read FRequestMethod write SetRequestMethod;
    property MultipartPOST : boolean read FMultipartPOST write SetMultipart;
    property OnPacketRead: TNotifyEvent read FOnPacketRead write FOnPacketRead;

  published
    procedure AddMultipartVar(field: string; value: widestring);
    procedure AddMultipartFile(field: string; filename: string);
    procedure AddMultipartStream(field: string; ms: TMemoryStream);
  end;

  TFrmGIRECambioPasw = class(TFrmGIREDlg)
    qryCambioPasw: TSQLQuery;
  private
    FGireEnlace: TDbExpressConexion;
    procedure SetGireEnlace(const Value: TDbExpressConexion);
  published
    PanelPrincipal: TPanel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    lblBaseDato: TLabel;
    lblPaswAnterior: TLabel;
    lblPaswNueva: TLabel;
    edPaswAnterior: TEdit;
    edPaswNueva: TEdit;
    lblConfirmaPasw: TLabel;
    Image1: TImage;
    lblUsuario: TLabel;
    edPaswConfirma: TEdit;
    lblNomBD: TLabel;
    lblNomUsu: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure edPaswAnteriorExit(Sender: TObject);
    procedure AceptarExecute(Sender: TObject);
    procedure edPaswAnteriorEnter(Sender: TObject);
    function VerificaClaves(Sender: TObject) : boolean;
    property GireEnlace:TDbExpressConexion   read FGireEnlace write SetGireEnlace;

  private
    function GetURL():String;
    function URLFormat(pURL: String):String;
  public

  end;

const
    bufferSize = 1024*4;
    multipart_boundary = '-----------------------------7cf87224d2020a';
    B64Table= 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/';

    TRAE_FH_EXPIRACION  = '"SINCRO.TRAE_FH_EXPIRACION"';
    TRAE_SECTOR = '"SINCRO.TRAE_SECTOR"';
    CAMBIA_CLAVE  = '"SINCRO.CAMBIA_CLAVE"';
    CAMBIA_CLAVE_USUARIO  = '"SINCRO.CAMBIA_CLAVE_USUARIO"';
    DESBLOQUEA_USUARIO  = '"SINCRO.DESBLOQUEA_USUARIO"';
    LLAMO_CAMBIO_CLAVE  = '"SINCRO.LLAMO_CAMBIO_CLAVE"';
    LLAMO_DESBLOQUEA = '"SINCRO.LLAMO_DESBLOQUEA"';

    TErrorSincro : Array [0..6] of String =( TRAE_FH_EXPIRACION,TRAE_SECTOR,CAMBIA_CLAVE,CAMBIA_CLAVE_USUARIO,DESBLOQUEA_USUARIO,LLAMO_CAMBIO_CLAVE,LLAMO_DESBLOQUEA );

implementation

uses Registry;

{$R *.DFM}

{ ************ Comienza TIEHTTP *************** }

constructor TIEHTTP.Create;
begin

  setlength(buffer, bufferSize);
  setRequestMethod('GET');
  multipartPOST := false;

  result_sl := TStringList.Create;
  sl := result_sl;
  CamposTexto := TStringList.Create;
  result_ms := TMemoryStream.Create;
  result_ms.Position := 0;
  cookies := tstringlist.create;
  response_headers := tstringlist.create;

  http_agent_string := 'tiehttp';

end;

function TIEHTTP.get_url(url: string): String;
begin
  result_ms.Clear;
  ReadUrl(nil, url, result_ms);
  result_ms.Position := 0;
  CheckAndDecompress(result_ms);

  sl.LoadFromStream(result_ms);
  //CamposTexto.LoadFromStream(result_ms);
  result := sl.text;
end;

function TIEHTTP.GetStringPercentage: string;
begin

  result := format('Bytes Leidos: %.0n '#13'Tamaño del archivo: %.0n'#13'Estado: %.0n%% realizado'
                                   ,[bytes_read_total*1.0,contentSize*1.0,(bytes_read_total/contentSize)*100] ) ;
end;

procedure TIEHTTP.ProcessReadRequest;
//se usa desde HTTPS -POST/GET
//                  HTTP  -POST
//                  para HTTP/GET usar geturl
var  aBuf: PByteArray;
const inetBufferSize = 1024;
var
  hI, hConnect, hFile: HInternet;
  bytesRead: DWORD;
  gotIt: boolean;
  dwFlags : DWord;
  lpdwBufferLength: DWORD;
  dwError : DWord;
  p1,p2 : pchar;
var
  context : DWORD;
  extraHeaders : Pchar;
  extraHeadersLength : DWord;
  size1, size2 : integer;

var
  dwBufLen : DWORD;
  dwIndex : Cardinal;

begin


  hI := nil;
  hConnect := nil;
  hFile := nil;
  size1 := 0;
  size2 := 0;
  size3_multipart := 0;

  GetMem(aBuf, inetBufferSize);

  try
    // Abrir conexion
    hI := InternetOpen(pchar(http_agent_string), INTERNET_OPEN_TYPE_PRECONFIG, nil, nil, 0);
    if (hI = nil) then
      raise exception.create('Falta conexión a Internet');
    context := 0;
    hConnect := InternetConnect(hI, aURLc2.lpSzHostName,
                aURLc2.nPort, aURLc2.lpszUserName, aURLc2.lpszPassword,
               INTERNET_SERVICE_HTTP, 0, context);

    if (hConnect = nil) then
      raise exception.createFmt('No es posible conectar al servidor %s', [aURLc2.lpSzHostName]);
    if aURLc2.nPort = 443 then
      dwflags := INTERNET_FLAG_SECURE or INTERNET_FLAG_IGNORE_CERT_CN_INVALID or INTERNET_FLAG_IGNORE_CERT_DATE_INVALID
    else
      dwflags := 0;

    dwFlags := dwFlags or INTERNET_FLAG_RELOAD;

    if RequestMethod = 'GET' then
      strcat(aURLc2.lpSzUrlPath, aURLc2.lpszExtraInfo); //already has '?'


    if getStr <> '' then begin

      if pos('?', aURLc2.lpszUrlPath) = 0 then
        getStr := '?' + getStr
      else
        getStr := '&' + getStr;

      size1 := length(aURLc2.lpszUrlPath) + length(getStr) + 100;
      getmem(p1, size1);

      strpcopy(p1, aURLc2.lpszUrlPath);
      strcat(p1, pchar(getStr));

      aURLc2.lpszUrlPath := p1;
      aURLc2.dwUrlPathLength := length(aURLc2.lpszUrlPath);
      getStr := '';
    end;

    setlasterror(0);
    hFile := HTTPOpenRequest(hConnect, PChar(RequestMethod),
    aURLc2.lpSzUrlPath, HTTP_VERSION, nil, nil, dwflags, context);
    dwError := getlasterror;
    if dwError <> 0 then begin
      if dwError in [183,122] then
        //se reciben errores con estos numeros
        //183: cannot create a file  (win98/d6)
        //122: the data area passed to a system call is too small
      else begin
        RaiseLastWin32Error;
        //raise exception.create('error #' + inttostr(dwError));
      end;
    end;


    if (hFile = nil) then raise(exception.create('No pudo abrir la petición HTTP'));

    if RequestMethod = 'GET' then begin
      aURLc2.lpSzExtraInfo := '';
      aURLc2.dwExtraInfoLength := 0;
    end;
    if pos('?', aURLc2.lpSzExtraInfo) = 1 then begin
      aURLc2.lpSzExtraInfo := pchar(copy(aURLc2.lpSzExtraInfo,2, aURLc2.dwExtraInfoLength));
      dec(aURLc2.dwExtraInfoLength);
    end;

    if postStr <> '' then begin

      if strpas(aURLc2.lpszExtraInfo) <> '' then postStr := '&' + postStr;

      if RequestMethod='GET' then
        raise exception.create('Accion no permitida en el metodo GET');

      size2 := length(aURLc2.lpSzExtraInfo) + length(postStr) + 1000;
      getMem(p2, size2);
      strpcopy(p2, aURLc2.lpSzExtraInfo);
      strcat(p2, pchar(postStr));
      aURLc2.lpSzExtraInfo := p2;
      aURLc2.dwExtraInfoLength := length(aURLc2.lpSzExtraInfo);
      postStr := '';
    end;

    //importante para POST
    //---------------------------
    if RequestMethod='POST' then begin
      if content_type='' then
        content_type := 'application/x-www-form-urlencoded';
    end else
      content_type := '';

    if content_type <> '' then
      content_type := 'Content-Type: ' + content_type;

    extraHeaders := pchar(content_type);
    extraHeadersLength := length(content_type);

    if pos('multipart', lowercase(content_type)) > 0 then
      ConvertToMultiPart;
    if not HTTPSendRequest(hFile, extraHeaders, extraHeadersLength, aURLc2.lpSzExtraInfo, aURLc2.dwExtraInfoLength) then begin
      dwError := getlasterror;
      if dwError = 12045 then begin
      InternetQueryOption (hFile, INTERNET_OPTION_SECURITY_FLAGS,
               @dwFlags, lpdwBufferLength);

        dwFlags := dwFlags or SECURITY_FLAG_IGNORE_UNKNOWN_CA;
        InternetSetOption (hFile, INTERNET_OPTION_SECURITY_FLAGS,
                       @dwFlags, sizeof (dwFlags) );

        if not HTTPSendRequest(hFile, extraHeaders, extraHeadersLength, aURLc2.lpSzExtraInfo, aURLc2.dwExtraInfoLength)
        then ;
        //dwError := getlasterror;
        //if getlasterror <> 0 then RaiseLastWin32Error;
      end;
    end;

    dwBufLen := sizeof(ContentSize);
    ContentSize := 0;
    dwIndex := 0;
    HttpQueryInfo(hFile, HTTP_QUERY_CONTENT_LENGTH or HTTP_QUERY_FLAG_NUMBER, @ContentSize, dwBufLen, dwIndex );
    if ContentSize=0 then ContentSize:=1; //avoid division by 0

    bytes_read_total := 0;

    repeat

      gotIt := InternetReadFile(hFile, aBuf, inetBufferSize, bytesRead);

      result_ms.WriteBuffer(aBuf^, bytesRead);

      inc(bytes_read_total, bytesread);
      if assigned(FOnPacketRead) then
        FOnPacketRead(self);

          until (gotIt and (bytesRead = 0));

    ReadCookiesAndHeaders(hFile);

  finally
    // limpiar memoria
    FreeMem(aBuf, inetBufferSize);

    if size1 > 0 then freemem(p1, size1);
    if size2 > 0 then freemem(p2, size1);
    if size3_multipart > 0 then freemem(aurlc2.lpszExtraInfo, size3_multipart);

    InternetCloseHandle(hFile);
    InternetCloseHandle(hConnect);
    InternetCloseHandle(hI);
  end;

end;

procedure TIEHTTP.CrackURL;
begin
  //Limpiar las estructuras
  FillChar(aURLC2, sizeOf(TURLComponents), 0);

  with aURLC2 do
  begin
    dwStructSize := sizeOf(TURLComponents);
    lpSzExtraInfo := @s1[1];
    dwExtraInfoLength := INTERNET_MAX_PATH_LENGTH;
    lpSzHostName := @s2[1];
    dwHostNameLength := INTERNET_MAX_PATH_LENGTH;
    lpszUrlPath := @s3[1];
    dwUrlPathLength := INTERNET_MAX_PATH_LENGTH;
  end;

  if not InternetCrackUrl(PChar(furl), 0, ICU_ESCAPE, aURLC2) then
    raise exception.createFmt('URL invalida. Error - %d = ', [GetLastError, SysErrorMessage(GetLastError)]);

  if string(aurlc2.lpszUrlPath) = '' then
    raise exception.create('xxx');

  if pos('+',aURLC2.lpszExtraInfo) > 0 then  //v=1+2 even if passed as 1%2B2, crack url set's it to 1+2
    aURLC2.lpszExtraInfo := pchar(findrepl2(aURLC2.lpszExtraInfo, '+', '%2B'));

  if (string(aURLC2.lpszUserName)='') and (username <> '') then begin
    aURLC2.lpszUserName := pchar(Username);
    aURLC2.lpszPassword := pchar(Password);
  end;

end;


procedure TIEHTTP.ExecuteURL(url:string);
begin
  SetURL(url);
  Execute;
end;

procedure TIEHTTP.Execute;
begin
  if furl = '' then raise exception.create('No existe URL en la ejecución.');

  try
    sl.Clear;
    CamposTexto.Clear;
    result_ms.Clear;

    ProcessReadRequest;

    result_ms.Position := 0;
    CheckAndDecompress(result_ms);

    result_ms.Position := 0;
    sl.LoadFromStream(result_ms);
    CamposTexto.CommaText := ExtraerCamposTexto;
    result_ms.Position := 0;

  finally
    setlength(multipartVars, 0);
  end;
end;

procedure TIEHTTP.ReadUrl(hSession: HInternet; const UrlAddr: string; Dest:TStream);

var
  NewSession: Boolean;
  hFile: HInternet;
  Context, BytesRead: DWORD;
  ReadRes: Boolean;
var
  dwBufLen : DWORD;
  ContentSize : DWORD;
  dwIndex : Cardinal;
begin

  NewSession := hSession = NIL;
  if NewSession then begin
    hSession := InternetOpen('SessionName', INTERNET_OPEN_TYPE_PRECONFIG, NIL, NIL, 0);
  end;
  try
    Context := 0;
    hFile := InternetOpenUrl(hSession, PCHAR(UrlAddr), pchar(headers), length(headers), INTERNET_FLAG_RELOAD or INTERNET_FLAG_KEEP_CONNECTION , Context);

    dwBufLen := sizeof(ContentSize);
    ContentSize := 0;
    dwIndex := 0;
    HttpQueryInfo(hFile, HTTP_QUERY_CONTENT_LENGTH or HTTP_QUERY_FLAG_NUMBER, @ContentSize, dwBufLen, dwIndex);
    if ContentSize=0 then ContentSize:=1;

    bytes_read_total := 0;
    if hFile <> NIL then
    try
      repeat
        FillChar(Buffer[0], Length(Buffer), 0);
        ReadRes := InternetReadFile(hFile, Buffer, Length(Buffer), BytesRead);
        Dest.Write(Buffer[0], BytesRead);
        inc(bytes_read_total, bytesread);
        if assigned(FOnPacketRead) then
          FOnPacketRead(self);
      until (ReadRes) and (BytesRead = 0);
    finally
      if not InternetCloseHandle(hFile) then
        error := getlasterror;
    end;
  finally
    if NewSession then
      if not InternetCloseHandle(hSession) then
        error := getlasterror;
  end;
end;

procedure TIEHTTP.SetGetStr(const Value: string);
begin
  FGetStr := Value;
end;

procedure TIEHTTP.SetPostStr(const Value: string);
begin
  FPostStr := Value;
end;


procedure TIEHTTP.SetMultipart(value: boolean);
begin
  FMultipartPOST := value;

  if FMultipartPOST then begin
    SetRequestMethod('POST');
  end;
end;

procedure TIEHTTP.SetRequestMethod(const Value: string);
begin
  FRequestMethod := uppercase(Value);

  if RequestMethod='POST' then begin
    if multipartPost then
      content_type := 'multipart/form-data; boundary='+multipart_boundary
    else
      content_type := 'application/x-www-form-urlencoded';
  end else
  if RequestMethod='GET' then
    content_type:='';
end;

procedure TIEHTTP.ConvertToMultiPart;
var
    ar, ar2 : arStr;
    i : integer;
    s: string;
    sl_temp : tstringlist;
    x: integer;
begin
  sl_temp := tstringlist.create;

  s := aurlc2.lpszExtraInfo;

  if (length(s)>0) then begin
    if s[1] = '&' then delete(s,1,1);
    ar := split(s, '&');
    for i := 0 to length(ar) - 1 do begin
      ar2 := split(ar[i], '=');
      if length(ar2) <> 2 then
        raise exception.Create('No es posible convertir ' + ar[i] + ' a multipart');
      AddMultipartVar(ar2[0], ar2[1]);
    end;
  end;

  if length(multipartVars) = 0 then
    raise exception.create('Error, no existen variables para el Post');

  for i := 0 to length(multipartVars) - 1 do begin
    sl_temp.add('--' +  multipart_boundary);
    sl_temp.add('Content-Disposition: form-data; name="'+multipartVars[i].f+'"');
    sl_temp.add('');
    sl_temp.add(multipartVars[i].v);
  end;

  sl_temp.add('--' + multipart_boundary + '--');

  s := sl_temp.text;
  size3_multipart := length(s)+100;
  getmem(aurlc2.lpszExtraInfo, size3_multipart); //+1 seems to be enough


for x := 1 to Length(s) do
begin
  aurlc2.lpszExtraInfo[x-1] := s[x];
end;
  aurlc2.dwExtraInfoLength := length( s );
  sl_temp.free;
end;

procedure TIEHTTP.SetURL(value: string);
begin
  furl := value;
  if furl = '' then begin
    FillChar(aURLC2, sizeOf(TURLComponents), 0);
    exit;
  end;

  if pos('://', lowercase(furl)) = 0 then
    furl := 'http://'+furl;


  CrackURL;

end;

procedure TIEHTTP.AddMultipartVar(field: string; value: widestring);
var i : integer;
begin
  if not multipartpost then
    raise exception.create('No está en modo multipart');

  i := length(multipartVars)+1;
  setlength(multipartVars, i);

  multipartVars[i-1].f := field;
  multipartVars[i-1].v := value;

end;

procedure TIEHTTP.ReadCookiesAndHeaders(hFile:HInternet);
var response_lpOutBuffer : array[1..5000] of char;
    response_dwSize : cardinal;
    infoLevel : cardinal;
    i2 : cardinal;
begin
  infoLevel := HTTP_QUERY_SET_COOKIE;
  cookies.Clear;
  i2 := 0;
  repeat
    response_dwSize := sizeof(response_lpOutBuffer);
    if not HttpQueryInfo(hFile, infoLevel, @response_lpOutBuffer[1], response_dwSize, i2) then
      break;
    cookies.Add(copy(response_lpOutBuffer,1,response_dwSize));
  until false;

  response_dwSize := sizeof(response_lpOutBuffer);
  fillchar(response_lpOutBuffer,sizeof(response_lpOutBuffer), 0);
  infoLevel := HTTP_QUERY_RAW_HEADERS_CRLF;
  i2 := 0;
  if HttpQueryInfo(hFile, infoLevel, @response_lpOutBuffer[1], response_dwSize, i2) then begin
    response_headers.Text := copy(response_lpOutBuffer,1,response_dwSize);
  end;
end;

procedure TIEHTTP.AddMultipartFile(field, filename: string);
var
    ms : tmemorystream;
begin
  ms := tmemorystream.create;
  ms.LoadFromFile(filename);

  AddMultipartStream(field, ms);
end;

procedure TIEHTTP.AddMultipartStream(field: string; ms: TMemoryStream);
function StringToWideString(const s: AnsiString; codePage: Word): WideString;
var
  l: integer;
begin
  if s = '' then
    Result := ''
  else
  begin
    l := MultiByteToWideChar(codePage, MB_PRECOMPOSED, PChar(@s[1]), - 1, nil, 0);
    SetLength(Result, l - 1);
    if l > 1 then
      MultiByteToWideChar(CodePage, MB_PRECOMPOSED, PChar(@s[1]),
        - 1, PWideChar(@Result[1]), l - 1);
  end;
end;

var s : string;
    orig : WideString;
begin
  s := Stream_ToText2(ms);
  ms.free;
  orig:= StringToWideString(s, CP_OEMCP) ;
  AddMultipartVar(field, s);
end;

function TIEHTTP.ExtraerCamposTexto: String;
    function PosDes(const SubCadena, Cadena: string; Desde: Integer): Integer;
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
    Function EvaluoOracleExceptSincro( value : String ): String;
    var indice : integer;
        retorno: String;
    begin
        { Si los Errores son fijos usar esta rutina -
         Recorre un (const) array con todos los objetos procedurales de SINCRO
         Si encuentra en el String evaluado alguno de estos objetos,
         los reemplaza por su igual sin las comillas "
        }
        retorno := value;
        for indice := 0 to Length(TErrorSincro)-1 do
        begin
            if Pos(TErrorSincro[indice],value) > 0 then
                retorno := StringReplace(retorno,TErrorSincro[Indice],StringReplace(TErrorSincro[indice],'"','',[rfReplaceAll]),[rfReplaceAll]);
        end;
        result := retorno;
    end;
var
    s, NombreCampo, ValorCampo: string;
    p1, p2: integer;
    delim: char;
    Registro, valor : String;
    resultado : string;
    lSigo : Boolean;
begin
    try
        result := '';
        lSigo := True;
        valor := EvaluoOracleExceptSincro( sl.Text );
        if Pos('CONNECTION REFUSED',UpperCase(valor))>0 then
            raise Exception.Create('No se puede establecer Conección con la URL');
        while lSigo do
        begin
            valor := Copy(valor,Pos('NAME',UpperCase(valor)), length(valor)-1); //Quito la parte inicial de la estructura del html que no sirve
            Registro := Copy(valor,Pos('NAME',UpperCase(valor)), Pos('>',valor)-1 ); //Me guardo el registro que voy a analizar
            valor := Copy(valor,Pos('>',valor)+1,length(valor)); // Me guardo el resto del string en caso que haya mas objetos name
            s := trim(Registro);
            while s <> '' do
            begin
                p1 := PosDes('=', s, 1);
                if p1 = 0 then
                  raise Exception.Create('No se encontro el signo "=" al analizar los campos.');
                delim := s[p1 + 1];
                if not (delim in ['"', '''']) then
                  raise Exception.Create('No se encontro delimitador de valores.');
                p2 := PosDes(delim, s, p1 + 2);
                if p2 = 0 then
                  raise Exception.Create('No se encontro delimitador de cierre ' + delim + ' al analizar los campos.');
                ValorCampo := copy(s, p1 + 2, p2 - (p1 + 2));
                NombreCampo := trim(copy(s, 1, p1 - 1));
                if UpperCase(NombreCampo) = 'NAME' then
                    resultado:=resultado + '"'+ValorCampo + '=';
                if UpperCase(NombreCampo) = 'VALUE' then
                    resultado:=resultado + ValorCampo+'",';
                delete(s, 1, p2);
            end;
            If Pos('input',valor)=0 then lSigo:=False;
        end;
        result := Copy(resultado,1,Length(resultado)-1);
    except
        on e:Exception do
        begin
            result := '"respuesta='+Trim(e.Message)+'"';
        end;
    end;
end;

procedure fr(var s:string; f,r:string);
var x:longint;
begin
  while pos(f,s)<>0 do begin
     x:=pos(f,s);
     delete(s,x,length(f));
     insert(r,s,x);
  end;
end;

procedure TIEHTTP.findRepl(var s:string; f,r:string);
begin
 fr(s,f,#25);
 fr(s,#25,r);
end;

function TIEHTTP.findRepl2(s:string; f,r:string): string;
begin
  if s <> '' then begin
    fr(s,f,#25);
    fr(s,#25,r);
  end;
 result := s;
end;

function HexDigit(c:char):integer;
begin
  c:=upcase(c);
  if (c>='0') and (c<='9') then
    result:=ord(c)-ord('0')
  else
    if (c>='A') and (c<='F') then result:=ord(c)-ord('A')+10
  else
    result := 0;
end;

function decodeHEXChr(s:string):char;
var x:integer;
begin
  x:=16*hexDigit(s[1])+hexDigit(s[2]);
  result:=chr(x);
end;

function TIEHTTP.split(s:string; char:char): arstr;
var p,i : integer;
    substr : string;
begin
  i := 1;
  repeat
    p := pos(char, s);
    if p=0 then p:=length(s)+1;
    substr := copy(s,1,p-1);
    delete(s,1,p);

    setlength(result, i);
    result[i-1] := substr;
    inc(i);
    if s='' then break;
  until false;
end;

procedure TIEHTTP.DecompressStream(inpStream,outStream: TStream);
var InpBuf,OutBuf: Pointer;
var OutBytes,sz: integer;
begin
  InpBuf := nil;
  OutBuf := nil;
  sz := inpStream.size-inpStream.Position;
  if sz > 0 then try
    GetMem(InpBuf,sz);
    inpStream.Read(InpBuf^,sz);
    outStream.Write(OutBuf^,OutBytes);
  finally
    if InpBuf <> nil then FreeMem(InpBuf);
    if OutBuf <> nil then FreeMem(OutBuf);
  end;
  outStream.Position := 0;
end;

procedure TIEHTTP.CheckAndDecompress(var inpStream: TMemoryStream);
var
  must_decompress : boolean;
  zip_header : array[1..8] of char;
  tmpStream : TMemoryStream;
begin
  inpStream.Read(zip_header,8);
  must_decompress := zip_header = #31#139#8#0#0#0#0#0;
  if not must_decompress then begin
    inpStream.position := 0;
    exit;
  end;

  tmpStream := TMemoryStream.Create;
  tmpStream.position := 0;
  DecompressStream(inpStream, tmpStream);
  inpStream.free;
  inpStream := tmpStream;
end;

function TIEHTTP.Stream_ToText(astream: TMemoryStream) : string;
var sl : tstringlist;
begin
  astream.Position := 0;
  sl := tstringlist.create;
  sl.LoadFromStream(astream);
  result := sl.text;
  sl.free;
end;

function TIEHTTP.Stream_ToText2(astream: TMemoryStream) : string;
begin
  SetLength(result, astream.Size);
  if astream.Size > 0 then
    Move(astream.Memory^,result[1],astream.Size);
end;

function Stream_Readline(Astream: tstream) : string;
var c : char;
    mode : integer;
    found_13 : boolean;
    found_10 : boolean;
begin
  result := '';
  mode := 0;
  found_10 := false;
  found_13 := false;

  while astream.Position < astream.Size do begin
    Astream.Read(c, 1);
    result := result+c;
    if (c in [#13,#10]) and not (found_10 and  found_13) then begin
      mode := 1;
      if c=#13 then found_13 := true
      else found_10 := true;
    end else
      if mode = 1 then begin
        delete(result, length(result), 1);
        astream.position := astream.position-1;
        break;
      end;
  end;
end;

function Stream_Compare(strm1,strm2:tstream): boolean;
var s1, s2 : string;
begin
  strm1.position := 0;
  strm2.position := 0;

  result := true;
  repeat
    s1 := Stream_Readline(strm1);
    s2 := Stream_Readline(strm2);
    if s1 <> s2 then begin
      result := false;
      raise exception.Create('streams compare error line1='+s1+', line2='+s2);
    end;
  until s1 = '';

  strm1.position := 0;
  strm2.position := 0;
end;

function TIEHTTP.Stream2_Replace(var astream: tstream; s1: string; s2:string): integer;
var ms:tmemorystream;
begin
  ms := tmemorystream.create;
  ms.LoadFromStream(astream);
  stream_replace(ms, s1,s2);
  (astream as tmemorystream).LoadFromStream(ms);
  ms.Free;
end;

function TIEHTTP.Stream_Replace(var astream: tmemorystream; s1: string; s2:string): integer;
var s : string;
    dest_stream : tmemorystream;
begin
  dest_stream := tmemorystream.create;
  dest_stream.Position := 0;

  astream.Position := 0;
  repeat
    s := Stream_Readline(astream);
    if s = '' then break;  //s='' means stream reading ended, if a line is empty s will be #13#10

    if pos(s1, s) > 0 then
      s := findrepl2(s, s1, s2);

    dest_stream.Write(s[1], length(s));
  until false;

  astream.Clear;
  astream.position:=0;
  dest_stream.Position := 0;
  astream.CopyFrom(dest_stream, dest_stream.size);
  dest_stream.Free;

end;

function GenerateINIfilename: string;
begin
  result := extractfilename(paramstr(0));
  delete(result,length(result)-3, 4);
  result := getcurrentdir + '\' + result + '.ini';
end;

function TIEHTTP.EncodeURL(s:string):string;
var i:integer;
    c:char;
const
    ValidURLChars:set of char=['A'..'Z','a'..'z','~','_','0'..'9','-','.'];
begin
   i:=1;
   findRepl(s,'%','%25');
   while (i<=length(s)) {and (i<2000)} do begin
       if (not (s[i] in validURLChars)) and (s[i]<>' ') and (s[i]<>'%') then begin
          c:=s[i];
          findRepl(s,c,'%'+intToHex(ord(c),2));
          i:=i+2;
       end;
       i:=i+1;
   end;
   findRepl(s,' ','%20');
   result:=s;
end;

function TIEHTTP.Bin2Hex(s :string) : string;
var i : integer;
begin
  result := '';
  for i := 1 to length(s) do
    result := result + inttohex(ord(s[i]), 2);
end;

function TIEHTTP.Hex2Bin(s :string) : string;
var i : integer;
begin
  result := '';
  for i := 1 to length(s) div 2  do
    result := result + decodeHEXChr(s[i*2-1]+s[i*2]);
end;

function TIEHTTP.breakuu(s:string) : string;
var i : integer;
begin
  result := '';
  for i := 1 to length(s) do begin
    result := result + s[i];
    if  (i mod 64 = 0) then
      result := result + #13;
  end;
end;

function TIEHTTP.B64Encode;
{by David Barton (davebarton@bigfoot.com) **************************}
{** http://www.scramdisk.clara.net/ }
var
  i: integer;
  InBuf: array[0..2] of byte;
  OutBuf: array[0..3] of char;
begin
  SetLength(Result,((Length(S)+2) div 3)*4);
  for i:= 1 to ((Length(S)+2) div 3) do
  begin
    if Length(S)< (i*3) then
      Move(S[(i-1)*3+1],InBuf,Length(S)-(i-1)*3)
    else
      Move(S[(i-1)*3+1],InBuf,3);
    OutBuf[0]:= B64Table[((InBuf[0] and $FC) shr 2) + 1];
    OutBuf[1]:= B64Table[(((InBuf[0] and $03) shl 4) or ((InBuf[1] and $F0) shr 4)) + 1];
    OutBuf[2]:= B64Table[(((InBuf[1] and $0F) shl 2) or ((InBuf[2] and $C0) shr 6)) + 1];
    OutBuf[3]:= B64Table[(InBuf[2] and $3F) + 1];
    Move(OutBuf,Result[(i-1)*4+1],4);
  end;
  if (Length(S) mod 3)= 1 then
  begin
    Result[Length(Result)-1]:= '=';
    Result[Length(Result)]:= '=';
  end
  else if (Length(S) mod 3)= 2 then
    Result[Length(Result)]:= '=';
end;

function TIEHTTP.B64Decode;
{by David Barton (davebarton@bigfoot.com) **************************}
{** http://www.scramdisk.clara.net/ }
var
  i: integer;
  InBuf: array[0..3] of byte;
  OutBuf: array[0..2] of byte;
begin
  if (Length(S) mod 4)<> 0 then
    raise Exception.Create('Base64: Incorrect string format');
  SetLength(Result,((Length(S) div 4)-1)*3);
  for i:= 1 to ((Length(S) div 4)-1) do
  begin
    Move(S[(i-1)*4+1],InBuf,4);
    if (InBuf[0]> 64) and (InBuf[0]< 91) then
      Dec(InBuf[0],65)
    else if (InBuf[0]> 96) and (InBuf[0]< 123) then
      Dec(InBuf[0],71)
    else if (InBuf[0]> 47) and (InBuf[0]< 58) then
      Inc(InBuf[0],4)
    else if InBuf[0]= 43 then
      InBuf[0]:= 62
    else
      InBuf[0]:= 63;
    if (InBuf[1]> 64) and (InBuf[1]< 91) then
      Dec(InBuf[1],65)
    else if (InBuf[1]> 96) and (InBuf[1]< 123) then
      Dec(InBuf[1],71)
    else if (InBuf[1]> 47) and (InBuf[1]< 58) then
      Inc(InBuf[1],4)
    else if InBuf[1]= 43 then
      InBuf[1]:= 62
    else
      InBuf[1]:= 63;
    if (InBuf[2]> 64) and (InBuf[2]< 91) then
      Dec(InBuf[2],65)
    else if (InBuf[2]> 96) and (InBuf[2]< 123) then
      Dec(InBuf[2],71)
    else if (InBuf[2]> 47) and (InBuf[2]< 58) then
      Inc(InBuf[2],4)
    else if InBuf[2]= 43 then
      InBuf[2]:= 62
    else
      InBuf[2]:= 63;
    if (InBuf[3]> 64) and (InBuf[3]< 91) then
      Dec(InBuf[3],65)
    else if (InBuf[3]> 96) and (InBuf[3]< 123) then
      Dec(InBuf[3],71)
    else if (InBuf[3]> 47) and (InBuf[3]< 58) then
      Inc(InBuf[3],4)
    else if InBuf[3]= 43 then
      InBuf[3]:= 62
    else
      InBuf[3]:= 63;
    OutBuf[0]:= (InBuf[0] shl 2) or ((InBuf[1] shr 4) and $03);
    OutBuf[1]:= (InBuf[1] shl 4) or ((InBuf[2] shr 2) and $0F);
    OutBuf[2]:= (InBuf[2] shl 6) or (InBuf[3] and $3F);
    Move(OutBuf,Result[(i-1)*3+1],3);
  end;
  if Length(S)<> 0 then
  begin
    Move(S[Length(S)-3],InBuf,4);
    if InBuf[2]= 61 then
    begin
      if (InBuf[0]> 64) and (InBuf[0]< 91) then
        Dec(InBuf[0],65)
      else if (InBuf[0]> 96) and (InBuf[0]< 123) then
        Dec(InBuf[0],71)
      else if (InBuf[0]> 47) and (InBuf[0]< 58) then
        Inc(InBuf[0],4)
      else if InBuf[0]= 43 then
        InBuf[0]:= 62
      else
        InBuf[0]:= 63;
      if (InBuf[1]> 64) and (InBuf[1]< 91) then
        Dec(InBuf[1],65)
      else if (InBuf[1]> 96) and (InBuf[1]< 123) then
        Dec(InBuf[1],71)
      else if (InBuf[1]> 47) and (InBuf[1]< 58) then
        Inc(InBuf[1],4)
      else if InBuf[1]= 43 then
        InBuf[1]:= 62
      else
        InBuf[1]:= 63;
      OutBuf[0]:= (InBuf[0] shl 2) or ((InBuf[1] shr 4) and $03);
      Result:= Result + char(OutBuf[0]);
    end
    else if InBuf[3]= 61 then
    begin
      if (InBuf[0]> 64) and (InBuf[0]< 91) then
        Dec(InBuf[0],65)
      else if (InBuf[0]> 96) and (InBuf[0]< 123) then
        Dec(InBuf[0],71)
      else if (InBuf[0]> 47) and (InBuf[0]< 58) then
        Inc(InBuf[0],4)
      else if InBuf[0]= 43 then
        InBuf[0]:= 62
      else
        InBuf[0]:= 63;
      if (InBuf[1]> 64) and (InBuf[1]< 91) then
        Dec(InBuf[1],65)
      else if (InBuf[1]> 96) and (InBuf[1]< 123) then
        Dec(InBuf[1],71)
      else if (InBuf[1]> 47) and (InBuf[1]< 58) then
        Inc(InBuf[1],4)
      else if InBuf[1]= 43 then
        InBuf[1]:= 62
      else
        InBuf[1]:= 63;
      if (InBuf[2]> 64) and (InBuf[2]< 91) then
        Dec(InBuf[2],65)
      else if (InBuf[2]> 96) and (InBuf[2]< 123) then
        Dec(InBuf[2],71)
      else if (InBuf[2]> 47) and (InBuf[2]< 58) then
        Inc(InBuf[2],4)
      else if InBuf[2]= 43 then
        InBuf[2]:= 62
      else
        InBuf[2]:= 63;
      OutBuf[0]:= (InBuf[0] shl 2) or ((InBuf[1] shr 4) and $03);
      OutBuf[1]:= (InBuf[1] shl 4) or ((InBuf[2] shr 2) and $0F);
      Result:= Result + char(OutBuf[0]) + char(OutBuf[1]);
    end
    else
    begin
      if (InBuf[0]> 64) and (InBuf[0]< 91) then
        Dec(InBuf[0],65)
      else if (InBuf[0]> 96) and (InBuf[0]< 123) then
        Dec(InBuf[0],71)
      else if (InBuf[0]> 47) and (InBuf[0]< 58) then
        Inc(InBuf[0],4)
      else if InBuf[0]= 43 then
        InBuf[0]:= 62
      else
        InBuf[0]:= 63;
      if (InBuf[1]> 64) and (InBuf[1]< 91) then
        Dec(InBuf[1],65)
      else if (InBuf[1]> 96) and (InBuf[1]< 123) then
        Dec(InBuf[1],71)
      else if (InBuf[1]> 47) and (InBuf[1]< 58) then
        Inc(InBuf[1],4)
      else if InBuf[1]= 43 then
        InBuf[1]:= 62
      else
        InBuf[1]:= 63;
      if (InBuf[2]> 64) and (InBuf[2]< 91) then
        Dec(InBuf[2],65)
      else if (InBuf[2]> 96) and (InBuf[2]< 123) then
        Dec(InBuf[2],71)
      else if (InBuf[2]> 47) and (InBuf[2]< 58) then
        Inc(InBuf[2],4)
      else if InBuf[2]= 43 then
        InBuf[2]:= 62
      else
        InBuf[2]:= 63;
      if (InBuf[3]> 64) and (InBuf[3]< 91) then
        Dec(InBuf[3],65)
      else if (InBuf[3]> 96) and (InBuf[3]< 123) then
        Dec(InBuf[3],71)
      else if (InBuf[3]> 47) and (InBuf[3]< 58) then
        Inc(InBuf[3],4)
      else if InBuf[3]= 43 then
        InBuf[3]:= 62
      else
        InBuf[3]:= 63;
      OutBuf[0]:= (InBuf[0] shl 2) or ((InBuf[1] shr 4) and $03);
      OutBuf[1]:= (InBuf[1] shl 4) or ((InBuf[2] shr 2) and $0F);
      OutBuf[2]:= (InBuf[2] shl 6) or (InBuf[3] and $3F);
      Result:= Result + Char(OutBuf[0]) + Char(OutBuf[1]) + Char(OutBuf[2]);
    end;
  end;
end;

{ ************* Finalizo TIEHTTP ************* }

{ ************ Comienza TFrmGIRECambioPasw *************** }

procedure TFrmGIRECambioPasw.FormActivate(Sender: TObject);
begin
  inherited;
  try
   lblNomBD.Caption  := GireEnlace.Ambito;
   lblNomUsu.Caption := UpperCase(GireEnlace.NombreUsuario);
   if edPaswAnterior.Text <> '' then
    edPaswAnterior.SetFocus;
  except
    raise Exception.Create('No existe conexión para cambiar la contraseña');
  end;
end;

procedure TFrmGIRECambioPasw.edPaswAnteriorExit(Sender: TObject);
begin
  inherited;
  if (edPaswAnterior.Text<>'') and (ModalResult <> mrNone) then
   begin
    edPaswNueva.Color      := clWindow;
    edPaswConfirma.color   := clWindow;
    edPaswNueva.Enabled    := true;
    edPaswConfirma.Enabled := true;
    edPaswNueva.SetFocus;
   end;
end;


function TFrmGIRECambioPasw.VerificaClaves(Sender: TObject) : boolean;
begin
 result:=true;
 if UpperCase(edPaswAnterior.Text)<>UpperCase(GireEnlace.ClaveUsuario) then
  begin
    ShowMessage('Contraseña anterior incorrecta');
    edPaswAnterior.SetFocus;
    result:=false;
  end
 else
  if (edPaswConfirma.Text='') and (edPaswNueva.text='') then
   begin
    edPaswAnteriorExit(Sender);
    result:=false;
   end;
 if result and (edPaswConfirma.Text='') and (edPaswNueva.text<>'') then
  begin
    edPaswConfirma.SetFocus;
    result:=false;
  end;

 if result and (UpperCase(edPaswConfirma.Text)<>UpperCase(edPaswNueva.text)) then
  begin
    ShowMessage('Verificación incorrecta de contraseña nueva');
    edPaswNueva.SetFocus;
    result:=false;
  end;

end;

procedure TFrmGIRECambioPasw.AceptarExecute(Sender: TObject);
var Respuesta, URL : String;
    HTTPPasw : TIEHTTP;
begin
   inherited;
   if not verificaClaves(Sender) then
      ModalResult := mrNone
   else
   begin
      try
        HTTPPasw := TIEHTTP.Create(self);
        try
           URL := URLFormat( GetURL() );
           HTTPPasw.ExecuteURL(URL);
           Respuesta := HTTPPasw.CamposTexto.Values['respuesta'];
           if Respuesta <> 'OK' then
              raise Exception.Create(Respuesta);
           GireEnlace.ClaveUsuario := edPaswNueva.Text;
           GireEnlace.GrabarArchINI(GireEnlace.NombreUsuario,GireEnlace.Ambito);
           ShowMessage('Contraseña cambiada con éxito');
        finally
            HTTPPasw.Free;
        end;
      except
         on e:Exception do
         raise Exception.Create('No se pudo cambiar la contraseña'+chr(13)+e.Message);
      end;
   end;
end;

procedure TFrmGIRECambioPasw.edPaswAnteriorEnter(Sender: TObject);
begin
  inherited;

  if (edPaswNueva.Text='') or (edPaswConfirma.Text='') then
   begin
     edPaswNueva.Color      := clSilver;
     edPaswConfirma.color   := clSilver;
     edPaswNueva.Text       :='';
     edPaswConfirma.Text    :='';
     edPaswNueva.Enabled    := False;
     edPaswConfirma.Enabled := False;
   end;
end;

procedure TFrmGIRECambioPasw.SetGireEnlace(const Value: TDbExpressConexion);
begin
  FGireEnlace := Value;
end;

function TFrmGIRECambioPasw.URLFormat(pURL: String): String;
var resultado : String;
begin
    try
        result := pURL;

        resultado := StringReplace(pURL,'@USER',GireEnlace.NombreUsuario,[rfReplaceAll]);
        resultado := StringReplace(resultado,'@OLDPASS',edPaswAnterior.Text,[rfReplaceAll]);
        resultado := StringReplace(resultado,'@NEWPASS',edPaswNueva.Text,[rfReplaceAll]);

        if resultado = pURL then
            raise Exception.Create('Alguno de los parametros URL(USER/OLDPASS/NEWPASS) se encuentra mal configurado.');

        result := resultado
    except
        raise;
    end;
end;

function TFrmGIRECambioPasw.GetURL: String;
var RetornaURL : String;
begin
    try
        try
            RetornaURL := GireEnlace.GetURLIni;
            if Empty(RetornaURL) then
            begin
                //Para que funcione se debe otorgar Parmiso de SELECT sobre GIRE.PARAMETROS para GIRE_USER
                qryCambioPasw.SQLConnection := GireEnlace.SQLConnect;
                qryCambioPasw.SQL.Text := 'select valor from gire.parametros where entorno = '''+Trim(GireEnlace.Ambito)+''' and nombre = ''URL_ADMIN_CLAVES'' ';
                qryCambioPasw.Open;
                if qryCambioPasw.Eof or ( Empty(qryCambioPasw.FieldValues['valor']) ) then
                    raise Exception.Create('Error en la Captura del parametro URL');
                RetornaURL := Trim(qryCambioPasw.FieldValues['valor']);
            end;
        finally
            qryCambioPasw.Close;
        end;
        Result := RetornaURL;
    except
        raise;
    end;
end;

{ ************ Finaliza TFrmGIRECambioPasw *************** }

end.

