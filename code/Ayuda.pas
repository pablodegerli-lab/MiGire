unit Ayuda;

{$DEBUGINFO OFF}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, ComCtrls, ADODB, Imglist, StdCtrls, DBTables, Variants;

type

  TAyuda = class(TComponent)
  private
    { Private declarations }
    Formulario: TForm;
    FConexion: TADOConnection;
    FProceso: Integer;
    FSistema: String;
    FEsADO: boolean;

    Panel3: TPanel;
    StatusBar1: TStatusBar;
    TreeView1: TTreeView;
    RichEdit1: TRichEdit;
    Image1: TImage;
    QryAyuda: TADOQuery;
    BDEQryAyuda: TQuery;
    ImageList1: TImageList;
    FImagen3: String;
    FImagen1: String;
    FImagen2: String;
    FVerAhora: Boolean;
    FNombreSistema: String;
    FPath: String;
    FEncabezado: String;
    FPathDefault: String;
    FBaseDeDatos: string;

    procedure Cargar_Ayuda;
    function Posicion : integer ;
    procedure SetConexion(const Value: TADOConnection);
    procedure SetProceso(const Value: Integer);
    procedure SetSistema(const Value: String);
    procedure SetImagen1(const Value: String);
    procedure SetImagen2(const Value: String);
    procedure SetImagen3(const Value: String);
    procedure SetVerAhora(const Value: Boolean);
    procedure SetNombreSistema(const Value: string);
    procedure SetEncabezado(const Value: String);
    procedure SetPath(const Value: String);
    procedure SetBaseDeDatos(const Value: string);
  protected
    { Protected declarations }
    procedure MiOnChange(Sender: TObject; Node: TTreeNode);
    procedure MiOnGetImageIndex(Sender: TObject; Node: TTreeNode);
    procedure MiOnGetSelectedIndex(Sender: TObject; Node: TTreeNode);
    procedure MiOnMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
  public
    { Public declarations }
    constructor Create(AOwner : TComponent ) ; override ;
    destructor Destroy ; override ;
    procedure Ejecutar;
  published
    { Published declarations }
    property BaseDeDatos: string read FBaseDeDatos write SetBaseDeDatos;
    property Conexion: TADOConnection  read FConexion write SetConexion;
    property Encabezado: String read FEncabezado write SetEncabezado;
    property Imagen1: String read FImagen1 write SetImagen1;
    property Imagen2: String read FImagen2 write SetImagen2;
    property Imagen3: String read FImagen3 write SetImagen3;
    property NombreSistema: string read FNombreSistema write SetNombreSistema;
    property Path: String read FPath write SetPath;
    property Proceso: Integer read FProceso write SetProceso;
    property Sistema: String read FSistema write SetSistema;
    property VerAhora: Boolean read FVerAhora write SetVerAhora;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Gire', [TAyuda]);
end;

{ TAyuda }

constructor TAyuda.Create(AOwner: TComponent);
var
  i: Integer;
  Temporal: TBitmap;
begin
  for I := 0 to AOwner.ComponentCount -1 do
  begin
    if AOwner.Components[I] is TAyuda then
       raise Exception.Create('No se admite mas de un componente de la clase '
                                     + '"TAyuda" por formulario.');
  end;
  inherited Create(AOwner);
  FNombreSistema := 'Sin Nombre';
  FPathDefault:= 'V:\PRODUC\HELP\';
  FImagen1:= 'BookShut.Bmp';
  FImagen2:= 'HelpIndx.Bmp';
  FImagen3:= 'BookOpen.Bmp';

  ImageList1 := TImageList.Create(Formulario);
  Temporal := TBitmap.Create;
  try
    try
      Temporal.LoadFromFile(FPathDefault+FImagen1);
      ImageList1.AddMasked( Temporal , Temporal.Canvas.Pixels[0,0] );
      Temporal.LoadFromFile(FPathDefault+FImagen2);
      ImageList1.AddMasked( Temporal , Temporal.Canvas.Pixels[0,0] );
      Temporal.LoadFromFile(FPathDefault+FImagen3);
      ImageList1.AddMasked( Temporal , Temporal.Canvas.Pixels[0,0] );
    except
      ShowMessage('No se encontraron las imagenes predefinidas');
    end;
  finally
    Temporal.Free;
  end;
