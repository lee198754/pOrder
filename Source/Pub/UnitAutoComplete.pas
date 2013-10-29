{*******************************************************}  
{                                                       }  
{       ϵͳ���� �༭���Զ���ʾ���                     }  
{       ������ַ http://blog.csdn.net/akof1314          }  
{       ��Ԫ���� UnitAutoComplete.pas                   }  
{       ��Ԫ���� �󶨱༭��ʹ֮�����ַ�������������ʾ }  
{                                                       }
{*******************************************************}

unit UnitAutoComplete;

interface  
uses  
    Windows, Classes,  ActiveX, ShlObj, ComObj;
const
  { IAutoComplete2 options }  
  ACO_NONE = 0;               //���Զ���ɹ���  
  ACO_AUTOSUGGEST = $1;       //�Զ���ʾ�����б�
  ACO_AUTOAPPEND = $2;        //�Զ���������
  ACO_SEARCH = $4;            //�������б��һ��������
  ACO_FILTERPREFIXES = $8;    //��ֹ�Զ����ƥ�䳣��ǰ׺����"www.", "http://"��
  ACO_USETAB = $10;           //��TAB���������б���ѡ��
  ACO_UPDOWNKEYDROPSLIST = $20; //���°��������������������б��
  ACO_RTLREADING = $40;       //�����ҵ����˳���
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
  ������:    TAutoComplete.EnableAutoComplete  
  ����:      �Զ����
  ����:      edt: TCustomEdit;sl: TStrings;dwFlag: DWORD
  ����ֵ:    ��
  ���÷���:   TAutoComplete.EnableAutoComplete(edt_Name.Handle, FStrings, ACO_AUTOSUGGEST + ACO_UPDOWNKEYDROPSLIST);
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
