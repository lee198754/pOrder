object Frm_SCGL_BFJC: TFrm_SCGL_BFJC
  Left = 448
  Top = 156
  Width = 572
  Height = 385
  Caption = #37096#20998#36827#20179
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #26032#23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  DesignSize = (
    556
    347)
  PixelsPerInch = 96
  TextHeight = 12
  object Bevel1: TBevel
    Left = 8
    Top = 297
    Width = 539
    Height = 10
    Anchors = [akLeft, akTop, akRight]
    Shape = bsBottomLine
  end
  object btn_ok: TButton
    Left = 370
    Top = 314
    Width = 75
    Height = 25
    Anchors = [akTop, akRight]
    Caption = #30830#35748
    TabOrder = 0
    OnClick = btn_okClick
  end
  object btn_close: TButton
    Left = 466
    Top = 314
    Width = 75
    Height = 25
    Anchors = [akTop, akRight]
    Caption = #20851#38381
    ModalResult = 2
    TabOrder = 1
  end
  object stg_BFJC: Ti_StgEdit
    Left = 0
    Top = 0
    Width = 556
    Height = 294
    Align = alTop
    ColCount = 7
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
    TabOrder = 2
    pt_TitleHeight = 20
    FixedFontStyle = []
    RowSelect = False
    FocusColor = clBlack
    RowSelectColor = clHighlight
    RowSelect_TextColor_Highlight = True
    AutoUpdate = True
    Merge_FixedRow = True
    Merge_FixedCol = False
    Merge_Cell = False
    FixedFontSize = 9
    FixedFontName = #23435#20307
    FixedGridLineColor = clBlack
    GridLinesFixed = PGridInset
    FormatString = #20135#21697#32534#21495'|'#24320#21333#21360#37327'('#26522')|'#26410#36827#20179#21360#37327'('#26522')|'#26412#27425#36827#20179#21360#37327'('#26522')|||'
    FixedWordBreak = True
    PermitCellSizing = False
    PermitExport = True
    WordBreak = False
    FixedRowAlignmentCenter = True
    ZeroToEmpty = True
    KeepEdit = False
    EnterAddRow = False
    ColWidths = (
      136
      92
      95
      103
      64
      64
      64)
    RowHeights = (
      20
      20)
  end
  object edt_Temp: TEdit
    Left = 160
    Top = 207
    Width = 121
    Height = 18
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 3
    Text = 'edt_Temp'
  end
  object btn_Print: TButton
    Left = 274
    Top = 314
    Width = 75
    Height = 25
    Anchors = [akTop, akRight]
    Caption = #25171#21360
    TabOrder = 4
    OnClick = btn_PrintClick
  end
  object rmr_JC: TRMGridReport
    ThreadPrepareReport = True
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbPageSetup, pbExit, pbExport, pbNavigator]
    DefaultCollate = False
    SaveReportOptions.RegistryPath = 'Software\ReportMachine\ReportSettings\'
    PreviewOptions.RulerUnit = rmutScreenPixels
    PreviewOptions.RulerVisible = False
    PreviewOptions.DrawBorder = False
    PreviewOptions.BorderPen.Color = clGray
    PreviewOptions.BorderPen.Style = psDash
    Dataset = rmdb_SCGL_JC
    StoreInDFM = True
    CompressLevel = rmzcFastest
    CompressThread = False
    LaterBuildEvents = True
    OnlyOwnerDataSet = False
    Left = 224
    Top = 312
    ReportData = {
      E52100001E005265706F72744D616368696E65205265706F72742046696C6520
      332E301A42000000AE0000000000000000000000000001000000000000000000
      00000F0044656661756C74205072696E7465721257000000756E697420526570
      6F72743B0D0A0D0A696E746572666163650D0A0D0A696D706C656D656E746174
      696F6E0D0A0D0A70726F636564757265204D61696E3B0D0A626567696E0D0A0D
      0A656E643B0D0A0D0A656E642E0D0A000000E5210000FF110054524D47726964
      5265706F72745061676504000500506167653101000100006A09000078050000
      983A0000983A0000983A0000983A00000000FFFF0000000000F9000000000000
      0000000000FFFFFFFFFFFFFFFF00000000000100000000000000000000000300
      02000700000005000000DD950000B3AF0000C90E0100E93A00009E5000008C4E
      000046270000CE180000CE180000CE180000AA02000001000100060001000101
      010400CBCECCE5F0FFFFFF0000080000FF8600000B0006004D656D6F34360000
      000000000000863103003525000011020000110200002000011800000080FFFF
      FF1F000000000000000009010000000000000000000901000000000000000000
      0901000000000000000000090100000000000122040000000000000000000000
      1252000000E4BAA7E68890E59381E9A284E8BF9BE4BB93E58D950D0AE8BF9BE4
      BB93E697A5E69C9F3A205B466F726D61744461746554696D652827797979792E
      4D4D2E6464272C5F524D5F4461746554696D65295D0D0A000000000000022E00
      0001000000000000000000000000000000000003005B3B5DFFFFFFFF05000400
      CBCECCE5F0FFFFFF0000080000FF860001010200000000000000000000000000
      0000FFFFFF1F00000D004D532053616E73205365726966F5FFFFFF0200000000
      000100000000FFFFFFFFFFFFFFFFBF03000001000200010002000101000400CB
      CECCE5F2FFFFFF0000080000FF8600000B0005004D656D6F3100000000000000
      00CB930000BD16000011020000110200002000011800000080FFFFFF1F000001
      0000000000090100000001000000000009010000000100000000000901000000
      0100000000000901000000000001220400000000000000000000001006000000
      E55D5C4F5553F7530D000A00000000000000022E000001000000000000000000
      000000000000000003005B3B5DFFFFFFFF05000400CBCECCE5F2FFFFFF000008
      0000FF8600010102000000000000000000000000000000FFFFFF1F00000D004D
      532053616E73205365726966F5FFFFFF0200000000000100000000FFFFFFFFFF
      FFFFFFE004000001000300010003000100000400CBCECCE5F2FFFFFF00000800
      00FF8600000B0006004D656D6F31300000000000000000CB930000BD16000011
      020000110200002000011800000080FFFFFF1F00000100000000000901000000
      0100000000000901000000010000000000090100000001000000000009010000
      000000012204000000000000000000000012110000005B726D64625F4A432E22
      474448225D0D0A000006004D656D6F31310000022E0000010000000000000000
      00000000000000000003005B3B5DFFFFFFFF05000400CBCECCE5F2FFFFFF0000
      080000FF8600000102000000000000000000000000000000FFFFFF1F00000D00
      4D532053616E73205365726966F5FFFFFF0200000000000100000000FFFFFFFF
      FFFFFFFFEA05000001000400010004000101000400CBCECCE5F2FFFFFF000008
      0000FF8600000B0006004D656D6F31390000000000000000CB930000BD160000
      11020000110200002800011800000080FFFFFF1F000000000000000009010000
      0000000000000009010000000000000000000901000000000000000000090100
      0000000001220400000000000000000000001000000000000000000000022E00
      0001000000000000000000000000000000000003005B3B5DFFFFFFFF05000400
      CBCECCE5F2FFFFFF0000080000FF860001010200000000000000000000000000
      0000FFFFFF1F00000D004D532053616E73205365726966F5FFFFFF0200000000
      000100000000FFFFFFFFFFFFFFFF0007000002000200020002000101000400CB
      CECCE5F3FFFFFF0000080000FF8600000B0006004D656D6F3135000000000000
      0000A2AD0000BD16000011020000110200002000011800000080FFFFFF1F0000
      0100000000000901000000010000000000090100000001000000000009010000
      0001000000000009010000000000012204000000000000000000000010060000
      00A74EC154167FF7530D000A00000000000000022E0000010000000000000000
      00000000000000000003005B3B5DFFFFFFFF05000400CBCECCE5F3FFFFFF0000
      080000FF8600010102000000000000000000000000000000FFFFFF1F00000D00
      4D532053616E73205365726966F5FFFFFF0200000000000100000000FFFFFFFF
      FFFFFFFF2208000002000300020003000100000400CBCECCE5F2FFFFFF000008
      0000FF8600000B0006004D656D6F31360000000000000000A2AD0000BD160000
      11020000110200002000011800000080FFFFFF1F000001000000000009010000
      0001000000000009010000000100000000000901000000010000000000090100
      00000000012204000000000000000000000012120000005B726D64625F4A432E
      2243504248225D0D0A000006004D656D6F31310000022E000001000000000000
      000000000000000000000003005B3B5DFFFFFFFF05000400CBCECCE5F2FFFFFF
      0000080000FF8600000102000000000000000000000000000000FFFFFF1F0000
      0D004D532053616E73205365726966F5FFFFFF0200000000000100000000FFFF
      FFFFFFFFFFFF2C09000002000400020004000101000400CBCECCE5F3FFFFFF00
      00080000FF8600000B0006004D656D6F31370000000000000000A2AD0000BD16
      000011020000110200002000011800000080FFFFFF1F00000000000000000901
      0000000000000000000901000000000000000000090100000000000000000009
      0100000000000122040000000000000000000000100000000000000000000002
      2E000001000000000000000000000000000000000003005B3B5DFFFFFFFF0500
      0400CBCECCE5F3FFFFFF0000080000FF86000101020000000000000000000000
      00000000FFFFFF1F00000D004D532053616E73205365726966F5FFFFFF020000
      0000000100000000FFFFFFFFFFFFFFFF410A0000030002000300020001010004
      00CBCECCE5F2FFFFFF0000080000FF8600000B0005004D656D6F320000000000
      000000B80C0100BD16000011020000110200002000011800000080FFFFFF1F00
      0001000000000009010000000100000000000901000000010000000000090100
      0000010000000000090100000000000122040000000000000000000000100600
      0000A25B37620D54F0790D000A00000000000000022E00000100000000000000
      0000000000000000000003005B3B5DFFFFFFFF05000400CBCECCE5F2FFFFFF00
      00080000FF8600010102000000000000000000000000000000FFFFFF1F00000D
      004D532053616E73205365726966F5FFFFFF0200000000000100000000FFFFFF
      FFFFFFFFFF5D0B000003000300030003000100000400CBCECCE5F2FFFFFF0000
      080000FF8600000B0006004D656D6F31310000000000000000B80C0100BD1600
      0011020000110200002100019800000080FFFFFF1F0000010000000000090100
      0000010000000000090100000001000000000009010000000100000000000901
      0000000000012204000000000000000000000012120000005B726D64625F4A43
      2E224B484D43225D0D0A000000000000022E0000010000000000000000000000
      00000000000003005B3B5DFFFFFFFF05000400CBCECCE5F2FFFFFF0000080000
      FF8600000102000000000000000000000000000000FFFFFF1F00000D004D5320
      53616E73205365726966F5FFFFFF0200000000000100000000FFFFFFFFFFFFFF
      FF710C000003000400030004000100000400CBCECCE5F2FFFFFF0000080000FF
      8600000B0006004D656D6F32300000000000000000B80C0100BD160000110200
      00110200002000011800000080FFFFFF1F000000000000000009010000000000
      0000000009010000000000000000000901000000000000000000090100000000
      000122040000000000000000000000120A00000020E8BF9BE4BB933A0D0A0000
      00000000022E000001000000000000000000000000000000000003005B3B5DFF
      FFFFFF05000400CBCECCE5F2FFFFFF0000080000FF8600000102000000000000
      000000000000000000FFFFFF1F00000D004D532053616E73205365726966F5FF
      FFFF0200000000000100000000FFFFFFFFFFFFFFFF820D000004000200040002
      000101000400CBCECCE5F2FFFFFF0000080000FF8600000B0005004D656D6F33
      0000000000000000D8380000BD16000011020000110200002000011800000080
      FFFFFF1F00000100000000000901000000010000000000090100000001000000
      0000090100000001000000000009010000000000012204000000000000000000
      0000100400000055534D4F0D000A00000000000000022E000001000000000000
      000000000000000000000003005B3B5DFFFFFFFF05000400CBCECCE5F2FFFFFF
      0000080000FF8600010102000000000000000000000000000000FFFFFF1F0000
      0D004D532053616E73205365726966F5FFFFFF0200000000000100000000FFFF
      FFFFFFFFFFFFA20E000004000300040003000100000400CBCECCE5F2FFFFFF02
      00080000FF8600000B0006004D656D6F31320000000000000000D8380000BD16
      000011020000110200002000011800000080FFFFFF1F00000100000000000901
      0000000100000000000901000000010000000000090100000001000000000009
      010000000000012204000000000000000000000012100000005B726D64625F4A
      432E224457225D0D0A000006004D656D6F31310000022E000001000000000000
      000000000000000000000003005B3B5DFFFFFFFF05000400CBCECCE5F2FFFFFF
      0200080000FF8600000102000000000000000000000000000000FFFFFF1F0000
      0D004D532053616E73205365726966F5FFFFFF0200000000000100000000FFFF
      FFFFFFFFFFFFB50F000004000400040004000100000400CBCECCE5F2FFFFFF00
      00080000FF8600000B0006004D656D6F32310000000000000000D8380000BD16
      000011020000110200002000011800000080FFFFFF1F00000000000000000901
      0000000000000000000901000000000000000000090100000000000000000009
      01000000000001220400000000000000000000001209000000E4BB93E7AEA13A
      0D0A000000000000022E00000100000000000000000000000000000000000300
      5B3B5DFFFFFFFF05000400CBCECCE5F2FFFFFF0000080000FF86000001020000
      00000000000000000000000000FFFFFF1F00000D004D532053616E7320536572
      6966F5FFFFFF0200000000000100000000FFFFFFFFFFFFFFFFCA100000050002
      00050002000101000400CBCECCE5F2FFFFFF0000080000FF8600000B0005004D
      656D6F3400000000000000008C4E0000BD160000110200001102000020000118
      00000080FFFFFF1F000001000000000009010000000100000000000901000000
      0100000000000901000000010000000000090100000000000122040000000000
      0000000000001006000000A18B12527065CF910D000A00000000000000022E00
      0001000000000000000000000000000000000003005B3B5DFFFFFFFF05000400
      CBCECCE5F2FFFFFF0000080000FF860001010200000000000000000000000000
      0000FFFFFF1F00000D004D532053616E73205365726966F5FFFFFF0200000000
      000100000000FFFFFFFFFFFFFFFFEA11000005000300050003000100000400CB
      CECCE5F2FFFFFF0200080000FF8600000B0006004D656D6F3133000000000000
      00008C4E0000BD16000011020000110200002000011800000080FFFFFF1F0000
      0100000000000901000000010000000000090100000001000000000009010000
      0001000000000009010000000000012204000000000000000000000012100000
      005B726D64625F4A432E22534C225D0D0A000006004D656D6F31310000022E00
      0001000000000000000000000000000000000003005B3B5DFFFFFFFF05000400
      CBCECCE5F2FFFFFF0200080000FF860000010200000000000000000000000000
      0000FFFFFF1F00000D004D532053616E73205365726966F5FFFFFF0200000000
      000100000000FFFFFFFFFFFFFFFFF412000005000400050004000101000400CB
      CECCE5F2FFFFFF0000080000FF8600000B0006004D656D6F3232000000000000
      00008C4E0000BD16000011020000110200002800011800000080FFFFFF1F0000
      0000000000000901000000000000000000090100000000000000000009010000
      0000000000000009010000000000012204000000000000000000000010000000
      00000000000000022E000001000000000000000000000000000000000003005B
      3B5DFFFFFFFF05000400CBCECCE5F2FFFFFF0000080000FF8600010102000000
      000000000000000000000000FFFFFF1F00000D004D532053616E732053657269
      66F5FFFFFF0200000000000100000000FFFFFFFFFFFFFFFF0914000006000200
      060002000101000400CBCECCE5F2FFFFFF0000080000FF8600000B0005004D65
      6D6F3500000000000000007B4C0000BD16000011020000110200002000011800
      000080FFFFFF1F00000100000000000901000000010000000000090100000001
      0000000000090100000001000000000009010000000000012204000000000000
      00000000001006000000DB8FD34E7065CF910D000A00000000000000022E0000
      01000000000000000000000000000000000003005B3B5DFFFFFFFF05000400CB
      CECCE5F2FFFFFF0000080000FF86000101020000000000000000000000000000
      00FFFFFF1F00000D004D532053616E73205365726966F5FFFFFF020000000000
      0100000000FFFFFFFFFFFFFFFF2B15000006000300060003000100000400CBCE
      CCE5F2FFFFFF0200080000FF8600000B0006004D656D6F313400000000000000
      007B4C0000BD16000011020000110200002000011800000080FFFFFF1F000001
      0000000000090100000001000000000009010000000100000000000901000000
      0100000000000901000000000001220400000000000000000000001212000000
      5B726D64625F4A432E224A43534C225D0D0A000006004D656D6F31310000022E
      000001000000000000000000000000000000000003005B3B5DFFFFFFFF050004
      00CBCECCE5F2FFFFFF0200080000FF8600000102000000000000000000000000
      000000FFFFFF1F00000D004D532053616E73205365726966F5FFFFFF02000000
      00000100000000FFFFFFFFFFFFFFFF3516000006000400060004000101000400
      CBCECCE5F2FFFFFF0000080000FF8600000B0006004D656D6F32330000000000
      0000007B4C0000BD16000011020000110200002800011800000080FFFFFF1F00
      0000000000000009010000000000000000000901000000000000000000090100
      0000000000000000090100000000000122040000000000000000000000100000
      0000000000000000022E00000100000000000000000000000000000000000300
      5B3B5DFFFFFFFF05000400CBCECCE5F2FFFFFF0000080000FF86000101020000
      00000000000000000000000000FFFFFF1F00000D004D532053616E7320536572
      6966F5FFFFFF0200000000000100000000FFFFFFFFFFFFFFFF0C005265706F72
      745469746C65310700486561646572330B004D61737465724461746131070046
      6F6F74657232000400CBCECCE5F3FFFFFF0000080000FF860000000000000000
      00000000000400CBCECCE5F3FFFFFF0000080000FF8600000000000000000000
      0000000400CBCECCE5F3FFFFFF0000080000FF8600000000000400CBCECCE5F3
      FFFFFF0000080000FF8600000000000000000000000000010132120054524D42
      616E645265706F72745469746C65D7170000000B000C005265706F7274546974
      6C65310000000000000000000000000000000011020000110200000002001800
      000000FFFFFF1F00000000000000000901000000000000000000090100000000
      0000000000090100000000000000000009010000000000012204000000000000
      00000000001000000000000000000000022E0000010000000000000000000000
      00000000000003005B3B5DFFFFFFFF050000000000000D004D532053616E7320
      5365726966F5FFFFFF0000080000FF01000000000000000000020300000000AC
      14000001000000B5CE0000000000000000000000000000000000003411005452
      4D42616E6450616765486561646572D7180000000B000B005061676548656164
      6572310000000000000000000000000000000011020000110200001802001800
      000000FFFFFF1F00000000000000000901000000000000000000090100000000
      0000000000090100000000000000000009010000000000012204000000000000
      00010000001000000000000000000000022E0000010000000000000000000000
      00000000000003005B3B5DFFFFFFFF050000000000000D004D532053616E7320
      5365726966F5FFFFFF0000080000FF01000000000000000000020300000000AC
      14000001000000B5CE000000000000000000000000000000000000380D005452
      4D42616E64486561646572CF190000000B000700486561646572310000000000
      000000000000000000000011020000110200000002001800000000FFFFFF1F00
      0000000000000009010000000000000000000901000000000000000000090100
      0000000000000000090100000000000122040000000000000002000000100000
      0000000000000000022E00000100000000000000000000000000000000000300
      5B3B5DFFFFFFFF050000000000000D004D532053616E73205365726966F5FFFF
      FF0000080000FF01000000000000000000020300000000AC14000001000000B5
      CE0000000000000000000000000000000000003C110054524D42616E644D6173
      74657244617461CF1A0000000B000B004D617374657244617461310000000000
      000000000000000000000011020000110200000002009800000000FFFFFF1F00
      0000000000000009010000000000000000000901000000000000000000090100
      0000000000000000090100000000000122040000000000000003000000100000
      0000000000000000022E00000100000000000000000000000000000000000300
      5B3B5DFFFFFFFF050000000000000D004D532053616E73205365726966F5FFFF
      FF0000080000FF01000000000000000000020300000000AC14000001000000B5
      CE000000000000000000000000000000000000380D0054524D42616E64486561
      646572C71B0000000B0007004865616465723200000000000000000000000000
      00000011020000110200000002001800000000FFFFFF1F000000000000000009
      0100000000000000000009010000000000000000000901000000000000000000
      0901000000000001220400000000000000040000001000000000000000000000
      022E000001000000000000000000000000000000000003005B3B5DFFFFFFFF05
      0000000000000D004D532053616E73205365726966F5FFFFFF0000080000FF01
      000000000000000000020300000000AC14000001000000B5CE00000000000000
      0000000000000000000000390D0054524D42616E64466F6F746572BF1C000000
      0B000700466F6F74657231000000000000000000000000000000001102000011
      0200000002001800000000FFFFFF1F0000000000000000090100000000000000
      0000090100000000000000000009010000000000000000000901000000000001
      220400000000000000050000001000000000000000000000022E000001000000
      000000000000000000000000000003005B3B5DFFFFFFFF050000000000000D00
      4D532053616E73205365726966F5FFFFFF0000080000FF010000000000000000
      00020300000000AC14000001000000B5CE000000000000000000000000000000
      000000380D0054524D42616E64486561646572B71D0000000B00070048656164
      6572330000000000000000000000000000000011020000110200000002001800
      000000FFFFFF1F00000000000000000901000000000000000000090100000000
      0000000000090100000000000000000009010000000000012204000000000000
      00060000001000000000000000000000022E0000010000000000000000000000
      00000000000003005B3B5DFFFFFFFF050000000000000D004D532053616E7320
      5365726966F5FFFFFF0000080000FF01000000000000000000020300000000AC
      14000001000000B5CE0000000000000000000000000000000000003C11005452
      4D42616E644D617374657244617461B71E0000000B000B004D61737465724461
      7461320000000000000000000000000000000011020000110200000002001800
      000000FFFFFF1F00000000000000000901000000000000000000090100000000
      0000000000090100000000000000000009010000000000012204000000000000
      00070000001000000000000000000000022E0000010000000000000000000000
      00000000000003005B3B5DFFFFFFFF050000000000000D004D532053616E7320
      5365726966F5FFFFFF0000080000FF01000000000000000000020300000000AC
      14000001000000B5CE0000000000000000000000000000000000003C11005452
      4D42616E644D617374657244617461B81F0000000B000B004D61737465724461
      7461330000000000000000000000000000000011020000110200000002001800
      000000FFFFFF1F00000000000000000901000000000000000000090100000000
      0000000000090100000000000000000009010000000000012204000000000000
      00080000001000000000000000000000022E0000010000000000000000000000
      00000000000003005B3B5DFFFFFFFF05000100310000000D004D532053616E73
      205365726966F5FFFFFF0000080000FF01000000000000000000020300000000
      AC14000001000000B5CE0000000000000000000000000000000000003C110054
      524D42616E644D617374657244617461B8200000000B000B004D617374657244
      6174613400000000000000000000000000000000110200001102000000020018
      00000000FFFFFF1F000000000000000009010000000000000000000901000000
      0000000000000901000000000000000000090100000000000122040000000000
      0000090000001000000000000000000000022E00000100000000000000000000
      0000000000000003005B3B5DFFFFFFFF050000000000000D004D532053616E73
      205365726966F5FFFFFF0000080000FF01000000000000000000020300000000
      AC14000001000000B5CE000000000000000000000000000000000000390D0054
      524D42616E64466F6F746572B0210000000B000700466F6F7465723200000000
      00000000000000000000000011020000110200000002001800000000FFFFFF1F
      0000000000000000090100000000000000000009010000000000000000000901
      00000000000000000009010000000000012204000000000000000A0000001000
      000000000000000000022E000001000000000000000000000000000000000003
      005B3B5DFFFFFFFF050000000000000D004D532053616E73205365726966F5FF
      FFFF0000080000FF01000000000000000000020300000000AC14000001000000
      B5CE000000000000000000000100000000000000FE420021005265706F72744D
      616368696E652044696374696F6E6172792046696C652033301A000000000000
      0000FD000000000000}
  end
  object rmdb_SCGL_JC: TRMDBDataSet
    Visible = True
    Left = 192
    Top = 312
  end
end