end;

destructor TAyuda.Destroy;
begin
  ImageList1.Free;
  inherited Destroy;
end;

procedure TAyuda.Ejecutar;
var
  Panel1: TPanel;
  Panel2: TPanel;
  Bevel1: TBevel;
  Bevel2: TBevel;
  Spliter: TSplitter;
  Lista: TStringList;
begin
  Formulario:= TForm.Create(Application);
  try
    Formulario.BorderIcons := [biSystemMenu, biMaximize];
    Formulario.BorderStyle := bsSizeable;
    Formulario.Icon.LoadFromFile(FPathDefault+'FORMICON.ICO');
    if FEncabezado = '' then
       Formulario.Caption := 'Ayuda - GIRE S.A. -  ' + Application.Title
    else
       Formulario.Caption := FEncabezado;

    Formulario.ClientHeight:= 369;
    Formulario.ClientWidth:= 643;
    Formulario.Position := poDesktopCenter;

    Panel1:= TPanel.Create(Formulario);
    Panel1.Parent:= Formulario;
    Panel1.Align:= alLeft;
    Panel1.Width:= 193;

    Bevel1:= TBevel.Create(Panel1);
    Bevel1.Parent:= Panel1;
    Bevel1.Align:= alClient;

    Spliter:= TSplitter.Create(Formulario);
    Spliter.Parent:= Formulario;
    Spliter.Height:= 350;
    Spliter.Left:= 195;
    Spliter.Width:= 2;
    Spliter.MinSize:=30;
    Spliter.Cursor:= crHSplit;
    Spliter.Beveled:= True;
    Spliter.ResizeStyle:= rsUpdate;

    Panel2:= TPanel.Create(Formulario);
    Panel2.Parent:= Formulario;
    Panel2.Align:= alClient;

    Bevel2:= TBevel.Create(Panel2);
    Bevel2.Parent:= Panel2;
    Bevel2.Align:= alClient;

    TreeView1:= TTreeView.Create(Panel1);
    TreeView1.Parent:= Panel1;
    TreeView1.Align:= alClient;
    TreeView1.Left:= 1;
    TreeView1.Color:= $00D7FFFC;
    TreeView1.Font.Charset:= DEFAULT_CHARSET;
    TreeView1.Font.Color:= clGreen;
    TreeView1.Font.Height:= -11;
    TreeView1.Font.Name:= 'MS Sans Serif';
    TreeView1.Font.Style:= [];
    TreeView1.HideSelection:= False;
    TreeView1.HotTrack:= True;
    TreeView1.Images:= ImageList1;
    TreeView1.Indent:= 19;
    TreeView1.ParentFont:= False;
    TreeView1.ReadOnly:= True;
    TreeView1.TabOrder:= 0;
    TreeView1.OnChange:= MiOnChange;
    TreeView1.OnGetImageIndex:= MiOnGetImageIndex;
    TreeView1.OnGetSelectedIndex:= MiOnGetSelectedIndex;
    TreeView1.OnMouseMove:= MiOnMouseMove;

    RichEdit1:= TRichEdit.Create(Panel2);
    RichEdit1.Parent:= Panel2;
    RichEdit1.Left:= 1;
    RichEdit1.Top:= 1;
    RichEdit1.Width:= 443;
    RichEdit1.Height:= 348;
    RichEdit1.Align:= alClient;
    RichEdit1.Color:= 16777162;
    RichEdit1.Font.Charset:= DEFAULT_CHARSET;
    RichEdit1.Font.Color:= clWindowText;
    RichEdit1.Font.Height:= -11;
    RichEdit1.Font.Name:= 'MS Sans Serif';
    RichEdit1.Font.Style:= [];
    RichEdit1.ParentFont:= False;
    RichEdit1.ReadOnly:= True;
    RichEdit1.ScrollBars:= ssBoth;
    RichEdit1.TabOrder:= 0;
    RichEdit1.WantReturns:= False;

    Panel3:= TPanel.Create(Panel2);
    Panel3.Parent:= Panel2;
    Panel3.Left:= 8;
    Panel3.Top:= 8;
    Panel3.Width:= 28;
    Panel3.Height:= 28;
    Panel3.AutoSize:= True;
    Panel3.BevelInner:= bvRaised;
    Panel3.TabOrder:= 1;
    Panel3.Visible:= False;

    Image1:= TImage.Create(Panel3);
    Image1.Parent:= Panel3;
    Image1.Left:= 2;
    Image1.Top:= 2;
    Image1.Width:= 24;
    Image1.Height:= 24;
    Image1.AutoSize:= True;
    Image1.Transparent:= True;

    if (FSistema = Null) or (FSistema = '') then
    begin
      MessageBox(Formulario.Handle, PChar('Debe ingresar el Sistema'), PChar('Error'), 16 );
      Abort;
    end;

    if (FConexion = NIL) and (FBaseDeDatos = '') then
    begin
      MessageBox(Formulario.Handle, PChar('Debe ingresar la Conexión o la BaseDeDatos.'), PChar('Error'), 16 );
      Abort;
    end;

    if FBaseDeDatos <> '' then
      FEsADO := False
    else
      FEsADO := True;

    Lista := TStringList.Create;
    try
      if FProceso = 0 then
      begin
        Lista.Add('Select * from GIRE.AYUDA where UPPER(SISTEMA) = UPPER('+ ''''+FSistema+''''+')');
        Lista.Add('order by PROCESO,ORDEN');
      end
      else
      begin
        Lista.Add('Select * from GIRE.AYUDA');
        Lista.Add('where UPPER(SISTEMA) = UPPER('+ ''''+FSistema+'''' + ') and PROCESO = '+IntToStr(FProceso));
        Lista.Add('order by PROCESO,ORDEN');
      end;

      if FEsADO then
      begin
        QryAyuda:= TADOQuery.Create(Formulario);
        QryAyuda.Connection := FConexion;
        QryAyuda.SQL.Assign(Lista);
      end
      else
      begin
        BDEQryAyuda := TQuery.Create(Formulario);
        BDEQryAyuda.DatabaseName := FBaseDeDatos;
        BDEQryAyuda.SQL.Assign(Lista);
      end;
    finally
      Lista.Free;
    end;

    StatusBar1:= TStatusBar.Create(Formulario);
    StatusBar1.Parent:= Formulario;
    StatusBar1.Left:= 0;
    StatusBar1.Top:= 350;
    StatusBar1.Width:= 643;
    StatusBar1.Height:= 19 ;
    StatusBar1.Color:= clSilver;
    StatusBar1.Font.Charset:= ANSI_CHARSET;
    StatusBar1.Font.Color:= clBlack;
    StatusBar1.Font.Height:= -11;
    StatusBar1.Font.Name:= 'MS Sans Serif';
    StatusBar1.Font.Style:= [fsBold];
    StatusBar1.SimplePanel:= False;
    StatusBar1.UseSystemFont:= False;

    Cargar_Ayuda;
    Formulario.ShowModal;
  finally
    Formulario.Free;
  end;

