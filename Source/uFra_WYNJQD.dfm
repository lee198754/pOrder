object Fra_WYNJQD: TFra_WYNJQD
  Left = 0
  Top = 0
  Width = 800
  Height = 600
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #26032#23435#20307
  Font.Style = []
  ParentFont = False
  TabOrder = 0
  object RzGroupBox1: TRzGroupBox
    Left = 0
    Top = 0
    Width = 800
    Height = 41
    Align = alTop
    Caption = #26597#35810#26465#20214
    TabOrder = 0
    object Label1: TLabel
      Left = 24
      Top = 17
      Width = 48
      Height = 12
      Caption = #25764#38144#26085#26399
    end
    object Label2: TLabel
      Left = 177
      Top = 22
      Width = 6
      Height = 12
      Caption = '~'
    end
    object dtp_cxq: TRzDateTimePicker
      Left = 80
      Top = 13
      Width = 89
      Height = 20
      Date = 40801.000000000000000000
      Time = 40801.000000000000000000
      TabOrder = 0
    end
    object dtp_cxz: TRzDateTimePicker
      Left = 192
      Top = 13
      Width = 89
      Height = 20
      Date = 40801.000000000000000000
      Time = 40801.000000000000000000
      TabOrder = 1
    end
    object btn_cx: TRzButton
      Left = 315
      Top = 11
      Caption = #26597#35810
      TabOrder = 2
      OnClick = btn_cxClick
    end
    object btn_dy: TButton
      Left = 398
      Top = 11
      Width = 75
      Height = 25
      Caption = #25171#21360
      TabOrder = 3
      OnClick = btn_dyClick
    end
    object btn_export: TRzButton
      Left = 481
      Top = 11
      Caption = #23548#20986
      TabOrder = 4
      OnClick = btn_exportClick
    end
  end
  object RzGroupBox2: TRzGroupBox
    Left = 0
    Top = 41
    Width = 800
    Height = 559
    Align = alClient
    Caption = #26410#21360#20869#20214#20449#24687
    TabOrder = 1
    object stg_wynjqd: Ti_StgEdit
      Left = 1
      Top = 13
      Width = 798
      Height = 545
      Align = alClient
      ColCount = 8
      DefaultRowHeight = 20
      FixedCols = 0
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      Options = [goRangeSelect, goRowSizing, goColSizing]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      pt_TitleHeight = 20
      FixedFontStyle = []
      RowSelect = True
      FocusColor = clBlack
      RowSelectColor = clGrayText
      RowSelect_TextColor_Highlight = True
      AutoUpdate = True
      Merge_FixedRow = True
      Merge_FixedCol = False
      Merge_Cell = False
      FixedFontSize = 9
      FixedFontName = #23435#20307
      FixedGridLineColor = clBlack
      GridLinesFixed = PGridInset
      FormatString = #25764#38144#26085#26399'|'#26426#26500#21517#31216'|'#20135#21697#32534#21495'|'#20135#21697#31867#22411'|'#23458#25143#21517#31216'|'#21360#37327'('#26522')|'#21360#21046#21333#20215'|'#29305#27530#24037#33402#36153#21333#20215
      FixedWordBreak = True
      PermitCellSizing = False
      PermitExport = True
      WordBreak = False
      FixedRowAlignmentCenter = True
      ZeroToEmpty = True
      KeepEdit = False
      EnterAddRow = False
      ColWidths = (
        97
        127
        130
        64
        111
        60
        95
        106)
      RowHeights = (
        20
        20)
    end
  end
  object rmr_WYNJQD: TRMGridReport
    ThreadPrepareReport = True
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbPageSetup, pbExit, pbSaveToXLS, pbExport, pbNavigator]
    DefaultCollate = False
    SaveReportOptions.RegistryPath = 'Software\ReportMachine\ReportSettings\'
    PreviewOptions.RulerUnit = rmutScreenPixels
    PreviewOptions.RulerVisible = False
    PreviewOptions.DrawBorder = False
    PreviewOptions.BorderPen.Color = clGray
    PreviewOptions.BorderPen.Style = psDash
    Dataset = rmdb_WYNJQD
    StoreInDFM = True
    CompressLevel = rmzcFastest
    CompressThread = False
    LaterBuildEvents = True
    OnlyOwnerDataSet = False
    Left = 680
    Top = 80
    ReportData = {
      C81A00001E005265706F72744D616368696E65205265706F72742046696C6520
      332E301A42000000AE0000000000000000000000000001000000000000000000
      00000F0044656661756C74205072696E7465721257000000756E697420526570
      6F72743B0D0A0D0A696E746572666163650D0A0D0A696D706C656D656E746174
      696F6E0D0A0D0A70726F636564757265204D61696E3B0D0A626567696E0D0A0D
      0A656E643B0D0A0D0A656E642E0D0A000000C81A0000FF110054524D47726964
      5265706F727450616765040005005061676531010900000033080000990B0000
      983A0000983A0000983A0000983A00000000FFFF0000000000F9000000000000
      0000000000FFFFFFFFFFFFFFFF00000000000100000000000000000000000300
      02000900000003000000954F0000416400006FA700008B2F00000D5E0000F23B
      00001D4100008C4E0000CE180000CE1800006302000001000100010001000101
      000400CBCECCE5F3FFFFFF0200080000FF8600000B0005004D656D6F37000000
      0000000000844D0000BD16000011020000110200002100019800000080FFFFFF
      1F00000100000000000901000000010000000000090100000001000000000009
      0100000001000000000009010000000000012204000000000000000000000010
      06000000A4640095E5651F670D000A00000000000100022E0000010000000000
      00000000000000000000000003005B3B5DFFFFFFFF05000400CBCECCE5F3FFFF
      FF0200080000FF8600010102000000000000000000000000000000FFFFFF1F00
      000D004D532053616E73205365726966F5FFFFFF0200000000000100000000FF
      FFFFFFFFFFFFFF8203000001000200010002000101000400CBCECCE5F3FFFFFF
      0000080000FF8600000B0005004D656D6F380000000000000000844D0000BD16
      000011020000110200000100019800000080FFFFFF1F00000100000000000901
      0000000100000000000901000000010000000000090100000001000000000009
      010000000000012204000000000000000000000012160000005B726D64625F57
      594E4A51442E2243585251225D0D0A000000000000022E000001000000000000
      000000000000000000000003005B3B5DFFFFFFFF05000400CBCECCE5F3FFFFFF
      0000080000FF8600010102000000000000000000000000000000FFFFFF1F0000
      0D004D532053616E73205365726966F5FFFFFF0200000000000100000000FFFF
      FFFFFFFFFFFF9704000002000100020001000101000400CBCECCE5F3FFFFFF02
      00080000FF8600000B0005004D656D6F3900000000000000002F620000BD1600
      0011020000110200002100019800000080FFFFFF1F0000010000000000090100
      0000010000000000090100000001000000000009010000000100000000000901
      0000000000012204000000000000000000000010060000003A6784670D54F079
      0D000A00000000000000022E0000010000000000000000000000000000000000
      03005B3B5DFFFFFFFF05000400CBCECCE5F3FFFFFF0200080000FF8600010102
      000000000000000000000000000000FFFFFF1F00000D004D532053616E732053
      65726966F5FFFFFF0200000000000100000000FFFFFFFFFFFFFFFFB705000002
      000200020002000101000400CBCECCE5F3FFFFFF0000080000FF8600000B0006
      004D656D6F313600000000000000002F620000BD160000110200001102000001
      00019800000080FFFFFF1F000001000000000009010000000100000000000901
      0000000100000000000901000000010000000000090100000000000122040000
      00000000000000000012160000005B726D64625F57594E4A51442E224A474D43
      225D0D0A000000000000022E0000010000000000000000000000000000000000
      03005B3B5DFFFFFFFF05000400CBCECCE5F3FFFFFF0000080000FF8600010102
      000000000000000000000000000000FFFFFF1F00000D004D532053616E732053
      65726966F5FFFFFF0200000000000100000000FFFFFFFFFFFFFFFFCD06000003
      000100030001000101000400CBCECCE5F3FFFFFF0200080000FF8600000B0006
      004D656D6F313000000000000000005DA50000BD160000110200001102000021
      00019800000080FFFFFF1F000001000000000009010000000100000000000901
      0000000100000000000901000000010000000000090100000000000122040000
      0000000000000000001006000000A74EC154167FF7530D000A00000000000000
      022E000001000000000000000000000000000000000003005B3B5DFFFFFFFF05
      000400CBCECCE5F3FFFFFF0200080000FF860001010200000000000000000000
      0000000000FFFFFF1F00000D004D532053616E73205365726966F5FFFFFF0200
      000000000100000000FFFFFFFFFFFFFFFFED0700000300020003000200010100
      0400CBCECCE5F3FFFFFF0000080000FF8600000B0006004D656D6F3137000000
      00000000005DA50000BD16000011020000110200000100019800000080FFFFFF
      1F00000100000000000901000000010000000000090100000001000000000009
      0100000001000000000009010000000000012204000000000000000000000012
      160000005B726D64625F57594E4A51442E2243504248225D0D0A000000000000
      022E000001000000000000000000000000000000000003005B3B5DFFFFFFFF05
      000400CBCECCE5F3FFFFFF0000080000FF860001010200000000000000000000
      0000000000FFFFFF1F00000D004D532053616E73205365726966F5FFFFFF0200
      000000000100000000FFFFFFFFFFFFFFFF070900000400010004000100010100
      0400CBCECCE5F3FFFFFF0200080000FF8600000B0006004D656D6F3131000000
      00000000007A2D0000BD16000011020000110200002100019800000080FFFFFF
      1F00000100000000000901000000010000000000090100000001000000000009
      0100000001000000000009010000000000012204000000000000000000000010
      08000000A74EC1540D000A007B7C8B570D000A00000000000000022E00000100
      0000000000000000000000000000000003005B3B5DFFFFFFFF05000400CBCECC
      E5F3FFFFFF0200080000FF8600010102000000000000000000000000000000FF
      FFFF1F00000D004D532053616E73205365726966F5FFFFFF0200000000000100
      000000FFFFFFFFFFFFFFFF270A000004000200040002000101000400CBCECCE5
      F3FFFFFF0000080000FF8600000B0006004D656D6F313800000000000000007A
      2D0000BD16000011020000110200000100019800000080FFFFFF1F0000010000
      0000000901000000010000000000090100000001000000000009010000000100
      0000000009010000000000012204000000000000000000000012160000005B72
      6D64625F57594E4A51442E2243504C58225D0D0A000000000000022E00000100
      0000000000000000000000000000000003005B3B5DFFFFFFFF05000400CBCECC
      E5F3FFFFFF0000080000FF8600010102000000000000000000000000000000FF
      FFFF1F00000D004D532053616E73205365726966F5FFFFFF0200000000000100
      000000FFFFFFFFFFFFFFFF3D0B000005000100050001000101000400CBCECCE5
      F3FFFFFF0200080000FF8600000B0006004D656D6F32330000000000000000FC
      5B0000BD16000011020000110200002100019800000080FFFFFF1F0000010000
      0000000901000000010000000000090100000001000000000009010000000100
      000000000901000000000001220400000000000000000000001006000000A25B
      37620D54F0790D000A00000000000000022E0000010000000000000000000000
      00000000000003005B3B5DFFFFFFFF05000400CBCECCE5F3FFFFFF0200080000
      FF8600010102000000000000000000000000000000FFFFFF1F00000D004D5320
      53616E73205365726966F5FFFFFF0200000000000100000000FFFFFFFFFFFFFF
      FF5D0C000005000200050002000101000400CBCECCE5F3FFFFFF0000080000FF
      8600000B0006004D656D6F32350000000000000000FC5B0000BD160000110200
      00110200000100019800000080FFFFFF1F000001000000000009010000000100
      0000000009010000000100000000000901000000010000000000090100000000
      00012204000000000000000000000012160000005B726D64625F57594E4A5144
      2E224B484D43225D0D0A000000000000022E0000010000000000000000000000
      00000000000003005B3B5DFFFFFFFF05000400CBCECCE5F3FFFFFF0000080000
      FF8600010102000000000000000000000000000000FFFFFF1F00000D004D5320
      53616E73205365726966F5FFFFFF0200000000000100000000FFFFFFFFFFFFFF
      FF730D000006000100060001000101000400CBCECCE5F3FFFFFF0200080000FF
      8600000B0005004D656D6F310000000000000000E1390000BD16000011020000
      110200002000019800000080FFFFFF1F00000100000000000901000000010000
      0000000901000000010000000000090100000001000000000009010000000000
      0122040000000000000000000000120D000000E58DB0E9878F28E69E9A290D0A
      000000000000022E000001000000000000000000000000000000000003005B3B
      5DFFFFFFFF05000400CBCECCE5F3FFFFFF0200080000FF860001010200000000
      0000000000000000000000FFFFFF1F00000D004D532053616E73205365726966
      F5FFFFFF0200000000000100000000FFFFFFFFFFFFFFFF900E00000600020006
      0002000101000400CBCECCE5F3FFFFFF0000080000FF8600000B0005004D656D
      6F340000000000000000E1390000BD1600001102000011020000010001980000
      0080FFFFFF1F0000010000000000090100000001000000000009010000000100
      0000000009010000000100000000000901000000000001220400000000000000
      0000000012140000005B726D64625F57594E4A51442E22594C225D0D0A000000
      000000022E000001000000000000000000000000000000000003005B3B5DFFFF
      FFFF05000400CBCECCE5F3FFFFFF0000080000FF860001010200000000000000
      0000000000000000FFFFFF1F00000D004D532053616E73205365726966F5FFFF
      FF0200000000000100000000FFFFFFFFFFFFFFFFA50F00000700010007000100
      0101000400CBCECCE5F3FFFFFF0200080000FF8600000B0005004D656D6F3200
      000000000000000C3F0000BD16000011020000110200002000019800000080FF
      FFFF1F0000010000000000090100000001000000000009010000000100000000
      0009010000000100000000000901000000000001220400000000000000000000
      001006000000705336525553F74E0D000A00000000000000022E000001000000
      000000000000000000000000000003005B3B5DFFFFFFFF05000400CBCECCE5F3
      FFFFFF0200080000FF8600010102000000000000000000000000000000FFFFFF
      1F00000D004D532053616E73205365726966F5FFFFFF02000000000001000000
      00FFFFFFFFFFFFFFFFC410000007000200070002000101000400CBCECCE5F3FF
      FFFF0000080000FF8600000B0005004D656D6F3500000000000000000C3F0000
      BD16000011020000110200000100019800000080FFFFFF1F0000010000000000
      0901000000010000000000090100000001000000000009010000000100000000
      0009010000000000012204000000000000000000000012160000005B726D6462
      5F57594E4A51442E22595A444A225D0D0A000000000000022E00000100000000
      0000000000000000000000000003005B3B5DFFFFFFFF05000400CBCECCE5F3FF
      FFFF0000080000FF8600010102000000000000000000000000000000FFFFFF1F
      00000D004D532053616E73205365726966F5FFFFFF0200000000000100000000
      FFFFFFFFFFFFFFFFE311000008000100080001000101000400CBCECCE5F3FFFF
      FF0200080000FF8600000B0005004D656D6F3300000000000000007B4C0000BD
      16000011020000110200002000019800000080FFFFFF1F000001000000000009
      0100000001000000000009010000000100000000000901000000010000000000
      090100000000000122040000000000000000000000100B00000079728A6BE55D
      7A82398D0D000A005553F74E0D000A00000000000000022E0000010000000000
      00000000000000000000000003005B3B5DFFFFFFFF05000400CBCECCE5F3FFFF
      FF0200080000FF8600010102000000000000000000000000000000FFFFFF1F00
      000D004D532053616E73205365726966F5FFFFFF0200000000000100000000FF
      FFFFFFFFFFFFFF0513000008000200080002000101000400CBCECCE5F3FFFFFF
      0000080000FF8600000B0005004D656D6F3600000000000000007B4C0000BD16
      000011020000110200000100019800000080FFFFFF1F00000100000000000901
      0000000100000000000901000000010000000000090100000001000000000009
      010000000000012204000000000000000000000012190000005B726D64625F57
      594E4A51442E225453475946444A225D0D0A000000000000022E000001000000
      000000000000000000000000000003005B3B5DFFFFFFFF05000400CBCECCE5F3
      FFFFFF0000080000FF8600010102000000000000000000000000000000FFFFFF
      1F00000D004D532053616E73205365726966F5FFFFFF02000000000001000000
      00FFFFFFFFFFFFFFFF0700486561646572330B004D6173746572446174613300
      0400CBCECCE5F3FFFFFF0000080000FF86000000000000000000000000000400
      CBCECCE5F3FFFFFF0000080000FF86000000000000000000000000000400CBCE
      CCE5F3FFFFFF0000080000FF8600000000000400CBCECCE5F3FFFFFF00000800
      00FF86000000000000000000000000000101380D0054524D42616E6448656164
      657286140000000B000700486561646572310000000000000000000000000000
      000011020000110200000002001800000000FFFFFF1F00000000000000000901
      0000000000000000000901000000000000000000090100000000000000000009
      0100000000000122040000000000000000000000100000000000000000000002
      2E000001000000000000000000000000000000000003005B3B5DFFFFFFFF0500
      00000000000D004D532053616E73205365726966F5FFFFFF0000080000FF0100
      0000000000000000020300000000AC14000001000000B5CE0000000000000000
      000000000000000000003C110054524D42616E644D6173746572446174618F15
      0000000B000B004D617374657244617461310000000000000000000000000000
      000011020000110200000002001800000000FFFFFF1F00000000000000000901
      0000000000000000000901000000000000000000090100000000000000000009
      0100000000000122040000000000000001000000100000000000000000000002
      2E000001000000000000000000000000000000000003005B3B5DFFFFFFFF0500
      0900726D64625F434C544A0000000D004D532053616E73205365726966F5FFFF
      FF0000080000FF01000000000000000000020300000000AC14000001000000B5
      CE00000000000000000000000000000000000032120054524D42616E64526570
      6F72745469746C6591160000000B000C005265706F72745469746C6531000000
      0000000000000000000000000011020000110200000002001800000000FFFFFF
      1F00000000000000000901000000000000000000090100000000000000000009
      0100000000000000000009010000000000012204000000000000000200000010
      00000000000000000000022E0000010000000000000000000000000000000000
      03005B3B5DFFFFFFFF050000000000000D004D532053616E73205365726966F5
      FFFFFF0000080000FF01000000000000000000020300000000AC140000010000
      00B5CE000000000000000000000000000000000000380D0054524D42616E6448
      656164657289170000000B000700486561646572320000000000000000000000
      000000000011020000110200000002001800000000FFFFFF1F00000000000000
      0009010000000000000000000901000000000000000000090100000000000000
      0000090100000000000122040000000000000003000000100000000000000000
      0000022E000001000000000000000000000000000000000003005B3B5DFFFFFF
      FF050000000000000D004D532053616E73205365726966F5FFFFFF0000080000
      FF01000000000000000000020300000000AC14000001000000B5CE0000000000
      000000000000000000000000003C110054524D42616E644D6173746572446174
      6192180000000B000B004D617374657244617461320000000000000000000000
      000000000011020000110200000002001800000000FFFFFF1F00000000000000
      0009010000000000000000000901000000000000000000090100000000000000
      0000090100000000000122040000000000000004000000100000000000000000
      0000022E000001000000000000000000000000000000000003005B3B5DFFFFFF
      FF05000900726D64625F434C544A0000000D004D532053616E73205365726966
      F5FFFFFF0000080000FF01000000000000000000020300000000AC1400000100
      0000B5CE0000000000000000000000000000000000003C110054524D42616E64
      4D6173746572446174619B190000000B000B004D617374657244617461330000
      000000000000000000000000000011020000110200000002009800000000FFFF
      FF1F000000000000000009010000000000000000000901000000000000000000
      0901000000000000000000090100000000000122040000000000000005000000
      1000000000000000000000022E00000100000000000000000000000000000000
      0003005B3B5DFFFFFFFF05000900726D64625F434C544A0000000D004D532053
      616E73205365726966F5FFFFFF0000080000FF01000000000000000000020300
      000000AC14000001000000B5CE00000000000000000000000000000000000038
      0D0054524D42616E64486561646572931A0000000B0007004865616465723300
      00000000000000000000000000000011020000110200000002009800000000FF
      FFFF1F0000000000000000090100000000000000000009010000000000000000
      0009010000000000000000000901000000000001220400000000000000060000
      001000000000000000000000022E000001000000000000000000000000000000
      000003005B3B5DFFFFFFFF050000000000000D004D532053616E732053657269
      66F5FFFFFF0000080000FF01000000000000000000020300000000AC14000001
      000000B5CE000000000000000000000000000000000000FE420021005265706F
      72744D616368696E652044696374696F6E6172792046696C652033301A000000
      0000000000FD000000000000}
  end
  object rmdb_WYNJQD: TRMDBDataSet
    Visible = True
    DataSet = ADO_WYNJQD
    Left = 648
    Top = 80
  end
  object ADO_WYNJQD: TADOQuery
    Connection = DM_DataBase.Con_YDPrint
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    Parameters = <>
    SQL.Strings = (
      'Exec p_wynjqd '#39'2012.01.01'#39','#39'2013.05.01'#39)
    Left = 648
    Top = 112
  end
end