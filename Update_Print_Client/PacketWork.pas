{
相对路径是相对于“客户端的目录”
}

unit PacketWork;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ShellApi, IniFiles, ShLwApi;

function p_Work(nNewPort: integer = 0; sNewIP: string = ''): boolean;
procedure p_SetMainIni(sIniFileName: string;
  sSection: string = 'MsgServer'; sPortKey: string = 'Port'; sIPKey: string = 'IP';
  nNewPort: integer = 0; sNewIP: string = '');

procedure SearchFile(DestPath: String; NowList: TStringList);


var
  g_sFile: string;    // 更新后运行目标的程序文件名
  g_ClientPath: string;  // 客户端的目录
  g_FilePath: string;  //本程序目录
  g_sArr: TStringList;

implementation

{
复制文件改ini
}

function G_GetAbsolutePath(sPath, sFileName: string): string;
var
  Dest:array [0..MAX_PATH] of char;
begin
  FillChar(Dest, MAX_PATH + 1, 0);
  PathCombine(Dest, PChar(sPath), PChar(sFileName));
  Result := string(Dest);
end;

function p_Work(nNewPort: integer; sNewIP: string): boolean;
var
  sFileFrom, sFileTo, sIniFile, s, sPathFrom, sPathTo, sTmp: string;
  Ini: TIniFile;
  n: integer;
  ss, sd: string;
  nPos: integer;
  searchrec:TSearchRec;
  ret:integer;
  sFileName: string;
procedure p_MkDir(const sPath: string);
var
  i: integer;
  s: string;
begin
  for i := 1 to Length(sPath) do
  begin
    if sPath[i] = '\' then
    begin
      s := Copy(sPath, 1, i - 1);
      if not DirectoryExists(s) then
        MkDir(s);
    end;
  end;

  if not DirectoryExists(sPath) then
    MkDir(sPath);
end;
begin
  Result := false;
  sPathFrom := ExtractFilePath(Application.ExeName);
  {sFileFrom := sPathFrom + g_sFile;

  if not FileExists(sFileFrom) then
  begin
    //Application.MessageBox('1', '提示信息', MB_ICONINFORMATION);
    exit;
  end;}

  //
  //sFile := ExtractFileName(sFileFrom);
  sFileTo := ExtractFilePath(Application.ExeName);
  sFileTo := Copy(sFileTo, 1, Length(sFileTo) - 1);
  sFileTo := ExtractFilePath(sFileTo);
  sFileTo := Copy(sFileTo, 1, Length(sFileTo) - 1);
  sFileTo := ExtractFilePath(sFileTo);             // 上两级目录

  sTmp := sFileTo;
  sTmp := Copy(sTmp, 1, Length(sTmp) - 1);
  sTmp := ExtractFilePath(sTmp);            // 再上一级目录
  g_ClientPath := sTmp;

  sIniFile := sFileTo + 'Update.ini';  // 日志文件
  if not FileExists(sIniFile) then
  begin
    //Application.MessageBox('2', '提示信息', MB_ICONINFORMATION);
    exit;
  end;

  sFileTo := Copy(sFileTo, 1, Length(sFileTo) - 1);
  sFileTo := ExtractFilePath(sFileTo);            // 再上一级目录
  sPathTo := sFileTo;

  //更新程序所在目录下所有文件
    g_FilePath := ExtractFilePath(Application.ExeName);
    g_sArr.Clear;
    SearchFile(g_FilePath,g_sArr);
    sFileName := ExtractFileName(Application.ExeName);
    if g_sArr.IndexOf(sFileName) > -1 then
      g_sArr.Delete(g_sArr.IndexOf(sFileName));  //不更新自己
  //更新添加的文件
    for n := 0 to g_sArr.Count - 1 do
    begin
      s := g_sArr[n];
      nPos := Pos('|', s); // ab|cd
      if nPos > 0 then
      begin
        ss := Copy(s, 1, nPos - 1);
        sd := Copy(s, nPos + 1, Length(s));
      end
      else
      begin
        ss := s;
        sd := s;
      end;


      sFileFrom := G_GetAbsolutePath(sPathFrom, ss);
      sFileTo := sPathTo + sd;
      if not FileExists(sFileFrom) then continue;

      //
      while FileExists(sFileTo) do
      begin
        DeleteFile(sFileTo);
        if FileExists(sFileTo) then
        begin
          Application.MessageBox(PChar(sFileTo + '，文件正在使用，请关闭程序'), '提示信息', MB_ICONINFORMATION);
        end;
      end;

      //
      p_MkDir(ExtractFilePath(sFileTo));
      MoveFile(PChar(sFileFrom), PChar(sFileTo));
      if not FileExists(sFileTo) then
      begin
        //Application.MessageBox('3', '提示信息', MB_ICONINFORMATION);
        exit;
      end;
    end;

  //Application.MessageBox(PChar('4：' + sIniFile), '提示信息', MB_ICONINFORMATION);
  Ini := TIniFile.Create(sIniFile);
  try
    s := Ini.ReadString('UpdateSoft', 'LastVersionTry', '');
    Ini.WriteString('UpdateSoft', 'LastVersion', s);
    if nNewPort > 0 then Ini.WriteInteger('UpdateServer', 'ServerPort', nNewPort);
    if sNewIP <> '' then Ini.WriteString('UpdateServer', 'ServerIP', sNewIP);
    Ini.UpdateFile;
  finally
    Ini.Free;
  end;

  //
  sFileTo := sPathTo + g_sFile;
  ShellExecute(0, 'open', PChar(sFileTo), PChar('Update'), PChar(ExtractFilePath(sFileTo)), SW_SHOW);
  Result := true;
