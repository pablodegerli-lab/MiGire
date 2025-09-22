unit UConfigRegional;

interface

uses SysUtils, Forms, Windows;


Function Configurar_Region: Boolean;

implementation

Function Configurar_Region: Boolean;
begin
	if DecimalSeparator = ThousandSeparator then
  begin
	  Application.MessageBox(PChar('CONFIGURACION REGIONAL INCORRECTA!!!'+#13+#10+ '(Separador Decimal = Separador de Miles)'+#13+#10+'Avise a Sistemas'),
                           PChar('Gema - Generación de Archivos'),
   	                       MB_ICONERROR );
    Result := False;
  end
  else
  begin
		DateSeparator     := '/';
		TimeSeparator     := ':';
		CurrencyDecimals  := 2;
		DecimalSeparator  := '.';
		ShortDateFormat   := 'dd/MM/yyyy';
		ThousandSeparator := ',';
		LongTimeFormat    := 'HH:mm:ss';
    Result := True;
  end;

end;

end.
