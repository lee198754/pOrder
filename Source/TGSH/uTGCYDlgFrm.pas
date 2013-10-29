unit uTGCYDlgFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, RzRadChk, Grids, iGrid, RzButton,uBaseForm;

type
  TCYDDInfo = record
    m_iAPartID: Integer;
    m_iOrderID: Integer;
    m_tiOrderType: Integer;
    m_sCPBH: string;
    m_nYL: Double;
    m_sYztmc: string;
    m_sTSGY: string;
    m_iXGR_TSGY: Integer;
    m_iCZR: Integer;
    m_sCXRQ: string;
    m_tiNJBZ: Integer;
    m_iFlag: Integer;

  end;

  TTGCYDlgFrm = class(TFrmBase)
    lab_zyl: TLabel;
    Label2: TLabel;
    lab_cpbh: TLabel;
    btn_Ok: TRzButton;
    RzButton1: TRzButton;
    edt_czyl: TEdit;
    edt_czcpbh: TEdit;
    stg_DDInfo: Ti_StgEdit;
    Bevel1: TBevel;
    lab_yyl: TLabel;
    procedure FormShow(Sender: TObject);
    procedure stg_DDInfoLinkClick(Sender: TObject; ACol, ARow: Integer);
    procedure btn_OkClick(Sender: TObject);
  private
    { Private declarations }
    procedure p_WriteStgDDInfo;
  public
    { Public declarations }
    aCYDDInfo:array of TCYDDInfo;
  end;

var
  TGCYDlgFrm: TTGCYDlgFrm;

implementation

{$R *.dfm}

uses
  PubStr;

const
  c_cpbh    = 0;
  c_yztmc   = 1;
  c_yl      = 2;
  c_cz      = 3;
  c_ApartID = 4;

procedure TTGCYDlgFrm.FormShow(Sender: TObject);
begin
  stg_DDInfo.ColBuddy[c_cpbh]  := 'edt_czcpbh';
  stg_DDInfo.ColBuddy[c_yl]  := 'edt_czyl';
  p_WriteStgDDInfo;
end;

procedure TTGCYDlgFrm.p_WriteStgDDInfo;
var
  i: integer;
begin
  stg_DDInfo.RowCount := iif(Length(aCYDDInfo)>0,Length(aCYDDInfo)+1,2);
  stg_DDInfo.ColWidths[c_APartID] := 0;
  for i := 0 to Length(aCYDDInfo) -1 do
  begin
    stg_DDInfo.Cells[c_cpbh,i+1] := aCYDDInfo[i].m_sCPBH;
    stg_DDInfo.Cells[c_yl,i+1] := FloatToStr(aCYDDInfo[i].m_nYL);
    stg_DDInfo.Cells[c_yztmc,i+1] := aCYDDInfo[i].m_sYztmc;
    stg_DDInfo.cells[c_cz,i+1] := '删除';
    stg_DDInfo.CellsLink[c_cz,i+1] := '删除';
    stg_DDInfo.Cells[c_ApartID,i+1] := IntToStr(aCYDDInfo[i].m_iAPartID);
  end;
end;

procedure TTGCYDlgFrm.stg_DDInfoLinkClick(Sender: TObject; ACol,
  ARow: Integer);
var
  i,n,iNum: integer;
  sCpbh: string;
begin
  if ACol = c_cz then
  begin
    if Application.MessageBox(PChar('是否删除'+#13#10+'    产品编号：'+stg_DDInfo.cells[c_cpbh ,ARow]+#13#10+'    邮资图名称: '+stg_DDInfo.cells[c_yztmc ,ARow]+#13#10+'    印量: '+stg_DDInfo.cells[c_yl ,ARow]),'提示',MB_ICONINFORMATION+MB_YESNO)=IDYES then
    begin
      n := 1;
      for i := 0 to Length(aCYDDInfo) -1 do
      begin
        if aCYDDInfo[i].m_iAPartID = StrToNum(stg_DDInfo.cells[c_ApartID ,ARow]) then
        begin
          aCYDDInfo[i].m_iFlag := 1;
          Break;
        end;
      end;
      stg_DDInfo.DelRow(ARow);
    end;
  end;

end;

procedure TTGCYDlgFrm.btn_OkClick(Sender: TObject);
var
  i,j: Integer;
begin
  for j := 1 to stg_DDInfo.RowCount do
  begin
    for i := 0 to Length(aCYDDInfo) -1 do
    begin
      if aCYDDInfo[i].m_iAPartID = StrToNum(stg_DDInfo.cells[c_ApartID ,j]) then
      begin
        aCYDDInfo[i].m_nYL := StrToFloat(stg_DDInfo.cells[c_yl ,j]);
        Break;
      end;
    end;
  end;

end;

end.