end;

procedure TAyuda.Cargar_Ayuda;
var
  Node, Node1, Node2 : TTreeNode;
begin
  Node := nil;
  Node1 := nil;
  Node2 := nil;

  if FEsADO then
  begin
    QryAyuda.Open;
    while not(QryAyuda.Eof) do
    begin
      Case Posicion() of
        0: Node := TreeView1.Items.Add (nil,  QryAyuda.FieldByName('NIVEL0').AsString );
        1: Node1 := TreeView1.Items.AddChild (Node , QryAyuda.FieldByName('NIVEL1').AsString );
        2: Node2 := TreeView1.Items.AddChild (Node1, QryAyuda.FieldByName('NIVEL2').AsString );
        3: TreeView1.Items.AddChild (Node2, QryAyuda.FieldByName('NIVEL3').AsString );
      end;
      QryAyuda.Next;
    end;
  end
  else
  begin
    BDEQryAyuda.Open;
    while not(BDEQryAyuda.Eof) do
    begin
      Case Posicion() of
        0: Node := TreeView1.Items.Add (nil,  BDEQryAyuda.FieldByName('NIVEL0').AsString );
        1: Node1 := TreeView1.Items.AddChild (Node , BDEQryAyuda.FieldByName('NIVEL1').AsString );
        2: Node2 := TreeView1.Items.AddChild (Node1, BDEQryAyuda.FieldByName('NIVEL2').AsString );
        3: TreeView1.Items.AddChild (Node2, BDEQryAyuda.FieldByName('NIVEL3').AsString );
      end;
      BDEQryAyuda.Next;
    end;
  end;

  TreeView1.Font.Style:= [fsBold];
