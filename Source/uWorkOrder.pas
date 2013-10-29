unit uWorkOrder;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBGridEhGrouping, GridsEh, DBGridEh, ExtCtrls, RzPanel, StdCtrls,
  DB, ADODB, ComCtrls, RzDTP, ButtonEdit, RM_Dataset, RM_System, RM_Common,
  RM_Class, RM_Designer, RM_e_Xls, RM_e_Graphic, RM_e_Jpeg, CheckLst,uPub_Type;

type
  TFrm_WorkOrder = class(TForm)                                                                           
    RzGroupBox1: TRzGroupBox;
    dbg_gdxx: TDBGridEh;
    Panel1: TPanel;
    ADO_WorkOrder: TADOQuery;
    ds_WorkOrder: TDataSource;
    RzGroupBox3: TRzGroupBox;
    mmo_bz: TMemo;
    RzGroupBox4: TRzGroupBox;
    mmo_zdyq: TMemo;
    edt_pm: Ti_TxtFilter;
    edt_hm: Ti_TxtFilter;
    edt_gdh: Ti_TxtFilter;
    dtp_kdrq: TRzDateTimePicker;
    Label3: TLabel;
    edt_zl: Ti_TxtFilter;
    edt_Tj: Ti_TxtFilter;
    edt_Zj: Ti_TxtFilter;
    cbb_cpks: TComboBox;
    edt_cpk: Ti_TxtFilter;
    edt_cpc: Ti_TxtFilter;
    Label5: TLabel;
    Label4: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    Label16: TLabel;
    edt_zh: Ti_TxtFilter;
    edt_rjhdq: Ti_TxtFilter;
    edt_rjhdz: Ti_TxtFilter;
    Label32: TLabel;
    Label15: TLabel;
    dtp_jhrq: TRzDateTimePicker;
    Label53: TLabel;
    lb_Temp: TListBox;
    rmdb_WorkOrder: TRMDBDataSet;
    rmr_Print: TRMReport;
    rmdb_Details: TRMDBDataSet;
    ADO_Details: TADOQuery;
    btn_zdyq: TButton;
    btn_AddRow: TButton;
    btn_DelRow: TButton;
    gb_zt: TRzGroupBox;
    pan_cz: TRzPanel;
    btn_zd: TButton;
    btn_xg: TButton;
    btn_dy: TButton;
    btn_cx: TButton;
    btn_Close: TButton;
    lab_zwrq: TLabel;
    lab_ywrq: TLabel;
    lab_sczt: TLabel;
    lab_jbrq: TLabel;
    btn_mbsj: TButton;
    ADO_MkProcDet: TADOQuery;
    rmdb_MkProcDet: TRMDBDataSet;
    cbb_zldw: TComboBox;
    Label35: TLabel;
    ADO_Matl: TADOQuery;
    rmdb_Matl: TRMDBDataSet;
    btn_History: TButton;
    btn_History_dy: TButton;
    cb_gyyq: TCheckListBox;
    edt_cpgg: Ti_TxtFilter;
    edt_fhdm: Ti_TxtFilter;
    edt_qshm: Ti_TxtFilter;
    edt_zzhm: Ti_TxtFilter;
    edt_zyph: Ti_TxtFilter;
    rmdb_ZB: TRMDBDataSet;
    ADO_ZB: TADOQuery;
    rmr_XPLPrint: TRMReport;
    Label6: TLabel;
    rb_jd_no: TRadioButton;
    rb_jd_yes: TRadioButton;
    procedure dbg_gdxxColumns1EditButtonClick(Sender: TObject;
      var Handled: Boolean);
    procedure dbg_gdxxColumns5EditButtonClick(Sender: TObject;
      var Handled: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbg_gdxxColumns2EditButtonClick(Sender: TObject;
      var Handled: Boolean);
    procedure dbg_gdxxColumns3EditButtonClick(Sender: TObject;
      var Handled: Boolean);
    procedure btn_zdClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edt_hmMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure edt_hmKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_hmEnter(Sender: TObject);
    procedure edt_hmExit(Sender: TObject);
    procedure lb_TempKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure lb_TempKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure lb_TempMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure lb_TempMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Panel1Click(Sender: TObject);
    procedure btn_dyClick(Sender: TObject);
    procedure btn_zdyqClick(Sender: TObject);
    procedure btn_AddRowClick(Sender: TObject);
    procedure btn_DelRowClick(Sender: TObject);
    procedure btn_xgClick(Sender: TObject);
    procedure btn_cxClick(Sender: TObject);
    procedure dbg_gdxxColumns4UpdateData(Sender: TObject; var Text: String;
      var Value: Variant; var UseText, Handled: Boolean);
    procedure edt_zlExit(Sender: TObject);
    procedure edt_TjExit(Sender: TObject);
    procedure btn_mbsjClick(Sender: TObject);
    procedure dbg_gdxxColumns0EditButtonClick(Sender: TObject;
      var Handled: Boolean);
    procedure btn_HistoryClick(Sender: TObject);
    procedure btn_History_dyClick(Sender: TObject);
    procedure dbg_gdxxColumns1UpdateData(Sender: TObject; var Text: String;
      var Value: Variant; var UseText, Handled: Boolean);
    procedure edt_qshmExit(Sender: TObject);
    procedure cb_gyyqMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
    OrderData_Bag: array of TOrderData;
    OrderGroup_Bag: array of TOrderGroup;
    aBST_Bag: array of TBST;
    aBSTPrint_Bag: array of TBSTPrint;
    aYSDH_Bag: array of TYSDH;
    aCL_Bag: array of TCL;
    aZB_Bag: array of TZB;
    aZBGX_Bag: array of TZBGX;
    aRJHD_Bag: array of TRJHD;
    bEnter: Boolean;
    vEdt: Ti_TxtFilter;
    g_bSCXG: Boolean;  //是否允许不受工单状态限制修改工单
    procedure EdtExit(Sender: TObject);
    procedure EdtEnter(Sender: TObject);
    procedure EdtKey(Sender: TObject; Key: Word);
    procedure SetSort(var StrList: TStringList);
    procedure SaveRJHD;
    function p_AddWorkOrder: Boolean;
    function p_History_AddWorkOrder: Boolean;   //历史工单添加
    function p_ModifyWorkOrder: Boolean;
    function GetCPBH: string;
    function IfCheck: Boolean;
    function GetBSTYS_old: Integer;    //获取本版共印(旧)
    function GetBSTYS: Integer;    //获取本版共印
    function f_MakeAllow: Boolean;   //操作允许
    function f_SaveArrWorkOrder: Boolean;  //保存工单数组
    function f_LoadArrWorkOrder: Boolean;  //读取工单数组
    procedure dbg_gdxxBSTEditButtonClick_old(Sender: TObject; var Handled: Boolean);
  public
    { Public declarations }
    vBSTID: Integer;
    vActionType: integer;       {c_WorkOrder_Select,c_WorkOrder_Modify,c_WorkOrder_KD}
    vWorkID: integer;
    vGroupID: Integer;
    vbCXBZ: Boolean;     //撤销标志(False: 未撤销;True: 已撤销)
    vbHistory: Boolean;  //历史工单
    function p_LoadWorkOrderData: Boolean;    //读取工单数据到数组中
    function p_LoadHistoryWorkOrderData: Boolean;    //读取历史工单数据到数组中
    procedure p_GetZDGY;             //获取装订工艺
  protected
    procedure CreateParams(var Params: TCreateParams); override;
  end;

var
  Frm_WorkOrder: TFrm_WorkOrder;
  aFrm_WorkOrder: array of TFrm_WorkOrder;

implementation

uses
  uDM_DataBase,uOrderList, uPub_Func, uFrm_YSDH, uBSTPrint, uHBST, uFrm_ZB,
  uFrm_CL, PubStr, Registry, uFrm_zdgy, uPub_Text, uFrm_WorkOrder_ZB, uFrm_WorkOrder_History,DateUtils;

{$R *.dfm}

procedure TFrm_WorkOrder.dbg_gdxxColumns0EditButtonClick(Sender: TObject;
  var Handled: Boolean);
var
  i: Integer;
  str: string;
begin
  Frm_OrderList := TFrm_OrderList.Create(Self);
  Frm_OrderList.vGroup := ADO_WorkOrder.RecNo;
  Frm_OrderList.vActionType := Self.vActionType;
  if Frm_OrderList.ShowModal = mrok then
  begin
    str := '';
    for i := 0 to Length(OrderData) -1 do
    begin
      if OrderData[i].m_iGroupID = ADO_WorkOrder.RecNo then
        str := str + OrderData[i].m_sCPBH + '; ';
    end;
    ADO_WorkOrder.Edit;
    ADO_WorkOrder.FieldByName('Orders').AsString := str;
    ADO_WorkOrder.Post;
  end;

  Frm_OrderList.Free;
end;

procedure TFrm_WorkOrder.dbg_gdxxColumns1EditButtonClick(Sender: TObject;
  var Handled: Boolean);
var
  i, iBSTYS: Integer;
  sJTMC: string;
begin
  Frm_YSDH := TFrm_YSDH.Create(Self);
  Frm_YSDH.vGroupID := ADO_WorkOrder.RecNo;
  Frm_YSDH.vActionType := Self.vActionType;
  if Frm_YSDH.ShowModal = mrok then
  begin
    sJTMC := '';
    for i := 0 to Length(aYSDH) -1 do
    begin
      if aYSDH[i].m_iGroupID = ADO_WorkOrder.RecNo then
      begin
        sJTMC := aYSDH[i].m_sJTMC;
      end;
    end;
    ADO_WorkOrder.Edit;
    ADO_WorkOrder.FieldByName('JTMC').AsString := sJTMC;
    iBSTYS := GetBSTYS;
    if iBSTYS > 0 then
      ADO_WorkOrder.FieldByName('BSTYS').AsInteger := iBSTYS;
    ADO_WorkOrder.Post;
  end;

  Frm_YSDH.Free;

end;

procedure TFrm_WorkOrder.dbg_gdxxColumns5EditButtonClick(Sender: TObject;
  var Handled: Boolean);
var
  AOD_Rec: TADOQuery;
  iBSTID: integer;
  sSqlData: string;
  i, n, iBSTZS, iBSTYS: integer;
  sGDH, sCplx, sYztmc: string;
  bInsert: Boolean;
begin
  //dbg_gdxxBSTEditButtonClick_old(Sender,Handled);
  //Exit;
  
  iBSTZS := ADO_WorkOrder.FieldByName('BSTZS').AsInteger;
  iBSTYS := ADO_WorkOrder.FieldByName('BSTYS').AsInteger;
  iBSTID := 0;
  for i := 0 to Length(aYSDH) -1 do
  begin
    if aYSDH[i].m_iGroupID = ADO_WorkOrder.RecNo then
      iBSTID := iif(aYSDH[i].m_iBSTID > 0,aYSDH[i].m_iBSTID, 0);
  end;
  vBSTID := iBSTID;
  sGDH := edt_gdh.Text;
  if Length(OrderData) > 0 then
  begin
    sSqlData := 'Select b.F_sCplx,a.F_sYZTMC from DO_OrderApart a,Set_PostageType b where a.F_sYZTMC like b.F_sYZTMC +''%%'' and a.F_iID=%d and a.F_tiCXBZ = 0 ';
    AOD_Rec := DM_DataBase.OpenQuery(sSqlData,[OrderData[0].m_iApartID]);
    if AOD_Rec.RecordCount >0 then
    begin
      sCplx := AOD_Rec.FieldByName('F_sCplx').AsString;
      sYztmc := AOD_Rec.FieldByName('F_sYZTMC').AsString;
    end;
    AOD_Rec.Free;
  end;
  if iBSTZS = 0 then
  begin
{    Frm_HBST := TFrm_HBST.Create(Self);
    Frm_HBST.ShowModal;
    Frm_HBST.Free;  }
    Frm_BSTPrint := TFrm_BSTPrint.Create(Self);
    Frm_BSTPrint.vActionType := Self.vActionType;
    Frm_BSTPrint.vCplx := sCplx;
    Frm_BSTPrint.vYztmc := sYztmc;
    Frm_BSTPrint.vBSTZS := iBSTZS;
    Frm_BSTPrint.vBSTYS := iBSTYS;
    Frm_BSTPrint.vGDH := sGDH;
    Frm_BSTPrint.ShowModal;
    vBSTID := Frm_BSTPrint.vBSTID;
    n := -1;
    for i := 0 to Length(aYSDH) -1 do
    begin
      if aYSDH[i].m_iGroupID = ADO_WorkOrder.RecNo then
      begin
        n := i;
        Break;
      end;
    end;
    if n = -1 then
    begin
      SetLength(aYSDH,Length(aYSDH)+1);
      n := Length(aYSDH)-1;
      aYSDH[n].m_iGroupID := ADO_WorkOrder.RecNo;
    end;
    aYSDH[n].m_iBSTID := vBSTID;
    aYSDH[n].m_iBSTZS := Frm_BSTPrint.vBSTZS;
    ADO_WorkOrder.Edit;
    ADO_WorkOrder.FieldByName('BSTZS').AsInteger := Frm_BSTPrint.vBSTZS;
    if iBSTYS = 0 then
    begin
      iBSTYS := GetBSTYS;
      if iBSTYS > 0 then
        ADO_WorkOrder.FieldByName('BSTYS').AsInteger := iBSTYS;
    end;
    ADO_WorkOrder.Post;
    Frm_BSTPrint.Free;

  end else
  if iBSTZS > 0 then
  begin
    Frm_BSTPrint := TFrm_BSTPrint.Create(Self);
    Frm_BSTPrint.vActionType := Self.vActionType;
    Frm_BSTPrint.vCplx := sCplx;
    Frm_BSTPrint.vYztmc := sYztmc;
    Frm_BSTPrint.vBSTZS := iBSTZS;
    Frm_BSTPrint.vBSTYS := iBSTYS;
    Frm_BSTPrint.vGDH := sGDH;
   // if iBSTID = -1 then
   //   iBSTID := ADO_WorkOrder.FieldByName('BSTID').AsInteger;
    for i := 0 to Length(aBST) -1 do
    begin
      if aBST[i].m_iGroupID = ADO_WorkOrder.RecNo then
      begin
        Frm_BSTPrint.vRow := aBST[i].m_iRow;
        Frm_BSTPrint.vCol := aBST[i].m_iCol;
        Frm_BSTPrint.mmo_bz.Text := aBST[i].m_sBZ;
       // vBSTID := iBSTID;
      end;
    end;
    while Frm_BSTPrint.ShowModal = mrNo do
    begin
      Frm_BSTPrint.Free;
      Frm_BSTPrint := TFrm_BSTPrint.Create(Self);
      Frm_BSTPrint.vActionType := Self.vActionType;
      Frm_BSTPrint.vCplx := sCplx;
      Frm_BSTPrint.vYztmc := sYztmc;
      Frm_BSTPrint.vBSTZS := 0;
      Frm_BSTPrint.vBSTYS := iBSTYS;
      Frm_BSTPrint.vGDH := sGDH;
      Frm_HBST := TFrm_HBST.Create(Self);
      Frm_HBST.ShowModal;
      //if Frm_HBST.ShowModal <> mrOk then
      if not Frm_HBST.vSucceed then
      begin
        Frm_HBST.Free;
        Break;
      end;
      Frm_HBST.Free;
    end;
    vBSTID := Frm_BSTPrint.vBSTID;
    n := -1;
    for i := 0 to Length(aYSDH) -1 do
    begin
      if aYSDH[i].m_iGroupID = ADO_WorkOrder.RecNo then
      begin
        n := i;
        Break;
      end;
    end;
    if n = -1 then
    begin
      SetLength(aYSDH,Length(aYSDH)+1);
      n := Length(aYSDH)-1;
      aYSDH[n].m_iGroupID := ADO_WorkOrder.RecNo;
    end;
    aYSDH[n].m_iBSTID := vBSTID;
    aYSDH[n].m_iBSTZS := Frm_BSTPrint.vBSTZS;
    ADO_WorkOrder.Edit;
    ADO_WorkOrder.FieldByName('BSTZS').AsInteger := Frm_BSTPrint.vBSTZS;
    if iBSTYS = 0 then
    begin
      iBSTYS := GetBSTYS;
      if iBSTYS > 0 then
        ADO_WorkOrder.FieldByName('BSTYS').AsInteger := iBSTYS;
    end;
    ADO_WorkOrder.Post;
    Frm_BSTPrint.Free;
  end;

end;

procedure TFrm_WorkOrder.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  try
    ADO_WorkOrder.Close;
    ADO_WorkOrder.SQL.Text := 'drop table #s';
    if vbHistory then
      ADO_WorkOrder.SQL.Text := 'drop table #History_s';
    ADO_WorkOrder.ExecSQL;
  except

  end;

end;

procedure TFrm_WorkOrder.dbg_gdxxColumns2EditButtonClick(Sender: TObject;
  var Handled: Boolean);
var
  i: Integer;
  str: string;
begin
  Frm_CL := TFrm_CL.Create(Self);
  Frm_CL.vGroupID := ADO_WorkOrder.RecNo;
  Frm_CL.vActionType := Self.vActionType;
  if Frm_CL.ShowModal = mrok then
  begin
    str := '';
    for i := 0 to Length(aCL) -1 do
    begin
      if aCL[i].m_iGroupID = ADO_WorkOrder.RecNo then
        str := aCL[i].m_sCLMC;
    end;
    ADO_WorkOrder.Edit;
    ADO_WorkOrder.FieldByName('CL').AsString := str;
    ADO_WorkOrder.Post;
  end;

  Frm_CL.Free;
end;

procedure TFrm_WorkOrder.dbg_gdxxColumns3EditButtonClick(Sender: TObject;
  var Handled: Boolean);
var
  i: Integer;
  str: string;
begin
  Frm_WorkOrder_ZB := TFrm_WorkOrder_ZB.Create(Self);
  Frm_WorkOrder_ZB.vGroupID := ADO_WorkOrder.RecNo;
  Frm_WorkOrder_ZB.vActionType := Self.vActionType;
  if Frm_WorkOrder_ZB.ShowModal = mrok then
  begin
    str := '';
    {for i := 0 to Length(aZB) -1 do
    begin
      if aZB[i].m_iGroupID = ADO_WorkOrder.RecNo then
        str := aZB[i].m_sSBLB + '版 ' + aZB[i].m_sSBKS + '开 ' + IntToStr(aZB[i].m_iSBK) + '块';
    end;   }
    for i := 0 to Length(aZBGX) -1 do
    begin
      if aZBGX[i].m_iGroupID = ADO_WorkOrder.RecNo then
        str := str + ';' + aZBGX[i].m_sName ;
    end;
    str := Copy(str,2,Length(str));
    ADO_WorkOrder.Edit;
    ADO_WorkOrder.FieldByName('ZB').AsString := str;
    ADO_WorkOrder.Post;
  end;

  Frm_WorkOrder_ZB.Free;
end;

procedure TFrm_WorkOrder.btn_zdClick(Sender: TObject);
var
  sSqlData: string;
  ADO_Rec: TADOQuery;
  iProductTypeID, iProductCategoryID: Integer;
  aCheckRJHD: TArrRJHD;
  str: string;
  i: Integer;
begin
  if not IfCheck then Exit;
  aCheckRJHD:=f_CheckRJHD(aRJHD);
  if Length(aCheckRJHD) > 0 then
  begin
    for i := 0 to Length(aCheckRJHD)-1 do
    begin
      str := str + Format('与%s %s %s-%s 重复'+#13#10 ,
        [aCheckRJHD[i].m_sCPBH,aCheckRJHD[i].m_sZH,aCheckRJHD[i].m_sRJHDQ,aCheckRJHD[i].m_sRJHDZ]) ;
    end;
    p_MessageBoxDlg(str);
    Exit;
  end;
  //------------------存储过程检验-------------------
  sSqlData := 'Select b.F_iProductTypeID from DO_OrderApart a,Set_PostageType b where CHARINDEX(b.F_sYZTMC,a.F_sYztmc)=1 and a.F_iID=%d';
  ADO_Rec := DM_DataBase.OpenQuery(sSqlData,[OrderData[0].m_iApartID],True);
  iProductTypeID := ADO_Rec.FieldByName('F_iProductTypeID').AsInteger;
  ADO_Rec.Free;
  if OrderData[0].m_iType = 0 then
    sSqlData := 'Select c.F_iID from DO_OrderApart a,BI_CustomOrderDetails b,Set_ProductCategory c '
      +' where a.F_iOrderID = b.F_iID and b.F_iProductType=c.F_iClassCode and a.F_iID=%d'
  else if OrderData[0].m_iType = 1 then
    sSqlData := 'Select c.F_iID from DO_OrderApart a,BI_SellOrderDetails b,Set_ProductCategory c '
      +' where a.F_iOrderID = b.F_iID and b.F_iProductType=c.F_iClassCode and a.F_iID=%d';
  ADO_Rec := DM_DataBase.OpenQuery(sSqlData,[OrderData[0].m_iApartID],True);
  iProductCategoryID := ADO_Rec.FieldByName('F_iID').AsInteger;
  sSqlData := 'exec p_Check_WorkOrder_ZD ''%s'',%d,%d';
  ADO_Rec := DM_DataBase.OpenQuery(sSqlData,[LoginData.m_sUserName,iProductCategoryID,iProductTypeID]);
  if Assigned(ADO_Rec) and (ADO_Rec.RecordCount > 0) then
  begin
    if ADO_Rec.FieldByName('Flag').AsInteger = 1 then
    begin
      p_MessageBoxDlg(ADO_Rec.FieldByName('Hint').AsString);
      ADO_Rec.Free;
      Exit;
    end;
  end;
  if Assigned(ADO_Rec) then
    ADO_Rec.Free;

  //-------------------------------------------
//  if p_AddWorkOrder and p_History_AddWorkOrder then  //暂不用把当前工单加入历史工单
  if p_AddWorkOrder then
  begin
    p_MessageBoxDlg('制单成功!');
    btn_zd.Enabled := False;
    btn_xg.Enabled := True;
    btn_dy.Enabled := True;
    btn_cx.Enabled := True;
  end else
    p_MessageBoxDlg('制单失败!')
end;

procedure TFrm_WorkOrder.FormShow(Sender: TObject);
var
  str: string;
begin
  if vActionType = c_WorkOrder_Select then
  begin
    btn_zd.Enabled := False;
    btn_xg.Enabled := False;
    btn_cx.Enabled := False;
    btn_dy.Enabled := True;
    {for i := 0 to dbg_gdxx.Columns.Count -1 do
    begin
      if dbg_gdxx.Columns[i].FieldName <> 'BSTZS' then
        dbg_gdxx.Columns[i].ButtonStyle := cbsNone;
    end;    }
  end;
  VertScrollBar.Position := 0;
  str := cbb_cpks.Text;
  CbbParamAdd(cbb_cpks,'成品开数');
  cbb_cpks.Text := str;
  p_GetZDGY;
  GetDeclareNumbersList;
  //操作允许判断
  f_MakeAllow;
end;

procedure TFrm_WorkOrder.EdtExit(Sender: TObject);
var
  MyReg: TRegistry;
  i,n: integer;
  ItemList,str: string;
  edt: TEdit;
  List: TStringList;
begin
  lb_Temp.BringToFront;
  bEnter := False;
  if (vEdt=nil) or (Ti_TxtFilter(Sender).Name <> vEdt.Name) then
    lb_Temp.Visible := False;
  edt := TEdit(Sender);
  MyReg := TRegistry.Create;
  MyReg.RootKey := HKEY_LOCAL_MACHINE;
  MyReg.OpenKey(c_Reg_WorkOrder_CookiePath,True);
  if MyReg.ValueExists(edt.Name) then
    ItemList := MyReg.ReadString(edt.Name);
  List := TStringList.Create;
  n := PosNum(ItemList,';');
  for i := 1 to n do
  begin
    str := PosCopy(ItemList,';',i);
    if str <> '' then
      List.Add(str)
  end;
  n := List.IndexOf(edt.Text);
  if n >= 0 then
    List.Delete(n);
  List.Insert(0,edt.Text);
  ItemList := '';
  for i := 0 to 99 do
  begin
    if i < List.Count then
      ItemList := ItemList + List.Strings[i] + ';';
  end;
  MyReg.WriteString(edt.Name, ItemList);
  MyReg.CloseKey;
  MyReg.Free;
end;

procedure TFrm_WorkOrder.EdtEnter(Sender: TObject);
var
  MyReg: TRegistry;
  ItemList,str: string;
  i,n: Integer;
begin
  lb_Temp.BringToFront;
  if (bEnter)  then
  begin
    if not Assigned(vEdt) then
    begin
      vEdt := Ti_TxtFilter(Sender);
      Exit;
    end;
    if (vEdt.Name <> Ti_TxtFilter(Sender).Name) then
    begin
      vEdt := Ti_TxtFilter(Sender);
      lb_Temp.Hide;
      Exit;
    end;
    if ((not lb_Temp.Visible) or (vEdt.Name <> Ti_TxtFilter(Sender).Name))  then
    begin
      lb_Temp.Left := Ti_TxtFilter(Sender).Left;
      lb_Temp.Top := Ti_TxtFilter(Sender).Top+Ti_TxtFilter(Sender).Height;
      lb_Temp.Width := Ti_TxtFilter(Sender).Width;
      lb_Temp.Tag := c_LB_Tag_Normal;
      vEdt := Ti_TxtFilter(Sender);
      MyReg := TRegistry.Create;
      MyReg.RootKey := HKEY_LOCAL_MACHINE;
      MyReg.OpenKey(c_Reg_WorkOrder_CookiePath,True);
      if MyReg.ValueExists(vEdt.Name) then
        ItemList := MyReg.ReadString(vEdt.Name);
      MyReg.CloseKey;
      MyReg.Free ;
      lb_Temp.Items.Clear;
      n := PosNum(ItemList,';');
      for i := 1 to n do
      begin
        str := PosCopy(ItemList,';',i);
        if (str <> '') and ((Ti_TxtFilter(Sender).Text = '') or (Pos(Ti_TxtFilter(Sender).Text,str) > 0))  then
        begin
          lb_Temp.Items.Add(str);
          if lb_Temp.Items.Count >= LB_LISTCONTCOUNT then
            Break;
        end;
      end;
      lb_Temp.Height := LB_HEIGHT - lb_Temp.ItemHeight*iif(lb_Temp.Count<LB_LISTCOUNT,LB_LISTCOUNT-lb_Temp.Count,0);
      if not lb_Temp.Visible then
        lb_Temp.Visible := True;
    end else
    if lb_Temp.Visible then
    begin
      lb_Temp.Visible := False;
    end;
  end;
end;

procedure TFrm_WorkOrder.edt_hmMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  EdtEnter(Sender);
end;

procedure TFrm_WorkOrder.EdtKey(Sender: TObject; Key: Word);
var
  MyReg: TRegistry;
  ItemList,str: string;
  i,n: Integer;
begin
  lb_Temp.BringToFront;
  lb_Temp.Left := Ti_TxtFilter(Sender).Left;
  lb_Temp.Top := Ti_TxtFilter(Sender).Top+Ti_TxtFilter(Sender).Height;
  lb_Temp.Width := Ti_TxtFilter(Sender).Width;
  lb_Temp.Tag := c_LB_Tag_Normal;
  vEdt := Ti_TxtFilter(Sender);
  if Key = VK_DOWN then
  begin
    if lb_Temp.Visible then
    begin
      lb_Temp.SetFocus;
      Exit;
    end;
  end;
  MyReg := TRegistry.Create;
  MyReg.RootKey := HKEY_LOCAL_MACHINE;
  MyReg.OpenKey(c_Reg_WorkOrder_CookiePath,True);
  if MyReg.ValueExists(vEdt.Name) then
    ItemList := MyReg.ReadString(vEdt.Name);
  MyReg.CloseKey;
  MyReg.Free ;
  lb_Temp.Items.Clear;
  n := PosNum(ItemList,';');
  for i := 1 to n do
  begin
    str := PosCopy(ItemList,';',i);
    if (str <> '') and ((Ti_TxtFilter(Sender).Text = '') or (Pos(Ti_TxtFilter(Sender).Text,str) > 0)) then
    begin
      lb_Temp.Items.Add(str);
      if lb_Temp.Items.Count >= LB_LISTCONTCOUNT then
        Break;
    end;
  end;
  lb_Temp.Height := LB_HEIGHT - lb_Temp.ItemHeight*iif(lb_Temp.Count<LB_LISTCOUNT,LB_LISTCOUNT-lb_Temp.Count,0);
  if not lb_Temp.Visible then
    lb_Temp.Visible := True;
end;

procedure TFrm_WorkOrder.edt_hmKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  EdtKey(Sender,Key);
end;

function TFrm_WorkOrder.p_AddWorkOrder: Boolean;
var
  i, j, n, iOrderType, iDetailsID, iSl, iWorkID, iZBID, iBSTID: Integer;
  sHint,sWorkID,sValue,sID, sGDH: string;
  pstr: PChar;
  iProductTypeID,iProductCategoryID, iXpl: Integer;
  sSqlData: string;
  iBsts, iGropuID: Integer;
  ADO_Rec: TADOQuery;
  ADO_CL, ADO_YSDH, ADO_ZB, ADO_Order, ADO_ZBGX, ADO_BST, ADO_BSTPrint, ADO_RJHD: TADOQuery;
  sPrefixCode,sNFGBRQ,sPrefixStyle: string;
  sDate, sYear, sMonth, sDay: string;
  iMatlID, iXM, iOutSL, iSign: Integer;
  sPCH, sBM, sCZRBM: string;
  bXPL: Boolean;
begin
  Result := False;
  bXPL := OrderData[0].m_iXPL = 1;
  try
    DM_DataBase.Con_YDPrint.BeginTrans;
    //------生成工单号------------------------------------
    if OrderData[0].m_iType = 0 then
      sSqlData :=  'Select e.F_sPrefixCode,e.F_sSmallPrefixCode,e.F_sNFGBRQ,e.F_sPrefixStyle,e.F_sSmallPrefixStyle '
        +' from DO_OrderApart a,BI_CustomOrderDetails b,Set_ProductCategory c,Set_PostageType d,Set_ProductType e   '
        +' where a.F_iOrderID=b.F_iID and a.F_sYZTMC like ''%%''+d.F_sYZTMC+''%%'' and b.F_iProductType=c.F_iClassCode '
        +' and c.F_iID = e.F_iProductCategoryID and d.F_iProductTypeID=e.F_iID and a.F_iID=%d and a.F_tiCXBZ = 0 '
    else if OrderData[0].m_iType = 1 then
      sSqlData := 'Select e.F_sPrefixCode,e.F_sSmallPrefixCode,e.F_sNFGBRQ,e.F_sPrefixStyle,e.F_sSmallPrefixStyle '
        +' from DO_OrderApart a,BI_SellOrderDetails b,Set_ProductCategory c,Set_PostageType d,Set_ProductType e   '
        +' where a.F_iOrderID=b.F_iID and a.F_sYZTMC like ''%%''+d.F_sYZTMC+''%%'' and b.F_iProductType=c.F_iClassCode '
        +' and c.F_iID = e.F_iProductCategoryID and d.F_iProductTypeID=e.F_iID and a.F_iID=%d and a.F_tiCXBZ = 0 ';

    ADO_Rec := DM_DataBase.OpenQuery(sSqlData,[OrderData[0].m_iApartID],False);
    if ADO_Rec = nil then
    begin
      Exit;
    end;
    sPrefixCode := '';
    if ADO_Rec.RecordCount > 0 then
    begin
      if not bXPL then
      begin
        sPrefixCode := Trim(ADO_Rec.FieldByName('F_sPrefixCode').AsString);
        sPrefixStyle := Trim(ADO_Rec.FieldByName('F_sPrefixStyle').AsString);
      end else
      begin
        sPrefixCode := Trim(ADO_Rec.FieldByName('F_sSmallPrefixCode').AsString);
        sPrefixStyle := Trim(ADO_Rec.FieldByName('F_sSmallPrefixStyle').AsString);
      end;
      sNFGBRQ := ADO_Rec.FieldByName('F_sNFGBRQ').AsString;
      sYear := Copy(sNFGBRQ,1,Pos('年',sNFGBRQ)+1);
      sMonth := Copy(sNFGBRQ,Pos('年',sNFGBRQ)+2,Pos('月',sNFGBRQ)-1-length(sYear));
      sDay := Copy(sNFGBRQ,Pos('月',sNFGBRQ)+2,Pos('日',sNFGBRQ)-1-Pos('月',sNFGBRQ)-1);
      sDate := sMonth+sDay;
      if FormatDateTime('MMdd',Now) >= sDate then
      begin
        if sYear = c_CPLB_NextYear then
          sYear := FormatDateTime('yy',Now)
        else if sYear= c_CPLB_ThisYear then
          sYear := FormatDateTime('yy',IncYear(Now));
        sPrefixCode := StrReplace(sPrefixStyle,'year',sYear);

        if (not bXPL) and (ADO_Rec.FieldByName('F_sPrefixCode').AsString <> sPrefixCode) then
        begin
          ADO_Rec.Edit;
          ADO_Rec.FieldByName('F_sPrefixCode').AsString := sPrefixCode;
          ADO_Rec.Post;
        end else
        if (bXPL) and (ADO_Rec.FieldByName('F_sSmallPrefixCode').AsString <> sPrefixCode) then
        begin
          ADO_Rec.Edit;
          ADO_Rec.FieldByName('F_sSmallPrefixCode').AsString := sPrefixCode;
          ADO_Rec.Post;
        end;
      end;
    end else
    begin
      p_MessageBoxDlg('错误：获取不到工单号,请设置邮资图的产品类型!!!');
      Exit;
    end;
    ADO_Rec.Free;
    if sPrefixCode = '' then
    begin
      p_MessageBoxDlg('请先设置工单号前缀!');
      Exit;
    end;
    if StrRight(sPrefixCode,1) <> '-' then
      sPrefixCode := sPrefixCode + '-' + FormatDateTime('yyyyMM',now);
    DM_DataBase.GetMaxID('DO_WorkOrder',sPrefixCode,sGDH);
    sGDH := sPrefixCode+StrRight(sGDH,4);
    //DM_DataBase.GetMaxID('BI_WorkOrder','BK_GDH',sGDH);
    //sGDH := 'CP-12BK-'+StrRight(sGDH,6);
    edt_gdh.Text := sGDH;
    //---------------------------------------


    sSqlData := 'Select b.F_iProductTypeID from DO_OrderApart a,Set_PostageType b where CHARINDEX(b.F_sYZTMC,a.F_sYztmc)=1 and a.F_iID=%d';
    ADO_Rec := DM_DataBase.OpenQuery(sSqlData,[OrderData[0].m_iApartID],True);
    iProductTypeID := ADO_Rec.FieldByName('F_iProductTypeID').AsInteger;
    ADO_Rec.Free;
    if OrderData[0].m_iType = 0 then
      sSqlData := 'Select c.F_iID from DO_OrderApart a,BI_CustomOrderDetails b,Set_ProductCategory c '
        +' where a.F_iOrderID = b.F_iID and b.F_iProductType=c.F_iClassCode and a.F_iID=%d'
    else if OrderData[0].m_iType = 1 then
      sSqlData := 'Select c.F_iID from DO_OrderApart a,BI_SellOrderDetails b,Set_ProductCategory c '
        +' where a.F_iOrderID = b.F_iID and b.F_iProductType=c.F_iClassCode and a.F_iID=%d';
    ADO_Rec := DM_DataBase.OpenQuery(sSqlData,[OrderData[0].m_iApartID],True);
    iProductCategoryID := ADO_Rec.FieldByName('F_iID').AsInteger;
    ADO_Rec.Free;
    //根据第一个订单是否小批量来确定工单是否小批量
//    if OrderData[0].m_iType = 0 then
//      sSqlData := 'Select b.F_tiXpl from DO_OrderApart a,BI_CustomOrderDetails b,BI_CustomOrder c '
//        +'where a.F_tiOrderType=0 and a.F_iOrderID=b.F_iID and b.F_iCustomID=c.F_iID and a.F_iID=%d';
//    if OrderData[0].m_iType = 1 then
//      sSqlData := 'Select b.F_tiXpl from DO_OrderApart a,BI_SellOrderDetails b,BI_SellOrder c '
//        +'where a.F_tiOrderType=1 and a.F_iOrderID=b.F_iID and b.F_iSellID=c.F_iID and a.F_iID=%d';
//    ADO_Rec := DM_DataBase.OpenQuery(sSqlData,[OrderData[0].m_iApartID]);
//    iXpl := ADO_Rec.FieldByName('F_tiXpl').AsInteger;
//    ADO_Rec.Free;
    //根据用户类型判断是否小批量
    if LoginData.m_iUserType in [c_User_Small,c_Admin_Small] then
      iXpl := 1
    else
      iXpl := 0;
    sSqlData := 'select * from DO_WorkOrder where 1=2';
    ADO_Rec := DM_DataBase.OpenQuery(sSqlData,[]);
    ADO_Rec.Insert;
    ADO_Rec.FieldByName('F_tiJDBZ').AsInteger := iif(rb_jd_yes.Checked,1,0);
    ADO_Rec.FieldByName('F_sGDH').AsString := edt_gdh.Text;
    ADO_Rec.FieldByName('F_sHM').AsString := edt_hm.Text;
    ADO_Rec.FieldByName('F_sPM').AsString := edt_pm.Text;
    ADO_Rec.FieldByName('F_dKDRQ').AsDateTime := dtp_kdrq.DateTime;
    ADO_Rec.FieldByName('F_iZL').AsInteger := StrToNum(edt_zl.Text);
    ADO_Rec.FieldByName('F_sZLDW').AsString := cbb_zldw.Text;
    if Trim(edt_Tj.Text) <> '' then
      ADO_Rec.FieldByName('F_nTJ').AsFloat := StrToFloat(edt_Tj.Text);
    if Trim(edt_Zj.Text) <> '' then
      ADO_Rec.FieldByName('F_nZJ').AsFloat := StrToFloat(edt_Zj.Text);
    ADO_Rec.FieldByName('F_sCPKS').AsString := cbb_cpks.Text;
    ADO_Rec.FieldByName('F_sCPGG').AsString := edt_cpgg.Text;
//    if Trim(edt_cpk.Text) <> '' then
//      ADO_Rec.FieldByName('F_nCPK').AsFloat := StrToFloat(edt_cpk.Text);
//    if Trim(edt_cpc.Text) <> '' then
//      ADO_Rec.FieldByName('F_nCPC').AsFloat := StrToFloat(edt_cpc.Text);
    ADO_Rec.FieldByName('F_sZH').AsString := edt_zh.Text;
    ADO_Rec.FieldByName('F_sRJHDQ').AsString := edt_rjhdq.Text;
    ADO_Rec.FieldByName('F_sRJHDZ').AsString := edt_rjhdz.Text;
    ADO_Rec.FieldByName('F_sZYPH').AsString := edt_zyph.Text;
    ADO_Rec.FieldByName('F_sFPDM').AsString := edt_fhdm.Text;
    ADO_Rec.FieldByName('F_sQSHM').AsString := trim(edt_qshm.Text);
    ADO_Rec.FieldByName('F_sZZHM').AsString := edt_zzhm.Text;
    ADO_Rec.FieldByName('F_sZDYQ').AsString := mmo_zdyq.Text;
    ADO_Rec.FieldByName('F_sBZ').AsString := mmo_bz.Text;
    ADO_Rec.FieldByName('F_sCPBH').AsString := GetCPBH;
    ADO_Rec.FieldByName('F_dJHRQ').AsDateTime := dtp_jhrq.DateTime;
    ADO_Rec.FieldByName('F_sKDR').AsString := LoginData.m_sUserName;
    ADO_Rec.FieldByName('F_iProductTypeID').AsInteger := iProductTypeID;
    ADO_Rec.FieldByName('F_iProductCategoryID').AsInteger := iProductCategoryID;
    ADO_Rec.FieldByName('F_tiXpl').AsInteger := iXpl;
    ADO_Rec.Post;
    vWorkID := ADO_Rec.FieldByName('F_iID').AsInteger;
    sSqlData := 'select * from DO_WorkOrderDetails where 1=2';
    ADO_Order := DM_DataBase.OpenQuery(sSqlData,[]);

    sSqlData := 'select * from DO_WorkOrderDetGroupNum where 1=2';
    ADO_RJHD := DM_DataBase.OpenQuery(sSqlData,[]);

    sSqlData := 'select * from DO_WorkOrderMatl where 1=2';
    ADO_CL := DM_DataBase.OpenQuery(sSqlData,[]);

    sSqlData := 'select * from DO_WorkOrderPrtProc where 1=2';
    ADO_YSDH := DM_DataBase.OpenQuery(sSqlData,[]);

    sSqlData := 'select * from DO_WorkOrderMkProc where 1=2';
    ADO_ZB := DM_DataBase.OpenQuery(sSqlData,[]);

    sSqlData := 'select * from DO_WorkOrderMkProcDet where 1=2';
    ADO_ZBGX := DM_DataBase.OpenQuery(sSqlData,[]);

    sSqlData := 'select * from DO_WorkOrderMKPic where 1=2';
    ADO_BST := DM_DataBase.OpenQuery(sSqlData,[]);

    sSqlData := 'select * from DO_WorkOrderMKPicPrt where 1=2';
    ADO_BSTPrint := DM_DataBase.OpenQuery(sSqlData,[]);

    ADO_WorkOrder.First;
    while not ADO_WorkOrder.Eof do
    begin
      iGropuID := ADO_WorkOrder.RecNo;
      //存入订单数据
      for i := 0 to Length(OrderData) -1 do
      begin
        if OrderData[i].m_iGroupID = iGropuID then
        begin
          n := i;
          with ADO_Order do
          begin
            Insert;
            FieldByName('F_tiOrderType').AsInteger := OrderData[n].m_iType;
            FieldByName('F_iApartID').AsInteger := OrderData[n].m_iApartID;
            FieldByName('F_sKhmc').AsString := OrderData[n].m_sKhmc;
            FieldByName('F_sCpbh').AsString := OrderData[n].m_sCPBH;
            FieldByName('F_sBz').AsString := OrderData[n].m_sBZ;
            FieldByName('F_sDw').AsInteger := 1;
            if Trim(OrderData[n].m_sSl) <> '' then
              FieldByName('F_sSl').AsFloat := StrToFloat(OrderData[n].m_sSl);
            if Trim(OrderData[n].m_sWJFSL) <> '' then
              FieldByName('F_nWJCSL').AsFloat := StrToFloat(OrderData[n].m_sWJFSL);
            FieldByName('F_sZh').AsString := OrderData[n].m_sZH;
            FieldByName('F_sRJHDQ').AsString := OrderData[n].m_sRJHDQ;
            FieldByName('F_sRJHDZ').AsString := OrderData[n].m_sRJHDZ;
            FieldByName('F_iGroupID').AsInteger := OrderData[n].m_iGroupID;
            FieldByName('F_iWorkID').AsInteger := vWorkID;
            Post;
            iDetailsID := FieldByName('F_iID').AsInteger;
            for j := 0 to Length(aRJHD) - 1 do
            begin
              if (aRJHD[j].m_sZH='') and (aRJHD[j].m_sRJHDQ='') and (aRJHD[j].m_sRJHDZ='') then Continue;
              with ADO_RJHD do begin
                if aRJHD[j].m_iApartID = OrderData[i].m_iApartID then begin
                  Insert;
                  FieldByName('F_sZH').AsString := aRJHD[j].m_sZH;
                  FieldByName('F_sRJHDQ').AsString := aRJHD[j].m_sRJHDQ;
                  FieldByName('F_sRJHDZ').AsString := aRJHD[j].m_sRJHDZ;
                  FieldByName('F_iApartID').AsInteger := aRJHD[j].m_iApartID;
                  FieldByName('F_iDetailsID').AsInteger := iDetailsID;
                  Post;
                  aRJHD[j].m_iID := FieldByName('F_iID').AsInteger;
                  Next;

                end;
              end;
            end;
          end;
        end;
      end;

      //存入材料数据
      for i := 0 to Length(aCL) -1 do
      begin
        if aCL[i].m_iGroupID = iGropuID then
        begin
          n := i;
          with ADO_CL do
          begin

            iMatlID := -1;
            iXM := 1;
            sPCH := aCL[n].m_sPCH;
            sBM:= aCL[n].m_sCLBH;
            if aCL[n].m_iFlag = c_CL_Flag_Normal then
              iOutSL := aCL[n].m_iJFQS + aCL[n].m_iJFS
            else
              iOutSL := StrToNum(aCL[n].m_sSL);
            sCZRBM := LoginData.m_sUserName;
            iSign := 0;
           // exec p_StockOut 工单中材料ID,项目(1:材料),批次号,编码,出库数量,操作人编码,标记(0:增加;1:修改)
          {  ADO_Rec.Free;
            ADO_Rec := DM_DataBase.OpenQuery('exec p_StockOut %d,%d,''%s'',''%s'',%d,''%s'',%d ',
              [iMatlID,iXM,sPCH,sBM,iOutSL,sCZRBM,iSign],True);
            if ADO_Rec.FieldByName('Flag').AsInteger <> 0 then
              raise Exception.Create(aCL[n].m_sCLMC+' 材料提取失败: ' + ADO_Rec.FieldByName('Hint').AsString);  }
            Insert;
            FieldByName('F_sCLBH').AsString := aCL[n].m_sCLBH;
            FieldByName('F_sCLMC').AsString := aCL[n].m_sCLMC;
            FieldByName('F_sCLGG').AsString := aCL[n].m_sCLGG;
            FieldByName('F_sCJGG').AsString := aCL[n].m_sCJGG;
            FieldByName('F_sCJKS').AsString := aCL[n].m_sCJKS;
            FieldByName('F_iJFQS').AsInteger := aCL[n].m_iJFQS;
            FieldByName('F_iJFS').AsInteger := aCL[n].m_iJFS;
            FieldByName('F_iZZS').AsInteger := aCL[n].m_iJFQS + aCL[n].m_iJFS;
            if aCL[n].m_iFlag = c_CL_Flag_Normal then
              FieldByName('F_sSL').AsFloat := (aCL[n].m_iJFQS + aCL[n].m_iJFS)/500
            else
              FieldByName('F_sSL').AsFloat := StrToNum(aCL[n].m_sSL);
            FieldByName('F_sDW').AsString := aCL[n].m_sDW;
            //FieldByName('F_sPCH').AsString := aCL[n].m_sPCH;
            FieldByName('F_iFlag').AsInteger := aCL[n].m_iFlag;
            FieldByName('F_iGroupID').AsInteger := aCL[n].m_iGroupID;
            FieldByName('F_iWorkID').AsInteger := vWorkID;
            Post;
          end;
        end;
      end;

      //存入印刷打号数据
      for i := 0 to Length(aYSDH) -1 do
      begin
        if aYSDH[i].m_iGroupID = iGropuID then
        begin
          n := i;
          with ADO_YSDH do
          begin
            Insert;
            FieldByName('F_sGJMC').AsString := aYSDH[n].m_sGJMC;
            FieldByName('F_sJTBH').AsString := aYSDH[n].m_sJTBH;
            FieldByName('F_sJTMC').AsString := aYSDH[n].m_sJTMC;
            FieldByName('F_iSBS').AsInteger := aYSDH[n].m_iSBS;
            FieldByName('F_sSC').AsString := aYSDH[n].m_sSC;
            FieldByName('F_sSB').AsString := aYSDH[n].m_sSB;
            FieldByName('F_iYS').AsInteger := aYSDH[n].m_iYS;
            FieldByName('F_iYS_1').AsInteger := aYSDH[n].m_iYS_1;
            FieldByName('F_iYS_2').AsInteger := aYSDH[n].m_iYS_2;
            FieldByName('F_sYZLX').AsString := aYSDH[n].m_sYZLX;
            FieldByName('F_sQT').AsString := aYSDH[n].m_sQT;
            FieldByName('F_sYQGX').AsString := aYSDH[n].m_sYQGX;
            FieldByName('F_sYQGXSL').AsString := aYSDH[n].m_sYQGXSL;
            FieldByName('F_sYQGXDW').AsString := aYSDH[n].m_sYQGXDW;
            FieldByName('F_sYSYQ').AsString := aYSDH[n].m_sYSYQ;
            FieldByName('F_sBZ').AsString := aYSDH[n].m_sBZ;
            FieldByName('F_iBSTID').AsInteger := aYSDH[n].m_iBSTID;
            FieldByName('F_iBSTYS').AsInteger := aYSDH[n].m_iBSTYS;
            FieldByName('F_iBSTZS').AsInteger := aYSDH[n].m_iBSTZS;
            FieldByName('F_iGroupID').AsInteger := aYSDH[n].m_iGroupID;
            FieldByName('F_iWorkID').AsInteger := vWorkID;
            Post;
          end;
        end;
      end;

      //存入制版数据
      for i := 0 to Length(aZB) -1 do
      begin
        if aZB[i].m_iGroupID = iGropuID then
        begin
          n := i;
          with ADO_ZB do
          begin
            Insert;
            FieldByName('F_sJD').AsString := aZB[n].m_sJD;
            FieldByName('F_sGB').AsString := aZB[n].m_sGB;
            FieldByName('F_sTS').AsString := aZB[n].m_sTS;
            FieldByName('F_sDY').AsString := aZB[n].m_sDY;
            FieldByName('F_sPB').AsString := aZB[n].m_sPB;
            FieldByName('F_sCP').AsString := aZB[n].m_sCP;
            FieldByName('F_sSBLB').AsString := aZB[n].m_sSBLB;
            FieldByName('F_sSBKS').AsString := aZB[n].m_sSBKS;
            FieldByName('F_iSBK').AsInteger := aZB[n].m_iSBK;
            FieldByName('F_sQT').AsString := aZB[n].m_sQT;
            FieldByName('F_iGroupID').AsInteger := aZB[n].m_iGroupID;
            FieldByName('F_iWorkID').AsInteger := vWorkID;
            Post;
            iZBID := FieldByName('F_iID').AsInteger;
            //存入制版工序数据
            for j := 0 to Length(aZBGX) - 1 do
            begin
              with ADO_ZBGX do begin
                if aZBGX[j].m_iGroupID = iGropuID then begin
                  Insert;
                  FieldByName('F_sCode').AsString := aZBGX[j].m_sCode;
                  FieldByName('F_sName').AsString := aZBGX[j].m_sName;
                  FieldByName('F_sCategorySpec').AsString := aZBGX[j].m_sCategorySpec;
                  FieldByName('F_sOutput').AsString := aZBGX[j].m_sOutput;
                  FieldByName('F_sUnit').AsString := aZBGX[j].m_sUnit;
                  FieldByName('F_sRemarks').AsString := aZBGX[j].m_sBZ;
                  FieldByName('F_iMkProcID').AsInteger := iZBID;
                  FieldByName('F_iGroupID').AsInteger := iGropuID;
                  FieldByName('F_iWorkID').AsInteger := vWorkID;
                  Post;
                  Next;
                end;
              end;
            end;
          end;
        end;
      end;

      //存入版式图数据
      for i := 0 to Length(aBST) -1 do
      begin
        if aBST[i].m_iGroupID = iGropuID then
        begin
          n := i;
          with ADO_BST do
          begin
            Insert;
            FieldByName('F_iRow').AsInteger := aBST[n].m_iRow;
            FieldByName('F_iCol').AsInteger := aBST[n].m_iCol;
            FieldByName('F_sBZ').AsString := aBST[n].m_sBZ;
            FieldByName('F_sCZR').AsString := LoginData.m_sUserName;
            FieldByName('F_dCZRQ').AsDateTime := Now;
            FieldByName('F_iGroupID').AsInteger := aBST[n].m_iGroupID;
            FieldByName('F_iWorkID').AsInteger := vWorkID;
            Post;
            iBSTID := FieldByName('F_iID').AsInteger;
            //存入版式图明细数据
            for j := 0 to Length(aBSTPrint) - 1 do
            begin
              with ADO_BSTPrint do begin
                if aBSTPrint[j].m_iGroupID = iGropuID then begin
                  Insert;
                  FieldByName('F_iRow').AsInteger := aBSTPrint[j].m_iRow;
                  FieldByName('F_iCol').AsInteger := aBSTPrint[j].m_iCol;
                  FieldByName('F_iApartID').AsInteger := aBSTPrint[j].m_iApartID;
                  FieldByName('F_sCPBH').AsString := aBSTPrint[j].m_sCPBH;
                  FieldByName('F_sBZ').AsString := aBSTPrint[j].m_sBZ;
                  FieldByName('F_iBSTID').AsInteger := iBSTID;
                  FieldByName('F_iGroupID').AsInteger := iGropuID;
                  FieldByName('F_iWorkID').AsInteger := vWorkID;
                  Post;
                  Next;
                end;
              end;
            end;
            Next;
          end;
        end;
      end;

      sSqlData := ' if not exists(Select 1 from DO_ProductDate_Log where F_iWorkID = %d and F_iGroupID = %d ) ' ;
      sSqlData := sSqlData + 'Insert into DO_ProductDate_Log (F_iWorkID,F_iGroupID) VALUES (%d,%d) ';
      DM_DataBase.ExecQuery(sSqlData,[vWorkID,iGropuID,vWorkID,iGropuID],True);
      ADO_WorkOrder.Next;
    end;

    DM_DataBase.Con_YDPrint.CommitTrans;
    Result := True;
  except
    on E: Exception do
    begin
      DM_DataBase.Con_YDPrint.RollbackTrans;
      p_MessageBoxDlg('错误：'+e.Message);
    end;
  end;
  ADO_Rec.Free;
  ADO_Order.Free;
  ADO_CL.Free;
  ADO_YSDH.Free;
  ADO_ZB.Free;
  ADO_ZBGX.Free;
  ADO_BST.Free;
  ADO_BSTPrint.Free;
end;

procedure TFrm_WorkOrder.edt_hmEnter(Sender: TObject);
begin
  bEnter := True;
end;

procedure TFrm_WorkOrder.edt_hmExit(Sender: TObject);
begin
  EdtExit(Sender);
end;

procedure TFrm_WorkOrder.lb_TempKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (TListBox(Sender).ItemIndex<1) and (Key = VK_UP) then
  begin
    TListBox(Sender).ItemIndex := -1;
    TListBox(Sender).Selected[0] := False;
    vEdt.SetFocus;
  end;
end;

procedure TFrm_WorkOrder.lb_TempKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  str: string;
begin
  if Key = VK_RETURN then
  begin
    lb_Temp.Visible := False;
    if lb_Temp.ItemIndex >= 0 then
    begin
      str := lb_Temp.Items.Strings[lb_Temp.ItemIndex];
      vEdt.Text := str;
    end;
    vEdt.SetFocus;
  end;
end;

procedure TFrm_WorkOrder.lb_TempMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  str: string;
  i: Integer;
begin
  lb_Temp.Visible := False;
  if lb_Temp.ItemIndex >= 0 then
  begin
    str := lb_Temp.Items.Strings[lb_Temp.ItemIndex];
    vEdt.Text := str;
  end;
  vEdt.SetFocus;
end;

procedure TFrm_WorkOrder.lb_TempMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
var
  str: string;
  p: TPoint;
  frame, caption: integer;
begin
  TListBox(Sender).ItemIndex := TListBox(Sender).ItemAtPos(Point(X,   Y),   True);
  str := '';
  if TListBox(Sender).ItemIndex >= 0 then
  begin
    str := TListBox(Sender).Items.Strings[TListBox(Sender).ItemIndex];
    TListBox(Sender).Hint := str;
    if Length(str)*TListBox(Sender).Font.Size > TListBox(Sender).Width then
    begin
      TListBox(Sender).ShowHint := True;
      GetCursorPos(p);
      application.ActivateHint(point(p.x,p.y));
    end else
      TListBox(Sender).ShowHint := False;
  end;
end;

procedure TFrm_WorkOrder.Panel1Click(Sender: TObject);
begin
  lb_Temp.Hide;
end;

procedure TFrm_WorkOrder.btn_dyClick(Sender: TObject);
var
  sSqlData: string;
  aCheckRJHD: TArrRJHD;
  str: string;
  i: Integer;
  rmBand: TRMBandMasterData;
  sText , sCaption ,AButtom ,BButtom: string;
  iDYBZ: integer;
begin
  aCheckRJHD:=f_CheckRJHD(aRJHD);
  if Length(aCheckRJHD) > 0 then
  begin
    for i := 0 to Length(aCheckRJHD)-1 do
    begin
      str := str + Format('与%s %s %s-%s 重复'+#13#10 ,
        [aCheckRJHD[i].m_sCPBH,aCheckRJHD[i].m_sZH,aCheckRJHD[i].m_sRJHDQ,aCheckRJHD[i].m_sRJHDZ]) ;
    end;
    p_MessageBoxDlg(str);
    Exit;
  end;
  iDYBZ := 0;
//  sText := '请选择先预览再打印还是直接打印：';
//  sCaption := '提示';
//  AButtom := '预览打印';
//  BButtom := '直接打印';
//  Screen.Cursor := crDefault;
//  case f_SelectDlg(sText,sCaption,AButtom,BButtom) of
//    mrYes: iDYBZ := 0;
//    mrNo: iDYBZ := 1;
//  else
//    Exit
//  end;


  with ADO_Details do
  begin
    Close;
    //sSqlData := 'Select * from DO_WorkOrderDetails where F_iWorkID=%d order by F_iGroupID,F_iID';
    sSqlData := 'exec p_gddy_order %d';
    SQL.Text := Format(sSqlData,[vWorkID]);
    Open;
  end;
  with ADO_ZB do
  begin
    Close;
    {sSqlData := 'Select F_sJTMC,F_sYQGX,sum(convert(int,IsNull(F_sYQGXSL,''0''))) F_sYQGXSL,F_sYQGXDW, F_sYSYQ '
      + ' from DO_WorkOrderPrtProc '
      + ' where F_iWorkID=%d and (convert(int,F_sYQGXSL) > 0 or IsNull(F_sYSYQ,'''') <> '''' or IsNull(F_sYQGX,'''') <> '''') '
      + ' group by F_sYQGX,F_sYQGXDW,F_sYSYQ,F_sJTMC '; }
    sSqlData := 'exec p_gddy_zb %d';
    SQL.Text := Format(sSqlData,[vWorkID]);
    Open;
  end;
  with ADO_MkProcDet do
  begin
    Close;
    //sSqlData := 'Select * from DO_WorkOrderMkProcDet where F_iWorkID=%d order by F_iGroupID,F_iID';
    {sSqlData := 'Select F_sName,F_sCategorySpec,sum(F_sOutput) F_sOutput,F_sUnit,F_sRemarks '
      + ' from DO_WorkOrderMkProcDet '
      + ' where F_iWorkID=%d '
      + ' group by F_sName,F_sCategorySpec,F_sUnit,F_sRemarks ';  }
    sSqlData := 'exec p_gddy_MkProcDet %d';
    SQL.Text := Format(sSqlData,[vWorkID]);
    Open;
  end;
  with ADO_Matl do
  begin
    Close;
    {sSqlData := 'Select F_sCLBH,F_sCLMC,F_sCLGG,F_sCJGG,F_sDW,Sum(F_iJFQS) F_iJFQS,Sum(F_iJFS) F_iJFS, '
      + ' Sum(F_iZZS) F_iZZS,Sum(convert(numeric(9,3),case when IsNull(F_sSL,''0'')=''0'' then ''0'' else F_sSL end)) F_sSL,F_iFlag '
      +' from DO_WorkOrderMatl where F_iWorkID=%d group by F_sCLBH,F_sCLMC,F_sCLGG,F_sCJGG,F_sDW,F_iFlag order by F_iFlag desc '; }
    sSqlData := 'exec p_gddy_Matl %d';
    SQL.Text := Format(sSqlData,[vWorkID]) ;
    Open;
  end;
  with DM_DataBase.ADO_Print do
  begin
//    Close;
    //sSqlData := 'select *,CPLX=(select F_sTypeName from Set_ProductType where F_iID=a.F_iProductTypeID) from DO_WorkOrder a where a.F_iID=%d';
    sSqlData := 'exec p_gddy %d';
    SQL.Text := Format(sSqlData,[vWorkID]);
    Open;
    if (FieldByName('F_sZH').AsString = '') and (FieldByName('F_sRJHDQ').AsString = '') and (FieldByName('F_sRJHDZ').AsString = '') then
    begin
      TRMBandMasterData(rmr_Print.FindGlobalObject('md_rjhd')).Visible := False;
      TRMBandMasterData(rmr_XPLPrint.FindGlobalObject('md_rjhd')).Visible := False;
    end else
    begin
      TRMBandMasterData(rmr_Print.FindGlobalObject('md_rjhd')).Visible := True;
      TRMBandMasterData(rmr_XPLPrint.FindGlobalObject('md_rjhd')).Visible := True;

    end;
    if  (FieldByName('F_sZYPH').AsString = '') and (FieldByName('F_sFPDM').AsString = '')
      and (FieldByName('F_sQSHM').AsString = '') and (FieldByName('F_sZZHM').AsString = '')  then
    begin
      TRMBandMasterData(rmr_Print.FindGlobalObject('md_zyph')).Visible := False;
      TRMBandMasterData(rmr_XPLPrint.FindGlobalObject('md_zyph')).Visible := False;
    end else
    begin
      TRMBandMasterData(rmr_Print.FindGlobalObject('md_zyph')).Visible := True;
      TRMBandMasterData(rmr_XPLPrint.FindGlobalObject('md_zyph')).Visible := True;
    end;
  end;
  //rmr_Print.LoadFromFile(ExtractFilePath(Application.ExeName)+c_WorkOrder_PrintExeName);
  case OrderData[0].m_iXPL of
    1:
      begin
        rmr_XPLPrint.PrepareReport;
        if iDYBZ = 1 then
          rmr_XPLPrint.PrintReport
        else
          rmr_XPLPrint.ShowReport;
      end;
  else
    begin
      rmr_Print.PrepareReport;
      if iDYBZ = 1 then
        rmr_Print.PrintReport
      else
       rmr_Print.ShowReport;
    end;
  end
end;

function TFrm_WorkOrder.GetCPBH: string;
var
  i, j, k, n: integer;
  aCPBH: array of TStringList;
  str, sCPBH: string;
  bAdd, bNext: Boolean;
  aTemp: array of string;
  aNum: array of Integer;
begin
  n := 0;
  SetLength(aCPBH,n+1);
  aCPBH[n] := TStringList.Create;
  for i := 0 to Length(OrderData) -1 do
  begin
    if OrderData[i].m_iGroupID <= 0 then Continue;
    bAdd := False;
    for j := 0 to Length(aCPBH) -1 do
    begin
      if aCPBH[j].Count = 0 then
      begin
        aCPBH[j].Add(OrderData[i].m_sCPBH);
        bAdd := True;
        Break;
      end else
      if Copy(OrderData[i].m_sCPBH,1,17) = Copy(aCPBH[j].Strings[0],1,17) then
      begin
        aCPBH[j].Add(OrderData[i].m_sCPBH);
        bAdd := True;
        Break;
      end;
    end;
    if not bAdd then
    begin
      Inc(n);
      SetLength(aCPBH,n+1);
      aCPBH[n] := TStringList.Create;
      aCPBH[n].Add(OrderData[i].m_sCPBH);
    end;    
  end;

  str := '';
  sCPBH := '';
  k := 0;
  for n := 0 to Length(aCPBH) -1 do
  begin
    SetSort(aCPBH[n]);
    for i := 0 to aCPBH[n].Count -1 do
    begin
      if i = 0 then
      begin
        sCPBH := sCPBH + aCPBH[n].Strings[i];
        if i = aCPBH[n].Count -1 then
          sCPBH := sCPBH + '; ';
        Continue;
      end;
      if i < aCPBH[n].Count -1 then
      begin
        if (StrToNum(StrRight(aCPBH[n].Strings[i],3)) - StrToNum(StrRight(aCPBH[n].Strings[i-1],3))) = 1 then
          Continue
        else if Pos(aCPBH[n].Strings[i-1],sCPBH) = 0 then
          sCPBH := sCPBH + '~' +StrRight(aCPBH[n].Strings[i-1],3)+'; '+aCPBH[n].Strings[i]
        else
          sCPBH := sCPBH +'; '+aCPBH[n].Strings[i];
      end else
      if (StrToNum(StrRight(aCPBH[n].Strings[i],3)) - StrToNum(StrRight(aCPBH[n].Strings[i-1],3))) = 1 then
      begin
        sCPBH := sCPBH + '~' +StrRight(aCPBH[n].Strings[i],3)+'; ';
        Continue
      end else
        sCPBH := sCPBH + '; '+aCPBH[n].Strings[i]+'; ';
    end;
  end;
  Result := sCPBH;
end;

procedure TFrm_WorkOrder.SetSort(var StrList: TStringList);
var
  i: integer;
  TempList: TStringList;
begin
  TempList := TStringList.Create;
  for i := 0 to StrList.Count -1 do
  begin
    TempList.Add(StrRight(StrList.Strings[i],3));
  end;
  TempList.Sort;
  for i := 0 to StrList.Count -1 do
  begin
    StrList.Strings[i] := Copy(StrList.Strings[i],1,Length(StrList.Strings[i])-3)+ TempList.Strings[i];
  end;
  TempList.Free;
end;

procedure TFrm_WorkOrder.btn_zdyqClick(Sender: TObject);
var
  sZd,sDzgy: string;
  aZdgy: array of string;
  i,n,iPos: integer;
begin
  Frm_zdgy := TFrm_zdgy.Create(Self);
  sZd := mmo_zdyq.Text;
  CbParamAdd(Frm_zdgy.cb_gyyq,'装订工艺');
  for i := 0 to Frm_zdgy.cb_gyyq.Items.Count -1 do
  begin
    if Pos(Frm_zdgy.cb_gyyq.Items.Strings[i],sZd) > 0 then
      Frm_zdgy.cb_gyyq.Checked[i] := True;
  end;
  if Frm_zdgy.ShowModal = mrOk then
  begin
    n := 0;
    SetLength(aZdgy,n);
    for i := 0 to Frm_zdgy.cb_gyyq.Items.Count -1 do
    begin
      if Frm_zdgy.cb_gyyq.Checked[i] then
      begin
        Inc(n);
        SetLength(aZdgy,n);
        aZdgy[n-1] := Frm_zdgy.cb_gyyq.Items.Strings[i];
      end;
    end;
    iPos := Pos('［',sZd);
    if iPos = 0 then
    begin
      mmo_zdyq.Text := mmo_zdyq.Text + #13#10;
      iPos := Length(mmo_zdyq.Text)+1;
    end;
    mmo_zdyq.Text := Copy(mmo_zdyq.Text,1,iPos-1);
    sDzgy := '';
    for i := 0 to Length(aZdgy) -1 do
    begin
      //sDzgy := sDzgy + ' ,' + aZdgy[i];
      sDzgy := sDzgy + '［'+ StrLeft(aZdgy[i] + '                           ',26)+'］';
      if (i+1) mod 3 = 0 then sDzgy := sDzgy + #13#10;
    end;
    //sDzgy := Copy(sDzgy,2,Length(sDzgy));
    if Length(aZdgy) > 0 then
      mmo_zdyq.Text := mmo_zdyq.Text + sDzgy + #13#10;
      //mmo_zdyq.Text := mmo_zdyq.Text + '［' + sDzgy + '］' + #13#10;
  end;
  Frm_zdgy.Free;
end;

procedure TFrm_WorkOrder.btn_AddRowClick(Sender: TObject);
begin
  ADO_WorkOrder.Insert;
  ADO_WorkOrder.Post;
end;

procedure TFrm_WorkOrder.btn_DelRowClick(Sender: TObject);
var
  i: Integer;
begin
  if p_MessageBoxDlg('是否要删除此行?','提示',MB_ICONINFORMATION + MB_YESNO) = IDYES then
  begin
    for i := 0 to Length(OrderData) -1 do
    begin
      if OrderData[i].m_iGroupID = ADO_WorkOrder.RecNo then
        OrderData[i].m_iGroupID := -1;
    end;
    for i := 0 to Length(aYSDH) -1 do
    begin
      if aYSDH[i].m_iGroupID = ADO_WorkOrder.RecNo then
        aYSDH[i].m_iGroupID := -1;
    end;
    for i := 0 to Length(aZB) -1 do
    begin
      if aZB[i].m_iGroupID = ADO_WorkOrder.RecNo then
        aZB[i].m_iGroupID := -1;
    end;
    for i := 0 to Length(aCL) -1 do
    begin
      if aCL[i].m_iGroupID = ADO_WorkOrder.RecNo then
        aCL[i].m_iGroupID := -1;
    end;
    if ADO_WorkOrder.RecordCount > 1 then
      ADO_WorkOrder.Delete
    else if ADO_WorkOrder.RecordCount = 1 then
    begin
      ADO_WorkOrder.Edit;
      for i := 0 to ADO_WorkOrder.FieldCount -1 do
        ADO_WorkOrder.Fields.Fields[i].AsString := '';
    end;
  end;
end;

function TFrm_WorkOrder.IfCheck: Boolean;
var
  i, iSl: Integer;
  str: string;
begin
  Result := False;
  str := '未输入订单信息!';
  for i := 0 to Length(OrderData) -1 do
  begin
    if OrderData[i].m_iGroupID >0 then
    begin
      str := '';
      Break;
    end;
  end;
  if str <> '' then
  begin
    p_MessageBoxDlg(str);
    Exit;
  end;

  str := '未输入机台信息!';
  for i := 0 to Length(aYSDH) -1 do
  begin
    if aYSDH[i].m_iGroupID >0 then
    begin
      str := '';
      Break;
    end;
  end;
  if str <> '' then
  begin
    p_MessageBoxDlg(str);
    Exit;
  end;


  str := '未输入材料信息!';
  for i := 0 to Length(aCL) -1 do
  begin
    if aCL[i].m_iGroupID >0 then
    begin
      str := '';
      Break;
    end;
  end;
  if str <> '' then
  begin
    p_MessageBoxDlg(str);
    Exit;
  end;

  str := '未输入制版信息!';
  for i := 0 to Length(aZB) -1 do
  begin
    if aZB[i].m_iGroupID >0 then
    begin
      str := '';
      Break;
    end;
  end;
  if str <> '' then
  begin
    p_MessageBoxDlg(str);
    Exit;
  end;

  str := '未画版式图';
  for i := 0 to Length(aBST) -1 do
  begin
    if aBST[i].m_iGroupID > 0 then
    begin
      str := '';
      Break;
    end;
  end;
  if str <> '' then
  begin
    p_MessageBoxDlg(str);
    Exit;
  end;

//  iBsts := ADO_WorkOrder.FieldByName('BSTYS').AsInteger;
  iSl := 0;
  for i := 0 to Length(OrderData) -1 do
  begin
   { OrderData[i].m_sSl := Format('%6.2f',[OrderData[i].m_iBSTS*iBsts /10000]);
    OrderData[i].m_sDw := 1;
    iSl := iSl + OrderData[i].m_iBSTS*iBsts;   }
    iSl := iSl + StrToNum(OrderData[i].m_sSl)*10000;
  end;
  if iSl <> StrToNum(edt_zl.Text) then
  begin
    //str := '所画的版式图中需要的总印量与此工单的总量不符,是否继续些操作?';
    str := '订单本次印量之和('+IntToStr(iSl)+')与此工单的总量('+edt_zl.Text+')不符,是否继续些操作?';
//    Application.MessageBox(pstr,'提示',MB_ICONINFORMATION);
    if p_MessageBoxDlg(str,'提示',MB_YESNO+MB_ICONINFORMATION) = IDNO then
    begin
      edt_zl.SetFocus;
      Exit;
    end;
  end;
  Result := True;
end;

procedure TFrm_WorkOrder.btn_xgClick(Sender: TObject);
var
  iWorkID: Integer;
  iSczt,iRec,iCPLX: integer;
  sSczt,sSqlData: string;
  ADO_Rec: TADOQuery;  
  aCheckRJHD: TArrRJHD;
  str: string;
  i: Integer;
begin
  if not IfCheck then Exit;
  aCheckRJHD:=f_CheckRJHD(aRJHD);
  if Length(aCheckRJHD) > 0 then
  begin
    for i := 0 to Length(aCheckRJHD)-1 do
    begin
      str := str + Format('与%s %s %s-%s 重复'+#13#10 ,
        [aCheckRJHD[i].m_sCPBH,aCheckRJHD[i].m_sZH,aCheckRJHD[i].m_sRJHDQ,aCheckRJHD[i].m_sRJHDZ]) ;
    end;
    p_MessageBoxDlg(str);
    Exit;
  end;  
  //---------------存储过程检验-----------------
  sSqlData := 'exec p_Check_WorkOrder_XG ''%s'',%d';
  ADO_Rec := DM_DataBase.OpenQuery(sSqlData,[LoginData.m_sUserName,vWorkID]);
  if Assigned(ADO_Rec) and (ADO_Rec.RecordCount > 0) then
  begin
    if ADO_Rec.FieldByName('Flag').AsInteger = 1 then
    begin
      p_MessageBoxDlg(ADO_Rec.FieldByName('Hint').AsString);
      ADO_Rec.Free;
      Exit;
    end;
  end;
  if Assigned(ADO_Rec) then
    ADO_Rec.Free;
  //---------------------------------------------------------
  iWorkID := vWorkID;
  if iWorkID = -1 then
  begin
    Application.MessageBox(PChar('数据不存在!'),'提示',MB_ICONINFORMATION);
    Exit;
  end;
  if not g_bSCXG then
  begin
    //已制版后不执行
  //  iSczt := DM_DataBase.GetMaxID('Select F_iSczt from BI_WorkOrder where F_iID='+IntToStr(iWorkID));
    sSqlData := 'Select c.F_iSczt,IsNull(b.F_iID,0) CPLX from DO_WorkOrder a left join Set_ProductType b on a.F_iProductTypeID=b.F_iID,DO_WorkOrderPrtProc c '
      +' where a.F_iID=%d and a.F_iID=c.F_iWorkID';
    ADO_Rec := DM_DataBase.OpenQuery(sSqlData,[iWorkID]);
    if ADO_Rec.RecordCount > 0 then
    begin
      iCPLX := ADO_Rec.FieldByName('CPLX').AsInteger;
      iSczt := ADO_Rec.FieldByName('F_iSczt').AsInteger;
      if (iCPLX = 5) and (iSczt =3 ) then
        iSczt := 2;
    end else
    begin
      Application.MessageBox(PChar('数据出错,请重新进入此工单界面!'),'提示',MB_ICONINFORMATION);
      Exit;
    end;
    ADO_Rec.Free;
    if iSczt >0 then
    begin
      case iSczt of
        0: sSczt:='已开单';
        1: sSczt:='已制版';
        2: sSczt:='已印刷';
        3: sSczt:='已打号';
        4: sSczt:='已后道加工';
        5: sSczt:='已进仓';
        6: sSczt:='已发货';
      end;
      Application.MessageBox(PChar('工单'+sSczt+',不能修改!'),'提示',MB_ICONINFORMATION);
      Exit;
    end;
  end;

//  if p_ModifyWorkOrder then
  if p_ModifyWorkOrder then
  begin
    p_MessageBoxDlg('修改成功!');
    btn_zd.Enabled := False;
    btn_xg.Enabled := True;
    btn_dy.Enabled := True;
    if btn_cx.Tag = c_Tag_MakeAllow then
      btn_cx.Enabled := True;
  end else
    p_MessageBoxDlg('修改失败!')
end;

function TFrm_WorkOrder.p_ModifyWorkOrder: Boolean;
var
  i, j, k, n, iCounts, iOrderType, iDetailsID, iSl, iWorkID, iZBID, iBSTID: Integer;
  sHint,sWorkID,sValue,sID, sGDH: string;
  pstr: PChar;
  iProductTypeID,iProductCategoryID,iXpl: Integer;
  sSqlData: string;
  iBsts, iGropuID: Integer;
  ADO_Rec: TADOQuery;
  ADO_CL, ADO_YSDH, ADO_ZB, ADO_ZBGX, ADO_Order, ADO_BST, ADO_BSTPrint, ADO_RJHD: TADOQuery;
  iMatlID, iXM, iOutSL, iSign: Integer;
  sPCH, sBM, sCZRBM: string;
  sOrderID,sOrderType: string;
  sRJHD,sZH,sRJHDQ,sRJHDZ: string;
begin
  Result := False;
  sOrderID := ''; sOrderType := '';
  DM_DataBase.Con_YDPrint.BeginTrans;
  try
    if not p_History_AddWorkOrder then Exit;
    sSqlData := 'Select F_iProductTypeID from DO_OrderApart a,Set_PostageType b where CHARINDEX(b.F_sYZTMC,a.F_sYztmc)=1 and a.F_iID=%d';
    ADO_Rec := DM_DataBase.OpenQuery(sSqlData,[OrderData[0].m_iApartID],True);
    iProductTypeID := ADO_Rec.FieldByName('F_iProductTypeID').AsInteger;
    ADO_Rec.Free;
    if OrderData[0].m_iType = 0 then
      sSqlData := 'Select c.F_iID from DO_OrderApart a,BI_CustomOrderDetails b,Set_ProductCategory c '
        +' where a.F_iOrderID = b.F_iID and b.F_iProductType=c.F_iClassCode and a.F_iID=%d'
    else if OrderData[0].m_iType = 1 then
      sSqlData := 'Select c.F_iID from DO_OrderApart a,BI_SellOrderDetails b,Set_ProductCategory c '
        +' where a.F_iOrderID = b.F_iID and b.F_iProductType=c.F_iClassCode and a.F_iID=%d';
    ADO_Rec := DM_DataBase.OpenQuery(sSqlData,[OrderData[0].m_iApartID],True);
    iProductCategoryID := ADO_Rec.FieldByName('F_iID').AsInteger;
    ADO_Rec.Free;
    //根据第一个订单是否小批量来确定工单是否小批量
//    if OrderData[0].m_iType = 0 then
//      sSqlData := 'Select b.F_tiXpl from DO_OrderApart a,BI_CustomOrderDetails b,BI_CustomOrder c '
//        +'where a.F_tiOrderType=0 and a.F_iOrderID=b.F_iID and b.F_iCustomID=c.F_iID and a.F_iID=%d';
//    if OrderData[0].m_iType = 1 then
//      sSqlData := 'Select b.F_tiXpl from DO_OrderApart a,BI_SellOrderDetails b,BI_SellOrder c '
//        +'where a.F_tiOrderType=1 and a.F_iOrderID=b.F_iID and b.F_iSellID=c.F_iID and a.F_iID=%d';
//    ADO_Rec := DM_DataBase.OpenQuery(sSqlData,[OrderData[0].m_iApartID],True);
//    iXpl := ADO_Rec.FieldByName('F_tiXpl').AsInteger;
//    ADO_Rec.Free;
    //根据用户类型判断是否小批量
    if LoginData.m_iUserType in [c_User_Small,c_Admin_Small] then
      iXpl := 1
    else
      iXpl := 0;
    sSqlData := 'select * from DO_WorkOrder where F_iID = %d';
    ADO_Rec := DM_DataBase.OpenQuery(sSqlData,[vWorkID],True);
    ADO_Rec.Edit;
    ADO_Rec.FieldByName('F_tiJDBZ').AsInteger := iif(rb_jd_yes.Checked,1,0);
    ADO_Rec.FieldByName('F_sGDH').AsString := edt_gdh.Text;
    ADO_Rec.FieldByName('F_sHM').AsString := edt_hm.Text;
    ADO_Rec.FieldByName('F_sPM').AsString := edt_pm.Text;
    ADO_Rec.FieldByName('F_dKDRQ').AsDateTime := dtp_kdrq.DateTime;
    ADO_Rec.FieldByName('F_iZL').AsInteger := StrToNum(edt_zl.Text);
    ADO_Rec.FieldByName('F_sZLDW').AsString := cbb_zldw.Text;
    if Trim(edt_Tj.Text) <> '' then
      ADO_Rec.FieldByName('F_nTJ').AsFloat := StrToFloat(edt_Tj.Text);
    if Trim(edt_Zj.Text) <> '' then
      ADO_Rec.FieldByName('F_nZJ').AsFloat := StrToFloat(edt_Zj.Text);
    ADO_Rec.FieldByName('F_sCPKS').AsString := cbb_cpks.Text;
    ADO_Rec.FieldByName('F_sCPGG').AsString := edt_cpgg.Text;
//    if Trim(edt_cpk.Text) <> '' then
//      ADO_Rec.FieldByName('F_nCPK').AsFloat := StrToFloat(edt_cpk.Text);
//    if Trim(edt_cpc.Text) <> '' then
//      ADO_Rec.FieldByName('F_nCPC').AsFloat := StrToFloat(edt_cpc.Text);
    ADO_Rec.FieldByName('F_sZH').AsString := edt_zh.Text;
    ADO_Rec.FieldByName('F_sRJHDQ').AsString := edt_rjhdq.Text;
    ADO_Rec.FieldByName('F_sRJHDZ').AsString := edt_rjhdz.Text;
    ADO_Rec.FieldByName('F_sZYPH').AsString := edt_zyph.Text;
    ADO_Rec.FieldByName('F_sFPDM').AsString := edt_fhdm.Text;
    ADO_Rec.FieldByName('F_sQSHM').AsString := trim(edt_qshm.Text);
    ADO_Rec.FieldByName('F_sZZHM').AsString := edt_zzhm.Text;
    ADO_Rec.FieldByName('F_sZDYQ').AsString := mmo_zdyq.Text;
    ADO_Rec.FieldByName('F_sBZ').AsString := mmo_bz.Text;
    ADO_Rec.FieldByName('F_sCPBH').AsString := GetCPBH;
    ADO_Rec.FieldByName('F_dJHRQ').AsDateTime := dtp_jhrq.DateTime;
    ADO_Rec.FieldByName('F_sXGR').AsString := LoginData.m_sUserName +';'+ ADO_Rec.FieldByName('F_sXGR').AsString ;
    ADO_Rec.FieldByName('F_dXGRQ').AsDateTime := Now;
    ADO_Rec.FieldByName('F_iProductTypeID').AsInteger := iProductTypeID;
    ADO_Rec.FieldByName('F_iProductCategoryID').AsInteger := iProductCategoryID;
    ADO_Rec.FieldByName('F_tiXpl').AsInteger := iXpl;
    ADO_Rec.Post;

    sSqlData := 'select * from DO_WorkOrderDetGroupNum a where exists(select 1 from DO_WorkOrderDetails b where a.F_iDetailsID =b.F_iID and b.F_iWorkID = %d)';
    ADO_RJHD := DM_DataBase.OpenQuery(sSqlData,[vWorkID],True);
    iCounts := 0;
    for i := 0 to Length(aRJHD) -1 do begin
      if (aRJHD[i].m_iGroupID > 0) then Inc(iCounts);
    end;
    if ADO_RJHD.RecordCount > iCounts then
    begin
      for i := 0 to  ADO_RJHD.RecordCount - iCounts - 1 do
        ADO_RJHD.Delete;
    end;
    ADO_RJHD.First;


    sSqlData := 'select * from DO_WorkOrderDetails where F_iWorkID = %d';
    ADO_Order := DM_DataBase.OpenQuery(sSqlData,[vWorkID],True);
    iCounts := 0;
    for i := 0 to Length(OrderData) -1 do begin
      if OrderData[i].m_iGroupID > 0 then Inc(iCounts);
    end;
    if ADO_Order.RecordCount > iCounts then
    begin
      for i := 0 to  ADO_Order.RecordCount - iCounts - 1 do
        ADO_Order.Delete;
    end;
    ADO_Order.First;


    sSqlData := 'select * from DO_WorkOrderMatl where F_iWorkID = %d';
    ADO_CL := DM_DataBase.OpenQuery(sSqlData,[vWorkID],True);
    iCounts := 0;
    for i := 0 to Length(aCL) -1 do begin
      if aCL[i].m_iGroupID > 0 then Inc(iCounts);
    end;
    if ADO_CL.RecordCount > iCounts then
    begin
      for i := 0 to  ADO_CL.RecordCount - iCounts - 1 do
        ADO_CL.Delete;
    end;
    ADO_CL.First;

    sSqlData := 'select * from DO_WorkOrderPrtProc where F_iWorkID = %d';
    ADO_YSDH := DM_DataBase.OpenQuery(sSqlData,[vWorkID],True);
    iCounts := 0;
    for i := 0 to Length(aYSDH) -1 do begin
      if aYSDH[i].m_iGroupID > 0 then Inc(iCounts);
    end;
    if ADO_YSDH.RecordCount > iCounts then
    begin
      for i := 0 to  ADO_YSDH.RecordCount - iCounts - 1 do
        ADO_YSDH.Delete;
    end;
    ADO_YSDH.First;

    sSqlData := 'select * from DO_WorkOrderMkProc where F_iWorkID = %d';
    ADO_ZB := DM_DataBase.OpenQuery(sSqlData,[vWorkID],True);
    iCounts := 0;
    for i := 0 to Length(aZB) -1 do begin
      if aZB[i].m_iGroupID > 0 then Inc(iCounts);
    end;
    if ADO_ZB.RecordCount > iCounts then
    begin
      for i := 0 to  ADO_ZB.RecordCount - iCounts - 1 do
        ADO_ZB.Delete;
    end;
    ADO_ZB.First;

    sSqlData := 'select * from DO_WorkOrderMkProcDet where F_iWorkID = %d';
    ADO_ZBGX := DM_DataBase.OpenQuery(sSqlData,[vWorkID],True);
    iCounts := 0;
    for i := 0 to Length(aZBGX) -1 do begin
      if aZBGX[i].m_iGroupID > 0 then Inc(iCounts);
    end;
    if ADO_ZBGX.RecordCount > iCounts then
    begin
      for i := 0 to  ADO_ZBGX.RecordCount - iCounts - 1 do
        ADO_ZBGX.Delete;
    end;
    ADO_ZBGX.First;

    sSqlData := 'select * from DO_WorkOrderMKPic where F_iWorkID = %d';
    ADO_BST := DM_DataBase.OpenQuery(sSqlData,[vWorkID],True);
    iCounts := 0;
    for i := 0 to Length(aBST) -1 do begin
      if aBST[i].m_iGroupID > 0 then Inc(iCounts);
    end;
    if ADO_BST.RecordCount > iCounts then
    begin
      for i := 0 to  ADO_BST.RecordCount - iCounts - 1 do
        ADO_BST.Delete;
    end;
    ADO_BST.First;

    sSqlData := 'select * from DO_WorkOrderMKPicPrt where F_iWorkID = %d';
    ADO_BSTPrint := DM_DataBase.OpenQuery(sSqlData,[vWorkID],True);
    iCounts := 0;
    for i := 0 to Length(aBSTPrint) -1 do begin
      if aBSTPrint[i].m_iGroupID > 0 then Inc(iCounts);
    end;
    if ADO_BSTPrint.RecordCount > iCounts then
    begin
      for i := 0 to  ADO_BSTPrint.RecordCount - iCounts - 1 do
        ADO_BSTPrint.Delete;
    end;
    ADO_BSTPrint.First;


    ADO_WorkOrder.First;
    while not ADO_WorkOrder.Eof do
    begin
      iGropuID := ADO_WorkOrder.RecNo;
      //修改订单数据
      for i := 0 to Length(OrderData) -1 do
      begin
        if OrderData[i].m_iGroupID = iGropuID then
        begin
          n := i;
          with ADO_Order do
          begin
            if not Eof then
              Edit
            else
              Insert;
            FieldByName('F_tiOrderType').AsInteger := OrderData[n].m_iType;
            FieldByName('F_iApartID').AsInteger := OrderData[n].m_iApartID;
            FieldByName('F_sKhmc').AsString := OrderData[n].m_sKhmc;
            FieldByName('F_sCpbh').AsString := OrderData[n].m_sCPBH;
            FieldByName('F_sBz').AsString := OrderData[n].m_sBZ;
            FieldByName('F_sDw').AsInteger := 1;
            if Trim(OrderData[n].m_sSl) <> '' then
              FieldByName('F_sSl').AsFloat := StrToFloat(OrderData[n].m_sSl);
            if Trim(OrderData[n].m_sWJFSL) <> '' then
              FieldByName('F_nWJCSL').AsFloat := StrToFloat(OrderData[n].m_sWJFSL);
            FieldByName('F_sZh').AsString := OrderData[n].m_sZH;
            FieldByName('F_sRJHDQ').AsString := OrderData[n].m_sRJHDQ;
            FieldByName('F_sRJHDZ').AsString := OrderData[n].m_sRJHDZ;
            FieldByName('F_iGroupID').AsInteger := iGropuID;
            FieldByName('F_iWorkID').AsInteger := vWorkID;
            Post;
            iDetailsID := FieldByName('F_iID').AsInteger;
            //存入兑奖号段
            for j := 0 to Length(aRJHD) - 1 do
            begin
              with ADO_RJHD do begin
                if aRJHD[j].m_iApartID = OrderData[i].m_iApartID then begin
                  if not Eof then
                    Edit
                  else
                  begin
                    if (aRJHD[j].m_sZH = '') and (aRJHD[j].m_sRJHDQ = '') and (aRJHD[j].m_sRJHDZ = '') then  Continue;
                    Insert;
                  end;
                  if  (FieldByName('F_sZH').AsString<>aRJHD[j].m_sZH) or (FieldByName('F_sRJHDQ').AsString<>aRJHD[j].m_sRJHDQ)
                    or (FieldByName('F_sRJHDZ').AsString<>aRJHD[j].m_sRJHDZ) then
                  begin
                    sOrderID := format('%s,%d',[sOrderID,OrderData[n].m_iOrderID]);
                    sOrderType := format('%s,%d',[sOrderType,OrderData[n].m_iType]);
                  end;
                  FieldByName('F_sZH').AsString := aRJHD[j].m_sZH;
                  FieldByName('F_sRJHDQ').AsString := aRJHD[j].m_sRJHDQ;
                  FieldByName('F_sRJHDZ').AsString := aRJHD[j].m_sRJHDZ;
                  FieldByName('F_iApartID').AsInteger := aRJHD[j].m_iApartID;
                  FieldByName('F_iDetailsID').AsInteger := iDetailsID;
                  aRJHD[j].m_iDetailsID := iDetailsID;
                  Post;
                  aRJHD[j].m_iID := FieldByName('F_iID').AsInteger;
                  Next;
                end;
              end;
            end;
            Next;
          end;
        end;
      end;

      //修改材料数据
      for i := 0 to Length(aCL) -1 do
      begin
        if aCL[i].m_iGroupID = iGropuID then
        begin
          n := i;
          with ADO_CL do
          begin

            if not Eof then
            begin
              iMatlID := ADO_CL.FieldByName('F_iID').AsInteger;
              iSign := 1;
            end else
            begin
              iMatlID := -1;
              iSign := 0;
            end;

            iXM := 1;
            sPCH := aCL[n].m_sPCH;
            sBM:= aCL[n].m_sCLBH;
            if aCL[n].m_iFlag = c_CL_Flag_Normal then
              iOutSL := aCL[n].m_iJFQS + aCL[n].m_iJFS
            else
              iOutSL := StrToNum(aCL[n].m_sSL);
            sCZRBM := LoginData.m_sUserName;

           // exec p_StockOut 工单中材料ID,项目(1:材料),批次号,编码,出库数量,操作人编码,标记(0:增加;1:修改)
           { ADO_Rec.Free;
            ADO_Rec := DM_DataBase.OpenQuery('exec p_StockOut %d,%d,''%s'',''%s'',%d,''%s'',%d ',
              [iMatlID,iXM,sPCH,sBM,iOutSL,sCZRBM,iSign],True);
            if ADO_Rec.FieldByName('Flag').AsInteger <> 0 then
              raise Exception.Create(aCL[n].m_sCLMC+' 材料提取失败: ' + ADO_Rec.FieldByName('Hint').AsString);  }

            if not Eof then
              Edit
            else
              Insert;
            FieldByName('F_sCLBH').AsString := aCL[n].m_sCLBH;
            FieldByName('F_sCLMC').AsString := aCL[n].m_sCLMC;
            FieldByName('F_sCLGG').AsString := aCL[n].m_sCLGG;
            FieldByName('F_sCJGG').AsString := aCL[n].m_sCJGG;
            FieldByName('F_sCJKS').AsString := aCL[n].m_sCJKS;
            FieldByName('F_iJFQS').AsInteger := aCL[n].m_iJFQS;
            FieldByName('F_iJFS').AsInteger := aCL[n].m_iJFS;
            FieldByName('F_iZZS').AsInteger := aCL[n].m_iJFQS + aCL[n].m_iJFS;
            if aCL[n].m_iFlag = c_CL_Flag_Normal then
              FieldByName('F_sSL').AsFloat := (aCL[n].m_iJFQS + aCL[n].m_iJFS)/500
            else
              FieldByName('F_sSL').AsFloat := StrToNum(aCL[n].m_sSL);
            FieldByName('F_sDW').AsString := aCL[n].m_sDW;
            FieldByName('F_sPCH').AsString := aCL[n].m_sPCH;
            FieldByName('F_iFlag').AsInteger := aCL[n].m_iFlag;
            FieldByName('F_iGroupID').AsInteger := iGropuID;
            FieldByName('F_iWorkID').AsInteger := vWorkID;
            Post;
            Next;
          end;
        end;
      end;

      //修改印刷打号数据
      for i := 0 to Length(aYSDH) -1 do
      begin
        if aYSDH[i].m_iGroupID = iGropuID then
        begin
          n := i;
          with ADO_YSDH do
          begin
            //ADO_Rec.Free;
           // sSqlData := 'Select * from BI_MachineToolInfo where F_iID=%d or F_sJTMC like %%%s%%';
           // ADO_Rec := DM_DataBase.OpenQuery(sSqlData,[]);
            if not Eof then
              Edit
            else
              Insert;
            FieldByName('F_sGJMC').AsString := aYSDH[n].m_sGJMC;
            FieldByName('F_sJTBH').AsString := aYSDH[n].m_sJTBH;
            FieldByName('F_sJTMC').AsString := aYSDH[n].m_sJTMC;
            FieldByName('F_iSBS').AsInteger := aYSDH[n].m_iSBS;
            FieldByName('F_sSC').AsString := aYSDH[n].m_sSC;
            FieldByName('F_sSB').AsString := aYSDH[n].m_sSB;
            FieldByName('F_iYS').AsInteger := aYSDH[n].m_iYS;
            FieldByName('F_iYS_1').AsInteger := aYSDH[n].m_iYS_1;
            FieldByName('F_iYS_2').AsInteger := aYSDH[n].m_iYS_2;
            FieldByName('F_sYZLX').AsString := aYSDH[n].m_sYZLX;
            FieldByName('F_sQT').AsString := aYSDH[n].m_sQT;
            FieldByName('F_sYQGX').AsString := aYSDH[n].m_sYQGX;
            FieldByName('F_sYQGXSL').AsString := aYSDH[n].m_sYQGXSL;
            FieldByName('F_sYQGXDW').AsString := aYSDH[n].m_sYQGXDW;
            FieldByName('F_sYSYQ').AsString := aYSDH[n].m_sYSYQ;
            FieldByName('F_sBZ').AsString := aYSDH[n].m_sBZ;
            FieldByName('F_iBSTID').AsInteger := aYSDH[n].m_iBSTID;
            FieldByName('F_iBSTYS').AsInteger := aYSDH[n].m_iBSTYS;
            FieldByName('F_iBSTZS').AsInteger := aYSDH[n].m_iBSTZS;
            FieldByName('F_iGroupID').AsInteger := iGropuID;
            FieldByName('F_iWorkID').AsInteger := vWorkID;
            Post;
            Next;
          end;
        end;
      end;

      //修改制版数据
      for i := 0 to Length(aZB) -1 do
      begin
        if aZB[i].m_iGroupID = iGropuID then
        begin
          n := i;
          with ADO_ZB do
          begin
            if not Eof then
              Edit
            else
              Insert;
            FieldByName('F_sJD').AsString := aZB[n].m_sJD;
            FieldByName('F_sGB').AsString := aZB[n].m_sGB;
            FieldByName('F_sTS').AsString := aZB[n].m_sTS;
            FieldByName('F_sDY').AsString := aZB[n].m_sDY;
            FieldByName('F_sPB').AsString := aZB[n].m_sPB;
            FieldByName('F_sCP').AsString := aZB[n].m_sCP;
            FieldByName('F_sSBLB').AsString := aZB[n].m_sSBLB;
            FieldByName('F_sSBKS').AsString := aZB[n].m_sSBKS;
            FieldByName('F_iSBK').AsInteger := aZB[n].m_iSBK;
            FieldByName('F_sQT').AsString := aZB[n].m_sQT;
            FieldByName('F_iGroupID').AsInteger := iGropuID;
            FieldByName('F_iWorkID').AsInteger := vWorkID;
            Post;
            iZBID := FieldByName('F_iID').AsInteger;
            //修改制版工序数据
            for j := 0 to Length(aZBGX) - 1 do
            begin
              with ADO_ZBGX do begin
                if aZBGX[j].m_iGroupID = iGropuID then begin
                  if not Eof then
                    Edit
                  else
                    Insert;
                  FieldByName('F_sCode').AsString := aZBGX[j].m_sCode;
                  FieldByName('F_sName').AsString := aZBGX[j].m_sName;
                  FieldByName('F_sCategorySpec').AsString := aZBGX[j].m_sCategorySpec;
                  FieldByName('F_sOutput').AsString := aZBGX[j].m_sOutput;
                  FieldByName('F_sUnit').AsString := aZBGX[j].m_sUnit;
                  FieldByName('F_sRemarks').AsString := aZBGX[j].m_sBZ;
                  FieldByName('F_iMkProcID').AsInteger := iZBID;
                  FieldByName('F_iGroupID').AsInteger := iGropuID;
                  FieldByName('F_iWorkID').AsInteger := vWorkID;
                  Post;
                  Next;
                end;
              end;
            end;

            Next;
          end;
        end;
      end;

      //存入版式图数据
      for i := 0 to Length(aBST) -1 do
      begin
        if aBST[i].m_iGroupID = iGropuID then
        begin
          n := i;
          with ADO_BST do
          begin
            if not Eof then
              Edit
            else
              Insert;
            FieldByName('F_iRow').AsInteger := aBST[n].m_iRow;
            FieldByName('F_iCol').AsInteger := aBST[n].m_iCol;
            FieldByName('F_sBZ').AsString := aBST[n].m_sBZ;
            FieldByName('F_sCZR').AsString := LoginData.m_sUserName;
            FieldByName('F_dCZRQ').AsDateTime := Now;
            FieldByName('F_iGroupID').AsInteger := aBST[n].m_iGroupID;
            FieldByName('F_iWorkID').AsInteger := vWorkID;
            Post;
            iBSTID := FieldByName('F_iID').AsInteger;
            //存入版式图明细数据
            for j := 0 to Length(aBSTPrint) - 1 do
            begin
              with ADO_BSTPrint do begin
                if aBSTPrint[j].m_iGroupID = iGropuID then begin
                  if not Eof then
                    Edit
                  else
                    Insert;
                  FieldByName('F_iRow').AsInteger := aBSTPrint[j].m_iRow;
                  FieldByName('F_iCol').AsInteger := aBSTPrint[j].m_iCol;
                  FieldByName('F_iApartID').AsInteger := aBSTPrint[j].m_iApartID;
                  FieldByName('F_sCPBH').AsString := aBSTPrint[j].m_sCPBH;
                  FieldByName('F_sBZ').AsString := aBSTPrint[j].m_sBZ;
                  FieldByName('F_iBSTID').AsInteger := iBSTID;
                  FieldByName('F_iGroupID').AsInteger := iGropuID;
                  FieldByName('F_iWorkID').AsInteger := vWorkID;
                  Post;
                  Next;
                end;
              end;
            end;
            Next;
          end;
        end;
      end;
      sSqlData := ' if not exists(Select 1 from DO_ProductDate_Log where F_iWorkID = %d and F_iGroupID = %d ) ' ;
      sSqlData := sSqlData + 'Insert into DO_ProductDate_Log (F_iWorkID,F_iGroupID) VALUES (%d,%d) ';
      DM_DataBase.ExecQuery(sSqlData,[vWorkID,iGropuID,vWorkID,iGropuID],True);

      ADO_WorkOrder.Next;
    end;

    DM_DataBase.Con_YDPrint.CommitTrans;
    Result := True;
  except
    on E: Exception do
    begin
      DM_DataBase.Con_YDPrint.RollbackTrans;
      p_MessageBoxDlg('错误：'+e.Message);
    end;
  end;
  try
    if Length(sOrderID) >0 then
    begin
      ADO_Rec.Free;
      sOrderID := Copy(sOrderID,2,Length(sOrderID));
      sOrderType := Copy(sOrderType,2,Length(sOrderType));

      sSqlData := 'select F_bRJBZ,F_sZH,F_sRJHDQ,F_sRJHDZ,F_sRJHD,dbo.f_GetRJHD(F_iOrderID,F_tiOrderType) RJHD,F_iOrderID,F_tiOrderType,F_iID from DO_CartonLableInfo where F_iOrderID in (%s) and F_tiOrderType in (%s) ';
      ADO_Rec := DM_DataBase.OpenQuery(sSqlData,[sOrderID,sOrderType]);
      if Assigned(ADO_Rec) and (ADO_Rec.RecordCount>0) then
      begin
        if p_MessageBoxDlg('发现有订单已箱签,是否更新兑奖号段?','提示',MB_YESNO + MB_ICONINFORMATION)= IDYES then
        begin
          DM_DataBase.Con_YDPrint.BeginTrans;
          //--------更新兑奖号段-----------------------------
          while not ADO_Rec.Eof do
          begin
            sRJHD := ADO_Rec.FieldByName('RJHD').AsString;
            sZH := PosCopy(sRJHD,';',1);
            sRJHDQ := PosCopy(sRJHD,';',2);
            sRJHDZ := PosCopy(sRJHD,';',3);
            ADO_Rec.Edit;
            ADO_Rec.FieldByName('F_bRJBZ').AsBoolean := True;
            ADO_Rec.FieldByName('F_sZH').AsString    := sZH;
            ADO_Rec.FieldByName('F_sRJHDQ').AsString := sRJHDQ;
            ADO_Rec.FieldByName('F_sRJHDZ').AsString := sRJHDZ;
            ADO_Rec.FieldByName('F_sRJHD').AsString  := sRJHD;
            ADO_Rec.Post;

            p_WriteGroup(ADO_Rec.FieldByName('F_iID').AsInteger,
              ADO_Rec.FieldByName('F_iOrderID').AsInteger,ADO_Rec.FieldByName('F_tiOrderType').AsInteger,
              sZH,sRJHDQ,sRJHDZ);
            ADO_Rec.Next;
          end;
          //----------------------------------------------------
          DM_DataBase.Con_YDPrint.CommitTrans;
        end;
      end;
    end;
  except
    on E: Exception do
    begin
      DM_DataBase.Con_YDPrint.RollbackTrans;
      p_MessageBoxDlg('更新兑奖号码失败：'+e.Message);
    end;

  end;          
  ADO_Rec.Free;
  ADO_Order.Free;
  ADO_CL.Free;
  ADO_YSDH.Free;
  ADO_ZB.Free;
  ADO_ZBGX.Free;
  ADO_BST.Free;
  ADO_BSTPrint.Free;
end;

procedure TFrm_WorkOrder.btn_cxClick(Sender: TObject);
var
  iWorkID: Integer;
  iSczt, iRec, i: integer;
  sSczt,sSqlData: string;
  ADO_Rec: TADOQuery;
  bRJHDExist: Boolean;
begin
  iWorkID := vWorkID;
  if iWorkID = -1 then
  begin
    Application.MessageBox(PChar('数据不存在!不能'+btn_cx.Caption+'!'),'提示',MB_ICONINFORMATION);
    Exit;
  end;

  if btn_cx.Caption = '撤消' then
  begin
    //已制版后不执行 ( 撤单暂不做此限制)
    iSczt := DM_DataBase.GetMaxID('Select Max(F_iSczt) from DO_WorkOrderPrtProc where F_iWorkID='+IntToStr(iWorkID));
    if iSczt >4 then
    begin
      case iSczt of
      0: sSczt:='已开单';
      1: sSczt:='已制版';
      2: sSczt:='已印刷';
      3: sSczt:='已打号';
      4: sSczt:='已后道加工';
      5: sSczt:='已进仓';
      6: sSczt:='已发货';
      end;
      Application.MessageBox(PChar('工单'+sSczt+',不能撤消!'),'提示',MB_ICONINFORMATION);
      Exit;
    end;  

    if Application.MessageBox('是否撤消此工单?','提示',MB_YESNO + MB_ICONINFORMATION)=ID_NO then exit;
    try
      DM_DataBase.Con_YDPrint.BeginTrans;
      sSqlData := ' Update DO_WorkOrder Set F_tiCXBZ=1,F_sCXR=''%s'',F_dCXRQ=getdate() where F_iID=%d ';
      bRJHDExist := False;
      for i := 0 to Length(aRJHD) -1 do
      begin
        if (aRJHD[i].m_sZH <> '') or (aRJHD[i].m_sRJHDQ <> '') or (aRJHD[i].m_sRJHDZ <> '') then
        begin
          bRJHDExist := True;
          Break;
        end;
      end;
      if (bRJHDExist) and (p_MessageBoxDlg('是否同时撤销此单的所有兑奖号码?','提示',MB_ICONINFORMATION + MB_YESNO)=IDYES) then
      begin
        sSqlData := sSqlData + ' Update DO_WorkOrderDetails set  F_sZH='''',F_sRJHDQ='''',F_sRJHDZ='''' where F_iWorkID = %d ';
        sSqlData := sSqlData + ' Update DO_WorkOrderDetGroupNum set  F_sZH='''',F_sRJHDQ='''',F_sRJHDZ='''' from '
          + ' DO_WorkOrderDetGroupNum a,DO_WorkOrderDetails b where a.F_iDetailsID=b.F_iID and b.F_iWorkID = %d ';
      end;
      DM_DataBase.ExecQuery(sSqlData,[LoginData.m_sUserName,iWorkID,iWorkID,iWorkID],True);
      for i := 0 to Length(aRJHD) -1 do
      begin
        aRJHD[i].m_sZH := '';
        aRJHD[i].m_sRJHDQ := '';
        aRJHD[i].m_sRJHDZ := '';
      end;
      for i := 0 to Length(OrderData) -1 do
      begin
        OrderData[i].m_sZH := '';
        OrderData[i].m_sRJHDQ := '';
        OrderData[i].m_sRJHDZ := '';
      end;

//      sSqlData := 'Update DO_StockOutInfo Set F_tiCXBZ=1,F_sCZRBM=''%s'',F_dCXRQ=getdate() '
//        +' from  DO_StockOutInfo a,DO_WorkOrderMatl b where b.F_iWorkID=%d and a.F_sPCH=b.F_sPCH';
     //暂时不使用库存
//      sSqlData := 'insert into DO_StockOutInfo (F_sPCH,F_iXM,F_sBM,F_nSL,F_sCZRBM,F_dCZRQ,F_tiCXBZ) '
//          +' select F_sPCH,1,F_sCLBH,case F_iFlag when 0 then -(F_iJFQS+F_iJFS) when 1 then -F_sSL end, '
//          +' ''%s'',getdate(),0 from DO_WorkOrderMatl where F_iWorkID=%d';
//      DM_DataBase.ExecQuery(sSqlData,[LoginData.m_sUserName,iWorkID],True);

      Application.MessageBox('撤消成功!','提示',MB_ICONINFORMATION);
      btn_cx.Caption := '恢复';
      DM_DataBase.Con_YDPrint.CommitTrans;
    except
      on E: Exception do
      begin
        DM_DataBase.Con_YDPrint.RollbackTrans;
        p_MessageBoxDlg('错误：'+e.Message);
      end;
    end;
//      vWorkID := 0;
//      vBSTID := 0;
//      lab_HBST.Caption := '画版式图';
//      EnableCom(True);
//      btn_xg.Enabled := False;
//      btn_dy.Enabled := False;
//      btn_cx.Enabled := False;
  end else
  if btn_cx.Caption = '恢复' then
  begin
    if Application.MessageBox('是否恢复此工单?','提示',MB_YESNO + MB_ICONINFORMATION)=ID_NO then exit;
    try
      try
        DM_DataBase.Con_YDPrint.BeginTrans;
        sSqlData := 'exec p_hfpd %d';
        ADO_Rec := DM_DataBase.OpenQuery(sSqlData,[iWorkID],True);
        if ADO_Rec.RecordCount > 0  then
        begin
          Application.MessageBox('此工单中的订单已被别的工单开过!不能恢复!','提示',MB_ICONINFORMATION);
          Exit;
        end;
        //暂时不使用库存
//        sSqlData := 'select 1 from v_clkc a,DO_WorkOrderMatl b where a.PCH=b.F_sPCH and b.F_iWorkID=%d '
//          +' and ((b.F_iFlag=0 and a.KCSL <(IsNull(b.F_iJFQS,0)+IsNull(b.F_iJFS,0))) or (b.F_iFlag=1 and a.KCSL < IsNull(F_sSL,0))) ';
//        ADO_Rec := DM_DataBase.OpenQuery(sSqlData,[iWorkID],True);
//        if ADO_Rec.RecordCount > 0  then
//        begin
//          Application.MessageBox('工单中所选批号库存不足!不能恢复!','提示',MB_ICONINFORMATION);
//          Exit;
//        end;
        sSqlData := 'Update DO_WorkOrder Set F_tiCXBZ=0 where F_iID=%d';
        DM_DataBase.ExecQuery(sSqlData,[iWorkID],True);
        //暂时不使用库存
//        sSqlData := 'insert into DO_StockOutInfo (F_sPCH,F_iXM,F_sBM,F_nSL,F_sCZRBM,F_dCZRQ,F_tiCXBZ) '
//            +' select F_sPCH,1,F_sCLBH,case F_iFlag when 0 then F_iJFQS+F_iJFS when 1 then F_sSL end, '
//            +' ''%s'',getdate(),0 from DO_WorkOrderMatl where F_iWorkID=%d';
//        DM_DataBase.ExecQuery(sSqlData,[LoginData.m_sUserName,iWorkID],True);
        Application.MessageBox('恢复成功!','提示',MB_ICONINFORMATION);
        btn_cx.Caption := '撤消';
        DM_DataBase.Con_YDPrint.CommitTrans;
      except
        on E: Exception do
        begin
          DM_DataBase.Con_YDPrint.RollbackTrans;
          p_MessageBoxDlg('错误：'+e.Message);
        end;

      end;
    finally
      ADO_Rec.Free;
    end;
  end;
end;

procedure TFrm_WorkOrder.dbg_gdxxColumns4UpdateData(Sender: TObject;
  var Text: String; var Value: Variant; var UseText, Handled: Boolean);
var
  i: Integer;
begin
  if not IsNum(Text) then
  begin
    p_MessageBoxDlg('无效字符,请输入数字!');
    Text := '0';
  end;
  if StrToNum(Text) > 0 then
  begin
    for i := 0 to Length(aYSDH) -1 do
    begin
      if aYSDH[i].m_iGroupID = ADO_WorkOrder.RecNo then
        aYSDH[i].m_iBSTYS := StrToNum(Text);
    end;
  end;
end;

procedure TFrm_WorkOrder.SaveRJHD;
var
  i: integer;
  sApartID: string;
  sSqlData: string;
begin
  sApartID := '';
  for i := 0 to Length(OrderData) -1 do
  begin
    sApartID :=sApartID + IntToStr(OrderData[i].m_iApartID);
  end;
  if sApartID <> '' then
  begin
    sSqlData := 'Select * from ';
  end;
end;

procedure TFrm_WorkOrder.edt_zlExit(Sender: TObject);
begin
  if (Pos('.',Ti_TxtFilter(Sender).Text)>0) or ((Ti_TxtFilter(Sender).Text <> '') and (not IsNum(Ti_TxtFilter(Sender).Text))) then
  begin
    p_MessageBoxDlg('字符无效,请输入数字(不含小数)!');
    Ti_TxtFilter(Sender).SetFocus;
    Exit;
  end;
end;

procedure TFrm_WorkOrder.edt_TjExit(Sender: TObject);
begin
  if (Ti_TxtFilter(Sender).Text <> '') and (not IsNum(Ti_TxtFilter(Sender).Text)) then
  begin
    p_MessageBoxDlg('字符无效,请输入数字!');
    Ti_TxtFilter(Sender).SetFocus;
    Exit;
  end;
  EdtExit(Sender);
end;

function TFrm_WorkOrder.GetBSTYS_old: Integer;
var
  i, iSBS, iSC, iZL, iCPKS, iBSTZS, iBSTYS: integer;
  sSC: string;
begin
  Result := 0;
  iBSTYS := ADO_WorkOrder.FieldByName('BSTYS').AsInteger;
  if iBSTYS > 0 then Exit;
  iSBS := 0;
//  sSC := '';
  for i := 0 to Length(aYSDH) -1 do
  begin
    if aYSDH[i].m_iGroupID = ADO_WorkOrder.RecNo then
    begin
      iSBS := aYSDH[i].m_iSBS;
//      sSC := aYSDH[i].m_sSC;
    end;
  end;
//  iSC := 0;
//  if StrToNum(PosCopy(sSC,'/',1)) > 0 then
//    Inc(iSC);
//  if StrToNum(PosCopy(sSC,'/',2)) > 0 then
//    Inc(iSC);
  if Trim(cbb_cpks.Text) = '对' then
    iCPKS := 2
  else
    iCPKS := StrToNum(cbb_cpks.Text);
  iBSTZS := ADO_WorkOrder.FieldByName('BSTZS').AsInteger;
  //iZL := StrToNum(edt_zl.Text);
  iZL := 0;
  for i := 0 to Length(OrderData) -1 do
  begin
    if OrderData[i].m_iGroupID = ADO_WorkOrder.RecNo then
      iZL := iZL + OrderData[i].m_iBCYL;
  end;
  if (iZL > 0) and (iSBS > 0)  then
  begin
    if iBSTZS > 0 then
      Result := iZL div iBSTZS                 //本版共印=总量/版式图个数*(iif(4/4,2,1))
    else if (iCPKS > 0) and (iCPKS div iSBS > 0) then
      Result := iZL div (iCPKS div iSBS);           //印数=总量/(产品开数/上机开本)*(iif(4/4,2,1))
    if Result > 0 then
    begin
      for i := 0 to Length(aYSDH) -1 do
      begin
        if aYSDH[i].m_iGroupID = ADO_WorkOrder.RecNo then
          aYSDH[i].m_iBSTYS := Result;
      end;
    end;
  end;

end;

procedure TFrm_WorkOrder.btn_mbsjClick(Sender: TObject);
var
  sFileName: string;
begin
  sFileName := ExtractFilePath(Application.ExeName)+'打印\工单打印模板.rmf';//c_WorkOrder_PrintExeName;
 // sFileName := 'c:\1.gif';
  case OrderData[0].m_iXPL of
    1:
      begin
        if FileExists(sFileName) then
          rmr_XPLPrint.LoadFromFile(sFileName);
        rmr_XPLPrint.DesignReport;
      end;
  else
    if FileExists(sFileName) then
      rmr_Print.LoadFromFile(sFileName);
    rmr_Print.DesignReport;
  end;
end;

function TFrm_WorkOrder.p_History_AddWorkOrder: Boolean;
var
  i, j, k, l, n, iCounts, iOrderType, iDetailsID, iSl,iWorkID,iZBID, iBSTID: Integer;
  sHint,sWorkID,sValue,sID, sGDH: string;
  pstr: PChar;
  iProductTypeID,iProductCategoryID,iXpl: Integer;
  sSqlData: string;
  iBsts, iGropuID: Integer;
  ADO_Rec, ADO_History: TADOQuery;
  ADO_CL, ADO_YSDH, ADO_ZB, ADO_ZBGX, ADO_Order, ADO_BST, ADO_BSTPrint, ADO_RJHD: TADOQuery;
  ADO_His_CL, ADO_His_YSDH, ADO_His_ZB, ADO_His_ZBGX, ADO_His_Order, ADO_His_BST, ADO_His_BSTPrint, ADO_His_RJHD: TADOQuery;

begin
  Result := False;
  if vWorkID = 0 then Exit;
  //DM_DataBase.Con_YDPrint.BeginTrans;
  try
    sSqlData := 'select * from DO_WorkOrder where F_iID = %d ';
    ADO_Rec := DM_DataBase.OpenQuery(sSqlData,[vWorkID],True);
    sSqlData := 'select * from History_WorkOrder where 1=2';
    ADO_History := DM_DataBase.OpenQuery(sSqlData,[OrderData[0].m_iApartID],True);
    ADO_History.Insert;
    ADO_History.FieldByName('F_tiJDBZ').AsInteger                := ADO_Rec.FieldByName('F_tiJDBZ').AsInteger;
    ADO_History.FieldByName('F_sGDH').AsString                   := ADO_Rec.FieldByName('F_sGDH').AsString;
    ADO_History.FieldByName('F_sHM').AsString                    := ADO_Rec.FieldByName('F_sHM').AsString;
    ADO_History.FieldByName('F_sPM').AsString                    := ADO_Rec.FieldByName('F_sPM').AsString;
    ADO_History.FieldByName('F_dKDRQ').AsDateTime                := ADO_Rec.FieldByName('F_dKDRQ').AsDateTime;
    ADO_History.FieldByName('F_iZL').AsInteger                   := ADO_Rec.FieldByName('F_iZL').AsInteger;
    ADO_History.FieldByName('F_sZLDW').AsString                  := ADO_Rec.FieldByName('F_sZLDW').AsString;
    ADO_History.FieldByName('F_nTJ').AsFloat                     := ADO_Rec.FieldByName('F_nTJ').AsFloat;
    ADO_History.FieldByName('F_nZJ').AsFloat                     := ADO_Rec.FieldByName('F_nZJ').AsFloat;
    ADO_History.FieldByName('F_sCPKS').AsString                  := ADO_Rec.FieldByName('F_sCPKS').AsString;
    ADO_History.FieldByName('F_sCPGG').AsString                  := ADO_Rec.FieldByName('F_sCPGG').AsString;
//    ADO_History.FieldByName('F_nCPK').AsFloat                    := ADO_Rec.FieldByName('F_nCPK').AsFloat;
//    ADO_History.FieldByName('F_nCPC').AsFloat                    := ADO_Rec.FieldByName('F_nCPC').AsFloat;
    ADO_History.FieldByName('F_sZH').AsString                    := ADO_Rec.FieldByName('F_sZH').AsString;
    ADO_History.FieldByName('F_sRJHDQ').AsString                 := ADO_Rec.FieldByName('F_sRJHDQ').AsString;
    ADO_History.FieldByName('F_sRJHDZ').AsString                 := ADO_Rec.FieldByName('F_sRJHDZ').AsString;
    ADO_History.FieldByName('F_sZYPH').AsString                  := ADO_Rec.FieldByName('F_sZYPH').AsString;
    ADO_History.FieldByName('F_sFPDM').AsString                  := ADO_Rec.FieldByName('F_sFPDM').AsString;
    ADO_History.FieldByName('F_sQSHM').AsString                  := ADO_Rec.FieldByName('F_sQSHM').AsString;
    ADO_History.FieldByName('F_sZZHM').AsString                  := ADO_Rec.FieldByName('F_sZZHM').AsString;
    ADO_History.FieldByName('F_sZDYQ').AsString                  := ADO_Rec.FieldByName('F_sZDYQ').AsString;
    ADO_History.FieldByName('F_sBZ').AsString                    := ADO_Rec.FieldByName('F_sBZ').AsString;
    ADO_History.FieldByName('F_sCPBH').AsString                  := ADO_Rec.FieldByName('F_sCPBH').AsString;
    ADO_History.FieldByName('F_dJHRQ').AsDateTime                := ADO_Rec.FieldByName('F_dJHRQ').AsDateTime;
    ADO_History.FieldByName('F_sKDR').AsString                   := ADO_Rec.FieldByName('F_sKDR').AsString  ;
    ADO_History.FieldByName('F_sXGR').AsString                  := ADO_Rec.FieldByName('F_sXGR').AsString;
    if ADO_Rec.FieldByName('F_sXGR').AsString <> '' then
      ADO_History.FieldByName('F_dXGRQ').AsDateTime                := ADO_Rec.FieldByName('F_dXGRQ').AsDateTime;
    ADO_History.FieldByName('F_iProductTypeID').AsInteger        := ADO_Rec.FieldByName('F_iProductTypeID').AsInteger;
    ADO_History.FieldByName('F_iProductCategoryID').AsInteger    := ADO_Rec.FieldByName('F_iProductCategoryID').AsInteger;
    ADO_History.FieldByName('F_tiCXBZ').AsInteger                := ADO_Rec.FieldByName('F_tiCXBZ').AsInteger;
    ADO_History.FieldByName('F_sCXR').AsString                   := ADO_Rec.FieldByName('F_sCXR').AsString;
    ADO_History.FieldByName('F_dCXRQ').AsDateTime                := ADO_Rec.FieldByName('F_dCXRQ').AsDateTime;
    ADO_History.FieldByName('F_iSczt').AsInteger                 := ADO_Rec.FieldByName('F_iSczt').AsInteger;
    ADO_History.FieldByName('F_dCzrq').AsDateTime                := ADO_Rec.FieldByName('F_dCzrq').AsDateTime;
    ADO_History.FieldByName('F_iCzrID').AsInteger                := ADO_Rec.FieldByName('F_iCzrID').AsInteger;
    ADO_History.FieldByName('F_tiXpl').AsInteger                 := ADO_Rec.FieldByName('F_tiXpl').AsInteger;
    ADO_History.FieldByName('F_sZl').AsString                    := ADO_Rec.FieldByName('F_sZl').AsString;
    ADO_History.FieldByName('F_iRealWorkID').AsInteger           := ADO_Rec.FieldByName('F_iID').AsInteger;
    ADO_History.Post;
    iWorkID := ADO_History.FieldByName('F_iID').AsInteger;
    ADO_History.Free;
    ADO_Rec.Free;

    sSqlData := 'select * from DO_WorkOrderDetails where F_iWorkID = %d';
    ADO_Order := DM_DataBase.OpenQuery(sSqlData,[vWorkID],True);
    sSqlData := 'select * from History_WorkOrderDetails where 1=2';
    ADO_His_Order := DM_DataBase.OpenQuery(sSqlData,[],True);

    sSqlData := 'select * from DO_WorkOrderDetGroupNum a where exists(select 1 from DO_WorkOrderDetails b where a.F_iDetailsID =b.F_iID and b.F_iWorkID = %d)';
    ADO_RJHD := DM_DataBase.OpenQuery(sSqlData,[vWorkID],True);
    sSqlData := 'select * from History_WorkOrderDetGroupNum where 1=2';
    ADO_His_RJHD := DM_DataBase.OpenQuery(sSqlData,[],True);


    sSqlData := 'select * from DO_WorkOrderMatl where F_iWorkID = %d';
    ADO_CL := DM_DataBase.OpenQuery(sSqlData,[vWorkID],True);
    sSqlData := 'select * from History_WorkOrderMatl where 1=2';
    ADO_His_CL := DM_DataBase.OpenQuery(sSqlData,[],True);

    sSqlData := 'select * from DO_WorkOrderPrtProc where F_iWorkID = %d';
    ADO_YSDH := DM_DataBase.OpenQuery(sSqlData,[vWorkID],True);
    sSqlData := 'select * from History_WorkOrderPrtProc where 1=2';
    ADO_His_YSDH := DM_DataBase.OpenQuery(sSqlData,[],True);

    sSqlData := 'select * from DO_WorkOrderMkProc where F_iWorkID = %d';
    ADO_ZB := DM_DataBase.OpenQuery(sSqlData,[vWorkID],True);
    sSqlData := 'select * from History_WorkOrderMkProc where 1=2';
    ADO_His_ZB := DM_DataBase.OpenQuery(sSqlData,[],True);

    sSqlData := 'select * from DO_WorkOrderMkProcDet where F_iWorkID = %d';
    ADO_ZBGX := DM_DataBase.OpenQuery(sSqlData,[vWorkID],True);
    sSqlData := 'select * from History_WorkOrderMkProcDet where 1=2';
    ADO_His_ZBGX := DM_DataBase.OpenQuery(sSqlData,[],True);

    sSqlData := 'select * from DO_WorkOrderMKPic where F_iWorkID = %d';
    ADO_BST := DM_DataBase.OpenQuery(sSqlData,[vWorkID],True);
    sSqlData := 'select * from History_WorkOrderMKPic where 1=2';
    ADO_His_BST := DM_DataBase.OpenQuery(sSqlData,[],True);

    sSqlData := 'select * from DO_WorkOrderMKPicPrt where F_iWorkID = %d';
    ADO_BSTPrint := DM_DataBase.OpenQuery(sSqlData,[vWorkID],True);
    sSqlData := 'select * from History_WorkOrderMKPicPrt where 1=2';
    ADO_His_BSTPrint := DM_DataBase.OpenQuery(sSqlData,[],True);


    //修改订单数据
    with ADO_Order do
    begin
      while not Eof do
      begin
        ADO_His_Order.Insert;
        ADO_His_Order.FieldByName('F_tiOrderType').AsInteger   := FieldByName('F_tiOrderType').AsInteger;
        ADO_His_Order.FieldByName('F_iApartID').AsInteger      := FieldByName('F_iApartID').AsInteger;
        ADO_His_Order.FieldByName('F_sKhmc').AsString          := FieldByName('F_sKhmc').AsString;
        ADO_His_Order.FieldByName('F_sCpbh').AsString          := FieldByName('F_sCpbh').AsString;
        ADO_His_Order.FieldByName('F_sBz').AsString            := FieldByName('F_sBz').AsString;
        ADO_His_Order.FieldByName('F_sDw').AsInteger           := FieldByName('F_sDw').AsInteger;
        ADO_His_Order.FieldByName('F_sSl').AsFloat             := FieldByName('F_sSl').AsFloat;
        ADO_His_Order.FieldByName('F_nWJCSL').AsFloat             := FieldByName('F_nWJCSL').AsFloat;
        ADO_His_Order.FieldByName('F_sZh').AsString            := FieldByName('F_sZh').AsString;
        ADO_His_Order.FieldByName('F_sRJHDQ').AsString         := FieldByName('F_sRJHDQ').AsString;
        ADO_His_Order.FieldByName('F_sRJHDZ').AsString         := FieldByName('F_sRJHDZ').AsString;
        ADO_His_Order.FieldByName('F_iGroupID').AsInteger      := FieldByName('F_iGroupID').AsInteger;
        ADO_His_Order.FieldByName('F_iWorkID').AsInteger       := iWorkID;
        ADO_His_Order.Post;
        iDetailsID := ADO_His_Order.FieldByName('F_iID').AsInteger;
        //存入兑奖号段
        with ADO_RJHD do
        begin
          First;
          while not Eof do
          begin
            if ADO_Order.FieldByName('F_iApartID').AsInteger = ADO_RJHD.FieldByName('F_iApartID').AsInteger then
            begin
              ADO_His_RJHD.Insert;
              ADO_His_RJHD.FieldByName('F_sZH').AsString           := FieldByName('F_sZH').AsString;
              ADO_His_RJHD.FieldByName('F_sRJHDQ').AsString        := FieldByName('F_sRJHDQ').AsString;
              ADO_His_RJHD.FieldByName('F_sRJHDZ').AsString        := FieldByName('F_sRJHDZ').AsString;
              ADO_His_RJHD.FieldByName('F_iApartID').AsInteger     := FieldByName('F_iApartID').AsInteger;
              ADO_His_RJHD.FieldByName('F_iDetailsID').AsInteger   := iDetailsID;
              ADO_His_RJHD.Post;
            end;
            Next;                                                                                                    
          end;
        end;
        Next;
      end;
    end;

    //修改材料数据
    with ADO_CL do
    begin
      while not Eof do
      begin
        ADO_His_CL.Insert;
        ADO_His_CL.FieldByName('F_sCLBH').AsString       := FieldByName('F_sCLBH').AsString;
        ADO_His_CL.FieldByName('F_sCLMC').AsString       := FieldByName('F_sCLMC').AsString;
        ADO_His_CL.FieldByName('F_sCLGG').AsString       := FieldByName('F_sCLGG').AsString;
        ADO_His_CL.FieldByName('F_sCJGG').AsString       := FieldByName('F_sCJGG').AsString;
        ADO_His_CL.FieldByName('F_sCJKS').AsString       := FieldByName('F_sCJKS').AsString;
        ADO_His_CL.FieldByName('F_iJFQS').AsInteger      := FieldByName('F_iJFQS').AsInteger;
        ADO_His_CL.FieldByName('F_iJFS').AsInteger       := FieldByName('F_iJFS').AsInteger;
        ADO_His_CL.FieldByName('F_iZZS').AsInteger       := FieldByName('F_iZZS').AsInteger;
        ADO_His_CL.FieldByName('F_sSL').AsString          := FieldByName('F_sSL').AsString;
        ADO_His_CL.FieldByName('F_sDW').AsString          := FieldByName('F_sDW').AsString;
        //ADO_His_CL.FieldByName('F_sPCH').AsString          := FieldByName('F_sPCH').AsString;
        ADO_His_CL.FieldByName('F_iFlag').AsInteger      := FieldByName('F_iFlag').AsInteger;
        ADO_His_CL.FieldByName('F_iGroupID').AsInteger   := FieldByName('F_iGroupID').AsInteger;
        ADO_His_CL.FieldByName('F_iWorkID').AsInteger    := iWorkID;
        ADO_His_CL.Post;
        Next;
      end;
    end;

    //修改印刷打号数据
    with ADO_YSDH do
    begin
      while not Eof do
      begin
        ADO_His_YSDH.Insert;
        ADO_His_YSDH.FieldByName('F_sGJMC').AsString        := FieldByName('F_sGJMC').AsString;
        ADO_His_YSDH.FieldByName('F_sJTBH').AsString        := FieldByName('F_sJTBH').AsString;
        ADO_His_YSDH.FieldByName('F_sJTMC').AsString        := FieldByName('F_sJTMC').AsString;
        ADO_His_YSDH.FieldByName('F_iSBS').AsInteger        := FieldByName('F_iSBS').AsInteger;
        ADO_His_YSDH.FieldByName('F_sSC').AsString          := FieldByName('F_sSC').AsString;
        ADO_His_YSDH.FieldByName('F_sSB').AsString          := FieldByName('F_sSB').AsString;
        ADO_His_YSDH.FieldByName('F_iYS').AsInteger         := FieldByName('F_iYS').AsInteger;
        ADO_His_YSDH.FieldByName('F_iYS_1').AsInteger       := FieldByName('F_iYS_1').AsInteger;
        ADO_His_YSDH.FieldByName('F_iYS_2').AsInteger       := FieldByName('F_iYS_2').AsInteger;
        ADO_His_YSDH.FieldByName('F_sYZLX').AsString        := FieldByName('F_sYZLX').AsString;
        ADO_His_YSDH.FieldByName('F_sQT').AsString          := FieldByName('F_sQT').AsString;
        ADO_His_YSDH.FieldByName('F_sYQGX').AsString        := FieldByName('F_sYQGX').AsString;
        ADO_His_YSDH.FieldByName('F_sYQGXSL').AsString      := FieldByName('F_sYQGXSL').AsString;
        ADO_His_YSDH.FieldByName('F_sYQGXDW').AsString      := FieldByName('F_sYQGXDW').AsString;
        ADO_His_YSDH.FieldByName('F_sYSYQ').AsString        := FieldByName('F_sYSYQ').AsString;
        ADO_His_YSDH.FieldByName('F_sBZ').AsString          := FieldByName('F_sBZ').AsString;
        ADO_His_YSDH.FieldByName('F_iBSTID').AsInteger      := FieldByName('F_iBSTID').AsInteger;
        ADO_His_YSDH.FieldByName('F_iBSTYS').AsInteger      := FieldByName('F_iBSTYS').AsInteger;
        ADO_His_YSDH.FieldByName('F_iBSTZS').AsInteger      := FieldByName('F_iBSTZS').AsInteger;
        ADO_His_YSDH.FieldByName('F_iGroupID').AsInteger    := FieldByName('F_iGroupID').AsInteger;
        ADO_His_YSDH.FieldByName('F_iWorkID').AsInteger     := iWorkID;
        ADO_His_YSDH.Post;
        Next;
      end;
    end;

    //修改制版数据
    with ADO_ZB do
    begin
      while not Eof do
      begin
        ADO_His_ZB.Insert;
        ADO_His_ZB.FieldByName('F_sJD').AsString         := FieldByName('F_sJD').AsString;
        ADO_His_ZB.FieldByName('F_sGB').AsString         := FieldByName('F_sGB').AsString;
        ADO_His_ZB.FieldByName('F_sTS').AsString         := FieldByName('F_sTS').AsString;
        ADO_His_ZB.FieldByName('F_sDY').AsString         := FieldByName('F_sDY').AsString;
        ADO_His_ZB.FieldByName('F_sPB').AsString         := FieldByName('F_sPB').AsString;
        ADO_His_ZB.FieldByName('F_sCP').AsString         := FieldByName('F_sCP').AsString;
        ADO_His_ZB.FieldByName('F_sSBLB').AsString       := FieldByName('F_sSBLB').AsString;
        ADO_His_ZB.FieldByName('F_sSBKS').AsString       := FieldByName('F_sSBKS').AsString;
        ADO_His_ZB.FieldByName('F_iSBK').AsInteger       := FieldByName('F_iSBK').AsInteger;
        ADO_His_ZB.FieldByName('F_sQT').AsString         := FieldByName('F_sQT').AsString;
        ADO_His_ZB.FieldByName('F_iGroupID').AsInteger   := FieldByName('F_iGroupID').AsInteger;
        ADO_His_ZB.FieldByName('F_iWorkID').AsInteger    := iWorkID;
        ADO_His_ZB.Post;
        iZBID := ADO_His_ZB.FieldByName('F_iID').AsInteger;
        //修改制版工序数据
        with ADO_ZBGX do
        begin
          First;
          while not Eof do
          begin
            if ADO_ZB.FieldByName('F_iGroupID').AsInteger = ADO_ZBGX.FieldByName('F_iGroupID').AsInteger then
            begin
              ADO_His_ZBGX.Insert;
              ADO_His_ZBGX.FieldByName('F_sCode').AsString            := FieldByName('F_sCode').AsString;
              ADO_His_ZBGX.FieldByName('F_sName').AsString            := FieldByName('F_sName').AsString;
              ADO_His_ZBGX.FieldByName('F_sCategorySpec').AsString    := FieldByName('F_sCategorySpec').AsString;
              ADO_His_ZBGX.FieldByName('F_sOutput').AsString          := FieldByName('F_sOutput').AsString;
              ADO_His_ZBGX.FieldByName('F_sUnit').AsString            := FieldByName('F_sUnit').AsString;
              ADO_His_ZBGX.FieldByName('F_sRemarks').AsString         := FieldByName('F_sRemarks').AsString;
              ADO_His_ZBGX.FieldByName('F_iMkProcID').AsInteger       := iZBID;
              ADO_His_ZBGX.FieldByName('F_iGroupID').AsInteger        := FieldByName('F_iGroupID').AsInteger;
              ADO_His_ZBGX.FieldByName('F_iWorkID').AsInteger         := iWorkID;
              ADO_His_ZBGX.Post;
            end;
            Next;
          end;
        end;
        Next;
      end;
    end;

    //修改版式图数据
    with ADO_BST do
    begin
      while not Eof do
      begin
        ADO_His_BST.Insert;
        ADO_His_BST.FieldByName('F_iRow').AsInteger       := FieldByName('F_iRow').AsInteger;
        ADO_His_BST.FieldByName('F_iCol').AsInteger       := FieldByName('F_iCol').AsInteger;
        ADO_His_BST.FieldByName('F_sBZ').AsString         := FieldByName('F_sBZ').AsString;
        ADO_His_BST.FieldByName('F_sCZR').AsString        := FieldByName('F_sCZR').AsString;
        ADO_His_BST.FieldByName('F_dCZRQ').AsDateTime     := FieldByName('F_dCZRQ').AsDateTime;
        ADO_His_BST.FieldByName('F_iGroupID').AsInteger   := FieldByName('F_iGroupID').AsInteger;
        ADO_His_BST.FieldByName('F_iWorkID').AsInteger    := iWorkID;
        ADO_His_BST.Post;
        iBSTID := ADO_His_BST.FieldByName('F_iID').AsInteger;
        //修改版式图明细数据
        with ADO_BSTPrint do
        begin
          First;
          while not Eof do
          begin
            if ADO_BST.FieldByName('F_iGroupID').AsInteger = ADO_BSTPrint.FieldByName('F_iGroupID').AsInteger then
            begin
              ADO_His_BSTPrint.Insert;
              ADO_His_BSTPrint.FieldByName('F_iRow').AsInteger            := FieldByName('F_iRow').AsInteger;
              ADO_His_BSTPrint.FieldByName('F_iCol').AsInteger            := FieldByName('F_iCol').AsInteger;
              ADO_His_BSTPrint.FieldByName('F_iApartID').AsInteger        := FieldByName('F_iApartID').AsInteger;
              ADO_His_BSTPrint.FieldByName('F_sCPBH').AsString            := FieldByName('F_sCPBH').AsString;
              ADO_His_BSTPrint.FieldByName('F_sBZ').AsString              := FieldByName('F_sBZ').AsString;
              ADO_His_BSTPrint.FieldByName('F_iBSTID').AsInteger          := iBSTID;
              ADO_His_BSTPrint.FieldByName('F_iGroupID').AsInteger        := FieldByName('F_iGroupID').AsInteger;
              ADO_His_BSTPrint.FieldByName('F_iWorkID').AsInteger         := iWorkID;
              ADO_His_BSTPrint.Post;                                                                                  
            end;
            Next;                                                                                                    
          end;
        end;
        Next;
      end;
    end;


    //DM_DataBase.Con_YDPrint.CommitTrans;
    Result := True;
  except
    on E: Exception do
    begin
      DM_DataBase.Con_YDPrint.RollbackTrans;
      p_MessageBoxDlg('添加历史记录错误：'+e.Message);
    end;
  end;
  ADO_Order.Free;
  ADO_CL.Free;
  ADO_YSDH.Free;
  ADO_ZB.Free;
  ADO_ZBGX.Free;
  ADO_His_Order.Free;
  ADO_His_CL.Free;
  ADO_His_YSDH.Free;
  ADO_His_ZB.Free;
  ADO_His_ZBGX.Free;
end;

function TFrm_WorkOrder.f_MakeAllow: Boolean;
var
  i: Integer;
  ADO_Rec: TADOQuery;
  sSqlData: string;
  iAllowID, iAllowCode: Integer;
begin
  if vActionType = c_WorkOrder_Select then
  begin
    rb_jd_no.Enabled := False;
    rb_jd_yes.Enabled := False;

  end;
{  if vWorkID > 0 then
  begin
    rb_jd_no.Enabled := False;
    rb_jd_yes.Enabled := False;
    sSqlData := 'select F_sKDR from DO_WorkOrder where F_iID = %d ';
    ADO_Rec := DM_DataBase.OpenQuery(sSqlData,[vWorkID]);
    if Assigned(ADO_Rec) and (ADO_Rec.RecordCount>0) then
    begin
      if LoginData.m_sUserName = ADO_Rec.FieldByName('F_sKDR').AsString then
      begin
        rb_jd_no.Enabled := True;
        rb_jd_yes.Enabled := True;
      end;
    end;
  end; }
  if LoginData.m_iAllowCode >= 0 then
  begin
    iAllowCode := LoginData.m_iAllowCode;
    sSqlData := 'Select F_iID,F_sCode from Set_AllowInfo where F_tiStatus = 1 and F_sCode in (''%s'',''%s'',''%s'') order by F_iID';
    ADO_Rec := DM_DataBase.OpenQuery(sSqlData,[c_Allow_CZMBSJ,c_Allow_WorkOrder_SQXG,c_Allow_WorkOrder_CX],False);
    if Assigned(ADO_Rec) and (ADO_Rec.RecordCount > 0) then
    begin
      while not ADO_Rec.Eof do
      begin
        if ADO_Rec.FieldByName('F_sCode').AsString = c_Allow_CZMBSJ then
        begin
          iAllowID := ADO_Rec.FieldByName('F_iID').AsInteger;
          if 1 shl iAllowID or iAllowCode = iAllowCode then
          begin
            btn_mbsj.Enabled := True;
            btn_mbsj.Tag := c_Tag_MakeAllow;
          end else
          begin
            btn_mbsj.Enabled := False;
            btn_mbsj.Tag := 0;
          end;
        end else
        if ADO_Rec.FieldByName('F_sCode').AsString = c_Allow_WorkOrder_SQXG then
        begin
          iAllowID := ADO_Rec.FieldByName('F_iID').AsInteger;
          if 1 shl iAllowID or iAllowCode = iAllowCode then
          begin
            g_bSCXG := True;
          end else
          begin
            g_bSCXG := False;
          end;
        end else
        if (ADO_Rec.FieldByName('F_sCode').AsString = c_Allow_WorkOrder_CX) and (btn_cx.Enabled) then
        begin
          iAllowID := ADO_Rec.FieldByName('F_iID').AsInteger;
          if 1 shl iAllowID or iAllowCode = iAllowCode then
          begin
            btn_cx.Enabled := True;
            btn_cx.Tag := c_Tag_MakeAllow;
          end else
          begin
            btn_cx.Enabled := False;
            btn_cx.Tag := 0;
          end;
        end;
        ADO_Rec.Next;
      end;
    end;
    if Assigned(ADO_Rec) then
      ADO_Rec.Free;
  end;
end;

procedure TFrm_WorkOrder.dbg_gdxxBSTEditButtonClick_old(Sender: TObject;
  var Handled: Boolean);
var
  AOD_Rec: TADOQuery;
  iBSTID: integer;
  sSqlData: string;
  i, n, iBSTZS, iBSTYS: integer;
  sGDH, sCplx, sYztmc: string;
  bInsert: Boolean;
begin
  iBSTZS := ADO_WorkOrder.FieldByName('BSTZS').AsInteger;
  iBSTYS := ADO_WorkOrder.FieldByName('BSTYS').AsInteger;
  iBSTID := 0;
  for i := 0 to Length(aYSDH) -1 do
  begin
    if aYSDH[i].m_iGroupID = ADO_WorkOrder.RecNo then
      iBSTID := iif(aYSDH[i].m_iBSTID > 0,aYSDH[i].m_iBSTID, 0);
  end;
  vBSTID := iBSTID;
  sGDH := edt_gdh.Text;
  if Length(OrderData) > 0 then
  begin
    sSqlData := 'Select b.F_sCplx,a.F_sYZTMC from DO_OrderApart a,Set_PostageType b where a.F_sYZTMC like b.F_sYZTMC +''%%'' and a.F_iID=%d ';
    AOD_Rec := DM_DataBase.OpenQuery(sSqlData,[OrderData[0].m_iApartID]);
    if AOD_Rec.RecordCount >0 then
    begin
      sCplx := AOD_Rec.FieldByName('F_sCplx').AsString;
      sYztmc := AOD_Rec.FieldByName('F_sYZTMC').AsString;
    end;
    AOD_Rec.Free;
  end;
  if (iBSTZS = 0) and (iBSTID=0) then
  begin
{    Frm_HBST := TFrm_HBST.Create(Self);
    Frm_HBST.ShowModal;
    Frm_HBST.Free;  }
//    vActionType := 1;
    Frm_BSTPrint := TFrm_BSTPrint.Create(Self);
    Frm_BSTPrint.vCplx := sCplx;
    Frm_BSTPrint.vYztmc := sYztmc;
    Frm_BSTPrint.vBSTZS := iBSTZS;
    Frm_BSTPrint.vBSTYS := iBSTYS;
    Frm_BSTPrint.vGDH := sGDH;
    Frm_BSTPrint.ShowModal;
    vBSTID := Frm_BSTPrint.vBSTID;
    n := -1;
    for i := 0 to Length(aYSDH) -1 do
    begin
      if aYSDH[i].m_iGroupID = ADO_WorkOrder.RecNo then
      begin
        n := i;
        Break;
      end;
    end;
    if n = -1 then
    begin
      SetLength(aYSDH,Length(aYSDH)+1);
      n := Length(aYSDH)-1;
      aYSDH[n].m_iGroupID := ADO_WorkOrder.RecNo;
    end;
    aYSDH[n].m_iBSTID := vBSTID;
    aYSDH[n].m_iBSTZS := Frm_BSTPrint.vBSTZS;
    ADO_WorkOrder.Edit;
    ADO_WorkOrder.FieldByName('BSTZS').AsInteger := Frm_BSTPrint.vBSTZS;
    if iBSTYS = 0 then
    begin
      iBSTYS := GetBSTYS;
      if iBSTYS > 0 then
        ADO_WorkOrder.FieldByName('BSTYS').AsInteger := iBSTYS;
    end;
    ADO_WorkOrder.Post;
    Frm_BSTPrint.Free;

  end else
  if (iBSTZS > 0) or (iBSTID>0) then
  begin
    Frm_BSTPrint := TFrm_BSTPrint.Create(Self);
    Frm_BSTPrint.vCplx := sCplx;
    Frm_BSTPrint.vYztmc := sYztmc;
    Frm_BSTPrint.vBSTZS := iBSTZS;
    Frm_BSTPrint.vBSTYS := iBSTYS;
    Frm_BSTPrint.vGDH := sGDH;
    if iBSTID = -1 then
      iBSTID := ADO_WorkOrder.FieldByName('BSTID').AsInteger;
    try
      AOD_Rec := TADOQuery.Create(Self);
      DM_DataBase.GetTableData(AOD_Rec,'DO_WorkOrderMKPic','F_iID='+IntToStr(iBSTID));
      if AOD_Rec.RecordCount >0 then
      begin
        Frm_BSTPrint.vRow := AOD_Rec.FieldByName('F_iRow').AsInteger;
        Frm_BSTPrint.vCol := AOD_Rec.FieldByName('F_iCol').AsInteger;
        Frm_BSTPrint.mmo_bz.Text := AOD_Rec.FieldByName('F_sBZ').AsString;
        vBSTID := iBSTID;
      end;
      while Frm_BSTPrint.ShowModal = mrNo do
      begin
        Frm_BSTPrint.Free;
        Frm_BSTPrint := TFrm_BSTPrint.Create(Self);
        Frm_BSTPrint.vCplx := sCplx;
        Frm_BSTPrint.vYztmc := sYztmc;
        Frm_BSTPrint.vBSTZS := 0;
        Frm_BSTPrint.vBSTYS := iBSTYS;
        Frm_BSTPrint.vGDH := sGDH;
        Frm_HBST := TFrm_HBST.Create(Self);
        Frm_HBST.ShowModal;
        //if Frm_HBST.ShowModal <> mrOk then
        if not Frm_HBST.vSucceed then
        begin
          Frm_HBST.Free;
          Break;
        end;
        Frm_HBST.Free;
      end;
      vBSTID := Frm_BSTPrint.vBSTID;
      n := -1;
      for i := 0 to Length(aYSDH) -1 do
      begin
        if aYSDH[i].m_iGroupID = ADO_WorkOrder.RecNo then
        begin
          n := i;
          Break;
        end;
      end;
      if n = -1 then
      begin
        SetLength(aYSDH,Length(aYSDH)+1);
        n := Length(aYSDH)-1;
        aYSDH[n].m_iGroupID := ADO_WorkOrder.RecNo;
      end;
      aYSDH[n].m_iBSTID := vBSTID;
      aYSDH[n].m_iBSTZS := Frm_BSTPrint.vBSTZS;
      ADO_WorkOrder.Edit;
      ADO_WorkOrder.FieldByName('BSTZS').AsInteger := Frm_BSTPrint.vBSTZS;
      if iBSTYS = 0 then
      begin
        iBSTYS := GetBSTYS;
        if iBSTYS > 0 then
          ADO_WorkOrder.FieldByName('BSTYS').AsInteger := iBSTYS;
      end;
      ADO_WorkOrder.Post;
      Frm_BSTPrint.Free;
    finally
      AOD_Rec.Free;
    end;
  end;
end;

function TFrm_WorkOrder.p_LoadWorkOrderData: Boolean;
var
  ADO_Rec: TADOQuery;
  i, j, n, iOrderType, iID: Integer;
  sHint, sSczt, str: string;
  comp: TComponent;
  iBsts,iWorkID,iApartID, iGroupID, iXPL, iOrderID,iType: Integer;
  sGDH, sKHMC, sCPBH, sYZTMC, SBZ, sDW, sSL, sWJFSL, sZH, sRJHDQ, sRJHDZ: string;
  sJBRQ, sYWRQ, sZWRQ: string;
  bCXBZ: Boolean;
  iSYYL, iMax: integer;
  sSqlData: string;
  sTypeName: string;

begin
  Result := False;
  iID := vWorkID;
  iGroupID := vGroupID;
  bCXBZ := vbCXBZ;
  if bCXBZ then
    btn_cx.Caption := '恢复';
  if iID = 0 then Exit;
  try
    sSqlData := 'Select a.*,b.F_iSCZT SCZT,c.F_sTypeName from DO_WorkOrderPrtProc b,'
      + ' DO_WorkOrder a left join Set_ProductType c on a.F_iProductTypeID=c.F_iID '
      + ' where a.F_iID=%d and a.F_iID=b.F_iWorkID and b.F_iGroupID=%d ';
    ADO_Rec := DM_DataBase.OpenQuery(sSqlData,[iID,iGroupID],True);
    if ADO_Rec = nil then Exit;
    if ADO_Rec.RecordCount > 0 then
    begin
      with ADO_Rec do
      begin
        for i := 0 to Self.ComponentCount -1 do
        begin
          comp := Self.Components[i];
          if (comp is Ti_TxtFilter) or (comp is TComboBox) or (comp is TRzDateTimePicker) or (comp is TMemo) then
          begin
            sHint := TCustomControl(comp).Hint;
            if (Copy(sHint,1,2) = 'F_') then
            begin
              if comp is TRzDateTimePicker then
                TRzDateTimePicker(comp).DateTime := FieldByName(sHint).AsDateTime
              else
                TEdit(comp).Text := FieldByName(sHint).AsString;
            end;
          end;
        end;
        case FieldByName('F_tiJDBZ').AsInteger of
          0:
            begin
              rb_jd_no.Checked := True;
              rb_jd_yes.Checked := False;
            end;
          1:
            begin
              rb_jd_no.Checked := False;
              rb_jd_yes.Checked := True;
            end;
        end;
        //Frm_Print.vBSTID := FieldByName('F_iBSTID').AsInteger;
        sTypeName := FieldByName('F_sTypeName').AsString ;
        sGDH := FieldByName('F_sGDH').AsString;
        Self.Caption := '工单查询 -- '+sGDH+'('+ sTypeName + ')';
        case FieldByName('SCZT').AsInteger of
          0: sSczt:='制版';
          1: sSczt:='印刷';
          2: sSczt:='打号';
          3: sSczt:='后道加工';
          4: sSczt:='进仓';
          5,6: sSczt:='已进仓';
        end;
        gb_zt.Show;
        lab_sczt.Caption := '该工单目前生产进度： '+sSczt;
        ADO_Rec.Free;
      end;
      sSqlData := 'Select * from DO_ProductDate_Log where F_iWorkID=%d and F_iGroupID=%d';
      ADO_Rec := DM_DataBase.OpenQuery(sSqlData,[iID,iGroupID],True);
      if ADO_Rec = nil then Exit;
      if ADO_Rec.RecordCount >0 then
      begin
        sJBRQ := '';
        sYWRQ := '';
        sZWRQ := '';
        if ADO_Rec.FieldByName('F_dYZBRQ').AsDateTime > 0 then
          sJBRQ := FormatDateTime('yyyy-MM-dd',ADO_Rec.FieldByName('F_dYZBRQ').AsDateTime);
        if ADO_Rec.FieldByName('F_dYYSRQ').AsDateTime > 0 then
          sYWRQ := FormatDateTime('yyyy-MM-dd',ADO_Rec.FieldByName('F_dYYSRQ').AsDateTime);
        if ADO_Rec.FieldByName('F_dYZDRQ').AsDateTime > 0 then
          sZWRQ := FormatDateTime('yyyy-MM-dd',ADO_Rec.FieldByName('F_dYZDRQ').AsDateTime);
        if Trim(sJBRQ) <> '' then
        begin
          lab_jbrq.Visible := True;
          lab_jbrq.Caption := '交版日期：'+sJBRQ;
          lab_jbrq.Left := Frm_WorkOrder.lab_sczt.Left+ Frm_WorkOrder.lab_sczt.Width + 30;
        end;
        if Trim(sYWRQ) <> '' then
        begin
          lab_ywrq.Visible := True;
          lab_ywrq.Caption := '印完日期：'+sYWRQ;
          lab_ywrq.Left := Frm_WorkOrder.lab_jbrq.Left+ Frm_WorkOrder.lab_jbrq.Width + 30;
        end;
        if Trim(sZWRQ) <> '' then
        begin
          lab_zwrq.Visible := True;
          lab_zwrq.Caption := '装订日期：'+sZWRQ;
          lab_zwrq.Left := Frm_WorkOrder.lab_ywrq.Left+ Frm_WorkOrder.lab_ywrq.Width + 30;
        end;
      end;

      //读取订单信息到数组
      sSqlData := 'select a.*,SYYL=dbo.f_GetSYYL(F_iApartID),b.F_sYZTMC,XPL=(select F_tiXPL from DO_WorkOrder where F_iID = a.F_iWorkID),b.F_iOrderID '
        + ' from DO_WorkOrderDetails a,DO_OrderApart b where a.F_iApartID=b.F_iID and a.F_iWorkID=%d Order By a.F_iGroupID,a.F_iID ';
      ADO_Rec := DM_DataBase.OpenQuery(sSqlData,[iID],True);
      n := 1;
      iGroupID := 0;
      SetLength(OrderData,0);
      //iBsts := StrToNum(edt_bsts.Text);
      with ADO_Rec do
      begin
        while not Eof do
        begin
          sKHMC    := FieldByName('F_sKhmc').AsString;
          sCPBH    := FieldByName('F_sCpbh').AsString;
          sYZTMC   := FieldByName('F_sYZTMC').AsString;
          iXPL     := FieldByName('XPL').AsInteger;
          sBZ      := FieldByName('F_sBz').AsString;
          sDW      := FieldByName('F_sDw').AsString;
          sSL      := FieldByName('F_sSl').AsString;
          sWJFSL   := FieldByName('F_nWJCSL').AsString;
          sZH      := FieldByName('F_sZh').AsString;
          sRJHDQ   := FieldByName('F_sRJHDQ').AsString;
          sRJHDZ   := FieldByName('F_sRJHDZ').AsString;
          iSYYL    := FieldByName('SYYL').AsInteger;
          iApartID := FieldByName('F_iApartID').AsInteger;
          if iGroupID <> FieldByName('F_iGroupID').AsInteger then
            n := 1;
          iGroupID   := FieldByName('F_iGroupID').AsInteger;
          iOrderType := FieldByName('F_tiOrderType').AsInteger;
          iOrderID   :=  FieldByName('F_iOrderID').AsInteger;
          SetLength(OrderData,Length(OrderData)+1);
          OrderData[Length(OrderData)-1].m_iXH := n;
          OrderData[Length(OrderData)-1].m_sCPBH := sCPBH;
          OrderData[Length(OrderData)-1].m_sYztmc := sYZTMC;
          OrderData[Length(OrderData)-1].m_iXPL := iXPL;
          OrderData[Length(OrderData)-1].m_sKhmc := sKHMC;
          OrderData[Length(OrderData)-1].m_sSl := StrToNum(sSL);
          OrderData[Length(OrderData)-1].m_sWJFSL := StrToNum(sWJFSL);
          OrderData[Length(OrderData)-1].m_iBCYL := StrToNum(sSL)*10000;
          OrderData[Length(OrderData)-1].m_iSyyl := StrToNum(sSL)*10000+iSYYL;
          OrderData[Length(OrderData)-1].m_iApartID := iApartID;
          OrderData[Length(OrderData)-1].m_iType := iOrderType;
          OrderData[Length(OrderData)-1].m_iOrderID := iOrderID;
          OrderData[Length(OrderData)-1].m_sZH := sZH;
          OrderData[Length(OrderData)-1].m_sRJHDQ := sRJHDQ;
          OrderData[Length(OrderData)-1].m_sRJHDZ := sRJHDZ;
          OrderData[Length(OrderData)-1].m_sDw := StrToNum(sDW);
          OrderData[Length(OrderData)-1].m_sBZ := SBZ;
          OrderData[Length(OrderData)-1].m_iGroupID := iGroupID;
         { if iBsts =0 then
            OrderData[Length(OrderData)-1].m_iBSTS := 0
          else
            OrderData[Length(OrderData)-1].m_iBSTS := StrToNum(sl)*10000 div iBsts;  }
          //CreateFrame(khmc, cpbh,bz,dw,sl,zh,ApartID,n);
          ADO_Rec.Next;
          inc(n);
        end;
        //vWorkID := iID;
        //Frm_WorkOrder.lab_HBST.Caption := '打印版式图';
  //          Frm_Print.EnableCom(False);
        ADO_Rec.Free;
      end;

      //读取兑奖号码到数组
      sSqlData := 'select a.*,b.F_sCPBH from DO_WorkOrderDetGroupNum a,DO_WorkOrderDetails b where a.F_iDetailsID=b.F_iID and b.F_iWorkID = %d Order By b.F_iGroupID,b.F_iID';
      ADO_Rec := DM_DataBase.OpenQuery(sSqlData,[iID],True);
      SetLength(aRJHD,0);
      with ADO_Rec do
      begin
        while not ADO_Rec.Eof do
        begin
          SetLength(aRJHD,Length(aRJHD)+1);
          aRJHD[Length(aRJHD)-1].m_iID := FieldByName('F_iID').AsInteger;
          aRJHD[Length(aRJHD)-1].m_sCPBH := FieldByName('F_sCPBH').AsString;
          aRJHD[Length(aRJHD)-1].m_sZH := FieldByName('F_sZH').AsString;
          aRJHD[Length(aRJHD)-1].m_sRJHDQ := FieldByName('F_sRJHDQ').AsString;
          aRJHD[Length(aRJHD)-1].m_sRJHDZ := FieldByName('F_sRJHDZ').AsString;
          aRJHD[Length(aRJHD)-1].m_iApartID := FieldByName('F_iApartID').AsInteger;
          aRJHD[Length(aRJHD)-1].m_iDetailsID := FieldByName('F_iDetailsID').AsInteger;
          aRJHD[Length(aRJHD)-1].m_iGroupID := iGroupID;
          Next;
        end;
      end;
      ADO_Rec.Free;


      //读取材料信息到数组
      sSqlData := 'select * from DO_WorkOrderMatl where F_iWorkID = %d Order By F_iGroupID';
      ADO_Rec := DM_DataBase.OpenQuery(sSqlData,[iID],True);
      SetLength(aCL,0);
      with ADO_Rec do
      begin
        while not ADO_Rec.Eof do
        begin
          SetLength(aCL,Length(aCL)+1);
          aCL[Length(aCL)-1].m_iID := FieldByName('F_iID').AsInteger;
          aCL[Length(aCL)-1].m_sCLBH := FieldByName('F_sCLBH').AsString;
          aCL[Length(aCL)-1].m_sCLMC := FieldByName('F_sCLMC').AsString;
          aCL[Length(aCL)-1].m_sCLGG := FieldByName('F_sCLGG').AsString;
          aCL[Length(aCL)-1].m_sCJGG := FieldByName('F_sCJGG').AsString;
          aCL[Length(aCL)-1].m_sCJKS := FieldByName('F_sCJKS').AsString;
          aCL[Length(aCL)-1].m_iJFQS := FieldByName('F_iJFQS').AsInteger;
          aCL[Length(aCL)-1].m_iJFS := FieldByName('F_iJFS').AsInteger;
          aCL[Length(aCL)-1].m_sSL := FieldByName('F_sSL').AsString;
          aCL[Length(aCL)-1].m_sDW := FieldByName('F_sDW').AsString;
          aCL[Length(aCL)-1].m_sPCH := FieldByName('F_sPCH').AsString;
          aCL[Length(aCL)-1].m_iFlag := FieldByName('F_iFlag').AsInteger;
          aCL[Length(aCL)-1].m_iGroupID := FieldByName('F_iGroupID').AsInteger;
          Next;
        end;
      end;
      ADO_Rec.Free;
      //读取机台信息到数组
      sSqlData := 'select * from DO_WorkOrderPrtProc where F_iWorkID = %d Order By F_iGroupID';
      ADO_Rec := DM_DataBase.OpenQuery(sSqlData,[iID],True);
      SetLength(aYSDH,0);
      with ADO_Rec do
      begin
        while not ADO_Rec.Eof do
        begin
          SetLength(aYSDH,Length(aYSDH)+1);
          aYSDH[Length(aYSDH)-1].m_iID := FieldByName('F_iID').AsInteger;
          aYSDH[Length(aYSDH)-1].m_sGJMC := FieldByName('F_sGJMC').AsString;
          aYSDH[Length(aYSDH)-1].m_sJTMC := FieldByName('F_sJTMC').AsString;
          aYSDH[Length(aYSDH)-1].m_sJTBH := FieldByName('F_sJTBH').AsString;
          aYSDH[Length(aYSDH)-1].m_sSC := FieldByName('F_sSC').AsString;
          aYSDH[Length(aYSDH)-1].m_iSBS := FieldByName('F_iSBS').AsInteger;
          aYSDH[Length(aYSDH)-1].m_sSB := FieldByName('F_sSB').AsString;
          aYSDH[Length(aYSDH)-1].m_iYS := FieldByName('F_iYS').AsInteger;
          aYSDH[Length(aYSDH)-1].m_iYS_1 := FieldByName('F_iYS_1').AsInteger;
          aYSDH[Length(aYSDH)-1].m_iYS_2 := FieldByName('F_iYS_2').AsInteger;
          aYSDH[Length(aYSDH)-1].m_sYZLX := FieldByName('F_sYZLX').AsString;
          aYSDH[Length(aYSDH)-1].m_sQT := FieldByName('F_sQT').AsString;
          aYSDH[Length(aYSDH)-1].m_sYQGX := FieldByName('F_sYQGX').AsString;
          aYSDH[Length(aYSDH)-1].m_sYQGXSL := FieldByName('F_sYQGXSL').AsString;
          aYSDH[Length(aYSDH)-1].m_sYQGXDW := FieldByName('F_sYQGXDW').AsString;
          aYSDH[Length(aYSDH)-1].m_sYSYQ := FieldByName('F_sYSYQ').AsString;
          //aYSDH[Length(aYSDH)-1].m_sBZ := FieldByName('F_sBZ').AsString;
          aYSDH[Length(aYSDH)-1].m_iBSTID := FieldByName('F_iBSTID').AsInteger;
          aYSDH[Length(aYSDH)-1].m_iBSTYS := FieldByName('F_iBSTYS').AsInteger;
          aYSDH[Length(aYSDH)-1].m_iBSTZS := FieldByName('F_iBSTZS').AsInteger;
//          aYSDH[Length(aYSDH)-1].m_sJTCLBH := FieldByName('F_sJTCLBH').AsString;
//          aYSDH[Length(aYSDH)-1].m_sJTCLMC := FieldByName('F_sJTCLMC').AsString;
//          aYSDH[Length(aYSDH)-1].m_sJTCLGG := FieldByName('F_sJTCLGG').AsString;
//          aYSDH[Length(aYSDH)-1].m_sJTCLDW := FieldByName('F_sJTCLDW').AsString;
          aYSDH[Length(aYSDH)-1].m_iGroupID := FieldByName('F_iGroupID').AsInteger;
          Next;
        end;
      end;
      ADO_Rec.Free;
      //读取制版信息到数组
      sSqlData := 'select * from DO_WorkOrderMkProc where F_iWorkID = %d Order By F_iGroupID';
      ADO_Rec := DM_DataBase.OpenQuery(sSqlData,[iID],True);
      SetLength(aZB,0);
      with ADO_Rec do
      begin
        while not ADO_Rec.Eof do
        begin
          SetLength(aZB,Length(aZB)+1);
          aZB[Length(aZB)-1].m_iID := FieldByName('F_iID').AsInteger;
          aZB[Length(aZB)-1].m_sTS := FieldByName('F_sTS').AsString;
          aZB[Length(aZB)-1].m_sGB := FieldByName('F_sGB').AsString;
          aZB[Length(aZB)-1].m_sJD := FieldByName('F_sJD').AsString;
          aZB[Length(aZB)-1].m_sDY := FieldByName('F_sDY').AsString;
          aZB[Length(aZB)-1].m_sPB := FieldByName('F_sPB').AsString;
          aZB[Length(aZB)-1].m_sSBLB := FieldByName('F_sSBLB').AsString;
          aZB[Length(aZB)-1].m_sSBKS := FieldByName('F_sSBKS').AsString;
          aZB[Length(aZB)-1].m_iSBK := FieldByName('F_iSBK').AsInteger;
          aZB[Length(aZB)-1].m_sQT := FieldByName('F_sQT').AsString;
          aZB[Length(aZB)-1].m_iGroupID := FieldByName('F_iGroupID').AsInteger;
          Next;
        end;
      end;
      ADO_Rec.Free;

      //读取制版工序信息到数组
      sSqlData := 'select * from DO_WorkOrderMkProcDet where F_iWorkID = %d Order By F_iGroupID';
      ADO_Rec := DM_DataBase.OpenQuery(sSqlData,[iID],True);
      SetLength(aZBGX,0);
      with ADO_Rec do
      begin
        while not ADO_Rec.Eof do
        begin
          SetLength(aZBGX,Length(aZBGX)+1);
          aZBGX[Length(aZBGX)-1].m_iID := FieldByName('F_iID').AsInteger;
          aZBGX[Length(aZBGX)-1].m_sCode := FieldByName('F_sCode').AsString;
          aZBGX[Length(aZBGX)-1].m_sName := FieldByName('F_sName').AsString;
          aZBGX[Length(aZBGX)-1].m_sCategorySpec := FieldByName('F_sCategorySpec').AsString;
          aZBGX[Length(aZBGX)-1].m_sOutput := FieldByName('F_sOutput').AsString;
          aZBGX[Length(aZBGX)-1].m_sUnit := FieldByName('F_sUnit').AsString;
          aZBGX[Length(aZBGX)-1].m_sBZ := FieldByName('F_sRemarks').AsString;
          aZBGX[Length(aZBGX)-1].m_iMkProcID := FieldByName('F_iMkProcID').AsInteger;
          aZBGX[Length(aZBGX)-1].m_iGroupID := FieldByName('F_iGroupID').AsInteger;
          Next;
        end;
      end;
      ADO_Rec.Free;

      //读取版式图信息到数组
      sSqlData := 'select * from DO_WorkOrderMKPic where F_iWorkID = %d Order By F_iGroupID';
      ADO_Rec := DM_DataBase.OpenQuery(sSqlData,[iID],True);
      SetLength(aBST,0);
      with ADO_Rec do
      begin
        while not ADO_Rec.Eof do
        begin
          SetLength(aBST,Length(aBST)+1);
          aBST[Length(aBST)-1].m_iID := FieldByName('F_iID').AsInteger;
          aBST[Length(aBST)-1].m_iRow := FieldByName('F_iRow').AsInteger;
          aBST[Length(aBST)-1].m_iCol := FieldByName('F_iCol').AsInteger;
          aBST[Length(aBST)-1].m_sBZ := FieldByName('F_sBZ').AsString;
          aBST[Length(aBST)-1].m_iGroupID := FieldByName('F_iGroupID').AsInteger;
          Next;
        end;
      end;
      ADO_Rec.Free;

      //读取版式图明细信息到数组
      sSqlData := 'select * from DO_WorkOrderMKPicPrt where F_iWorkID = %d Order By F_iGroupID';
      ADO_Rec := DM_DataBase.OpenQuery(sSqlData,[iID],True);
      SetLength(aBSTPrint,0);
      with ADO_Rec do
      begin
        while not ADO_Rec.Eof do
        begin
          SetLength(aBSTPrint,Length(aBSTPrint)+1);
          aBSTPrint[Length(aBSTPrint)-1].m_iID := FieldByName('F_iID').AsInteger;
          aBSTPrint[Length(aBSTPrint)-1].m_iRow := FieldByName('F_iRow').AsInteger;
          aBSTPrint[Length(aBSTPrint)-1].m_iCol := FieldByName('F_iCol').AsInteger;
          aBSTPrint[Length(aBSTPrint)-1].m_iApartID := FieldByName('F_iApartID').AsInteger;
          aBSTPrint[Length(aBSTPrint)-1].m_sCPBH := FieldByName('F_sCPBH').AsString;
          aBSTPrint[Length(aBSTPrint)-1].m_sBZ := FieldByName('F_sBZ').AsString;
          aBSTPrint[Length(aBSTPrint)-1].m_iBSTID := FieldByName('F_iBSTID').AsInteger;
          aBSTPrint[Length(aBSTPrint)-1].m_iGroupID := FieldByName('F_iGroupID').AsInteger;
          Next;
        end;
      end;
      ADO_Rec.Free;

    end;

    with ADO_WorkOrder do
    begin
      try
        sSqlData := 'select cast('''' as varchar(500)) orders,cast('''' as varchar(500)) JTMC,cast(0 as int) BSTYS,cast(0 as int) BSTZS '
          +',cast('''' as varchar(500)) CL,cast('''' as varchar(500)) ZB into #s '
          +'select * from #s';
        Close;
        SQL.Text := sSqlData;
        Open;
      except
        sSqlData := 'Deleta from #s';
        Close;
        SQL.Text := sSqlData;
        Open;
      end;
      //取最大行数
      iMax := 0;
      for i := 0 to Length(OrderData) -1 do
      begin
        if iMax < OrderData[i].m_iGroupID then
          iMax := OrderData[i].m_iGroupID;
      end;
      for i := 0 to Length(aYSDH) -1 do
      begin
        if iMax < aYSDH[i].m_iGroupID then
          iMax := aYSDH[i].m_iGroupID;
      end;
      for i := 0 to Length(aCL) -1 do
      begin
        if iMax < aCL[i].m_iGroupID then
          iMax := aCL[i].m_iGroupID;
      end;
      for i := 0 to Length(aZB) -1 do
      begin
        if iMax < aZB[i].m_iGroupID then
          iMax := aZB[i].m_iGroupID;
      end;
      //添加数据
      First;
      for i := 0 to iMax -1 do
      begin
        sCPBH := '';
        for j := 0 to Length(OrderData) -1 do
        begin
          if OrderData[j].m_iGroupID = i+1 then
          begin
            sCPBH := sCPBH + OrderData[j].m_sCPBH + '; ';
          end;
        end;
        if not Eof then
          Edit
        else
          Insert;
        FieldByName('orders').AsString := sCPBH;
        Post;
        Next;
      end;
      First;
      while not Eof do
      begin
        for i := 0 to Length(aYSDH) -1 do
        begin
          if aYSDH[i].m_iGroupID = Frm_WorkOrder.ADO_WorkOrder.RecNo then
          begin
            Edit;
            FieldByName('JTMC').AsString := aYSDH[i].m_sJTMC;
            FieldByName('BSTYS').AsInteger := aYSDH[i].m_iBSTYS;
            FieldByName('BSTZS').AsInteger := aYSDH[i].m_iBSTZS;
            Post;
          end;
        end;
        Next;
      end;
      First;
      while not Eof do
      begin
        for i := 0 to Length(aCL) -1 do
        begin
          if aCL[i].m_iGroupID = Frm_WorkOrder.ADO_WorkOrder.RecNo then
          begin
            Edit;
            FieldByName('CL').AsString := aCL[i].m_sCLMC;
            Post;
          end;
        end;
        Next;
      end;
      First;
      while not Eof do
      begin
        {for i := 0 to Length(aZB) -1 do
        begin
          if aZB[i].m_iGroupID = Frm_WorkOrder.ADO_WorkOrder.RecNo then
          begin
            str := aZB[i].m_sSBLB + '版 ' + aZB[i].m_sSBKS + '开 ' + IntToStr(aZB[i].m_iSBK) + '块';
            Edit;
            FieldByName('ZB').AsString := str;
            Post;
          end;
        end;   }
        str := '';
        for i := 0 to Length(aZBGX) -1 do
        begin
          if aZBGX[i].m_iGroupID = Frm_WorkOrder.ADO_WorkOrder.RecNo then
            str := str + ';' + aZBGX[i].m_sName ;
        end;
        str := Copy(str,2,Length(str));
        Edit;
        FieldByName('ZB').AsString := str;
        Post;
        Next;
      end;


      Result := True;
    end;
  except
    on E:Exception do
    begin
      Screen.Cursor := crDefault;
      p_MessageBoxDlg('错误：'+e.Message);
    end;
  end;
end;

procedure TFrm_WorkOrder.btn_HistoryClick(Sender: TObject);
begin
  Frm_WorkOrder_History := TFrm_WorkOrder_History.Create(Self);
  Frm_WorkOrder_History.vWorkID := vWorkID;
  f_SaveArrWorkOrder;
  Frm_WorkOrder_History.ShowModal;
  f_LoadArrWorkOrder;
  Frm_WorkOrder_History.Free;
end;

function TFrm_WorkOrder.p_LoadHistoryWorkOrderData: Boolean;
var
  ADO_Rec: TADOQuery;
  i, j, n, iOrderType, iID: Integer;
  sHint, sSczt, str: string;
  comp: TComponent;
  iBsts,iWorkID,iApartID, iGroupID, iOrderID: Integer;
  sGDH, sKHMC, sCPBH, SBZ, sDW, sSL, sWJFSL, sZH, sRJHDQ, sRJHDZ, sYZTMC: string;
  sJBRQ, sYWRQ, sZWRQ: string;
  bCXBZ: Boolean;
  iSYYL, iMax, iXPL: integer;
  sSqlData: string;
  sTypeName: string;
  sCZRQ: string;

begin
  Result := False;
  iID := vWorkID;
  iGroupID := vGroupID;
  bCXBZ := vbCXBZ;
  if bCXBZ then
    btn_cx.Caption := '恢复';
  if iID = 0 then Exit;
  try
    sSqlData := 'Select a.*,b.F_iSCZT SCZT,c.F_sTypeName from DO_WorkOrderPrtProc b,'
      + ' History_WorkOrder a left join Set_ProductType c on a.F_iProductTypeID=c.F_iID '
      + ' where a.F_iID=%d and a.F_iRealWorkID=b.F_iWorkID and b.F_iGroupID=%d ';
    ADO_Rec := DM_DataBase.OpenQuery(sSqlData,[iID,iGroupID],True);
    if ADO_Rec = nil then Exit;
    if ADO_Rec.RecordCount > 0 then
    begin
      with ADO_Rec do
      begin
        for i := 0 to Self.ComponentCount -1 do
        begin
          comp := Self.Components[i];
          if (comp is Ti_TxtFilter) or (comp is TComboBox) or (comp is TRzDateTimePicker) or (comp is TMemo) then
          begin
            sHint := TCustomControl(comp).Hint;
            if (Copy(sHint,1,2) = 'F_') then
            begin
              if comp is TRzDateTimePicker then
                TRzDateTimePicker(comp).DateTime := FieldByName(sHint).AsDateTime
              else
                TEdit(comp).Text := FieldByName(sHint).AsString;
            end;
          end;
        end;
        case FieldByName('F_tiJDBZ').AsInteger of
          0:
            begin
              rb_jd_no.Checked := True;
              rb_jd_yes.Checked := False;
            end;
          1:
            begin
              rb_jd_no.Checked := False;
              rb_jd_yes.Checked := True;
            end;
        end;
        //Frm_Print.vBSTID := FieldByName('F_iBSTID').AsInteger;
        sTypeName := FieldByName('F_sTypeName').AsString ;
        sGDH := FieldByName('F_sGDH').AsString;
        if FieldByName('F_dXGRQ').AsDateTime > 0 then
          sCZRQ := FormatDateTime('yyyy-MM-dd hh:mm:ss',FieldByName('F_dXGRQ').AsDateTime)
        else
          sCZRQ := FormatDateTime('yyyy-MM-dd hh:mm:ss',FieldByName('F_dKDRQ').AsDateTime);
        Self.Caption := '历史工单查询 -- '+sGDH+'('+ sTypeName + ') '+sCZRQ;
        ADO_Rec.Free;
      end;

      //读取订单信息到数组
      sSqlData := 'select a.*,SYYL=dbo.f_GetHistorySYYL(F_iApartID),b.F_sYZTMC,XPL=(select F_tiXPL from History_WorkOrder where F_iID = a.F_iWorkID),b.F_iOrderID '
        + ' from History_WorkOrderDetails a,DO_OrderApart b where a.F_iApartID=b.F_iID and F_iWorkID=%d Order By a.F_iGroupID,a.F_iID';
      ADO_Rec := DM_DataBase.OpenQuery(sSqlData,[iID],True);
      n := 1;
      iGroupID := 1;
      SetLength(OrderData,0);
      //iBsts := StrToNum(edt_bsts.Text);
      with ADO_Rec do
      begin
        while not Eof do
        begin
          sKHMC    := FieldByName('F_sKhmc').AsString;
          sCPBH    := FieldByName('F_sCpbh').AsString;
          sYZTMC   := FieldByName('F_sYZTMC').AsString;
          iXPL     := FieldByName('XPL').AsInteger;
          SBZ      := FieldByName('F_sBz').AsString;
          sDW      := FieldByName('F_sDw').AsString;
          sSL      := FieldByName('F_sSl').AsString;
          sWJFSL   := FieldByName('F_nWJCSL').AsString;
          sZH      := FieldByName('F_sZh').AsString;
          sRJHDQ   := FieldByName('F_sRJHDQ').AsString;
          sRJHDZ   := FieldByName('F_sRJHDZ').AsString;
          iSYYL    := FieldByName('SYYL').AsInteger;
          iApartID := FieldByName('F_iApartID').AsInteger;
          if iGroupID <> FieldByName('F_iGroupID').AsInteger then
            n := 1;
          iGroupID   := FieldByName('F_iGroupID').AsInteger;
          iOrderType := FieldByName('F_tiOrderType').AsInteger;
          iOrderID   := FieldByName('F_iOrderID').AsInteger;
          SetLength(OrderData,Length(OrderData)+1);

          OrderData[Length(OrderData)-1].m_iXH := n;
          OrderData[Length(OrderData)-1].m_sCPBH := sCPBH;
          OrderData[Length(OrderData)-1].m_sYztmc := sYZTMC;
          OrderData[Length(OrderData)-1].m_iXPL := iXPL;
          OrderData[Length(OrderData)-1].m_sKhmc := sKHMC;
          OrderData[Length(OrderData)-1].m_sSl := StrToNum(sSL);
          OrderData[Length(OrderData)-1].m_sWJFSL := StrToNum(sWJFSL);
          OrderData[Length(OrderData)-1].m_iBCYL := StrToNum(sSL)*10000;
          OrderData[Length(OrderData)-1].m_iSyyl := StrToNum(sSL)*10000+iSYYL;
          OrderData[Length(OrderData)-1].m_iApartID := iApartID;
          OrderData[Length(OrderData)-1].m_iType := iOrderType;
          OrderData[Length(OrderData)-1].m_iOrderID := iOrderID;
          OrderData[Length(OrderData)-1].m_sZH := sZH;
          OrderData[Length(OrderData)-1].m_sRJHDQ := sRJHDQ;
          OrderData[Length(OrderData)-1].m_sRJHDZ := sRJHDZ;
          OrderData[Length(OrderData)-1].m_sDw := StrToNum(sDW);
          OrderData[Length(OrderData)-1].m_sBZ := SBZ;
          OrderData[Length(OrderData)-1].m_iGroupID := iGroupID;
         { if iBsts =0 then
            OrderData[Length(OrderData)-1].m_iBSTS := 0
          else
            OrderData[Length(OrderData)-1].m_iBSTS := StrToNum(sl)*10000 div iBsts;  }
          //CreateFrame(khmc, cpbh,bz,dw,sl,zh,ApartID,n);
          ADO_Rec.Next;
          inc(n);
        end;
        vWorkID := iID;
        //Frm_WorkOrder.lab_HBST.Caption := '打印版式图';
  //          Frm_Print.EnableCom(False);
        ADO_Rec.Free;
      end;

      //读取兑奖号码到数组
      sSqlData := 'select a.*,b.F_sCPBH from History_WorkOrderDetGroupNum a,History_WorkOrderDetails b where a.F_iDetailsID=b.F_iID and b.F_iWorkID = %d Order By b.F_iGroupID,b.F_iID';
      ADO_Rec := DM_DataBase.OpenQuery(sSqlData,[iID],True);
      SetLength(aBSTPrint,0);
      with ADO_Rec do
      begin
        while not ADO_Rec.Eof do
        begin
          SetLength(aRJHD,Length(aRJHD)+1);
          aRJHD[Length(aRJHD)-1].m_iID := FieldByName('F_iID').AsInteger;
          aRJHD[Length(aRJHD)-1].m_sCPBH := FieldByName('F_sCPBH').AsString;
          aRJHD[Length(aRJHD)-1].m_sZH := FieldByName('F_sZH').AsString;
          aRJHD[Length(aRJHD)-1].m_sRJHDQ := FieldByName('F_sRJHDQ').AsString;
          aRJHD[Length(aRJHD)-1].m_sRJHDZ := FieldByName('F_sRJHDZ').AsString;
          aRJHD[Length(aRJHD)-1].m_iApartID := FieldByName('F_iApartID').AsInteger;
          aRJHD[Length(aRJHD)-1].m_iDetailsID := FieldByName('F_iDetailsID').AsInteger;
          aRJHD[Length(aRJHD)-1].m_iGroupID := iGroupID;
          Next;
        end;
      end;
      ADO_Rec.Free;

      //读取材料信息到数组
      sSqlData := 'select * from History_WorkOrderMatl where F_iWorkID = %d Order By F_iGroupID';
      ADO_Rec := DM_DataBase.OpenQuery(sSqlData,[iID],True);
      SetLength(aCL,0);
      with ADO_Rec do
      begin
        while not ADO_Rec.Eof do
        begin
          SetLength(aCL,Length(aCL)+1);
          aCL[Length(aCL)-1].m_iID      := FieldByName('F_iID').AsInteger;
          aCL[Length(aCL)-1].m_sCLBH    := FieldByName('F_sCLBH').AsString;
          aCL[Length(aCL)-1].m_sCLMC    := FieldByName('F_sCLMC').AsString;
          aCL[Length(aCL)-1].m_sCLGG    := FieldByName('F_sCLGG').AsString;
          aCL[Length(aCL)-1].m_sCJGG    := FieldByName('F_sCJGG').AsString;
          aCL[Length(aCL)-1].m_sCJKS    := FieldByName('F_sCJKS').AsString;
          aCL[Length(aCL)-1].m_iJFQS    := FieldByName('F_iJFQS').AsInteger;
          aCL[Length(aCL)-1].m_iJFS     := FieldByName('F_iJFS').AsInteger;
          aCL[Length(aCL)-1].m_sSL      := FieldByName('F_sSL').AsString;
          aCL[Length(aCL)-1].m_sDW      := FieldByName('F_sDW').AsString;
          aCL[Length(aCL)-1].m_sPCH     := FieldByName('F_sPCH').AsString;
          aCL[Length(aCL)-1].m_iFlag    := FieldByName('F_iFlag').AsInteger;
          aCL[Length(aCL)-1].m_iGroupID := FieldByName('F_iGroupID').AsInteger;
          Next;
        end;
      end;
      ADO_Rec.Free;
      //读取机台信息到数组
      sSqlData := 'select * from History_WorkOrderPrtProc where F_iWorkID = %d Order By F_iGroupID';
      ADO_Rec := DM_DataBase.OpenQuery(sSqlData,[iID],True);
      SetLength(aYSDH,0);
      with ADO_Rec do
      begin
        while not ADO_Rec.Eof do
        begin
          SetLength(aYSDH,Length(aYSDH)+1);
          aYSDH[Length(aYSDH)-1].m_iID := FieldByName('F_iID').AsInteger;
          aYSDH[Length(aYSDH)-1].m_sGJMC := FieldByName('F_sGJMC').AsString;
          aYSDH[Length(aYSDH)-1].m_sJTMC := FieldByName('F_sJTMC').AsString;
          aYSDH[Length(aYSDH)-1].m_sJTBH := FieldByName('F_sJTBH').AsString;
          aYSDH[Length(aYSDH)-1].m_sSC := FieldByName('F_sSC').AsString;
          aYSDH[Length(aYSDH)-1].m_iSBS := FieldByName('F_iSBS').AsInteger;
          aYSDH[Length(aYSDH)-1].m_sSB := FieldByName('F_sSB').AsString;
          aYSDH[Length(aYSDH)-1].m_iYS := FieldByName('F_iYS').AsInteger;
          aYSDH[Length(aYSDH)-1].m_iYS_1 := FieldByName('F_iYS_1').AsInteger;
          aYSDH[Length(aYSDH)-1].m_iYS_2 := FieldByName('F_iYS_2').AsInteger;
          aYSDH[Length(aYSDH)-1].m_sYZLX := FieldByName('F_sYZLX').AsString;
          aYSDH[Length(aYSDH)-1].m_sQT := FieldByName('F_sQT').AsString;
          aYSDH[Length(aYSDH)-1].m_sYQGX := FieldByName('F_sYQGX').AsString;
          aYSDH[Length(aYSDH)-1].m_sYQGXSL := FieldByName('F_sYQGXSL').AsString;
          aYSDH[Length(aYSDH)-1].m_sYQGXDW := FieldByName('F_sYQGXDW').AsString;
          aYSDH[Length(aYSDH)-1].m_sYSYQ := FieldByName('F_sYSYQ').AsString;
          //aYSDH[Length(aYSDH)-1].m_sBZ := FieldByName('F_sBZ').AsString;
          aYSDH[Length(aYSDH)-1].m_iBSTID := FieldByName('F_iBSTID').AsInteger;
          aYSDH[Length(aYSDH)-1].m_iBSTYS := FieldByName('F_iBSTYS').AsInteger;
          aYSDH[Length(aYSDH)-1].m_iBSTZS := FieldByName('F_iBSTZS').AsInteger;
//          aYSDH[Length(aYSDH)-1].m_sJTCLBH := FieldByName('F_sJTCLBH').AsString;
//          aYSDH[Length(aYSDH)-1].m_sJTCLMC := FieldByName('F_sJTCLMC').AsString;
//          aYSDH[Length(aYSDH)-1].m_sJTCLGG := FieldByName('F_sJTCLGG').AsString;
//          aYSDH[Length(aYSDH)-1].m_sJTCLDW := FieldByName('F_sJTCLDW').AsString;
          aYSDH[Length(aYSDH)-1].m_iGroupID := FieldByName('F_iGroupID').AsInteger;
          Next;
        end;
      end;
      ADO_Rec.Free;
      //读取制版信息到数组
      sSqlData := 'select * from History_WorkOrderMkProc where F_iWorkID = %d Order By F_iGroupID';
      ADO_Rec := DM_DataBase.OpenQuery(sSqlData,[iID],True);
      SetLength(aZB,0);
      with ADO_Rec do
      begin
        while not ADO_Rec.Eof do
        begin
          SetLength(aZB,Length(aZB)+1);
          aZB[Length(aZB)-1].m_iID := FieldByName('F_iID').AsInteger;
          aZB[Length(aZB)-1].m_sTS := FieldByName('F_sTS').AsString;
          aZB[Length(aZB)-1].m_sGB := FieldByName('F_sGB').AsString;
          aZB[Length(aZB)-1].m_sJD := FieldByName('F_sJD').AsString;
          aZB[Length(aZB)-1].m_sDY := FieldByName('F_sDY').AsString;
          aZB[Length(aZB)-1].m_sPB := FieldByName('F_sPB').AsString;
          aZB[Length(aZB)-1].m_sSBLB := FieldByName('F_sSBLB').AsString;
          aZB[Length(aZB)-1].m_sSBKS := FieldByName('F_sSBKS').AsString;
          aZB[Length(aZB)-1].m_iSBK := FieldByName('F_iSBK').AsInteger;
          aZB[Length(aZB)-1].m_sQT := FieldByName('F_sQT').AsString;
          aZB[Length(aZB)-1].m_iGroupID := FieldByName('F_iGroupID').AsInteger;
          Next;
        end;
      end;
      ADO_Rec.Free;

      //读取制版工序信息到数组
      sSqlData := 'select * from History_WorkOrderMkProcDet where F_iWorkID = %d Order By F_iGroupID';
      ADO_Rec := DM_DataBase.OpenQuery(sSqlData,[iID],True);
      SetLength(aZBGX,0);
      with ADO_Rec do
      begin
        while not ADO_Rec.Eof do
        begin
          SetLength(aZBGX,Length(aZBGX)+1);
          aZBGX[Length(aZBGX)-1].m_iID := FieldByName('F_iID').AsInteger;
          aZBGX[Length(aZBGX)-1].m_sCode := FieldByName('F_sCode').AsString;
          aZBGX[Length(aZBGX)-1].m_sName := FieldByName('F_sName').AsString;
          aZBGX[Length(aZBGX)-1].m_sCategorySpec := FieldByName('F_sCategorySpec').AsString;
          aZBGX[Length(aZBGX)-1].m_sOutput := FieldByName('F_sOutput').AsString;
          aZBGX[Length(aZBGX)-1].m_sUnit := FieldByName('F_sUnit').AsString;
          aZBGX[Length(aZBGX)-1].m_sBZ := FieldByName('F_sRemarks').AsString;
          aZBGX[Length(aZBGX)-1].m_iMkProcID := FieldByName('F_iMkProcID').AsInteger;
          aZBGX[Length(aZBGX)-1].m_iGroupID := FieldByName('F_iGroupID').AsInteger;
          Next;
        end;
      end;
      ADO_Rec.Free;

      //读取版式图信息到数组
      sSqlData := 'select * from History_WorkOrderMKPic where F_iWorkID = %d Order By F_iGroupID';
      ADO_Rec := DM_DataBase.OpenQuery(sSqlData,[iID],True);
      SetLength(aBST,0);
      with ADO_Rec do
      begin
        while not ADO_Rec.Eof do
        begin
          SetLength(aBST,Length(aBST)+1);
          aBST[Length(aBST)-1].m_iID := FieldByName('F_iID').AsInteger;
          aBST[Length(aBST)-1].m_iRow := FieldByName('F_iRow').AsInteger;
          aBST[Length(aBST)-1].m_iCol := FieldByName('F_iCol').AsInteger;
          aBST[Length(aBST)-1].m_sBZ := FieldByName('F_sBZ').AsString;
          aBST[Length(aBST)-1].m_iGroupID := FieldByName('F_iGroupID').AsInteger;
          Next;
        end;
      end;
      ADO_Rec.Free;

      //读取版式图明细信息到数组
      sSqlData := 'select * from History_WorkOrderMKPicPrt where F_iWorkID = %d Order By F_iGroupID';
      ADO_Rec := DM_DataBase.OpenQuery(sSqlData,[iID],True);
      SetLength(aBSTPrint,0);
      with ADO_Rec do
      begin
        while not ADO_Rec.Eof do
        begin
          SetLength(aBSTPrint,Length(aBSTPrint)+1);
          aBSTPrint[Length(aBSTPrint)-1].m_iID := FieldByName('F_iID').AsInteger;
          aBSTPrint[Length(aBSTPrint)-1].m_iRow := FieldByName('F_iRow').AsInteger;
          aBSTPrint[Length(aBSTPrint)-1].m_iCol := FieldByName('F_iCol').AsInteger;
          aBSTPrint[Length(aBSTPrint)-1].m_iApartID := FieldByName('F_iApartID').AsInteger;
          aBSTPrint[Length(aBSTPrint)-1].m_sCPBH := FieldByName('F_sCPBH').AsString;
          aBSTPrint[Length(aBSTPrint)-1].m_sBZ := FieldByName('F_sBZ').AsString;
          aBSTPrint[Length(aBSTPrint)-1].m_iBSTID := FieldByName('F_iBSTID').AsInteger;
          aBSTPrint[Length(aBSTPrint)-1].m_iGroupID := FieldByName('F_iGroupID').AsInteger;
          Next;
        end;
      end;
      ADO_Rec.Free;

    end;

    with ADO_WorkOrder do
    begin
      try
        sSqlData := 'select cast('''' as varchar(500)) orders,cast('''' as varchar(500)) JTMC,cast(0 as int) BSTYS,cast(0 as int) BSTZS '
          +',cast('''' as varchar(500)) CL,cast('''' as varchar(500)) ZB into #History_s '
          +'select * from #History_s';
        Close;
        SQL.Text := sSqlData;
        Open;
      except
        sSqlData := 'Delete from #History_s';
        Close;
        SQL.Text := sSqlData;
        Open;

      end;
      //取最大行数
      iMax := 0;
      for i := 0 to Length(OrderData) -1 do
      begin
        if iMax < OrderData[i].m_iGroupID then
          iMax := OrderData[i].m_iGroupID;
      end;
      for i := 0 to Length(aYSDH) -1 do
      begin
        if iMax < aYSDH[i].m_iGroupID then
          iMax := aYSDH[i].m_iGroupID;
      end;
      for i := 0 to Length(aCL) -1 do
      begin
        if (iMax < aCL[i].m_iGroupID) and (aCL[i].m_iFlag=0) then
          iMax := aCL[i].m_iGroupID;
      end;
      for i := 0 to Length(aZB) -1 do
      begin
        if iMax < aZB[i].m_iGroupID then
          iMax := aZB[i].m_iGroupID;
      end;
      //添加数据
      First;
      sCPBH := '';
      for i := 0 to iMax -1 do
      begin
        for j := 0 to Length(OrderData) -1 do
        begin
          if OrderData[j].m_iGroupID = ADO_WorkOrder.RecNo then
          begin
            sCPBH := sCPBH + OrderData[j].m_sCPBH + '; ';
          end;
        end;
        if not Eof then
          Edit
        else
          Insert;
        FieldByName('orders').AsString := sCPBH;
        Post;
        Next;
      end;
      First;
      while not Eof do
      begin
        for i := 0 to Length(aYSDH) -1 do
        begin
          if aYSDH[i].m_iGroupID = ADO_WorkOrder.RecNo then
          begin
            Edit;
            FieldByName('JTMC').AsString := aYSDH[i].m_sJTMC;
            FieldByName('BSTYS').AsInteger := aYSDH[i].m_iBSTYS;
            FieldByName('BSTZS').AsInteger := aYSDH[i].m_iBSTZS;
            Post;
          end;
        end;
        Next;
      end;
      First;
      while not Eof do
      begin
        for i := 0 to Length(aCL) -1 do
        begin
          if (aCL[i].m_iGroupID = ADO_WorkOrder.RecNo) and (aCL[i].m_iFlag=0) then
          begin
            Edit;
            FieldByName('CL').AsString := aCL[i].m_sCLMC;
            Post;
          end;
        end;
        Next;
      end;
      First;
      while not Eof do
      begin
        {for i := 0 to Length(aZB) -1 do
        begin
          if aZB[i].m_iGroupID = Frm_WorkOrder.ADO_WorkOrder.RecNo then
          begin
            str := aZB[i].m_sSBLB + '版 ' + aZB[i].m_sSBKS + '开 ' + IntToStr(aZB[i].m_iSBK) + '块';
            Edit;
            FieldByName('ZB').AsString := str;
            Post;
          end;
        end;   }
        str := '';
        for i := 0 to Length(aZBGX) -1 do
        begin
          if aZBGX[i].m_iGroupID = ADO_WorkOrder.RecNo then
            str := str + ';' + aZBGX[i].m_sName ;
        end;
        str := Copy(str,2,Length(str));
        Edit;
        FieldByName('ZB').AsString := str;
        Post;
        Next;
      end;

      Result := True;
    end;
  except
    on E:Exception do
    begin
      Screen.Cursor := crDefault;
      p_MessageBoxDlg('错误：'+e.Message);
    end;
  end;
end;

procedure TFrm_WorkOrder.btn_History_dyClick(Sender: TObject);
var
  sSqlData: string;
begin
  with ADO_Details do
  begin
    Close;
    //sSqlData := 'Select * from History_WorkOrderDetails where F_iWorkID=%d order by F_iGroupID,F_iID';
    sSqlData := 'exec p_history_gddy_order %d';
    SQL.Text := Format(sSqlData,[vWorkID]) ;
    Open;
  end;
  with ADO_MkProcDet do
  begin
    Close;
    sSqlData := 'Select * from History_WorkOrderMkProcDet where F_iWorkID=%d order by F_iGroupID,F_iID';
    SQL.Text := Format(sSqlData,[vWorkID]) ;
    Open;
  end;
  with ADO_Matl do
  begin
    Close;
    sSqlData := 'Select F_sCLBH,F_sCLMC,F_sCLGG,F_sCJGG,F_sDW,Sum(F_iJFQS) F_iJFQS,Sum(F_iJFS) F_iJFS, '
      + ' Sum(F_iZZS) F_iZZS,Sum(convert(numeric(9,3),case when IsNull(F_sSL,''0'')=''0'' then ''0'' else F_sSL end)) F_sSL,F_iFlag '
      +' from History_WorkOrderMatl where F_iWorkID=%d group by F_sCLBH,F_sCLMC,F_sCLGG,F_sCJGG,F_sDW,F_iFlag order by F_iFlag desc';
    SQL.Text := Format(sSqlData,[vWorkID]) ;
    Open;
  end;
  with DM_DataBase.ADO_Print do
  begin
//    Close;
    //sSqlData := 'select *,CPLX=(select F_sTypeName from Set_ProductType where F_iID=a.F_iProductTypeID) from DO_WorkOrder a where a.F_iID=%d';
    sSqlData := 'exec p_history_gddy %d';
    SQL.Text := Format(sSqlData,[vWorkID]) ;
    Open;
  end;
  //rmr_Print.LoadFromFile(ExtractFilePath(Application.ExeName)+c_WorkOrder_PrintExeName);
  case OrderData[0].m_iXPL of
    1:
      begin
        rmr_XPLPrint.PrepareReport;
        rmr_XPLPrint.ShowReport;
      end;
  else
    rmr_Print.PrepareReport;
    rmr_Print.ShowReport;
  end;
end;

procedure TFrm_WorkOrder.CreateParams(var Params: TCreateParams);
begin
  inherited;
//  Params.WndParent :=   0 ;//就是桌面
end;

function TFrm_WorkOrder.f_SaveArrWorkOrder: Boolean;
var
  i: Integer;
begin
  Result := False;
  SetLength(OrderData_Bag,0);
  SetLength(OrderGroup_Bag,0);
  SetLength(aBST_Bag,0);
  SetLength(aBSTPrint_Bag,0);
  SetLength(aYSDH_Bag,0);
  SetLength(aCL_Bag,0);
  SetLength(aZB_Bag,0);
  SetLength(aZBGX_Bag,0);
  SetLength(aRJHD_Bag,0);

  SetLength(OrderData_Bag,Length(OrderData));
  for i := 0 to Length(OrderData) -1 do
  begin
    OrderData_Bag[i] := OrderData[i]
  end;
  SetLength(OrderGroup_Bag,Length(OrderGroup));
  for i := 0 to Length(OrderGroup) -1 do
  begin
    OrderGroup_Bag[i] := OrderGroup[i]
  end;
  SetLength(aBST_Bag,Length(aBST));
  for i := 0 to Length(aBST) -1 do
  begin
    aBST_Bag[i] := aBST[i]
  end;
  SetLength(aBSTPrint_Bag,Length(aBSTPrint));
  for i := 0 to Length(aBSTPrint) -1 do
  begin
    aBSTPrint_Bag[i] := aBSTPrint[i]
  end;
  SetLength(aYSDH_Bag,Length(aYSDH));
  for i := 0 to Length(aYSDH) -1 do
  begin
    aYSDH_Bag[i] := aYSDH[i]
  end;
  SetLength(aCL_Bag,Length(aCL));
  for i := 0 to Length(aCL) -1 do
  begin
    aCL_Bag[i] := aCL[i]
  end;
  SetLength(aZB_Bag,Length(aZB));
  for i := 0 to Length(aZB) -1 do
  begin
    aZB_Bag[i] := aZB[i]
  end;
  SetLength(aZBGX_Bag,Length(aZBGX));
  for i := 0 to Length(aZBGX) -1 do
  begin
    aZBGX_Bag[i] := aZBGX[i]
  end;
  SetLength(aRJHD_Bag,Length(aRJHD));
  for i := 0 to Length(aRJHD) -1 do
  begin
    aRJHD_Bag[i] := aRJHD[i]
  end;


  SetLength(OrderData,0);
  SetLength(OrderGroup,0);
  SetLength(aBST,0);
  SetLength(aBSTPrint,0);
  SetLength(aYSDH,0);
  SetLength(aCL,0);
  SetLength(aZB,0);
  SetLength(aZBGX,0);
  SetLength(aRJHD,0);

  Result := True;
end;

function TFrm_WorkOrder.f_LoadArrWorkOrder: Boolean;
var
  i: Integer;
begin
  Result := False;
  SetLength(OrderData,0);
  SetLength(OrderGroup,0);
  SetLength(aBST,0);
  SetLength(aBSTPrint,0);
  SetLength(aYSDH,0);
  SetLength(aCL,0);
  SetLength(aZB,0);
  SetLength(aZBGX,0);
  SetLength(aRJHD,0);

  SetLength(OrderData,Length(OrderData_Bag));
  for i := 0 to Length(OrderData_Bag) -1 do
  begin
    OrderData[i] := OrderData_Bag[i]
  end;
  SetLength(OrderGroup,Length(OrderGroup_Bag));
  for i := 0 to Length(OrderGroup_Bag) -1 do
  begin
    OrderGroup[i] := OrderGroup_Bag[i]
  end;
  SetLength(aBST,Length(aBST_Bag));
  for i := 0 to Length(aBST_Bag) -1 do
  begin
    aBST[i] := aBST_Bag[i]
  end;
  SetLength(aBSTPrint,Length(aBSTPrint_Bag)) ;
  for i := 0 to Length(aBSTPrint_Bag) -1 do
  begin
    aBSTPrint[i] := aBSTPrint_Bag[i]
  end;
  SetLength(aYSDH,Length(aYSDH_Bag));
  for i := 0 to Length(aYSDH_Bag) -1 do
  begin
    aYSDH[i] := aYSDH_Bag[i]
  end;
  SetLength(aCL,Length(aCL_Bag));
  for i := 0 to Length(aCL_Bag) -1 do
  begin
    aCL[i] := aCL_Bag[i]
  end;
  SetLength(aZB,Length(aZB_Bag));
  for i := 0 to Length(aZB_Bag) -1 do
  begin
    aZB[i] := aZB_Bag[i]
  end;
  SetLength(aZBGX,Length(aZBGX_Bag));
  for i := 0 to Length(aZBGX_Bag) -1 do
  begin
    aZBGX[i] := aZBGX_Bag[i]
  end;
  SetLength(aRJHD,Length(aRJHD_Bag));
  for i := 0 to Length(aRJHD_Bag) -1 do
  begin
    aRJHD[i] := aRJHD_Bag[i]
  end;

  SetLength(OrderData_Bag,0);
  SetLength(OrderGroup_Bag,0);
  SetLength(aBST_Bag,0);
  SetLength(aBSTPrint_Bag,0);
  SetLength(aYSDH_Bag,0);
  SetLength(aCL_Bag,0);
  SetLength(aZB_Bag,0);
  SetLength(aZBGX_Bag,0);
  SetLength(aRJHD_Bag,0);

  Result := True;

end;

procedure TFrm_WorkOrder.p_GetZDGY;
var
  sZd: string;
  i,n,iPos: integer;
begin
  sZd := mmo_zdyq.Text;
  CbParamAdd(cb_gyyq,'装订工艺');
  for i := 0 to cb_gyyq.Items.Count -1 do
  begin
    if Pos(cb_gyyq.Items.Strings[i],sZd) > 0 then
      cb_gyyq.Checked[i] := True;
  end;
end;

function TFrm_WorkOrder.GetBSTYS: Integer;
var
  i, iSBS, iSC, iZL, iCPKS, iBSTZS, iBSTYS: integer;
  sSC: string;
begin
  Result := 0;
  iBSTYS := ADO_WorkOrder.FieldByName('BSTYS').AsInteger;
  if iBSTYS > 0 then Exit;
  iZL := 0;
  for i := 0 to Length(OrderData) -1 do
  begin
    if OrderData[i].m_iGroupID = ADO_WorkOrder.RecNo then
      iZL := iZL + OrderData[i].m_iBCYL;
  end;

  iBSTZS := ADO_WorkOrder.FieldByName('BSTZS').AsInteger;

  if (iZL > 0) and (iBSTZS > 0)  then
  begin
    if iBSTZS > 0 then
      Result := iZL div iBSTZS;                 //本版共印=总量/每版成品数
    if Result > 0 then
    begin
      for i := 0 to Length(aYSDH) -1 do
      begin
        if aYSDH[i].m_iGroupID = ADO_WorkOrder.RecNo then
          aYSDH[i].m_iBSTYS := Result;
      end;
    end;
  end;
end;

procedure TFrm_WorkOrder.dbg_gdxxColumns1UpdateData(Sender: TObject;
  var Text: String; var Value: Variant; var UseText, Handled: Boolean);
var
  i: integer;
begin
  for i := 0 to Length(aYSDH) -1 do
  begin
    if aYSDH[i].m_iGroupID = ADO_WorkOrder.RecNo then
    begin
      aYSDH[i].m_iBSTZS := Value;
    end;
  end;
end;

procedure TFrm_WorkOrder.edt_qshmExit(Sender: TObject);
var
  str, sQSHM, sZZHM: string;
  len: integer;
begin
  str := Ti_TxtFilter(Sender).Text;
  if (Ti_TxtFilter(Sender).Name = 'edt_qshm') or (Ti_TxtFilter(Sender).Name = 'edt_zzhm') then
  begin
    if not IsNum(Ti_TxtFilter(Sender).Text) then
    begin
      p_MessageBoxDlg('错误:无效字符,请输入数字!');
      Ti_TxtFilter(Sender).SetFocus;
      Exit;
    end;
    //if Trim(str) <> '' then
    //  Ti_TxtFilter(Sender).Text := StrRight('00000000'+str,8);
  end;

  if (Ti_TxtFilter(Sender).Name = 'edt_qshm') and (Trim(str) <> '')
    and (Trim(edt_zzhm.Text) = '') and (IsNum(edt_zl.Text))  then
  begin
    sZZHM := StrToNum(str) + StrToNum(edt_zl.Text) -1;
    len := Length(str);
    if len < Length(sZZHM) then
      len := Length(sZZHM);
    edt_zzhm.Text := StrRight(StrRep('0',len)+sZZHM,len);
  end;
  EdtExit(Sender);
end;

procedure TFrm_WorkOrder.cb_gyyqMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  sZd,sTemp,sDzgy: string;
  aZdgy: array of string;
  i,n,iPos: integer;
  bGYYQ: Boolean;
  sGYYQ: string;
begin
  if cb_gyyq.ItemAtPos(Point(X,Y),True) < 0 then Exit;
  bGYYQ := cb_gyyq.Checked[cb_gyyq.ItemAtPos(Point(X,Y),True)];
  sGYYQ := cb_gyyq.Items.Strings[cb_gyyq.ItemAtPos(Point(X,Y),True)];
  sZd := mmo_zdyq.Text;
  if (not bGYYQ) and (sGYYQ <> '') then
  begin
    iPos := Pos('［'+sGYYQ,sZd);
    if iPos > 0 then
    begin
      sTemp := Copy(sZd,iPos,Length(sZd));
      if Copy(sTemp,Pos('］',sTemp)+2,2) = #13#10 then
        sZd := Copy(sZd,1,iPos-1) + Copy(sTemp,Pos('］',sTemp)+4,Length(sTemp))
      else
        sZd := Copy(sZd,1,iPos-1) + Copy(sTemp,Pos('］',sTemp)+2,Length(sTemp));
      mmo_zdyq.Text := sZd;
    end;
    Exit;
  end;
  n := 0;
  SetLength(aZdgy,n);
  for i := 0 to cb_gyyq.Items.Count -1 do
  begin
    if cb_gyyq.Checked[i] then
    begin
      Inc(n);
      SetLength(aZdgy,n);
      aZdgy[n-1] := cb_gyyq.Items.Strings[i];
    end;
  end;
  iPos := Pos('［',sZd);
  if iPos = 0 then
  begin
    if copy(mmo_zdyq.Text,Length(mmo_zdyq.Text)-1,2) <> #13#10 then
      mmo_zdyq.Text := mmo_zdyq.Text + #13#10;
    iPos := Length(mmo_zdyq.Text)+1;
  end;
  //mmo_zdyq.Text := Copy(mmo_zdyq.Text,1,iPos-1);
  sDzgy := '';
  for i := 0 to Length(aZdgy) -1 do
  begin
    //sDzgy := sDzgy + ' ,' + aZdgy[i];
    if Pos(aZdgy[i],sZd) = 0 then
    begin
      sDzgy := sDzgy + '［'+ StrLeft(aZdgy[i] + '                           ',26)+'］' ;
    end;
    //if (i+1) mod 3 = 0 then sDzgy := sDzgy + #13#10;
  end;
  //if (Length(aZdgy)-1) mod 3 = 0 then sDzgy := sDzgy + #13#10;
  //sDzgy := Copy(sDzgy,2,Length(sDzgy));
  if sDzgy <> '' then
    mmo_zdyq.Text := mmo_zdyq.Text + sDzgy + #13#10;
    //mmo_zdyq.Text := mmo_zdyq.Text + '［' + sDzgy + '］' + #13#10;
end;


end.


