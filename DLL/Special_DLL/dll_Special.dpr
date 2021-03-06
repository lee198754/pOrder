library dll_Special;

{ Important note about DLL memory management: ShareMem must be the
  first unit in your library's USES clause AND your project's (select
  Project-View Source) USES clause if your DLL exports any procedures or
  functions that pass strings as parameters or function results. This
  applies to all strings passed to and from your DLL--even those that
  are nested in records and classes. ShareMem is the interface unit to
  the BORLNDMM.DLL shared memory manager, which must be deployed along
  with your DLL. To avoid using BORLNDMM.DLL, pass string information
  using PChar or ShortString parameters. }

uses
  SysUtils,
  Classes,
  Forms,
  Dialogs,
  Windows,
  uOrderRecoveryFrm in 'YCXDDQD\uOrderRecoveryFrm.pas' {Frm_OrderRecovery},
  uYCXDDQDFrm in 'YCXDDQD\uYCXDDQDFrm.pas' {Frm_YCXDDQD},
  uDM_DataBase in 'DataBase\uDM_DataBase.pas' {DM_DataBase: TDataModule},
  uBaseForm in 'Base\uBaseForm.pas',
  uPub_Text in 'Pub\uPub_Text.pas',
  uPub_Type in 'Pub\uPub_Type.pas',
  FileClientDll in 'Pub\FileClientDll.pas',
  U_FileMd5 in 'Pub\U_FileMd5.pas',
  uFrm_Select in 'Pub\uFrm_Select.pas' {Frm_Select},
  uFrm_SelectDlg in 'Pub\uFrm_SelectDlg.pas' {Frm_SelectDlg},
  NetDataDef in 'Pub\NetDataDef.pas',
  uPub_Func in 'Pub\uPub_Func.pas',
  InitSock in 'Pub\InitSock.pas',
  uDDMX_DZX in 'Pub\uDDMX_DZX.pas' {Frm_DDMX_DZX},
  uDDMX_XSX in 'Pub\uDDMX_XSX.pas' {Frm_DDMX_XSX},
  uFrm_Tsgy_modif in 'Pub\uFrm_Tsgy_modif.pas' {Frm_Tsgy_modif};

{$R *.res}

var
  ObjectList: TStrings;

procedure p_Special(qk: Integer; clc: ShortString;iParentWindow:Thandle; iHandle: Thandle); stdcall;
begin
  Application.Handle := iHandle;
  case qk of //12,45,75,76,77,99,202,213,304,306,961,962,9201, 20101..20200
    12: begin
        if not Assigned(Frm_YCXDDQD) then
        begin
          Frm_YCXDDQD := TFrm_YCXDDQD.Create(Application);
          ObjectList.AddObject('Frm_YCXDDQD',Frm_YCXDDQD);
        end;
        Frm_YCXDDQD.FraShow;
        Frm_YCXDDQD.Visible := True;
      end;
  end;
end;

procedure DLLEntryPoint(dwReason: DWord);
var
  i: integer;
begin
  case dwReason of
    DLL_PROCESS_ATTACH:
      begin
        ObjectList := TStringList.Create;
        Application.Initialize;
      end;
    DLL_PROCESS_DETACH:
      begin
        for i := 0 to ObjectList.Count -1 do
        begin
          ObjectList.Objects[i].Free;
        end;
        ObjectList.Free;
      end;
    DLL_THREAD_ATTACH: Messagebeep(0);
    DLL_THREAD_DETACH: Messagebeep(0);
  end;
end;

exports p_Special;

begin
  DLLProc := @DLLEntryPoint;
  DLLEntryPoint(DLL_PROCESS_ATTACH);

end.
 