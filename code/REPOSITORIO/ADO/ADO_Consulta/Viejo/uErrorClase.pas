unit uErrorClase;

interface

uses
  SysUtils;

ResourceString
  NoExisteReporte = 'Falta el parametro Reporte';
  NoExisteQuery = 'Falta el parametro Query';
  sNoIngresoDatos = 'Debe Ingresar Datos';

type
  EParamProc = class(Exception);
  EParamProcNoExisteQry = class(EParamProc);
  EParamProcNoExisteReporte = class(EParamProc);
  EParamProcNoIngresoDatos = Class(EParamProc);

implementation

end.
 