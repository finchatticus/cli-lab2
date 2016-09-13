.assembly Lab2Assembly
{
	.ver 1:0:0:0
}

.method static void Main()
{
	.locals init(
		int32 x,
		int32 y,
		int32 z
	)
	
	ldstr "x="
	call int32 GetNumber(string)
	stloc x
	
	ldstr "y="
	call int32 GetNumber(string)
	stloc y
	
	ldloc x
	ldloc y
	call int32 Sum(int32 x, int32 y)
	stloc z
	
	ldloc x
	ldloc y
	ldloc z
	call void SumPrint(int32 x, int32 y, int32 z)
	
	.entrypoint
	ret
	
}

.method static int32 GetNumber(string varName)
{
	ldarg varName;
	call void [mscorlib]System.Console::Write(string)
	call string [mscorlib]System.Console::ReadLine();
	call int32 [mscorlib]System.Int32::Parse(string)
	ret
}

.method static int32 Sum(int32 x, int32 y)
{
	ldarg x
	ldarg y
	add
	ret
}

.method static void SumPrint(int32 x, int32 y, int32 z)
{
	ldstr "{0}+{1}={2}"
	
	ldarg x
	box int32
	
	ldarg y
	box int32
	
	ldarg z
	box int32
	
	call void [mscorlib]System.Console::WriteLine(string, object, object, object)
	
	ret
}