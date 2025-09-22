unit uLocator;

{$DEBUGINFO OFF}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, DB, DBCtrls, StdCtrls, Buttons, uFormFiltrado, uFiltradorQuery;

ResourceString
  sDatasourceNoAsignado = 'Datasource no asignado';
  sFiltroNoHabilitado = 'El filtro no está habilitado';
  sHintEstaFiltrado='Filtrado por '#13+'%s';
  sHintTodosLosRegistros='Todos los registros';

type
  ELocator = Exception;

  TLocatorBase = class(TCustomPanel)
  private
    { Private declarations }
    FComboFields: TComboBox;
    FSplitter: TSplitter;
    FEdit: TEdit;
    FFields: TStrings;
    FAutoGetFields: boolean;
    FFieldActual: string;
    FFieldsTitles: TStrings;
    FLocateOptions: TLocateOptions;
    FIncremental: boolean;
    FDataLink: TFieldDataLink;
    FOnChange: TNotifyEvent;
    FDefaultFieldName: string;
    FPanelEdit: TPanel;
    FBitmap1: TBitmap;
    FBitmap2: TBitmap;
    function GetCenterPosition: Integer;
    function GetDatasource: TDatasource;
    procedure SetCenterPosition(const Value: Integer);
    procedure SetDatasource(const Value: TDatasource);
    function GetFields: TStrings;
    procedure SetFields(const Value: TStrings);
    procedure SetAutoGetFields(const Value: boolean);
    procedure SetFieldsTitles(const Value: TStrings);
    function GetLocateOptions: TLocateOptions;
    procedure SetLocateOptions(const Value: TLocateOptions);
    procedure SetIncremental(const Value: boolean);
    procedure LocateDataset;
    procedure OnActiveChange(Sender: TObject);
    procedure SetDefaultFieldName(const Value: string);
    procedure FieldsOnChange(Sender: TObject);
    procedure FieldsTitlesOnChange(Sender: TObject);
  protected
    { Protected declarations }
    procedure CreateComboFields;
    procedure CreateSplitter;
    procedure CreateEdit;
    procedure OnEditChange(Sender: TObject);
    procedure OnEditExit(Sender: TObject);
    procedure OnEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState); virtual;
    procedure OnComboChange(Sender: TObject);
    function DatasetAvailable: boolean;
    procedure GetDatasetFields;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function DataSet: TDataSet;
  published
    { Published declarations }
    property Align;
    property Alignment;
    property Anchors;
    property AutoSize;
    property BevelInner;
    property BevelOuter default bvNone;
    property BevelWidth;
    property BiDiMode;
    property BorderWidth;
    property BorderStyle;
    property Color;
    property Constraints;
    property Ctl3D;
    property UseDockManager default True;
    property DockSite;
    property DragCursor;
    property DragKind;
    property DragMode;
    property Enabled;
    property FullRepaint;
    property Font;
    property Height default 21;
    property Locked;
    property ParentBiDiMode;
    property ParentColor;
    property ParentCtl3D;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ShowHint;
    property TabOrder;
    property TabStop;
    property Visible;
    property OnCanResize;
    property OnClick;
    property OnConstrainedResize;
    property OnDockDrop;
    property OnDockOver;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDock;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnGetSiteInfo;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnResize;
    property OnStartDock;
    property OnStartDrag;
    property OnUnDock;
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
    property CenterPosition: Integer read GetCenterPosition write SetCenterPosition default 50;
    property DataSource: TDatasource read GetDatasource write SetDatasource;
    property Fields: TStrings read GetFields write SetFields;
    property FieldsTitles: TStrings read FFieldsTitles write SetFieldsTitles;
    property AutoGetFields: boolean read FAutoGetFields write SetAutoGetFields default True;
    property LocateOptions: TLocateOptions read GetLocateOptions write SetLocateOptions;
    property Incremental: boolean read FIncremental write SetIncremental default True;
    property DefaultFieldName: string read FDefaultFieldName write SetDefaultFieldName;
  end;

  TLocator = class;

  TNotifyChangeFiltro = procedure(Sender: TLocator; AFiltrador: TFiltradorQuery) of object;

  TLocator = class(TLocatorBase)
  private
    FOnChangeFiltro: TNotifyChangeFiltro;
    FBotonFiltro: TSpeedButton;
    FFormFiltrado: TFormFiltrado;
    FOnFilterButtonClick: TNotifyEvent;
    FFiltroHabilitado: boolean;
    FShowButtonHint: boolean;
    procedure ChangeFiltro; 
    function GetFormFiltrado: TFormFiltrado;
    procedure FiltradorChangeFiltro(Sender: TObject);
    procedure SetFiltroHabilitado(const Value: boolean);
    procedure ValidarFiltroHabilitado;
    procedure CreateButtonFiltrado;
    procedure DestroyButtonFiltrado;
    procedure OnButtonFiltrarClick(Sender: TObject);
    procedure CreateFormFiltrado;
    procedure SetShowButtonHint(const Value: boolean);
    function GetFiltrador: TFiltradorQuery;
    procedure SetFiltrador(const Value: TFiltradorQuery);
  protected
    procedure OnEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState); override;
  public
    procedure AsignarBitmap(Filtrado: boolean);
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure MostrarFormFiltrado;
    property FormFiltrado: TFormFiltrado read GetFormFiltrado;
    property Filtrador: TFiltradorQuery read GetFiltrador write SetFiltrador;
  published
    property OnFilterButtonClick: TNotifyEvent read FOnFilterButtonClick write FOnFilterButtonClick;
    property FiltroHabilitado: boolean read FFiltroHabilitado write SetFiltroHabilitado default True;
    property ShowButtonHint: boolean read FShowButtonHint write SetShowButtonHint default True;
    property OnChangeFiltro: TNotifyChangeFiltro read FOnChangeFiltro write FOnChangeFiltro;
  end;

