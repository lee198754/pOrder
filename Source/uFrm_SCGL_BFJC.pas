unit uFrm_SCGL_BFJC;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, iGrid, ExtCtrls, RM_Dataset, RM_System,
  RM_Common, RM_Class, RM_GridReport, ADODB;

type
  TFrm_SCGL_BFJC = class(TForm)
    Bevel1: TBevel;
    btn_ok: TButton;
    btn_close: TButton;
    stg_BFJC: Ti_StgEdit;
    edt_Temp: TEdit;
    btn_Print: TButton;
    rmr_JC: TRMGridReport;
    rmdb_SCGL_JC: TRMDBDataSet;
    procedure FormShow(Sender: TObject);
    procedure btn_okClick(Sender: TObject);
    procedure btn_PrintClick(Sender: TObject);
  private
    { Private declarations }
    FIsPrint: Boolean;
    function IsCheck:Boolean;
    function GetIsJCPrint: Boolean;
  public
    { Public declarations }
    vSuccess: Boolean;
    vJTXXID: Integer;
    vWorkID: Integer;
  end;

var
  Frm_SCGL_BFJC: TFrm_SCGL_BFJC;

implementation

uses
  uPub_Text,PubStr, uDM_DataBase, uPub_Type, uPub_Func;

{$R *.dfm}



procedure TFrm_SCGL_BFJC.FormShow(Sender: TObject);
begin
  vSuccess := False;
  FIsPrint := GetIsJCPrint;
  stg_BFJC.ColBuddy[c_BFJC_BCJCYL] := 'edt_Temp';
  stg_BFJC.ColWidths[c_BFJC_DetailsID] := 0;
  stg_BFJC.ColWidths[c_BFJC_GDH] := 0;
  stg_BFJC.ColWidths[c_BFJC_KHMC] := 0;

end;

procedure TFrm_SCGL_BFJC.btn_okClick(Sender: TObject);
const
  c_HDJG = 4;
  c_JC   = 5;
var
  i, iBCJCYL, iDetailsID, iSCZT: Integer;
  sInsertSQL, sSqlData: string;
  sDetailsID,sScrqFieldName,sCzrFieldName: string;
begin
  vSuccess := False;
  if not FIsPrint then
  begin
    p_MessageBoxDlg('请先打印进仓单再进行确认!');
    Exit;
  end;
  if not IsCheck then Exit;
  sInsertSQL := '';
  sDetailsID := '';
  for i := 1 to stg_BFJC.RowCount -1 do
  begin
    iBCJCYL := StrToNum(stg_BFJC.Cells[c_BFJC_BCJCYL,i]);
    iDetailsID := StrToNum(stg_BFJC.Cells[c_BFJC_DetailsID,i]);
    if sInsertSQL = '' then
      sInsertSQL := Format(' Select %d,%d ',[iDetailsID,iBCJCYL])
    else
      sInsertSQL := sInsertSQL + Format(' union all Select %d,%d ',[iDetailsID,iBCJCYL]);
    if iBCJCYL = StrToNum(stg_BFJC.Cells[c_BFJC_WJCYL,i]) then
      sDetailsID := IntToStr(iDetailsID) +',' + sDetailsID;
  end;
  if sDetailsID <> '' then
  begin
    sDetailsID := Copy(sDetailsID,1,Length(sDetailsID)-1);
  end;

  DM_DataBase.Con_YDPrint.BeginTrans;

  try
    if sDetailsID <> ''  then
    begin
      iSCZT := c_HDJG;
      sScrqFieldName := 'F_dYZDRQ';
      sCzrFieldName := 'F_iYZDCZRID';
      sSqlData := ' Update DO_WorkOrderDetails set F_iSczt=%d,F_dCzrq=Getdate(),F_iCzrID=%d where F_iID in (%s)  ';
      sSqlData := sSqlData + ' Update DO_WorkOrderPrtProc set F_iSczt=%d,F_dCzrq=Getdate(),F_iCzrID=%d from DO_WorkOrderPrtProc a '
        +' where not exists(Select 1 from DO_WorkOrderDetails where F_iSczt<%d and F_iWorkID=a.F_iWorkID and F_iGroupID=a.F_iGroupID) '
        +' and F_iID = %d ';
      sSqlData := sSqlData+' Update DO_ProductDate_Log set %s=Getdate(),%s=%d  from DO_ProductDate_Log  a '
        +' ,DO_WorkOrderPrtProc b where a.F_iWorkID=b.F_iWorkID and a.F_iGroupID=b.F_iGroupID and a.F_iWorkID=b.F_iWorkID and b.F_iID = %d '
        +' and not exists(Select 1 from DO_WorkOrderDetails where F_iSczt<%d and F_iWorkID=a.F_iWorkID and F_iGroupID=a.F_iGroupID)';
      sSqlData := sSqlData + ' Update DO_WorkOrder set F_iSczt=%d,F_dCzrq=Getdate(),F_iCzrID=%d from DO_WorkOrder a where a.F_iID = %d '
        +' and not exists(Select 1 from DO_WorkOrderDetails where F_iSczt<%d and F_iWorkID=a.F_iID ) ';
      DM_DataBase.ExecQuery(sSqlData,[iSczt,LoginData.m_iUserID,sDetailsID
        ,iSczt,LoginData.m_iUserID,iSczt,vJTXXID
        ,sScrqFieldName,sCzrFieldName,LoginData.m_iUserID,vJTXXID,iSczt
        ,iSczt,LoginData.m_iUserID,vWorkID,iSczt],True);
    end;

    if sDetailsID <> '' then
    begin
      sSqlData := 'create table #ApartID (F_iApartID int ,F_iDetailsID int,F_iSL int) ';
      sSqlData := sSqlData + ' insert into #ApartID (F_iDetailsID,F_iSL) ' + sInsertSQL;
      DM_DataBase.ExecQuery(sSqlData,[],True);
      sSqlData := ' p_jcgl ''%s''';
      DM_DataBase.ExecQuery(sSqlData,[sDetailsID],True);
      
      //更新进仓打印标记并增加进仓数量
