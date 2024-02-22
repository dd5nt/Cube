    (*
--
-- ������ ��� �������� ���� ����� ������� ������� ��������� ������������ ��������
--     TDynaArray   :  ���������� ������
--     TDynaMatrix  :  ��������� ������������ ������
--
*)

unit DynArray;

interface

uses

  SysUtils;

type

  TDynArrayBaseType = double;

const

  vMaxElements = (High(Cardinal) - $F) div sizeof(TDynArrayBaseType);
  {= ����������� ����������� ��������� ������ =}

type

  TDynArrayNDX = 1..vMaxElements;
  TArrayElements = array[TDynArrayNDX] of TDynArrayBaseType;
  {= ����� ������� ������ TDynArrayBaseType, ������� �� ����� �������� =}
  PArrayElements = ^TArrayElements;
  {= ��������� �� ������ =}

  EDynArrayRangeError = class(ERangeError);

  TDynArray = class
  private
    fDimension: TDynArrayNDX;
    fMemAllocated: word;
    function GetElement(N: TDynArrayNDX): TDynArrayBaseType;
    procedure SetElement(N: TDynArrayNDX; const NewValue: TDynArrayBaseType);
  protected
    Elements: PArrayElements;
  public
    constructor Create(NumElements: TDynArrayNDX);
    destructor Destroy; override;
    procedure Resize(NewDimension: TDynArrayNDX); virtual;
    property dimension: TDynArrayNDX
      read fDimension;
    property Element[N: TDynArrayNDX]: TDynArrayBaseType
    read GetElement
      write SetElement;
    default;
  end;

const

  vMaxMatrixColumns = 65520 div sizeof(TDynArray);
  {= ���������� ������� ������ � �������������� ������� �������� TDynArray =}

type

  TMatrixNDX = 1..vMaxMatrixColumns;
  TMatrixElements = array[TMatrixNDX] of TDynArray;
  {= ������ ������� ������� ����� ������������ �������� =}
  PMatrixElements = ^TMatrixElements;
  {= ��������� �� ������ ����������... =}

  TDynaMatrix = class
  private
    fRows: TDynArrayNDX;
    fColumns: TMatrixNDX;
    fMemAllocated: longint;
    function GetElement(row: TDynArrayNDX;
      column: TMatrixNDX): TDynArrayBaseType;
    procedure SetElement(row: TDynArrayNDX;
      column: TMatrixNDX;
      const NewValue: TDynArrayBaseType);
  protected
    mtxElements: PMatrixElements;
  public
    constructor Create(NumRows: TDynArrayNDX; NumColumns: TMatrixNDX);
    destructor Destroy; override;
    property rows: TDynArrayNDX
      read fRows;
    property columns: TMatrixNDX
      read fColumns;
    property Element[row: TDynArrayNDX; column: TMatrixNDX]: TDynArrayBaseType
    read GetElement
      write SetElement;
    default;
  end;

implementation

(*

--
--  ������ TDynArray
--
*)

constructor TDynArray.Create(NumElements: TDynArrayNDX);

begin {==TDynArray.Create==}
  inherited Create;
  fDimension := NumElements;
  GetMem(Elements, fDimension * sizeof(TDynArrayBaseType));
  fMemAllocated := fDimension * sizeof(TDynArrayBaseType);
  FillChar(Elements^, fMemAllocated, 0);
end; {==TDynArray.Create==}

destructor TDynArray.Destroy;

begin {==TDynArray.Destroy==}
  FreeMem(Elements, fMemAllocated);
  inherited Destroy;
end; {==TDynArray.Destroy==}

procedure TDynArray.Resize(NewDimension: TDynArrayNDX);

begin {TDynArray.Resize==}
  if (NewDimension < 1) then
    raise EDynArrayRangeError.CreateFMT('������ ����� �� ������� ��������� : %d',
      [NewDimension]);
  Elements := ReAllocMem(Elements, fMemAllocated, NewDimension *
    sizeof(TDynArrayBaseType));
  fDimension := NewDimension;
  fMemAllocated := fDimension * sizeof(TDynArrayBaseType);
end; {TDynArray.Resize==}

function TDynArray.GetElement(N: TDynArrayNDX): TDynArrayBaseType;

begin {==TDynArray.GetElement==}
  if (N < 1) or (N > fDimension) then
    raise EDynArrayRangeError.CreateFMT('������ ����� �� ������� ��������� : %d',
      [N]);
  result := Elements^[N];
end; {==TDynArray.GetElement==}

procedure TDynArray.SetElement(N: TDynArrayNDX; const NewValue:
  TDynArrayBaseType);

begin {==TDynArray.SetElement==}
  if (N < 1) or (N > fDimension) then
    raise EDynArrayRangeError.CreateFMT('������ ����� �� ������� ��������� : %d',
      [N]);
  Elements^[N] := NewValue;
end; {==TDynArray.SetElement==}

(*

--
--  ������ TDynaMatrix
--
*)

constructor TDynaMatrix.Create(NumRows: TDynArrayNDX; NumColumns: TMatrixNDX);

var
  col: TMatrixNDX;
begin {==TDynaMatrix.Create==}
  inherited Create;
  fRows := NumRows;
  fColumns := NumColumns;
  {= ��������� ������ ��� ������� ���������� (�.�. ��� ������� TDynArrays) =}
  GetMem(mtxElements, fColumns * sizeof(TDynArray));
  fMemAllocated := fColumns * sizeof(TDynArray);
  {= ������ �������� ������ ��� ������� ������� ������� =}
  for col := 1 to fColumns do
  begin
    mtxElements^[col] := TDynArray.Create(fRows);
    inc(fMemAllocated, mtxElements^[col].fMemAllocated);
  end;
end; {==TDynaMatrix.Create==}

destructor TDynaMatrix.Destroy;

var
  col: TMatrixNDX;
begin {==TDynaMatrix.Destroy;==}
  for col := fColumns downto 1 do
  begin
    dec(fMemAllocated, mtxElements^[col].fMemAllocated);
    mtxElements^[col].Free;
  end;
  FreeMem(mtxElements, fMemAllocated);
  inherited Destroy;
end; {==TDynaMatrix.Destroy;==}

function TDynaMatrix.GetElement(row: TDynArrayNDX;

  column: TMatrixNDX): TDynArrayBaseType;
begin {==TDynaMatrix.GetElement==}
  if (row < 1) or (row > fRows) then
    raise
      EDynArrayRangeError.CreateFMT('������ ������ ����� �� ������� ��������� : %d', [row]);
  if (column < 1) or (column > fColumns) then
    raise
      EDynArrayRangeError.CreateFMT('������ ������� ����� �� ������� ��������� : %d', [column]);
  result := mtxElements^[column].Elements^[row];
end; {==TDynaMatrix.GetElement==}

procedure TDynaMatrix.SetElement(row: TDynArrayNDX;

  column: TMatrixNDX;
  const NewValue: TDynArrayBaseType);
begin {==TDynaMatrix.SetElement==}
  if (row < 1) or (row > fRows) then
    raise
      EDynArrayRangeError.CreateFMT('������ ������ ����� �� ������� ��������� : %d', [row]);
  if (column < 1) or (column > fColumns) then
    raise
      EDynArrayRangeError.CreateFMT('������ ������� ����� �� ������� ��������� : %d', [column]);
  mtxElements^[column].Elements^[row] := NewValue;
end; {==TDynaMatrix.SetElement==}

end.
