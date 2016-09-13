.assembly Lab2Assembly
{
	.ver 1:0:0:0
}

.method static void Main()
{
	.locals init(
		int32 x,
		int32 y,
		int32 z,
		class Operation obj
	)
	
	newobj void Operation::.ctor()
	stloc obj
	ldloc obj
	
	ldstr "x="
	call int32 Operation::GetNumber(string)
	stloc x
	
	ldstr "y="
	call int32 Operation::GetNumber(string)
	stloc y
	
	ldloc x
	ldloc y
	call int32 Operation::Sum(int32 x, int32 y)
	stloc z
	
	ldloc x
	ldloc y
	ldloc z
	call void Operation::SumPrint(int32 x, int32 y, int32 z)
	
	pop
	
	.entrypoint
	ret
	
}

.class public Operation
{
	.method void .ctor()
	{
		.maxstack 1
		ldarg.0
		call instance void [mscorlib]System.Object::.ctor()
		ret
	}
}

.class Operation 
{

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

.method void .ctor()
	{
		.maxstack 1
		ldarg.0
		call instance void [mscorlib]System.Object::.ctor()
		ret
	}

}