end;

procedure TAyuda.MiOnChange(Sender: TObject; Node: TTreeNode);
var
  Current : Integer;
  Ref_BMP, Ref_ARCHIVO: string;
begin
  Current := TreeView1.Selected.AbsoluteIndex ;
  if Current <> 0 then
  begin
    if FEsADO then
    begin
      QryAyuda.First;
      QryAyuda.MoveBy(Current);
      Ref_BMP := QryAyuda.FieldByName('BMP').AsString;
      Ref_ARCHIVO := QryAyuda.FieldByName('ARCHIVO').AsString;
    end
    else
    begin
      BDEQryAyuda.First;
      BDEQryAyuda.MoveBy(Current);
      Ref_BMP := BDEQryAyuda.FieldByName('BMP').AsString;
      Ref_ARCHIVO := BDEQryAyuda.FieldByName('ARCHIVO').AsString;
    end;

    if (Ref_BMP <> '') and FileExists(FPath+Ref_BMP) then
    begin
      Panel3.Visible:= True;
      image1.Picture.LoadFromFile(FPath+Ref_BMP);
    end
    else
      Panel3.Visible:= False;

    if (Ref_ARCHIVO <> '') and FileExists(FPath+Ref_ARCHIVO) then
       RichEdit1.Lines.LoadFromFile(FPath + Ref_ARCHIVO)
    else
    begin

       if FileExists(FPathDefault+'GIRE.ICO') then
       begin
         Panel3.Visible:= True;
         image1.Picture.LoadFromFile(FPathDefault+'GIRE.ICO');
       end;

       if FileExists(FPathDefault+'GIRE.RTF') then
          RichEdit1.Lines.LoadFromFile(FPathDefault+'GIRE.RTF');

       RichEdit1.Lines.Add('      ' +FNombreSistema);
     end;
  end
  else
  begin
    if FileExists(FPathDefault+'GIRE.ICO') then
    begin
      Panel3.Visible:= True;
      image1.Picture.LoadFromFile(FPathDefault+'GIRE.ICO');
    end;

    if FileExists(FPathDefault+'GIRE.RTF') then
       RichEdit1.Lines.LoadFromFile(FPathDefault+'GIRE.RTF');

    RichEdit1.Lines.Add('      ' +FNombreSistema);
  end;
end;

procedure TAyuda.MiOnGetImageIndex(Sender: TObject; Node: TTreeNode);
begin
  if Node.HasChildren then
     if Node.Expanded then
        Node.ImageIndex:= 2
     else
        Node.ImageIndex:= 0
  else
     Node.ImageIndex:= 1;
end;

procedure TAyuda.MiOnGetSelectedIndex(Sender: TObject; Node: TTreeNode);
begin
  Node.SelectedIndex := Node.ImageIndex;
end;