end;

procedure p_SetMainIni(sIniFileName: string;
  sSection: string; sPortKey: string; sIPKey: string;
  nNewPort: integer; sNewIP: string);
var
  Ini: TIniFile;
  sFileTo: string;
begin
  sFileTo := ExtractFilePath(Application.ExeName);
  sFileTo := Copy(sFileTo, 1, Length(sFileTo) - 1);
  sFileTo := ExtractFilePath(sFileTo);
  sFileTo := Copy(sFileTo, 1, Length(sFileTo) - 1);
  sFileTo := ExtractFilePath(sFileTo);
  sFileTo := Copy(sFileTo, 1, Length(sFileTo) - 1);
  sFileTo := ExtractFilePath(sFileTo);             // 上三级目录


  sFileTo := sFileTo + sIniFileName;  // 日志文件
  if not FileExists(sFileTo) then
  begin
    //Application.MessageBox('2', '提示信息', MB_ICONINFORMATION);
    exit;
  end;

  Ini := TIniFile.Create(sFileTo);
  try
    if nNewPort > 0 then Ini.WriteInteger(sSection, sPortKey, nNewPort);
    if sNewIP <> '' then Ini.WriteString(sSection, sIPKey, sNewIP);
    Ini.UpdateFile;
  finally
    Ini.Free;
  end;
end;

procedure SearchFile(DestPath: String; NowList: TStringList);
var
  searchrec:TSearchRec;
  ret:integer;
  NowPath,sPath:String;
  i: integer;
begin
  //为搜索的目录构造符合条件的形式
  if   DestPath[length(DestPath)] <> '\'   then
  begin
      NowPath:=DestPath+ '\';
  end   else
  begin
      NowPath:=DestPath;
  end;
  ret:=findfirst(NowPath+ '*.*',faAnyFile,searchrec);
  while   ret=0   do
  begin
      //如果搜索到是目录，则递归搜索 
      if   (searchrec.Attr   and   faDirectory)=   faDirectory   then
      begin
          if   (SearchRec.Name   <> '.')   and   (SearchRec.Name   <> '..')   then
          begin
              SearchFile(NowPath+SearchRec.Name,NowList);
          end; 
      end   else
      begin
          //否则加入列表中
          sPath := Copy(NowPath,pos(g_FilePath,NowPath)+length(g_FilePath), Length(NowPath));
          NowList.Add(sPath+SearchRec.Name);
//            Inc(i);
//            Inc(num);
      end;
      ret:=findNext(SearchRec);
  end;
  findClose(SearchRec);
//    form1.Label2.Caption := IntToStr(i);

end;

end.
