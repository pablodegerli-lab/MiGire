unit uGireConsulta;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  TGireConsulta = class(TDataModule)
    qryConsulta: TQuery;
    qryBusqueda: TQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;
  TGireConsultaClass = Class of TGireConsulta;

var
  GireConsulta: TGireConsulta;

implementation

{$R *.DFM}

end.
  