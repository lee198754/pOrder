object Frm_ZB: TFrm_ZB
  Left = 519
  Top = 192
  Width = 405
  Height = 262
  Caption = #21046#29256#20449#24687
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #26032#23435#20307
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 389
    Height = 224
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    OnClick = Panel2Click
    object Bevel1: TBevel
      Left = 8
      Top = 160
      Width = 369
      Height = 18
      Shape = bsBottomLine
    end
    object Label24: TLabel
      Left = 21
      Top = 110
      Width = 24
      Height = 12
      Caption = #26194#29256
      Color = clBtnFace
      ParentColor = False
    end
    object Label33: TLabel
      Left = 114
      Top = 109
      Width = 12
      Height = 12
      Caption = #29256
      Color = clBtnFace
      ParentColor = False
    end
    object Label34: TLabel
      Left = 194
      Top = 109
      Width = 12
      Height = 12
      Caption = #24320
      Color = clBtnFace
      ParentColor = False
    end
    object Label35: TLabel
      Left = 258
      Top = 109
      Width = 12
      Height = 12
      Caption = #22359
      Color = clBtnFace
      ParentColor = False
    end
    object edt_ts: Ti_TxtFilter
      Left = 48
      Top = 48
      Width = 121
      Height = 20
      Alignment = taLeftJustify
      WordWrap = False
      WantReturns = False
      WantTabs = False
      ZeroToEmpty = False
      EditLabel.Width = 24
      EditLabel.Height = 12
      EditLabel.Caption = #35843#33394
      EditLabel.Transparent = True
      LabelCaption = #35843#33394
      LabelPosition = lpLeft
      LabelSpacing = 3
      TabEnter = True
      TabOrder = 2
      OnEnter = edt_jdEnter
      OnExit = edt_jdExit
      OnKeyUp = edt_jdKeyUp
      OnMouseDown = edt_jdMouseDown
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
    object edt_gb: Ti_TxtFilter
      Left = 216
      Top = 16
      Width = 145
      Height = 20
      Alignment = taLeftJustify
      WordWrap = False
      WantReturns = False
      WantTabs = False
      ZeroToEmpty = False
      EditLabel.Width = 24
      EditLabel.Height = 12
      EditLabel.Caption = #25913#29256
      EditLabel.Transparent = True
      LabelCaption = #25913#29256
      LabelPosition = lpLeft
      LabelSpacing = 3
      TabEnter = True
      TabOrder = 1
      OnEnter = edt_jdEnter
      OnExit = edt_jdExit
      OnKeyUp = edt_jdKeyUp
      OnMouseDown = edt_jdMouseDown
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
    object edt_dy: Ti_TxtFilter
      Left = 216
      Top = 48
      Width = 145
      Height = 20
      Alignment = taLeftJustify
      WordWrap = False
      WantReturns = False
      WantTabs = False
      ZeroToEmpty = False
      EditLabel.Width = 24
      EditLabel.Height = 12
      EditLabel.Caption = #25171#26679
      EditLabel.Transparent = True
      LabelCaption = #25171#26679
      LabelPosition = lpLeft
      LabelSpacing = 3
      TabEnter = True
      TabOrder = 3
      OnEnter = edt_jdEnter
      OnExit = edt_jdExit
      OnKeyUp = edt_jdKeyUp
      OnMouseDown = edt_jdMouseDown
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
    object edt_jd: Ti_TxtFilter
      Left = 48
      Top = 16
      Width = 121
      Height = 20
      Alignment = taLeftJustify
      WordWrap = False
      WantReturns = False
      WantTabs = False
      ZeroToEmpty = False
      EditLabel.Width = 24
      EditLabel.Height = 12
      EditLabel.Caption = #26657#23545
      EditLabel.Transparent = True
      LabelCaption = #26657#23545
      LabelPosition = lpLeft
      LabelSpacing = 3
      TabEnter = True
      TabOrder = 0
      OnEnter = edt_jdEnter
      OnExit = edt_jdExit
      OnKeyUp = edt_jdKeyUp
      OnMouseDown = edt_jdMouseDown
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
    object edt_pb: Ti_TxtFilter
      Left = 48
      Top = 80
      Width = 121
      Height = 20
      Alignment = taLeftJustify
      WordWrap = False
      WantReturns = False
      WantTabs = False
      ZeroToEmpty = False
      EditLabel.Width = 24
      EditLabel.Height = 12
      EditLabel.Caption = #25340#29256
      EditLabel.Transparent = True
      LabelCaption = #25340#29256
      LabelPosition = lpLeft
      LabelSpacing = 3
      TabEnter = True
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #26032#23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnEnter = edt_jdEnter
      OnExit = edt_jdExit
      OnKeyUp = edt_jdKeyUp
      OnMouseDown = edt_jdMouseDown
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
    object edt_cp: Ti_TxtFilter
      Left = 216
      Top = 80
      Width = 145
      Height = 20
      Alignment = taLeftJustify
      WordWrap = False
      WantReturns = False
      WantTabs = False
      ZeroToEmpty = False
      EditLabel.Width = 24
      EditLabel.Height = 12
      EditLabel.Caption = #20986#29255
      EditLabel.Transparent = True
      LabelCaption = #20986#29255
      LabelPosition = lpLeft
      LabelSpacing = 3
      TabEnter = True
      TabOrder = 5
      OnEnter = edt_jdEnter
      OnExit = edt_jdExit
      OnKeyUp = edt_jdKeyUp
      OnMouseDown = edt_jdMouseDown
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
    object btn_ok: TButton
      Left = 183
      Top = 188
      Width = 75
      Height = 25
      Caption = #30830#35748
      ModalResult = 1
      TabOrder = 11
      OnClick = btn_okClick
    end
    object btn_close: TButton
      Left = 295
      Top = 188
      Width = 75
      Height = 25
      Caption = #20851#38381
      ModalResult = 2
      TabOrder = 12
    end
    object edt_sbk: Ti_TxtFilter
      Tag = 3
      Left = 213
      Top = 107
      Width = 36
      Height = 20
      Hint = 'F_sSbk'
      Alignment = taLeftJustify
      WordWrap = False
      WantReturns = False
      WantTabs = False
      ZeroToEmpty = False
      EditLabel.Width = 6
      EditLabel.Height = 12
      EditLabel.Transparent = True
      LabelPosition = lpLeft
      LabelSpacing = 3
      TabEnter = True
      MaxLength = 4
      TabOrder = 8
      OnEnter = edt_jdEnter
      OnExit = edt_jdExit
      OnKeyUp = edt_jdKeyUp
      OnMouseDown = edt_jdMouseDown
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
    object cbb_sblb: TComboBox
      Tag = 3
      Left = 48
      Top = 106
      Width = 57
      Height = 20
      Hint = 'F_sSblb'
      ItemHeight = 12
      ItemIndex = 1
      TabOrder = 6
      Text = 'CTP'
      OnEnter = cbb_sblbEnter
      Items.Strings = (
        'CTF'
        'CTP')
    end
    object cbb_sbks: TComboBox
      Tag = 3
      Left = 135
      Top = 106
      Width = 50
      Height = 20
      Hint = 'F_sSbks'
      ItemHeight = 12
      ItemIndex = 2
      TabOrder = 7
      Text = '4'
      OnEnter = cbb_sblbEnter
      Items.Strings = (
        #23545
        '3'
        '4'
        '6'
        '8')
    end
    object edt_qt: Ti_TxtFilter
      Left = 48
      Top = 136
      Width = 313
      Height = 20
      Alignment = taLeftJustify
      WordWrap = False
      WantReturns = False
      WantTabs = False
      ZeroToEmpty = False
      EditLabel.Width = 24
      EditLabel.Height = 12
      EditLabel.Caption = #20854#20182
      EditLabel.Transparent = True
      LabelCaption = #20854#20182
      LabelPosition = lpLeft
      LabelSpacing = 3
      TabEnter = True
      TabOrder = 9
      OnEnter = edt_jdEnter
      OnExit = edt_jdExit
      OnKeyUp = edt_jdKeyUp
      OnMouseDown = edt_jdMouseDown
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
    object lb_Temp: TListBox
      Left = 48
      Top = 184
      Width = 121
      Height = 98
      Ctl3D = False
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = #26032#23435#20307
      Font.Style = []
      ItemHeight = 16
      Items.Strings = (
        '1'
        '2'
        '3'
        '4'
        '5'
        '6'
        '7')
      ParentCtl3D = False
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 10
      Visible = False
      OnKeyDown = lb_TempKeyDown
      OnKeyUp = lb_TempKeyUp
      OnMouseDown = lb_TempMouseDown
      OnMouseMove = lb_TempMouseMove
    end
  end
end