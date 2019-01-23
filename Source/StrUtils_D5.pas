unit StrUtils_D5;

interface

function IfThen(AValue: Boolean; const ATrue: widestring; AFalse: widestring = ''): widestring; overload;

function IfThen(AValue: Boolean; const ATrue: integer; AFalse: integer = 0): integer; overload;

Function DupeString(const str:ansistring; Count :integer):ansistring;
Function DupeStringW(const str:widestring; Count :integer):widestring;

function RightStr(const S: widestring;  Count: Integer):widestring;
function LeftStr(const S: widestring; Count: Integer):widestring;

implementation


function IfThen(AValue: Boolean; const ATrue: widestring; AFalse: widestring = ''): widestring;
begin
 if AValue then result:=ATrue else result:=AFalse;
end;


function IfThen(AValue: Boolean; const ATrue: integer; AFalse: integer): integer;
begin
 if AValue then result:=ATrue else result:=AFalse;
end;

Function DupeString(const str:ansistring; Count :integer):ansistring;
var d:integer;
begin
 setlength(result, length(str)*Count);
 for d:=0 to Count-1 do
  if length(str)>0 then Move(Str[1], result[d*length(str)+1], length(str));
end;


Function DupeStringW(const str:widestring; Count :integer):widestring;
var d:integer;
begin
 setlength(result, length(str)*Count);
 for d:=0 to Count-1 do
  if length(str)>0 then Move(Str[1], result[d*length(str)*2+1], length(str)*2);
end;



function RightStr(const S: widestring;  Count: Integer):widestring;
begin
 result:=Copy(S,Length(S)+1-Count,Count);
end;

function LeftStr(const S: widestring; Count: Integer):widestring;
begin
 result:=Copy(S,1,Count);
end;

end.