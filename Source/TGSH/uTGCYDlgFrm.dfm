object TGCYDlgFrm: TTGCYDlgFrm
  Left = 533
  Top = 247
  Width = 500
  Height = 457
  Caption = #37325#21360#20449#24687
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = #26032#23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  DesignSize = (
    484
    419)
  PixelsPerInch = 96
  TextHeight = 14
  object lab_zyl: TLabel
    Left = 8
    Top = 36
    Width = 56
    Height = 14
    Caption = #21407#21360#37327#65306
  end
  object Label2: TLabel
    Left = 8
    Top = 12
    Width = 70
    Height = 14
    Caption = #37325#21360#35746#21333#65306
  end
  object lab_cpbh: TLabel
    Left = 72
    Top = 12
    Width = 56
    Height = 14
    Caption = 'lab_cpbh'
  end
  object Bevel1: TBevel
    Left = 8
    Top = 320
    Width = 465
    Height = 26
    Anchors = [akLeft, akTop, akRight]
    Shape = bsBottomLine
  end
  object lab_yyl: TLabel
    Left = 72
    Top = 36
    Width = 49
    Height = 14
    Caption = 'lab_yyl'
  end
  object btn_Ok: TRzButton
    Left = 280
    Top = 355
    Default = True
    ModalResult = 1
    Caption = #30830#23450
    TabOrder = 0
    OnClick = btn_OkClick
  end
  object RzButton1: TRzButton
    Left = 384
    Top = 355
    Default = True
    ModalResult = 2
    Caption = #21462#28040
    TabOrder = 1
  end
  object edt_czyl: TEdit
    Left = 88
    Top = 368
    Width = 73
    Height = 22
    TabOrder = 2
    Text = 'edt_czyl'
  end
  object edt_czcpbh: TEdit
    Left = 8
    Top = 368
    Width = 73
    Height = 22
    ReadOnly = True
    TabOrder = 3
    Text = 'edt_czcpbh'
  end
  object stg_DDInfo: Ti_StgEdit
    Left = 5
    Top = 56
    Width = 468
    Height = 273
    Anchors = [akLeft, akTop, akRight]
    ColCount = 5
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
    TabOrder = 4
    pt_TitleHeight = 20
    FixedFontStyle = []
    OnLinkClick = stg_DDInfoLinkClick
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
    FormatString = #20135#21697#32534#21495'|'#37038#36164#22270#21517#31216'|'#21360#37327'('#19975#26522')|'#25805#20316'|'
    FixedWordBreak = True
    PermitCellSizing = False
    PermitExport = True
    WordBreak = False
    FixedRowAlignmentCenter = True
    ZeroToEmpty = True
    KeepEdit = False
    EnterAddRow = False
    ColWidths = (
      240
      87
      64
      64
      64)
    RowHeights = (
      20
      20)
  end
end
