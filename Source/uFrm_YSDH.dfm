object Frm_YSDH: TFrm_YSDH
  Left = 474
  Top = 143
  Width = 480
  Height = 366
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = #26426#21488#20449#24687
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #26032#23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 464
    Height = 328
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    OnMouseDown = Panel2MouseDown
    object Bevel1: TBevel
      Left = 8
      Top = 264
      Width = 429
      Height = 18
      Shape = bsBottomLine
    end
    object Label2: TLabel
      Left = 208
      Top = 147
      Width = 48
      Height = 12
      Caption = #21360#21046#31867#22411
    end
    object Label24: TLabel
      Left = 9
      Top = 210
      Width = 48
      Height = 12
      Caption = #21360#21069#24037#24207
      Color = clBtnFace
      ParentColor = False
    end
    object Label33: TLabel
      Left = 142
      Top = 210
      Width = 24
      Height = 12
      Caption = #25968#37327
      Color = clBtnFace
      ParentColor = False
    end
    object Label35: TLabel
      Left = 254
      Top = 210
      Width = 24
      Height = 12
      Caption = #21333#20301
      Color = clBtnFace
      ParentColor = False
    end
    object edt_bh: Ti_TxtFilter
      Left = 60
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
      EditLabel.Caption = #32534#21495
      EditLabel.Transparent = True
      LabelCaption = #32534#21495
      LabelPosition = lpLeft
      LabelSpacing = 3
      TabEnter = True
      TabOrder = 0
      OnEnter = edt_bhEnter
      OnExit = edt_bhExit
      OnKeyUp = edt_bhKeyUp
      OnMouseDown = edt_bhMouseDown
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
    object edt_jt: Ti_TxtFilter
      Left = 268
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
      EditLabel.Caption = #26426#21488
      EditLabel.Transparent = True
      LabelCaption = #26426#21488
      LabelPosition = lpLeft
      LabelSpacing = 3
      TabEnter = True
      TabOrder = 1
      OnEnter = edt_bhEnter
      OnExit = edt_bhExit
      OnKeyUp = edt_bhKeyUp
      OnMouseDown = edt_bhMouseDown
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
    object edt_sc: Ti_TxtFilter
      Left = 268
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
      EditLabel.Caption = #33394#27425
      EditLabel.Transparent = True
      LabelCaption = #33394#27425
      LabelPosition = lpLeft
      LabelSpacing = 3
      TabEnter = True
      TabOrder = 3
      OnEnter = edt_bhEnter
      OnExit = edt_scExit
      OnKeyUp = edt_sbsKeyUp
      OnMouseDown = edt_sbsMouseDown
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
    object edt_sbs: Ti_TxtFilter
      Left = 60
      Top = 80
      Width = 121
      Height = 20
      Alignment = taLeftJustify
      WordWrap = False
      WantReturns = False
      WantTabs = False
      ZeroToEmpty = False
      EditLabel.Width = 48
      EditLabel.Height = 12
      EditLabel.Caption = #19978#26426#24320#26412
      EditLabel.Transparent = True
      LabelCaption = #19978#26426#24320#26412
      LabelPosition = lpLeft
      LabelSpacing = 3
      TabEnter = True
      TabOrder = 2
      OnEnter = edt_bhEnter
      OnExit = edt_sbsExit
      OnKeyUp = edt_sbsKeyUp
      OnMouseDown = edt_sbsMouseDown
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
    object edt_qt: Ti_TxtFilter
      Left = 60
      Top = 176
      Width = 353
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
      TabOrder = 7
      OnEnter = edt_bhEnter
      OnExit = EdtExit
      OnKeyUp = edt_sbsKeyUp
      OnMouseDown = edt_sbsMouseDown
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
    object edt_sb: Ti_TxtFilter
      Left = 60
      Top = 112
      Width = 353
      Height = 20
      Alignment = taLeftJustify
      WordWrap = False
      WantReturns = False
      WantTabs = False
      ZeroToEmpty = False
      EditLabel.Width = 24
      EditLabel.Height = 12
      EditLabel.Caption = #33394#21035
      EditLabel.Transparent = True
      LabelCaption = #33394#21035
      LabelPosition = lpLeft
      LabelSpacing = 3
      TabEnter = True
      TabOrder = 4
      Text = '(TKTHK)'#32418#34013#40644#12289#19987#40657
      OnEnter = edt_bhEnter
      OnExit = EdtExit
      OnKeyUp = edt_sbsKeyUp
      OnMouseDown = edt_sbsMouseDown
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
    object edt_ys_1: Ti_TxtFilter
      Left = 60
      Top = 144
      Width = 55
      Height = 20
      Alignment = taLeftJustify
      WordWrap = False
      WantReturns = False
      WantTabs = False
      ZeroToEmpty = False
      EditLabel.Width = 24
      EditLabel.Height = 12
      EditLabel.Caption = #21360#25968
      EditLabel.Transparent = True
      LabelCaption = #21360#25968
      LabelPosition = lpLeft
      LabelSpacing = 3
      TabEnter = True
      TabOrder = 5
      OnEnter = edt_bhEnter
      OnExit = edt_ys_1Exit
      OnKeyUp = edt_sbsKeyUp
      OnMouseDown = edt_sbsMouseDown
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
      Left = 251
      Top = 292
      Width = 75
      Height = 25
      Caption = #30830#35748
      ModalResult = 1
      TabOrder = 8
      OnClick = btn_okClick
    end
    object btn_close: TButton
      Left = 363
      Top = 292
      Width = 75
      Height = 25
      Caption = #20851#38381
      ModalResult = 2
      TabOrder = 9
    end
    object cbb_yzlx: TComboBox
      Left = 260
      Top = 144
      Width = 145
      Height = 20
      ItemHeight = 12
      ItemIndex = 1
      TabOrder = 6
      Text = #22871#21360
      OnEnter = cbb_yzlxEnter
      Items.Strings = (
        #32763#21360
        #22871#21360
        #21333#38754#21360)
    end
    object edt_bz: Ti_TxtFilter
      Left = 396
      Top = 204
      Width = 353
      Height = 20
      Alignment = taLeftJustify
      WordWrap = False
      WantReturns = False
      WantTabs = False
      ZeroToEmpty = False
      EditLabel.Width = 24
      EditLabel.Height = 12
      EditLabel.Caption = #22791#27880
      EditLabel.Transparent = True
      LabelCaption = #22791#27880
      LabelPosition = lpLeft
      LabelSpacing = 3
      TabEnter = True
      TabOrder = 11
      Visible = False
      OnEnter = edt_bhEnter
      OnExit = EdtExit
      OnKeyUp = edt_sbsKeyUp
      OnMouseDown = edt_sbsMouseDown
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
    object edt_sbk: Ti_TxtFilter
      Tag = 3
      Left = 170
      Top = 206
      Width = 56
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
      TabOrder = 12
      OnEnter = edt_bhEnter
      OnExit = edt_ys_1Exit
      OnKeyUp = edt_sbsKeyUp
      OnMouseDown = edt_sbsMouseDown
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
      Left = 61
      Top = 206
      Width = 57
      Height = 20
      Hint = 'F_sSblb'
      ItemHeight = 12
      ItemIndex = 0
      TabOrder = 13
      Text = #35013#29256
      Items.Strings = (
        #35013#29256)
    end
    object cbb_sbks: TComboBox
      Tag = 3
      Left = 284
      Top = 206
      Width = 50
      Height = 20
      Hint = 'F_sSbks'
      ItemHeight = 12
      ItemIndex = 0
      TabOrder = 14
      Text = #29256
      Items.Strings = (
        #29256)
    end
    object edt_ysyq: Ti_TxtFilter
      Left = 60
      Top = 236
      Width = 353
      Height = 20
      Alignment = taLeftJustify
      WordWrap = False
      WantReturns = False
      WantTabs = False
      ZeroToEmpty = False
      EditLabel.Width = 48
      EditLabel.Height = 12
      EditLabel.Caption = #21360#21047#35201#27714
      EditLabel.Transparent = True
      LabelCaption = #21360#21047#35201#27714
      LabelPosition = lpLeft
      LabelSpacing = 3
      TabEnter = True
      TabOrder = 15
      OnEnter = edt_bhEnter
      OnExit = EdtExit
      OnKeyUp = edt_sbsKeyUp
      OnMouseDown = edt_sbsMouseDown
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
    object edt_gjmc: Ti_TxtFilter
      Left = 60
      Top = 16
      Width = 121
      Height = 20
      Alignment = taLeftJustify
      WordWrap = False
      WantReturns = False
      WantTabs = False
      ZeroToEmpty = False
      EditLabel.Width = 48
      EditLabel.Height = 12
      EditLabel.Caption = #26500#20214#21517#31216
      EditLabel.Transparent = True
      LabelCaption = #26500#20214#21517#31216
      LabelPosition = lpLeft
      LabelSpacing = 3
      TabEnter = True
      TabOrder = 16
      OnEnter = edt_bhEnter
      OnExit = EdtExit
      OnKeyUp = edt_sbsKeyUp
      OnMouseDown = edt_sbsMouseDown
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
    object edt_ys_2: Ti_TxtFilter
      Left = 137
      Top = 144
      Width = 55
      Height = 20
      Alignment = taLeftJustify
      WordWrap = False
      WantReturns = False
      WantTabs = False
      ZeroToEmpty = False
      EditLabel.Width = 12
      EditLabel.Height = 12
      EditLabel.Caption = '/ '
      EditLabel.Transparent = True
      LabelCaption = '/ '
      LabelPosition = lpLeft
      LabelSpacing = 3
      TabEnter = True
      TabOrder = 17
      OnEnter = edt_bhEnter
      OnExit = edt_ys_1Exit
      OnKeyUp = edt_sbsKeyUp
      OnMouseDown = edt_sbsMouseDown
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
      Left = 36
      Top = 296
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
    object btn_jt: TButton
      Left = 180
      Top = 46
      Width = 22
      Height = 21
      Caption = #8230
      TabOrder = 18
      OnClick = btn_jtClick
    end
  end
end
