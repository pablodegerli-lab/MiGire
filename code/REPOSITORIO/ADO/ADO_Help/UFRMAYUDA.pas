unit uFrmAyuda;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, ComCtrls, StdCtrls, Db, DBTables, ImgList, Buttons, ADODB;

type
  TFrmAyuda = class(TForm)
    StatusBar1: TStatusBar;
    Panel2: TPanel;
    Panel3: TPanel;
    Splitter1: TSplitter;
    TreeView1: TTreeView;
    Bevel1: TBevel;
    RichEdit1: TRichEdit;
    Bevel2: TBevel;
    ImageList1: TImageList;
    Panel1: TPanel;
    Image1: TImage;
    QryAyuda: TADOQuery;
    procedure TreeView1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure TreeView1GetSelectedIndex(Sender: TObject; Node: TTreeNode);
    procedure TreeView1GetImageIndex(Sender: TObject; Node: TTreeNode);
    procedure TreeView1Change(Sender: TObject; Node: TTreeNode);
    function Posicion : integer ;
  private
    FNroProceso: Integer;
    FSistema   : String;
    FConexion: TADOConnection;
    procedure Cargar_Ayuda;
  public
    constructor Create(AOwner: TComponent; ASistema: String; AConexion: TADOConnection);reintroduce; overload;
    constructor Create(AOwner: TComponent; ASistema: String; Proceso: Integer; AConexion: TADOConnection);reintroduce; overload;
  end;

implementation

{$R *.DFM}

constructor TFrmAyuda.Create(AOwner: TComponent; ASistema: String; AConexion: TADOConnection);
begin
  FConexion := AConexion;
  FSistema  := ASistema;
  inherited Create(AOwner);
  QryAyuda.Connection := FConexion;
  QryAyuda.SQL.Clear;
  QryAyuda.SQL.Add('Select * from GIRE.AYUDA');
  QryAyuda.SQL.Add('where SISTEMA = '+ ''''+FSistema+'''');
  QryAyuda.SQL.Add('order by PROCESO,ORDEN');
  Cargar_Ayuda;
end;

constructor TFrmAyuda.Create(AOwner: TComponent; ASistema: String;
  Proceso: Integer; AConexion: TADOConnection);
begin
  FSistema    := ASistema;
  FNroProceso := Proceso;
  FConexion   := AConexion;
  inherited Create(AOwner);
  QryAyuda.Connection := FConexion;
  QryAyuda.SQL.Clear;
  QryAyuda.SQL.Add('Select * from GIRE.AYUDA');
  QryAyuda.SQL.Add('where SISTEMA = '+ ''''+FSistema+'''' + ' and PROCESO = '+IntToStr(Proceso));
  QryAyuda.SQL.Add('order by PROCESO,ORDEN');
  Cargar_Ayuda;
end;

function TFrmAyuda.Posicion : integer ;
var
  Resultado : integer;
begin
  Resultado := 2;
  if QryAyuda.FieldByName('NIVEL2').AsString = '' then
     Resultado := 1;
  if QryAyuda.FieldByName('NIVEL1').AsString = '' then
     Resultado := 0;

  result := Resultado;
end;


procedure TFrmAyuda.TreeView1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var
  nItem : TTreeNode;
  Current : Integer;
  HT : THitTests;
begin
  HT := TreeView1.GetHitTestInfoAt(X,Y);
  if ((htOnlabel in HT) or (htOnIcon in HT))  then
  begin
    nItem := TreeView1.GetNodeAt(x,y);
    Current := nItem.AbsoluteIndex;
    QryAyuda.First;
    QryAyuda.MoveBy(Current);
    StatusBar1.SimpleText:=QryAyuda.FieldByName('LEYENDA').AsString;
  end
  else
    StatusBar1.SimpleText:=' ';
end;

procedure TFrmAyuda.TreeView1GetSelectedIndex(Sender: TObject;
  Node: TTreeNode);
begin
  Node.SelectedIndex := Node.ImageIndex;
end;

procedure TFrmAyuda.TreeView1GetImageIndex(Sender: TObject; Node: TTreeNode);
begin
  if Node.HasChildren then
    if Node.Expanded then
      Node.ImageIndex := 2
    else
      Node.ImageIndex := 0
  else
    Node.ImageIndex := 1;
end;

procedure TFrmAyuda.TreeView1Change(Sender: TObject; Node: TTreeNode);
var
  Current : Integer;
begin
  Current := TreeView1.Selected.AbsoluteIndex ;
  QryAyuda.First;
  QryAyuda.MoveBy(Current);
  RichEdit1.Lines.LoadFromFile(Trim(QryAyuda.FieldByName('ARCHIVO').AsString) );
  if QryAyuda.FieldByName('BMP').AsString <> '' then
  begin
    image1.Picture.LoadFromFile(Trim(QryAyuda.FieldByName('BMP').AsString) );
    Panel1.Visible := true ;
  end
  else
    Panel1.Visible := false ;
end;

procedure TFrmAyuda.Cargar_Ayuda;
var
  Node, Node1 : TTreeNode;
begin
  Node := nil;
  Node1 := nil;
  QryAyuda.Open;
  RichEdit1.Lines.LoadFromFile(QryAyuda.FieldByName('ARCHIVO').AsString);
  while not(QryAyuda.Eof) do
  begin

    Case Posicion() of
      0:
        Node := TreeView1.Items.Add (nil,  QryAyuda.FieldByName('NIVEL0').AsString );

      1:
        Node1 := TreeView1.Items.AddChild (Node, QryAyuda.FieldByName('NIVEL1').AsString );

      2:
        TreeView1.Items.AddChild (Node1, QryAyuda.FieldByName('NIVEL2').AsString );
    end;

    QryAyuda.Next

  end;
  TreeView1.Font.Style:= [fsBold];
end;

end.
