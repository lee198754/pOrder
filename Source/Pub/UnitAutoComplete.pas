{*******************************************************}  
{                                                       }  
{       系统名称 编辑框自动提示完成                     }  
{       作者网址 http://blog.csdn.net/akof1314          }  
{       单元名称 UnitAutoComplete.pas                   }  
{       单元功能 绑定编辑框，使之关联字符串，可联想提示 }  
{                                                       }
{*******************************************************}

unit UnitAutoComplete;

interface  
uses  
    Windows, Classes,  ActiveX, ShlObj, ComObj;
const
  { IAutoComplete2 options }  
  ACO_NONE = 0;               //无自动完成功能  
  ACO_AUTOSUGGEST = $1;       //自动显示下拉列表
  ACO_AUTOAPPEND = $2;        //自动添加完成项
  ACO_SEARCH = $4;            //在下拉列表多一个搜索项
  ACO_FILTERPREFIXES = $8;    //防止自动完成匹配常用前缀比如"www.", "http://"等
  ACO_USETAB = $10;           //用TAB键在下拉列表中选择
  ACO_UPDOWNKEYDROPSLIST = $20; //上下按键可以用来调出下拉列表框
  ACO_RTLREADING = $40;       //按由右到左的顺序读
type
    TEnumString = class(TInterfacedObject, IEnumString)
  private  
    FStrings: TStrings;
    FIndex: Integer;  
  protected  
    { IEnumString }  
    function Next(celt: Longint; out elt; pceltFetched: PLongint): HResult; stdcall;  
    function Skip(celt: Longint): HResult; stdcall;  
    function Reset: HResult; stdcall;  
    function Clone(out enm: IEnumString): HResult; stdcall;  
  public  
    constructor Create(Strings: TStrings);  
  end;  
  
    TAutoComplete = class  
    private  
      //  
    protected  
      //                                      
    public  
      class procedure EnableAutoComplete(hwndEdit: HWND;sl: TStrings;dwFlag: DWORD);
  end;  
implementation
  
constructor TEnumString.Create(Strings: TStrings);  
begin  
  inherited Create;  
  FStrings := Strings;
end;

{ TEnumString.IEnumString }  
  
function TEnumString.Next(celt: Longint;  
  out elt; pceltFetched: PLongint): HResult;  
var  
  I: Integer;  
begin
  I := 0;
  while (I < celt) and (FIndex < FStrings.Count) do
  begin
    TPointerList(elt)[I] := PWideChar(WideString(FStrings[FIndex]));
    Inc(I);
    Inc(FIndex);
  end;  
  if pceltFetched <> nil then pceltFetched^ := I;
  if I = celt then Result := S_OK else Result := S_FALSE;
end;

  
function TEnumString.Skip(celt: Longint): HResult;  
begin  
  if (FIndex + celt) <= FStrings.Count then
  begin
    Inc(FIndex, celt);  
    Result := S_OK;  
  end  
  else  
  begin  
    FIndex := FStrings.Count;
    Result := S_FALSE;  
  end;  
end;  
  
function TEnumString.Reset: HResult;  
begin
  FIndex := 0;
  Result := S_OK;
end;
  
function TEnumString.Clone(out enm: IEnumString): HResult;  
begin  
  try  
    enm := TEnumString.Create(FStrings);
    Result := S_OK;  
  except  
    Result := E_UNEXPECTED;
  end;
end;  
  
{-------------------------------------------------------------------------------  
  过程名:    TAutoComplete.EnableAutoComplete  
  功能:      自动完成
  参数:      edt: TCustomEdit;sl: TStrings;dwFlag: DWORD
  返回值:    无
  调用方法:   TAutoComplete.EnableAutoComplete(edt_Name.Handle, FStrings, ACO_AUTOSUGGEST + ACO_UPDOWNKEYDROPSLIST);
-------------------------------------------------------------------------------}
class procedure TAutoComplete.EnableAutoComplete(hwndEdit: HWND;sl: TStrings;dwFlag: DWORD);
var  
  FAutoComplete: IAutoComplete2;
  FStrings: IUnknown;
begin
  FAutoComplete := CreateComObject(CLSID_AutoComplete) as IAutoComplete2;
  FStrings := TEnumString.Create(sl) as IUnknown;
  OleCheck(FAutoComplete.SetOptions(dwFlag));
  OleCheck(FAutoComplete.Init(hwndEdit, FStrings, nil, nil));
end;
end.
