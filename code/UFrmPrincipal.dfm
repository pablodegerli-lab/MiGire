inherited FrmPrincipal: TFrmPrincipal
  Left = 369
  Top = 87
  VertScrollBar.Range = 0
  VertScrollBar.Style = ssHotTrack
  ActiveControl = DbGrillaDistribuciones
  BorderStyle = bsSingle
  Caption = 'Principal'
  ClientHeight = 464
  ClientWidth = 759
  WindowState = wsMaximized
  OnActivate = FormActivate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar1: TStatusBar
    Top = 442
    Width = 759
    Height = 22
  end
  inherited Panel1: TPanel
    Width = 759
    inherited ToolBarEspecifica: TToolBar
      Width = 729
      Hint = 
        'Acceda a las opciones a trav'#233's de la barra de herramientas o del' +
        ' men'#250' asociado'
      HotImages = Imagenes.Chicas
      OnDblClick = ToolBarEspecificaDblClick
      object TBGeneraArchivos: TToolButton
        Left = 0
        Top = 0
        Action = GenerarArchivos
      end
      object TBCopiaATrx: TToolButton
        Left = 28
        Top = 0
        Action = CopiaATrx
      end
      object TBVueltaAtras: TToolButton
        Left = 56
        Top = 0
        Action = VolverAtras
      end
      object ToolButton3: TToolButton
        Left = 84
        Top = 0
        Width = 8
        Caption = 'ToolButton3'
        ImageIndex = 2
        Style = tbsSeparator
      end
      object TBConsultaDistribuciones: TToolButton
        Left = 92
        Top = 0
        Action = ConsultarDistribuciones
      end
      object ToolButton1: TToolButton
        Left = 120
        Top = 0
        Action = ListarDetalleFacturacion
      end
      object ToolButton5: TToolButton
        Left = 148
        Top = 0
        Width = 8
        Caption = 'ToolButton5'
        ImageIndex = 46
        Style = tbsSeparator
      end
      object TBCambioClave: TToolButton
        Left = 156
        Top = 0
        Action = CambiarClave
      end
      object TBDefinirImpresora: TToolButton
        Left = 184
        Top = 0
        Action = DefinirImpresora
      end
      object TBAyudaSistema: TToolButton
        Left = 212
        Top = 0
        Action = CargarAyuda
      end
    end
    inherited ToolBarGeneral: TToolBar
      Left = 729
      HotImages = Imagenes.Chicas
    end
  end
  object Panel2: TPanel [2]
    Left = 0
    Top = 29
    Width = 759
    Height = 323
    Align = alClient
    TabOrder = 2
    object Panel6: TPanel
      Left = 1
      Top = 1
      Width = 757
      Height = 23
      Align = alTop
      BevelOuter = bvNone
      Caption = 'Panel6'
      TabOrder = 0
      object Panel5: TPanel
        Left = 0
        Top = 0
        Width = 757
        Height = 23
        Hint = 'Busque r'#225'pidamente la distribuci'#243'n por medio del localizador'
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object Label2: TLabel
          Left = 212
          Top = 3
          Width = 111
          Height = 17
          AutoSize = False
          Caption = 'B'#250'squeda r'#225'pida:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          ParentFont = False
        end
        object Image1: TImage
          Left = 324
          Top = 2
          Width = 27
          Height = 19
          Center = True
          Picture.Data = {
            0954474946496D6167655B00000047494638396115001400910000FFFF00D6D3
            CE0000000000002C00000000150014000002348C8FA9CBED0F1D5013827AAED5
            99B7EB81D82256E5270A41A992A0A0A62D75C1C63BD3F60DEC4C9F0342720662
            E4884C2A97C802003B}
          Stretch = True
          Transparent = True
        end
        object Label3: TLabel
          Left = 4
          Top = 3
          Width = 92
          Height = 16
          Caption = 'Distribuciones:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          ParentFont = False
        end
        object LCantDistri: TLabel
          Left = 101
          Top = 3
          Width = 51
          Height = 16
          Caption = 'Cantidad'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object LocalizadorDistribucion: TLocator
          Left = 352
          Top = 0
          Width = 405
          Height = 23
          Align = alRight
          AutoSize = True
          BevelOuter = bvRaised
          Constraints.MaxHeight = 23
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Pitch = fpFixed
          Font.Style = []
          Locked = True
          ParentFont = False
          TabOrder = 0
          CenterPosition = 145
          DataSource = DSDistribuciones
          AutoGetFields = False
          LocateOptions = [loCaseInsensitive, loPartialKey]
          FiltroHabilitado = False
        end
      end
    end
    object Panel7: TPanel
      Left = 1
      Top = 24
      Width = 757
      Height = 298
      Align = alClient
      BevelOuter = bvLowered
      Caption = 'Panel7'
      TabOrder = 1
      object DbGrillaDistribuciones: TRxDBGrid
        Left = 1
        Top = 1
        Width = 755
        Height = 296
        Hint = 
          'Si hace doble click sobre una distribuci'#243'n generar'#225' los archivos' +
          ' para la empresa'
        Align = alClient
        BorderStyle = bsNone
        Color = clWhite
        DataSource = DSDistribuciones
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        PopupMenu = PMGema
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clNavy
        TitleFont.Height = -11
        TitleFont.Name = 'Arial'
        TitleFont.Style = [fsBold]
        OnDrawColumnCell = DbGrillaDistribucionesDrawColumnCell
        OnDblClick = DbGrillaDistribucionesDblClick
        TitleButtons = True
        OnTitleBtnClick = DbGrillaDistribucionesTitleBtnClick
        Columns = <
          item
            Expanded = False
            FieldName = 'EMPRESA'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Pitch = fpFixed
            Font.Style = []
            Title.Alignment = taCenter
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RAZONSOCIAL'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Pitch = fpFixed
            Font.Style = []
            Title.Alignment = taCenter
            Width = 255
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'PROCESO'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Pitch = fpFixed
            Font.Style = []
            Title.Alignment = taCenter
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRIPCION'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Pitch = fpFixed
            Font.Style = []
            Title.Alignment = taCenter
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'ULTFHPROCESO'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Pitch = fpFixed
            Font.Style = []
            Title.Alignment = taCenter
            Width = 64
            Visible = True
          end>
      end
    end
  end
  object Panel3: TPanel [3]
    Left = 0
    Top = 352
    Width = 759
    Height = 90
    Align = alBottom
    TabOrder = 3
    object Degrade1: TDegrade
      Left = 1
      Top = 1
      Width = 757
      Height = 88
      Hint = 'GEMA (ex DISEMP)'
      ColorDesde = 10581248
      ColorHasta = clWhite
      Align = alClient
    end
    object Label1: TLabel
      Left = 40
      Top = 33
      Width = 559
      Height = 38
      Caption = 'GEMA - Generaci'#243'n y Emisi'#243'n de Archivos'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -27
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      Transparent = True
    end
    object Image2: TImage
      Left = 657
      Top = 9
      Width = 54
      Height = 70
      AutoSize = True
      Picture.Data = {
        0954474946496D616765C310000047494638396136004600F70000FFFFFF0808
        082E2E2E3737374141415454547171718D8D8DA0A0A0AAAAAAB3B3B3BDBDBDC6
        C6C6D0D0D0D9D9D9EDEDEDF6F6F6EDE3E3F6EDEDFFF6F6C6BDBDE3D9D9B3AAAA
        BDB3B3847A7A978D8D7A7171675D5DF6E3E35D5454716767D9C6C6E3D0D0EDD9
        D9544B4BB3A0A0BDAAAAC6B3B3AA9797372E2EFFE3E3F6D9D98D7A7A978484ED
        D0D02E2525847171E3C6C6D0B3B37A6767C6AAAA715D5DB39797675454251B1B
        5D4B4BAA8D8DA084848D71711108084B37378467677A5D5D372525674B4B9771
        715D41412E1B1B5437377A54544B2E2E2511114125250000001B0808C0C0C037
        1B1B1100000000002508080800002E0808110000000000080000000000000000
        0800000000000000000000005D413754372E4B2E252508008D716741251B9784
        7A4B372E251108080000D9C6BD8D7A71412E25D0BDB3AA978D847167251B11F6
        EDE3D9D0C6AAA0978D847A41372E080000D9D9D0AAAAA0BDBDB37171672E2E25
        25251B0808000000000000008D978DEDF6F6AAB3B3374141F6F6FFBDBDC6D0D0
        D9E3D9F6B3AABD847A8DEDE3EDF6EDF6FFF6FFC6BDC6D0C6D0E3D9E3B3AAB3A0
        97A0BDB3BD8D848D7A717A675D67FFEDFFD9C6D9BDAABDD9BDD9251B258D718D
        544154110811251125412541EDC6E3C6A0BDD0B3C6C6AABDAA8DA0A084978467
        7A7A5D715D4154371B2E110008080000D9BDD0B397AA8D71844125371B0011E3
        C6D9BDA0B325081BEDD9E3C6B3BDA08D977A67712E1B25080000F6E3EDFFEDF6
        D9C6D0D0BDC6B3A0AAAA97A084717A67545DF6D0E35D4B54D0AABD412E378D67
        7A6741541B0811000000E3D0D9BDAAB397848D715D67EDC6D94B3741A07A8D71
        4B5D542E41000000D9AABD411125F6D9E3AA8D978467715D414B371B25110000
        FFE3EDD9BDC6B397A08D717A674B5441252E1B0008000000EDD0D9C6AAB3BDA0
        AAA0848D977A847A5D6771545D5437414B2E372E111B250811080000000000D9
        B3BDB38D978D6771411B251B0000F6D0D9E3BDC6C6A0AAAA848D845D677A545D
        714B54542E371100000800004B1B255D2E3741111B000000B6B6B621F9040100
        004B002C00000000360046004008FF0097081C48B0A0C1810B122E38C8B061C3
        0527EC801812838A2B25CA88556B92CE96AD2CE8B85D1B52E54429008B568C20
        61C2571624617A3041B70E1785850C49DD2A77E4C63754E2B27DF20460D60825
        1978D4F0516E020B194FAC58C902400C110EE0CA8D3B97E517117159CE696B97
        8DD6840E98E8E05C32CB9C3A67C4FCDDE291C9561E5C00DE00CB22E11E00203A
        C2F03A66E21B366CD37485BB350243966AE5CCA52B268BC2AB24B48011CB5045
        CA089C8D62D55274E80103070FFE005044838998333E985C3BE78D541610F572
        D003622B04167F794A8C88834C542A4B8C6ED5FA76E8D00E11B7262458BBC040
        1A2E5C4498DBA1ACD320448514FDFF6A46AD5AAC54C68E8D42B569112B51E88C
        990B492EDDAF73BACC899000E2C8090E26C44047056B19B4402C6D7C80C313E6
        940287043620A38231A980E2092F8BC8828A34B98492CA3AEE34C3043ED7C093
        0D3B394C314D0BB814E89041B144F0CA04AF98C3040C5C085185151C4CC0C635
        34C262C421B6F0D00D0A5C78B1C60F74BCE8A44314940182122A3471CD0AA988
        43E0935C1644002CB980520C3CD56CF4CB3AE758F34308E080930B00A4D440CE
        3DE1E450CA25B174399002264C20CE21DB00718E10C690B0CB11AFC0928535CA
        1423C5175C0021030A2AE0804C35EBA4630239D908A10E53DAC0C3CD39D48030
        818B595023440E4348518608648CFF91C60A33D09A8412531C618D35DE4C2382
        2DE694F30D37DA4C230E08BC6C538E3A2B7C930537CA50438B11E95C904D1212
        94819032111C52CB2115345088058750C04B3A4A04AB4D2F9FB0D2492AC76463
        0933C15C930022374D400C164AA4B341020C003008041348404C91C798431D00
        B848C0CB238744C2C71F7FB821C135D300D18E36472831842FC8BC12CC3448D0
        308638F030518F3C42C0C32035B1B0C103373C347143166558408141B328B342
        35F75481061B6C4C40420D3528714F34E6E8728B279B58F8C927B644F24934D3
        FC9285AEE09813C32F138450CE0F4700D12497494CA07611697841830E427CE1
        433E5458A1850E26E448043FD9C4FF930E3D4FD1F001142BDC92909E0EA94501
        D9624CB0C2CD5384A0082CB7C42201308B5480F8E6072D30850658702EFA0219
        F09241121868800116A524014C1EA4E8E2462C2E48704B25184CB78002A20F94
        C1237218A38131C00080650CD41073C4A2597455432DAECC62CC0453B0400F58
        D890D3A08B0E25040C308ECFD04D3ADB8CA33C2FBAECB20B2ED56421C513EB60
        C10309C03061CE2F3748D3CD30D3F4304E36E908813452A1800B1C4401FED880
        0B6240827B682108F0D0410D62A00D7194C018DCF8C6357EC10421C8A40B3730
        C21126F08271A0234DE318823AE0210423FCE209F698C0104A8100822CA01C2C
        E88510B6610B2898C30A3930430AFF9EE30165D082245AE0010526408E1F58E3
        064D0002077C10836ADCA01CF8490C3740B10D2EEC431C3180C209F0E000DE09
        4404E3F0C1140040023D50CF06C02081DA40308535A8030BE6388239A6918A72
        606304E198C60CAC610E6A78631D53408608B0F08D6F40A10522680231CE7103
        5F1C21033859C00EB0E0B0612422018548442D40B1896C886015DCF8C4242C11
        094A1CE318CB20C738A4D18A490C02161898001686C0471188000011501B0422
        900465A4021C2348C4122E10005ADCE2158688C00220A088424C401254D0410F
        42828C5374A217C8F804397EB18C71D8E310AF58C4031421C32C6C630A8FC085
        242850084354E010B7B0012F7061FFB8812C02171648C40400D1073E00A01087
        80021CCE208414C8E305DC18829542108E6CF4C01E42384213DE1083293C210A
        E433C72114810B5A9C4351C4F040041490001B2EE0023EC0813F60B19A400882
        119588C42634C10C518442148C48053952D18C5988830433700710B8418E79D8
        421BE6B88739C4A18411DC600C52504219E840073312040A5B80C12B68D02C58
        284212B600803758910D691C621DB3D0842640A1084F506213A308CA2174300E
        127063054A38841C27C00D2BBCE003A77A082430618E2A44E5085A6883382020
        8004A40219DF6807231E018A482002149D80C538B001037BDC4308ED60460ED2
        010476E823051428C102CEE6A43CFF6061023290420A26E0053610A129D83047
        367C710252304109E1B8C734C6110E7A980304D678C238BA01025CC4A29F9BA3
        830227D0861158210DBA99803E80300478F0400928005B3758400D6E88E30561
        484119D2F0815BF4CE2090304604723184093CC10C2188010A26700D0EBCC216
        26088110A03006601CEEBE2FD2401C6A3005A90CF803D6A0002E0CA18B453C18
        C25D5A800372418D6DF06006BAF02A885F94C902040001CDF447066281000424
        4404795A31439C8085613883144AF0852F7EE084743881142E0086083C000C52
        286318AF0881080E046201208000BED0850A7E108B5F28A11CA520C636AAB80E
        6FD4A216A910810BAC600E6EA003FF00B738C494B9E7A405806003B128431900
        E00427A8630ADE18063064318E598C8302D1B005299C900A494C010B5318C738
        4A900E1740A109DC70309D19B281215CE0605080822CB6E10A62388307AFA845
        296A90852998800613D005650E01826FD443054740D334B6410DAFE962D30879
        440562D11F15546306E6C0865FB5518C2A3801182620C211ECA60523544309D7
        46873C54C08D1C64431BE3D0C62FAC910D1E0CA1181700B6E326508E69744308
        E95807380E218E69E4421C1C380629FA01042078010867E8010DC2108D2CACA3
        094738843590400D6A74E31EE860422C8E0102EE09203A2470410FB260046D80
        E31AA558C1315AC0816BA4A21AB5FFB00510B640041CD080045A20023CC6610C
        779B0363445093379E010F12E10203C3C0004286200D76B84307D7E8063C7E40
        82115020092B480016685185211C81043DE8413888B0D474F8E00520680239B6
        C10D17642315E3D8062FF0918D7AD8C3053FF8010510E08681D4200C2EA0411A
        C2300326F05D0A3E50811B463085245441099972C72FC61103606CB31CE40807
        58CCB18D73C4801BD99846293C958E738CC40304B8800105D284196C030E4258
        036FA130056EA4A10D2A1882126C20EA3C1A411CE0EEC1AECFC18D6DC8421BE5
        B0463AB2208B7264030B2AE005149C71846E00E01B8C58014E44508F74608118
        778A05300E418B428400032BA841FF1BA4F0021D0061061A08CA36A6210D2C80
        601CC538C4300E990E6E40C116A9B8C0049CB0035AD8A00CAD670238B103D9D0
        0B58E00CFE7001BAC0001E710BB0700222600387F009AD600EA2C00AB2100E92
        360EAD100B14600C14400187400ABB200E2A800CCF130100E00C36000055400C
        2A200526C00003E10FCE60086935010A00018B700DE3500BA3900EAE100BA8F0
        0BADD00A9DF053CBB05CC1800ABAA0080E80174A70021E1002BB200B87000087
        E00092C067A5900DBB200D882010016003B6107FAF4001178008720001B7C04B
        31F0034C500D87800A86E009E3800CCCE00ECBB00CD7600C19D0006D0000C490
        0543400BEBC308AFA00891300100FF900BB0A00218E0048D700079F000581001
        8A000000900881A01A5D280642400662205520900AAD400ADA900DF3B08A4000
        0218500B11200113500355A00E9DF0497F900A13D01C1C500036A00CB196498C
        E001B080500BD00782B01A15300371000445C005AA800AEA300BC0C0209B320F
        5190032ED0047A20024E10061F030CA0D007880000A9700B20000E2200099CC8
        006B41070F700C879008221008867008AAE1042B400146005F5EA0054CC004D8
        300B34300E4BF802506004FA70043AF005D01012D4800CC6F0011BD00D37C00D
        6B400C00D05504A1008A600B8E200BC4700885C0070F301DB1D023E7A015A790
        0ABC800CC1000AAA700E23300FF7FF1006E7D0718885033ED0722E600220600E
        42C00440B4025C65431DE00261A0062B905692800A839008BC60099D550DA300
        0AA06009D1B009B7A00AAA000BC65203F8D00CFA400DEC400D3D400ADC9004E6
        F0032E50023C30062E10822E720166D0055BC00D4A3003C4900992900AB87008
        BBF009BFB00AB0600C92500AA5E0099F800AA8100AE6600B47C003F07004D420
        02C0E0067030012830026B60054E41016EB03B068101D7D01CF0F03821500213
        503344A00F3230021FA00200000A93F009DE910BB7800B9E200AEA400D43600D
        7880059C384CD7400231D00364000516D0102BC0674C90055AE0572400001350
        0220500CD3B302E1B00985101EA7FF700CB66008D4200DCD905C31E00E460004
        4FC09E6A740F3F5006C026100A300C31700320A0055CA004721701CA70018910
        0E91D98EB1600C91D90AC7C008C1700AF4402D392004F4800FF5100FEE800444
        20805C62010B60344FB0064D706937F03887900DBF200D17000947C00D85140E
        F2D00E13900D39D00CD5C0021A0803AEE004B7B0337AB2007850345E600663E0
        0513C036F60002F69003567204F8000342500FFD867BE1000ED3C01C40E2010A
        F0615CB200091002D790064040024C500441B00FF4A08D5260043C2004542004
        40F0A0D7400348B00E4CC00E30D0583CD006F5F92403C20112300E54300E2C00
        0451B03C24344700A00B11EA5C46A0600448200555B0067BFA247BD00807F203
        C3A00213D09E2290073FA0366C000287A009EC200354700DD7F0031D30A99BB3
        0022700865A003009005379006591006317001B79001C54001D7700347F0198D
        A0630DB10690A505B63A017100023BC00ABE000088E00889C0AA20365B2A4002
        6F30052F5006D10002D23071964AAC5B6A0108100B3C800385E474A629AE3DBA
        032B30045ACAAE3DAA0C2A263A0101003B}
      Transparent = True
    end
  end
  inherited ActionList1: TActionList
    Left = 8
    Top = 279
    object GenerarArchivos: TAction
      Category = 'Principal'
      Caption = 'Generaci'#243'n de Archivos'
      Hint = 'Generaci'#243'n de Archivos'
      ImageIndex = 24
      OnExecute = GenerarArchivosExecute
    end
    object CopiaATrx: TAction
      Category = 'Principal'
      Caption = 'Copiar a Transmisi'#243'n'
      Hint = 'Copiar a Transmisi'#243'n'
      ImageIndex = 44
      OnExecute = CopiaATrxExecute
    end
    object ConsultarDistribuciones: TAction
      Category = 'Especiales'
      Caption = 'Consulta de Distribuciones Realizadas'
      Hint = 'Consulta de Distribuciones Realizadas'
      ImageIndex = 45
      OnExecute = ConsultarDistribucionesExecute
    end
    object CargarAyuda: TAction
      Category = 'Sistema'
      Caption = 'Ayuda del Sistema'
      Hint = 'Ayuda del Sistema'
      ImageIndex = 41
      OnExecute = CargarAyudaExecute
    end
    object DefinirImpresora: TAction
      Category = 'Sistema'
      Caption = '&Seleccionar Impresora'
      Hint = 'Seleccionar Impresora'
      ImageIndex = 13
      OnExecute = DefinirImpresoraExecute
    end
    object ImprimirResumen: TAction
      Category = 'Principal'
      Caption = 'Resumen de Distribuciones'
      Hint = 'Resumen de Distribuciones'
      ImageIndex = 8
    end
    object VolverAtras: TAction
      Category = 'Principal'
      Caption = 'Vuelta Atr'#225's '#218'ltima Generaci'#243'n de Archivos'
      Hint = 'Vuelta atr'#225's de la '#250'ltima generaci'#243'n de Archivos'
      ImageIndex = 47
      OnExecute = VolverAtrasExecute
    end
    object CambiarClave: TAction
      Category = 'Sistema'
      Caption = 'Cambio de Contrase'#241'a'
      Hint = 'Cambio de Contrase'#241'a'
      ImageIndex = 49
      OnExecute = CambiarClaveExecute
    end
    object ListarDetalleFacturacion: TAction
      Category = 'Especiales'
      Caption = 'Detalle de Facturaci'#243'n a Empresa'
      Hint = 'Detalle de Facturaci'#243'n a Empresa'
      ImageIndex = 42
      OnExecute = ListarDetalleFacturacionExecute
    end
  end
  inherited MainMenu1: TMainMenu
    Left = 40
    Top = 279
    inherited MnuPrincipal: TMenuItem
      object GeneracindeArchivos1: TMenuItem [0]
        Action = GenerarArchivos
      end
      object CopiaraTransmisin1: TMenuItem [1]
        Action = CopiaATrx
      end
      object VueltaAtrsltimoGeneracindeArchivos1: TMenuItem [2]
        Action = VolverAtras
      end
    end
    object Especiales1: TMenuItem
      Caption = 'E&speciales'
      object ConsultadeDistribucionesRealizadas1: TMenuItem
        Action = ConsultarDistribuciones
      end
      object DetalledeFacturacinaEmpresa1: TMenuItem
        Action = ListarDetalleFacturacion
      end
    end
    object Sistema1: TMenuItem
      Caption = '&Sistema'
      object CambiodeContrasea1: TMenuItem
        Action = CambiarClave
      end
      object SeleccionarImpresora1: TMenuItem
        Action = DefinirImpresora
      end
      object AyudadelSistema1: TMenuItem
        Action = CargarAyuda
      end
    end
  end
  object DSDistribuciones: TDataSource
    DataSet = DMPrincipal.QryDistribuciones
    OnDataChange = DSDistribucionesDataChange
    Left = 72
    Top = 279
  end
  object ColaDeImpresion: TPrintDialog
    Options = [poDisablePrintToFile]
    Left = 107
    Top = 278
  end
  object Ayuda1: TAyuda
    Conexion = GemaConexion.ADOConec
    Encabezado = 'Generaci'#243'n y Emisi'#243'n de Archivos'
    Imagen1 = 'BookShut.Bmp'
    Imagen2 = 'HelpIndx.Bmp'
    Imagen3 = 'BookOpen.Bmp'
    NombreSistema = 'GEMA'
    Path = 'V:\PRODUC\HELP_RTF\'
    Proceso = 1
    Sistema = 'GEMA'
    VerAhora = False
    Left = 144
    Top = 277
  end
  object AdoCtrlMenuGema: TADOCtrlMenu
    ActionList = ActionList1
    Referencia = 'PRINCIPAL'
    Conexion = GemaConexion.ADOConec
    CodigoProceso = 100
    Left = 185
    Top = 277
  end
  object PMGema: TPopupMenu
    Images = Imagenes.Chicas
    Left = 225
    Top = 277
    object GeneracindeArchivos2: TMenuItem
      Action = GenerarArchivos
    end
    object CopiaraTransmisin2: TMenuItem
      Action = CopiaATrx
    end
    object VueltaAtrsltimaGeneracindeArchivos1: TMenuItem
      Action = VolverAtras
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object ConsultadeDistribucionesRealizadas2: TMenuItem
      Action = ConsultarDistribuciones
    end
    object DetalledeFacturacinaEmpresa2: TMenuItem
      Action = ListarDetalleFacturacion
    end
  end
end