procedure TAyuda.MiOnMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
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
    if FEsADO then
    begin
      QryAyuda.First;
      QryAyuda.MoveBy(Current);
      StatusBar1.SimpleText:=QryAyuda.FieldByName('LEYENDA').AsString
    end
    else
    begin
      BDEQryAyuda.First;
      BDEQryAyuda.MoveBy(Current);
      StatusBar1.SimpleText:=BDEQryAyuda.FieldByName('LEYENDA').AsString;
    end;
  end
  else
    StatusBar1.SimpleText:=' ';
end;

procedure TAyuda.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited Notification(AComponent,Operation);
  if ((Operation = opRemove) and (AComponent = Conexion) and (FConexion <> Nil)) then
      Conexion:=Nil;
end;

function TAyuda.Posicion: integer;
var
  Resultado : integer;
begin
  Resultado := 3;
  if FEsADO then
  begin
    if QryAyuda.FieldByName('NIVEL3').AsString = '' then
       Resultado := 2;
    if QryAyuda.FieldByName('NIVEL2').AsString = '' then
       Resultado := 1;
    if QryAyuda.FieldByName('NIVEL1').AsString = '' then
       Resultado := 0;
  end
  else
  begin
    if BDEQryAyuda.FieldByName('NIVEL3').AsString = '' then
       Resultado := 2;
    if BDEQryAyuda.FieldByName('NIVEL2').AsString = '' then
       Resultado := 1;
    if BDEQryAyuda.FieldByName('NIVEL1').AsString = '' then
       Resultado := 0;
  end;

  result := Resultado;
end;

procedure TAyuda.SetConexion(const Value: TADOConnection);
begin
  if FConexion <> Value then
  begin
    FBaseDeDatos := '';
    FConexion := Value;
  end;
end;

procedure TAyuda.SetProceso(const Value: Integer);
begin
  FProceso := Value;
end;

procedure TAyuda.SetSistema(const Value: String);
begin
  FSistema := Value;
end;

procedure TAyuda.SetImagen1(const Value: String);
var
   BmpTemp: TBitmap;
   IcoTemp: TIcon;
