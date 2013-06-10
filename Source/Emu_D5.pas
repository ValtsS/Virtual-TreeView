unit Emu_D5;

interface

uses Windows, ActiveX, SysUtils, Messages;

const
 CM_BASE = $B000;
 CM_PARENTDOUBLEBUFFEREDCHANGED = CM_BASE + $80;

function SHDoDragDrop(hwnd:HWND; pdata:IDataObject; pdsrc:IDropSource; dwEffect:DWord; pdwEffect:PDWORD):HRESULT;StdCall;

implementation

const shell32 = 'shell32.dll';

type ExceptionProcNotfound = class(Exception);
     ExceptionLibNotFound = class(Exception);

procedure GetProcedureAddress(var P: Pointer; const ModuleName, ProcName: string);
var
  ModuleHandle: HMODULE;
begin
  if not Assigned(P) then
  begin
    ModuleHandle := GetModuleHandle(PChar(ModuleName));
    if ModuleHandle = 0 then
    begin
      ModuleHandle := LoadLibrary(PChar(ModuleName));
      if ModuleHandle = 0 then raise ExceptionLibNotFound.Create('Library not found: ' + ModuleName);
    end;
    P := GetProcAddress(ModuleHandle, PChar(ProcName));
    if not Assigned(P) then raise ExceptionProcNotfound.Create('Function not found: ' + ModuleName + '.' + ProcName);
  end;
end;


{$WARNINGS OFF}
var
  _SHDoDragDrop: Pointer;
function SHDoDragDrop(hwnd:HWND; pdata:IDataObject; pdsrc:IDropSource; dwEffect:DWord; pdwEffect:PDWORD):HRESULT;StdCall;
begin
  GetProcedureAddress(_SHDoDragDrop, shell32, 'SHDoDragDrop');
  asm
    mov esp, ebp
    pop ebp
    jmp [_SHDoDragDrop]
  end;
end;


{$WARNINGS ON}


end.