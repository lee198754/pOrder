object Frm_HBST: TFrm_HBST
  Left = 441
  Top = 209
  Width = 260
  Height = 187
  Caption = #30011#29256#24335#22270
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #26032#23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 12
  object Label1: TLabel
    Left = 189
    Top = 28
    Width = 36
    Height = 12
    Caption = '(1~10)'
    Font.Charset = GB2312_CHARSET
    Font.Color = clRed
    Font.Height = -12
    Font.Name = #26032#23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 190
    Top = 61
    Width = 30
    Height = 12
    Caption = '(1~4)'
    Font.Charset = GB2312_CHARSET
    Font.Color = clRed
    Font.Height = -12
    Font.Name = #26032#23435#20307
    Font.Style = []
    ParentFont = False
  end
  object edt_Col: Ti_TxtFilter
    Left = 64
    Top = 56
    Width = 121
    Height = 20
    Alignment = taLeftJustify
    WordWrap = False
    WantReturns = False
    WantTabs = False
    ZeroToEmpty = False
    EditLabel.Width = 24
    EditLabel.Height = 12
    EditLabel.Caption = #21015#65306
    EditLabel.Transparent = True
    LabelCaption = #21015#65306
    LabelPosition = lpLeft
    LabelSpacing = 3
    TabEnter = True
    TabOrder = 1
    AllowNegative = True
    BorderLine = False
    BorderLineColor = clBlack
    BorderLineGap = 0
    ErrDialog = False
    ErrLostFocus = False
    FullEnter = True
    LabelEnableFollow = True
    LabelLeft = -1
    LabelTransParent = True
    LayOut = BIVCenter
    Style = PNomal
    ReadOnly_X = False
    AllowEmpty_X = True
  end
  object edt_Row: Ti_TxtFilter
    Left = 64
    Top = 24
    Width = 121
    Height = 20
    Alignment = taLeftJustify
    WordWrap = False
    WantReturns = False
    WantTabs = False
    ZeroToEmpty = False
    EditLabel.Width = 24
    EditLabel.Height = 12
    EditLabel.Caption = #34892#65306
    EditLabel.Transparent = True
    LabelCaption = #34892#65306
    LabelPosition = lpLeft
    LabelSpacing = 3
    TabEnter = True
    TabOrder = 0
    AllowNegative = True
    BorderLine = False
    BorderLineColor = clBlack
    BorderLineGap = 0
    ErrDialog = False
    ErrLostFocus = False
    FullEnter = True
    LabelEnableFollow = True
    LabelLeft = -1
    LabelTransParent = True
    LayOut = BIVCenter
    Style = PNomal
    ReadOnly_X = False
    AllowEmpty_X = True
  end
  object btn_ok: TRzButton
    Left = 80
    Top = 96
    Caption = #30830#23450
    TabOrder = 2
    OnClick = btn_okClick
  end
end
