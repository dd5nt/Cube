unit fRnd;

interface

const SEED 	=	 161803398;
const RND_32_MAX =	4294967295;

var
  table :array [0..55] of Longword;
  index1, index2 : Longword;

  procedure InitRnd;
  function Rnd( limit: Longword) : Longword;

implementation

function rnd_32_hp( limit : Longword) : Longword;
begin
	index1 := (index1 + 1) mod 55;
	index2 := (index2 + 1) mod 55;
	table[index1] := table[index1] - table[index2];
	result := table[index1] mod limit;
end;

procedure init_32( j : LongWord);
var
  i,ii,loop : LongWord;
  k : LongWord;
begin
//  k := 1UL;
  k := 1;
	table[54] := j;
	for i :=0 to 53 do begin
		ii := 21* i mod 55;
		table[ii] := k;
		k := j - k;
		j := table[ii];
	end;
	for loop :=0 to 3 do begin
		for i := 0 to 54 do
			table[i] := table[i] - table[(i + 31) mod 55];
  end;
	index1 := 0;
	index2 := 31;
end;

procedure InitRnd;
begin
  init_32(SEED);
//  Randomize;
end;

function Rnd( limit: Longword) : Longword;
begin
	Result := rnd_32_hp( limit);
//  Result := Random( limit);
end;

end.