procedure Register;

implementation

{$R uLocator}

uses
  DBTables;

procedure Register;
begin
  RegisterComponents('GIRE Rapipago', [TLocator]);
  RegisterComponents('GIRE Rapipago', [TLocatorBase]);
end;

{ TLocatorBase }

constructor TLocatorBase.Create(AOwner: TComponent);
begin
  inherited;
  ControlStyle := ControlStyle - [csSetCaption];
  Height := 23;
  Caption := '';
  FLocateOptions := [loCaseInsensitive, loPartialKey];
  FIncremental := True;
  FAutoGetFields:= True;

  Constraints.MaxHeight:= 23;

  CreateComboFields;
  CreateSplitter;
  CreateEdit;

  FFields := TStringList.Create;
  TStringList(FFields).OnChange:= FieldsOnChange;

  FFieldsTitles := TStringList.Create;
  TStringList(FFieldsTitles).OnChange:= FieldsTitlesOnChange;

  FDataLink := TFieldDataLink.Create;
  FDataLink.OnActiveChange := OnActiveChange;
end;

procedure TLocatorBase.FieldsOnChange(Sender: TObject);
begin
  FComboFields.Items:= FFields;
end;

procedure TLocatorBase.FieldsTitlesOnChange(Sender: TObject);
begin
  FComboFields.Items:= FFieldsTitles;
end;

destructor TLocatorBase.Destroy;
begin
  FDataLink.OnActiveChange := nil;
  FDataLink.Free;

  FFields.Free;
  FFieldsTitles.Free;

  inherited;
end;

procedure TLocatorBase.CreateComboFields;
begin
  FComboFields := TComboBox.Create(Self);
  with FComboFields do
  begin
    Parent := Self;
    Align := alLeft;
    Style := csDropDownList;
    OnChange := OnComboChange;
  end;
end;

procedure TLocatorBase.CreateEdit;
begin
  FPanelEdit:= TPanel.Create(Self);
  with FPanelEdit do
  begin
    Parent := Self;
    Caption:= '';
    if Assigned(FComboFields) then
    begin
      Constraints.MaxHeight:= FComboFields.Height - 3;
    end;
    Align := alClient;
    BevelInner := bvNone;
    BevelOuter := bvNone;
    BorderWidth:= 0;
    BorderStyle := bsSingle;    
    TabStop:= False;
  end;

  FEdit := TEdit.Create(FPanelEdit);
  with FEdit do
  begin
    Parent := FPanelEdit;
    Text := '';
    if Assigned(FComboFields) then
      Constraints.MaxHeight:= FComboFields.Height - 3;

    Align := alClient;
    OnChange := OnEditChange;
    OnKeyDown := OnEditKeyDown;
    OnExit := OnEditExit;
    Enabled := False;
    BorderWidth := 0;
    BorderStyle:= bsNone;
  end;
end;

