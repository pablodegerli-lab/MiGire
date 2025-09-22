unit uFrmBusqueda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmGIREDlg, StdCtrls, DBCtrls, ActnList, Buttons, ExtCtrls,
  Grids, DBGrids, Db, ADODB, Mask;


type
  TFrmDlgBusqueda = class(TFrmGIREDlg)
    Panel2: TPanel;
    Label1: TLabel;
    Panel4: TPanel;
    Label2: TLabel;
    EDato: TEdit;
    DBGrid1: TDBGrid;
    CBCampos: TComboBox;
    dsDato: TDataSource;
    RGEleccion: TRadioGroup;
    GroupBox1: TGroupBox;
    DBEdit1: TDBEdit;
    procedure CBCamposClick(Sender: TObject);
    procedure RGEleccionClick(Sender: TObject);
    procedure EDatoChange(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
    fdata: TDataSet;
    fCampo: String;
    procedure armarListaDatos;
    procedure armarFiltro;
    procedure Buscar;

  public
    { Public declarations }
    procedure setParametros(ADataset:TDataset ; ADato: String);overload;
    procedure setParametros(ADatasource:TDataSource ; ADato: String);overload;
    function getDatoInt:integer;
    function getDatoStr:string;
    function getDato:Variant;
    destructor destroy ; override ;
  end;


(* funcion del freamwork Busqueda que crea el formulario de busqueda y devuelve
  el valor del campo que es pasado por parametro, tambien recibe un dataset
  en este caso es un variant. Es un sobrecarga *)
function GetDato(Adataset:TDataset; Acampo: String):Variant;overload;

(* funcion del freamwork Busqueda que crea el formulario de busqueda y devuelve
  el valor del campo que es pasado por parametro, tambien recibe un datasource
  en este caso es un variant. Es un sobrecarga *)
function GetDato(Adatasource:TDataSource; Acampo: String):Variant;overload;

implementation

{$R *.dfm}


(* CREA UN FORMULARIO DE DIALOGO DE BUSQUEDA PERO CON DATOS GENERICOS
   RECIBE UN DATASET Y EL CAMPO DE LA SELECCION *)
function GetDato(Adataset:TDataset; Acampo: String):Variant;
var
Frm: TFrmDlgBusqueda;
begin
  Result := -1;
  Frm := TFrmDlgBusqueda.Create(Nil);
  try
    frm.setParametros(Adataset,Acampo);
    if frm.ShowModal = mrOk Then
       Result := frm.getDato;
  finally
     Frm.Free;
  end;
end;

(* CREA UN FORMULARIO DE DIALOGO DE BUSQUEDA PERO CON DATOS STRING
  RECIBE UN DATASOURCE Y EL CAMPO DE LA SELECCION *)
function GetDato(Adatasource:TDataSource; Acampo: String):Variant;overload;
var
Frm: TFrmDlgBusqueda;
begin
  Result := -1;
  Frm := TFrmDlgBusqueda.Create(Nil);
  try
    frm.setParametros(Adatasource,Acampo);
    if frm.ShowModal = mrOk Then
       Result := frm.getDato;
  finally
     Frm.Free;
  end;
end;

{ TFrmDlgBusqueda }

(* METODOS DE LA CLASE *)

(* OBTIENE EL DARO DEL CAMPO, SACADO DEL DATASET PASADO POR PARAMETRO
  DEBE SER PARA CUANDO ES UN INTEGER*)
function TFrmDlgBusqueda.getdatoInt: integer;
begin
  result:= -1;
  try
    if (fdata.active) and  (fdata.RecordCount > 0 ) then
       result := fdata.FieldByName(fCampo).AsInteger;
  except
    raise;
  end;
end;

(* EFECTUA EL FILTRO DE LA SELECCION SEGUN LA OPCION QUE HALLA ELEJIDO EL USUARIO
 SI ES: 0 TIENE QUE SER IGUAL A LO ESCRITO
        1 COMIENZE CON LO ESCRITO
        2 QUE TERMINE CON LO ESCRITO*)
procedure TFrmDlgBusqueda.armarFiltro;
begin
  fdata.Filtered := false;
  fdata.Filter := '';
  if (CBCampos.ItemIndex <> -1 )
     and (EDato.Text <> '') then
  begin
   case RGEleccion.ItemIndex of
   0:begin
      IF fdata.Fields[CBCampos.ItemIndex].DataType = ftString then
            fdata.Filter :=   CBCampos.Text +
                             ' =  ''' +
                              EDato.Text +
                               '''';
      end;
   1: begin
      IF fdata.Fields[CBCampos.ItemIndex].DataType = ftString then
         fdata.Filter :=   CBCampos.Text +
                             ' LIKE  ''' +
                              EDato.Text +
                               '%''';
      end;
   2:
   begin
      IF fdata.Fields[CBCampos.ItemIndex].DataType = ftString then
            fdata.Filter :=   CBCampos.Text +
                             ' LIKE  ''%' +
                              EDato.Text +
                               '%''';
      end;
   end;
     fdata.Filtered := true;
  end;
end;

(* ARMA LOS LISTADOS DE LOS CAMPOS Y SE LOS ASIGNA AL COMBOBOX
  IMPORTANTE SIRVE PARA CAMPOS QUE NO SEAN PERSISTENTES O COMO QUE SEAN*)
procedure TFrmDlgBusqueda.armarListaDatos;
var i: integer;
begin
  CBCampos.Items.Clear;
  for i:= 0 to fdata.FieldCount - 1 do
    if fdata.Fields[i].name = '' Then
      CBCampos.Items.Add(fdata.Fields[i].DisplayName)
      else
        CBCampos.Items.Add(fdata.Fields[i].Name);
end;

(* OBTIENE EL DARO DEL CAMPO, SACADO DEL DATASET PASADO POR PARAMETRO
  DEBE SER PARA CUANDO ES UN STRING*)
function TFrmDlgBusqueda.getdatoStr:String;
begin
  Result := '' ;
  try
    if (fdata.active) and  (fdata.RecordCount > 0) then
      result :=  fdata.FieldByName(fCampo).AsString;
  except
    raise;
  end;
end;

(* SETEA LOS PARAMETROS PARA EL USO DEL FREAMWORK
    RECIBE UN DATASET*)
procedure TFrmDlgBusqueda.setParametros(ADataset: TDataset; ADato: String);
begin
   fdata := ADataset;
   fCampo := ADato;
   armarListaDatos;
   dsDato.DataSet := fdata;
   DBEdit1.DataField := fCampo;
end;

(* LIMPIA EL FILTRO Y DESTRUYE EL FORMULARIO *)
destructor TFrmDlgBusqueda.destroy;
begin
  fdata.Filtered := false;
  fdata.Filter := '';
  inherited;
end;

(* OBTIENE EL DATO DEL CAMPO, SACADO DEL DATASET PASADO POR PARAMETRO
  ESTA HECHO PARA CAMPOS DE CUALQUIER TIPO, TAMBIEN SE PUEDEN ADMITE CAMPOS
  PERSISTENTE COMO LOS QUE NO LO SON *)
function TFrmDlgBusqueda.getDato: Variant;
var
i: integer;
begin
 Result := null ;
  try
    if (fdata.active) and  (fdata.RecordCount > 0) then
    for i:= 0 to fdata.FieldCount -1 do
    begin
      if (fdata.Fields[i].Name <> '' ) and (fdata.Fields[i].Name = fCampo) then
       result :=  fdata.Fields[i].value
      else if (fdata.Fields[i].Name = '' ) and (fdata.Fields[i].DisplayName = fCampo) then
          result :=  fdata.Fields[i].value;
    end;
  except
    raise;
  end;
end;

(* BUSCA LOS CAMPOS *)
procedure TFrmDlgBusqueda.Buscar;
begin
  if (CBCampos.ItemIndex > -1) then
  armarFiltro;
end;

(* HACE QUE ELIJA UN CAMPO PARA LA BUSQUEDA *)
procedure TFrmDlgBusqueda.CBCamposClick(Sender: TObject);
begin
  inherited;
  Buscar;
end;

(* EVENTO DEL CLICK DEL RADIOGROUP LLAMA AL PROCEDIMETO BUSCAR *)
procedure TFrmDlgBusqueda.RGEleccionClick(Sender: TObject);
begin
  inherited;
  buscar;
end;

(* EVENTO DEL CHANGE DEL EDIT LLAMA AL PROCEDIMETO BUSCAR *)
procedure TFrmDlgBusqueda.EDatoChange(Sender: TObject);
begin
  inherited;
  buscar;
end;

(* SETEA LOS PARAMETROS PARA EL USO DEL FREAMWORK
RECIBE UN DATASOURCE, LO HACE MAS GENERICO*)
procedure TFrmDlgBusqueda.setParametros(ADatasource: TDataSource;
ADato: String);
begin
    DBGrid1.DataSource := ADatasource;
    fdata := ADatasource.DataSet;
    fCampo := ADato;
    armarListaDatos;
    DBEdit1.DataSource := ADatasource;
    DBEdit1.DataField := fCampo;
end;

(* EVENTO DEL DOBLE CLICK DEL COMBOBOX QUE TIENE LA MISMA FUNCIONALIDAD DEL ACEPTAR *)
procedure TFrmDlgBusqueda.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
  ModalResult:= mrOk;
end;

end.
