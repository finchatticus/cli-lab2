.assembly OpLib 
{
	.ver 2:0:0:0
}

.class public Operation 
{

.method public static int32 GetNumber(string varName)
{
	ldarg varName;
	call void [mscorlib]System.Console::Write(string)
	call string [mscorlib]System.Console::ReadLine();
	call int32 [mscorlib]System.Int32::Parse(string)
	ret
}

.method public static int32 Sum(int32 x, int32 y)
{
	ldarg x
	ldarg y
	add
	ret
}

.method public static void SumPrint(int32 x, int32 y, int32 z)
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

.method public void .ctor()
{
	.maxstack 1
	ldarg.0
	call instance void [mscorlib]System.Object::.ctor()
	ret
}

}