//      sSqlData := 'update DO_WorkOrderDetails set F_tiJCDY=1,F_iJCSL=F_iJCSL+b.F_iSL '
//        +' from DO_WorkOrderDetails a,#ApartID b '
//        +' where a.F_iID in (%s) and a.F_iID=b.F_iDetailsID ';
//      DM_DataBase.ExecQuery(sSqlData,[sDetailsID],True);

      sSqlData := 'drop table #ApartID';
      DM_DataBase.ExecQuery(sSqlData,[],True);
    end;

    if sDetailsID <> ''  then
    begin
      iSCZT := c_JC;
      sScrqFieldName := 'F_dYJCRQ';
      sCzrFieldName := 'F_iYJCCZRID';
      sSqlData := ' Update DO_WorkOrderDetails set F_iSczt=%d,F_dCzrq=Getdate(),F_iCzrID=%d where F_iID in (%s)  ';
      sSqlData := sSqlData + ' Update DO_WorkOrderPrtProc set F_iSczt=%d,F_dCzrq=Getdate(),F_iCzrID=%d from DO_WorkOrderPrtProc a '
        +' where not exists(Select 1 from DO_WorkOrderDetails where F_iSczt<%d and F_iWorkID=a.F_iWorkID and F_iGroupID=a.F_iGroupID) '
        +' and F_iID = %d ';
      sSqlData := sSqlData+' Update DO_ProductDate_Log set %s=Getdate(),%s=%d  from DO_ProductDate_Log  a '
        +' ,DO_WorkOrderPrtProc b where a.F_iWorkID=b.F_iWorkID and a.F_iGroupID=b.F_iGroupID and a.F_iWorkID=b.F_iWorkID and b.F_iID =%d '
        +' and not exists(Select 1 from DO_WorkOrderDetails where F_iSczt<%d and F_iWorkID=a.F_iWorkID and F_iGroupID=a.F_iGroupID)';
      sSqlData := sSqlData + ' Update DO_WorkOrder set F_iSczt=%d,F_dCzrq=Getdate(),F_iCzrID=%d from DO_WorkOrder a where a.F_iID = %d '
        +' and not exists(Select 1 from DO_WorkOrderDetails where F_iSczt<%d and F_iWorkID=a.F_iID ) ';
      DM_DataBase.ExecQuery(sSqlData,[iSczt,LoginData.m_iUserID,sDetailsID
        ,iSczt,LoginData.m_iUserID,iSczt,vJTXXID
        ,sScrqFieldName,sCzrFieldName,LoginData.m_iUserID,vJTXXID,iSczt
        ,iSczt,LoginData.m_iUserID,vWorkID,iSczt],True);

    end;
    DM_DataBase.Con_YDPrint.CommitTrans;
  except
    on E: Exception do
    begin
      DM_DataBase.Con_YDPrint.RollbackTrans;
      Application.MessageBox(PChar('失败:'+E.message),'提示',MB_ICONINFORMATION);
    end;
  end;

  vSuccess := True;
  Close;