procedure TLocatorBase.CreateSplitter;
begin
  FSplitter := TSplitter.Create(Self);
  with FSplitter do
  begin
    Parent := Self;
    Left:= FComboFields.Width;
    Align := alLeft;
  end;
end;

function TLocatorBase.DatasetAvailable: boolean;
begin
  Result := (FDataLink.Datasource <> nil)
    and (FDataLink.Dataset<>nil)
    and (FDataLink.Dataset.Active);
end;

function TLocatorBase.GetCenterPosition: Integer;
begin
  Result := FComboFields.Width;
end;

function TLocatorBase.GetDatasource: TDatasource;
begin
  Result := FDataLink.DataSource;
end;

function TLocatorBase.GetFields: TStrings;
begin
  Result := FFields;
end;

function TLocatorBase.GetLocateOptions: TLocateOptions;
begin
  Result := FLocateOptions;
end;

procedure TLocatorBase.OnComboChange(Sender: TObject);
begin
  if DatasetAvailable then
  begin
    if FComboFields.ItemIndex <> -1 then
    begin
      FEdit.Enabled := True;
      FFieldActual := FFields.Strings[FComboFields.ItemIndex];
    end
    else
      FEdit.Enabled := False;
  end;
end;

procedure TLocatorBase.OnEditChange(Sender: TObject);
begin
  if DatasetAvailable and Incremental then
    LocateDataset;
  
  if Assigned(FOnChange) then
    OnChange(Sender);
end;

procedure TLocatorBase.LocateDataset;
begin
  try
    FDataLink.Dataset.Locate(FFieldActual, FEdit.Text, LocateOptions);
  except
  end;
end;

procedure TLocatorBase.SetAutoGetFields(const Value: boolean);
begin
  FAutoGetFields := Value;
end;

procedure TLocatorBase.SetCenterPosition(const Value: Integer);
begin
  FComboFields.Width := Value;
end;

procedure TLocatorBase.SetDatasource(const Value: TDatasource);
begin
  FDataLink.DataSource := Value;
end;

procedure TLocatorBase.SetFields(const Value: TStrings);
begin
  FFields.Assign(Value);
end;

procedure TLocatorBase.SetFieldsTitles(const Value: TStrings);
begin
  FFieldsTitles.Assign(Value);
  FComboFields.Items := FFieldsTitles;
  FFieldActual := '';
end;

procedure TLocatorBase.SetIncremental(const Value: boolean);
begin
  FIncremental := Value;
end;

procedure TLocatorBase.SetLocateOptions(const Value: TLocateOptions);
begin
  FLocateOptions := Value;
end;

procedure TLocatorBase.OnEditExit(Sender: TObject);
begin
  if not Incremental then
    LocateDataset;
end;

procedure TLocatorBase.OnEditKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    LocateDataset;
  end;
end;

procedure TLocatorBase.GetDatasetFields;
var
  f: integer;
begin
  FFields.Clear;
  FFieldsTitles.Clear;
  for f := 0 to FDataLink.Dataset.FieldCount - 1 do
  begin
    FFields.Add(FDataLink.Dataset.Fields[f].FieldName);
    if FDataLink.Dataset.Fields[f].DisplayLabel <> '' then
      FFieldsTitles.Add(FDataLink.Dataset.Fields[f].DisplayLabel)
    else
      FFieldsTitles.Add(FDataLink.Dataset.Fields[f].FieldName);
  end;
  FComboFields.Items := FFieldsTitles;
end;

procedure TLocatorBase.OnActiveChange(Sender: TObject);
begin
  if DatasetAvailable
    and not (csDesigning in ComponentState)
    and AutoGetFields then
    GetDatasetFields
  else
    FComboFields.ItemIndex:= -1;
  FComboFields.ItemIndex:= FFields.IndexOf(FDefaultFieldName);    
  OnComboChange(FComboFields);
end;

procedure TLocatorBase.SetDefaultFieldName(const Value: string);
begin
  FDefaultFieldName := Value;
end;

function TLocatorBase.DataSet: TDataSet;
begin
  if (FDataLink.DataSource = nil)
    or (FDataLink.DataSource.Dataset = nil) then
    raise ELocator.Create(sDatasourceNoAsignado);

  Result := FDataLink.DataSource.DataSet;
end;


{ TLocator }