begin
  if FImagen1 <> Value then
  begin
     if FileExists(FPath+Value) then
     begin
        if UpperCase(ExtractFileExt(Value)) = '.BMP' then
        begin
           BmpTemp := TBitmap.Create;
           try
             BmpTemp.LoadFromFile(FPath+Value);
             if (BmpTemp.Height > 32) or (BmpTemp.Width > 32) then
                ShowMessage('Tamaño de imagen no admitido.')
             else
             begin
                ImageList1.InsertMasked( 0, BmpTemp , BmpTemp.Canvas.Pixels[0,0] );
                ImageList1.Delete(1);
                FImagen1 := Value;
             end;
           finally
             BmpTemp.Free;
           end;
        end
        else if UpperCase(ExtractFileExt(Value)) = '.ICO' then
        begin
           IcoTemp := TIcon.Create;
           try
              IcoTemp.Transparent:= True;
              IcoTemp.LoadFromFile(FPath+Value);
              if (IcoTemp.Height > 32) or (IcoTemp.Width > 32) then
                 ShowMessage('Tamaño de imagen no admitido.')
              else
              begin
                 ImageList1.InsertIcon(0,IcoTemp);
                 ImageList1.Delete(1);
                 FImagen1 := Value;
              end;
           finally
              IcoTemp.Free;
           end;
        end
        else
           ShowMessage('Archivo con extensión inválida.');
     end
     else
        ShowMessage('No se localizó el archivo.'+#13#10+'El path de la Imagen debe coincidir con la propiedad PATH');
  end;
end;

procedure TAyuda.SetImagen2(const Value: String);
var
   BmpTemp: TBitmap;
   IcoTemp: TIcon;
begin
  if FImagen2 <> Value then
  begin
     if FileExists(FPath+Value) then
     begin
        if UpperCase(ExtractFileExt(Value)) = '.BMP' then
        begin
           BmpTemp := TBitmap.Create;
           try
             BmpTemp.Transparent:= True;
             BmpTemp.LoadFromFile(FPath+Value);
             if (BmpTemp.Height > 32) or (BmpTemp.Width > 32) then
                ShowMessage('Tamaño de imagen no admitido.')
             else
             begin
                ImageList1.InsertMasked( 1, BmpTemp , BmpTemp.Canvas.Pixels[0,0] );
                ImageList1.Delete(2);
                FImagen2 := Value;
             end;
           finally
             BmpTemp.Free;
           end;
        end
        else if UpperCase(ExtractFileExt(Value)) = '.ICO' then
        begin
           IcoTemp := TIcon.Create;
           try
              IcoTemp.Transparent:= True;
              IcoTemp.LoadFromFile(FPath+Value);
              if (IcoTemp.Height > 32) or (IcoTemp.Width > 32) then
                 ShowMessage('Tamaño de imagen no admitido.')
              else
              begin
                 ImageList1.InsertIcon(1,IcoTemp);
                 ImageList1.Delete(2);
                 FImagen2 := Value;
              end;
           finally
              IcoTemp.Free;
           end;
        end
        else
           ShowMessage('Archivo con extensión inválida.');
     end
     else
        ShowMessage('No se localizó el archivo.'+#13#10+'El path de la Imagen debe coincidir con la propiedad PATH');
  end;
end;

procedure TAyuda.SetImagen3(const Value: String);
var
   BmpTemp: TBitmap;
   IcoTemp: TIcon;
begin
  if FImagen3 <> Value then
  begin
     if FileExists(FPath+Value) then
     begin
        if UpperCase(ExtractFileExt(Value)) = '.BMP' then
        begin
           BmpTemp := TBitmap.Create;
           try
             BmpTemp.Transparent:= True;
             BmpTemp.LoadFromFile(FPath+Value);
             if (BmpTemp.Height > 32) or (BmpTemp.Width > 32) then
                ShowMessage('Tamaño de imagen no admitido.')
             else
             begin
                ImageList1.InsertMasked( 2, BmpTemp , BmpTemp.Canvas.Pixels[0,0] );
                ImageList1.Delete(3);
                FImagen3:= Value;
             end;
           finally
             BmpTemp.Free;
           end;
        end
        else if UpperCase(ExtractFileExt(Value)) = '.ICO' then
        begin
           IcoTemp := TIcon.Create;
           try
              IcoTemp.Transparent:= True;
              IcoTemp.LoadFromFile(FPath+Value);
              if (IcoTemp.Height > 32) or (IcoTemp.Width > 32) then
                 ShowMessage('Tamaño de imagen no admitido.')
              else
              begin
                 ImageList1.InsertIcon(2,IcoTemp);
                 ImageList1.Delete(3);
                 FImagen3:= Value;
              end;
           finally
              IcoTemp.Free;
           end;
        end
        else
           ShowMessage('Archivo con extensión inválida.');
     end
     else
        ShowMessage('No se localizó el archivo.'+#13#10+'El path de la Imagen debe coincidir con la propiedad PATH');
  end;
end;

procedure TAyuda.SetVerAhora(const Value: Boolean);
begin
  if Value then
     Ejecutar;
  FVerAhora := False;
end;

procedure TAyuda.SetNombreSistema(const Value: string);
begin
  FNombreSistema := Value;
end;

procedure TAyuda.SetEncabezado(const Value: String);
begin
  FEncabezado := Value;
end;

procedure TAyuda.SetPath(const Value: String);
begin
  if Value <> '' then
  begin
     if Copy(Value,Length(Value), Length(Value)-1) <> '\' then
        FPath := Value + '\'
     else
        FPath := Value;
  end
  else
     FPath:= FPathDefault;
end;

procedure TAyuda.SetBaseDeDatos(const Value: string);
begin
  if FBaseDeDatos <> Value then
  begin
    FConexion := nil;
    FBaseDeDatos := Value;
  end;
end;

end.