end;

function TFrm_SCGL_BFJC.IsCheck: Boolean;
begin
  Result := False;

  Result := True;
end;

procedure TFrm_SCGL_BFJC.btn_PrintClick(Sender: TObject);
var
  i, iBCJCYL, iDetailsID, iSCZT: Integer;
  sInsertSQL,sSqlData: string;
  sDetailsID,sKHMC,sScrqFieldName,sCzrFieldName: string;
  ADO_Rec: TADOQuery;
begin
  if not IsCheck then Exit;
  sDetailsID := '';
  for i := 1 to stg_BFJC.RowCount -1 do
  begin
    iBCJCYL := StrToNum(stg_BFJC.Cells[c_BFJC_BCJCYL,i]);
    iDetailsID := StrToNum(stg_BFJC.Cells[c_BFJC_DetailsID,i]);
    sKHMC := stg_BFJC.Cells[c_BFJC_KHMC,i];
    if sInsertSQL = '' then
      sInsertSQL := Format(' Select %d,%d,''%s'' ',[iDetailsID,iBCJCYL,sKHMC])
    else
      sInsertSQL := sInsertSQL + Format(' union all Select %d,%d,''%s'' ',[iDetailsID,iBCJCYL,sKHMC]);
    if (iBCJCYL >0)and (iBCJCYL <= StrToNum(stg_BFJC.Cells[c_BFJC_WJCYL,i])) then
      sDetailsID := IntToStr(iDetailsID) +',' + sDetailsID;
  end;
  if sDetailsID <> '' then
  begin
    sDetailsID := Copy(sDetailsID,1,Length(sDetailsID)-1);
    sSqlData := 'create table #ApartID (F_iApartID int ,F_iDetailsID int,F_iSL int,F_sKHMC varchar(50)) ';
    sSqlData := sSqlData + ' insert into #ApartID (F_iDetailsID,F_iSL,F_sKHMC) ' + sInsertSQL;
    DM_DataBase.ExecQuery(sSqlData,[],True);
    sSqlData := 'SELECT a.F_sGDH GDH,left(b.F_sCPBH,17) CPBH, b.F_sKhmc KHMC, DW=''枚'', sum(b.F_sSL*10000) SL,sum(c.F_iSL) JCSL'
      +' FROM dbo.DO_WorkOrder a, dbo.DO_WorkOrderDetails b,#ApartID c WHERE a.F_iID=b.F_iWorkID AND b.F_iID =c.F_iDetailsID'
      +' Group by a.F_sGDH,b.F_sKhmc,left(b.F_sCPBH,17)';
    ADO_Rec := DM_DataBase.OpenQuery(sSqlData,[sDetailsID]);
    if Assigned(ADO_Rec) and (ADO_Rec.RecordCount > 0) then
    begin
      rmdb_SCGL_JC.DataSet := ADO_Rec;
      rmr_JC.PrepareReport;
      rmr_JC.ShowReport;
    end;
    if Assigned(ADO_Rec) then ADO_Rec.Free;

    sSqlData := 'drop table #ApartID';
    DM_DataBase.ExecQuery(sSqlData,[],True);
  end;
  FIsPrint := True;
end;

function TFrm_SCGL_BFJC.GetIsJCPrint: Boolean;
var
  i, iBCJCYL,iDetailsID: Integer;
  sDetailsID, sSqlData: string;
  ADO_Rec: TADOQuery;
begin
  Result := False;
 { for i := 1 to stg_BFJC.RowCount -1 do
  begin
    iBCJCYL := StrToNum(stg_BFJC.Cells[c_BFJC_BCJCYL,i]);
    iDetailsID := StrToNum(stg_BFJC.Cells[c_BFJC_DetailsID,i]);
    if iBCJCYL = StrToNum(stg_BFJC.Cells[c_BFJC_WJCYL,i]) then
      sDetailsID := IntToStr(iDetailsID) +',' + sDetailsID;
  end;
  if sDetailsID <> '' then
  begin
    sDetailsID := Copy(sDetailsID,1,Length(sDetailsID)-1);
    sSqlData := 'SELECT 1 from DO_WorkOrderDetails where F_iID in (%s) and F_tiJCDY=0';
    ADO_Rec := DM_DataBase.OpenQuery(sSqlData,[sDetailsID]);
    if Assigned(ADO_Rec) then
    begin
      if (ADO_Rec.RecordCount=0) then
        Result := True;
      ADO_Rec.Free;
    end;
  end;   }

end;

end.