procedure TLocator.AsignarBitmap(Filtrado: boolean);
begin
  if Filtrado then
    FBotonFiltro.Glyph.Assign(FBitmap1)
  else
    FBotonFiltro.Glyph.Assign(FBitmap2);
  FBotonFiltro.Invalidate;
end;

constructor TLocator.Create(AOwner: TComponent);
begin
  inherited;
  CreateButtonFiltrado;
  FFormFiltrado:= nil;
  FOnFilterButtonClick:= nil;
  FFiltroHabilitado:= True;
  ShowButtonHint:= True;
end;

procedure TLocator.CreateButtonFiltrado;
begin

  FBitmap1:=TBitmap.Create;
  FBitmap1.LoadFromResourceName(HInstance, 'BITMAPFILTRADO');
  FBitmap2:= TBitmap.Create;
  FBitmap2.LoadFromResourceName(HInstance, 'BITMAPNOFILTRADO');

  FBotonFiltro:= TSpeedButton.Create(FPanelEdit);
  with FBotonFiltro do
  begin
    Parent:= FPanelEdit;
    Align:= alRight;
    Width:= 23;
    OnClick:= OnButtonFiltrarClick;
    NumGlyphs:= 1;
    ShowHint:= FShowButtonHint;
    Hint:= sHintTodosLosRegistros;
    AsignarBitmap(False);
  end;
end;

destructor TLocator.Destroy;
begin
  DestroyButtonFiltrado;
  inherited;
end;

procedure TLocator.DestroyButtonFiltrado;
begin
  FBitmap1.Free;
  FBitmap2.Free;
end;

function TLocator.GetFormFiltrado: TFormFiltrado;
begin
  ValidarFiltroHabilitado;

  if not Assigned(FFormFiltrado) then
    CreateFormFiltrado;

  Result:= FFormFiltrado;
end;

procedure TLocator.MostrarFormFiltrado;
begin
  if FormFiltrado.Query <> (Dataset as TQuery) then
    FormFiltrado.Query := (Dataset as TQuery);
  FormFiltrado.ShowModal;
end;

procedure TLocator.OnButtonFiltrarClick(Sender: TObject);
begin
  if Assigned(FOnFilterButtonClick) then
    FOnFilterButtonClick(Sender)
  else
    MostrarFormFiltrado;
end;

procedure TLocator.OnEditKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    if ssCtrl in Shift then
      MostrarFormFiltrado
    else
      LocateDataset;
  end;
end;

procedure TLocator.SetFiltroHabilitado(const Value: boolean);
begin
  if not (csDesigning in ComponentState) then
  begin
    if not Value
      and ( FFormFiltrado <> nil ) then
      FFormFiltrado.Filtrador.CancelarFiltro;
  end;
  FFiltroHabilitado := Value;
end;

procedure TLocator.ValidarFiltroHabilitado;
begin
  if not FiltroHabilitado then
    raise ELocator.Create(sFiltroNoHabilitado);
end;

procedure TLocator.CreateFormFiltrado;
begin
  FFormFiltrado:= TFormFiltrado.Create(Self);
  FFormFiltrado.Query := (DataSet as TQuery);
  FormFiltrado.Filtrador.OnChangeFiltro := FiltradorChangeFiltro; 
end;

procedure TLocator.SetShowButtonHint(const Value: boolean);
begin
  FShowButtonHint := Value;
  if Assigned(FBotonFiltro) then
    FBotonFiltro.ShowHint:= FShowButtonHint;
end;

function TLocator.GetFiltrador: TFiltradorQuery;
begin
  Result := FormFiltrado.Filtrador;
end;

procedure TLocator.SetFiltrador(const Value: TFiltradorQuery);
begin
  FormFiltrado.Filtrador := Value;
  FormFiltrado.Filtrador.OnChangeFiltro := FiltradorChangeFiltro;
end;

procedure TLocator.FiltradorChangeFiltro(Sender: TObject);
begin
  AsignarBitmap((Sender as TFiltradorQuery).Filtrado);

  if (Sender as TFiltradorQuery).Filtrado then
    FBotonFiltro.Hint:= Trim(Format(sHintEstaFiltrado,
      [(Sender as TFiltradorQuery).Condicion.Text]))
  else
    FBotonFiltro.Hint:= sHintTodosLosRegistros;

  ChangeFiltro;
end;

procedure TLocator.ChangeFiltro;
begin
  if Assigned(FOnChangeFiltro) then
    FOnChangeFiltro(Self, Filtrador);
end;

end.

