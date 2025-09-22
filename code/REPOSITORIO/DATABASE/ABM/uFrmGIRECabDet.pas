unit uFrmGIRECabDet;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFRMGIREABMCAB, Db, Menus, DBActns, StdActns, ActnList, ComCtrls,
  StdCtrls, ExtCtrls, uLocator, ToolWin, Grids, DBGrids;

type
  TFrmGIREAbmCabDet = class(TFrmGIREAbmCab)
    PanelDeta1: TTabSheet;
    ToolBar1: TToolBar;
    btnPrimeroDet1: TToolButton;
    btnAnteriorDet1: TToolButton;
    btnProximoDet1: TToolButton;
    btnUltimoDet1: TToolButton;
    dsDeta: TDataSource;
    GridDetalle: TDBGrid;
    ToolButton7: TToolButton;
    BtnAgregarDet1: TToolButton;
    btnEliminarDet1: TToolButton;
    BtnCancelarDet1: TToolButton;
    btnRefrescarDet1: TToolButton;
    ToolButton13: TToolButton;
    LocDet1: TLocator;
    DataSetCancel2: TDataSetCancel;
    DataSetDelete2: TDataSetDelete;
    DataSetEdit2: TDataSetEdit;
    DataSetFirst2: TDataSetFirst;
    DataSetInsert2: TDataSetInsert;
    DataSetLast2: TDataSetLast;
    DataSetNext2: TDataSetNext;
    DataSetPost2: TDataSetPost;
    DataSetPrior2: TDataSetPrior;
    DataSetRefresh2: TDataSetRefresh;
    BtnEditarDet1: TToolButton;
    btnAceptarDet1: TToolButton;
  private
    { Private declarations }
  public
    Procedure AsignarDatos(ADataSets: Array of TDataSet); override;
    Procedure AbrirDatos; override;
    { Public declarations }
  end;

var
  FrmGIREAbmCabDet: TFrmGIREAbmCabDet;

implementation

{$R *.DFM}

procedure TFrmGIREAbmCabDet.AbrirDatos;
begin
  inherited;
  If DsDeta.DataSet <> nil then
     DsDeta.DataSet.Open;
end;

procedure TFrmGIREAbmCabDet.AsignarDatos(ADataSets: array of TDataSet);
var
 DataSet: TDataSet;
begin
  Inherited;
  If Length(ADataSets) > 1 then
  begin
    DataSet := ADataSets[1];
    dsDeta.DataSet := DataSet;
  end;
end;

end.
