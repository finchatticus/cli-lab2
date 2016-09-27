.assembly OpLib 
{
	.ver 5:0:0:0
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
	ldarg x //Load argument numbered num onto the stack.
	ldarg y
	add
	ret
}

.method public static int32 Sub(int32 x, int32 y)
{
	ldarg x
	ldarg y
	sub
	ret
}

.method public static int32 Mul(int32 x, int32 y)
{
	ldarg x
	ldarg y
	mul
	ret
}

.method public static int32 Div(int32 x, int32 y)
{
	ldarg x
	ldarg y
	div
	ret
}

.method public static int32 Square(int32 x) {
	ldarg x
	ldarg x
	call int32 Operation::Mul(int32 x, int32 x)
	ret
}

.method public static int32 Cube(int32 x)
{
	.locals init(
		int32 x2,
		int32 x3
	)
	
	ldarg x //Load argument numbered num onto the stack.
	ldarg x
	call int32 Operation::Mul(int32 x, int32 x)
	stloc x2
	ldarg x
	ldloc x2
	call int32 Operation::Mul(int32 x, int32 x2)
	ret
}

.method public static int32 Left(int32 x, int32 y)
{
	.locals init(
		int32 x3,
		int32 y3
	)
	
	ldarg x
	call int32 Operation::Cube(int32 x)
	stloc x3
	ldarg y
	call int32 Operation::Cube(int32 y)
	stloc y3
	ldloc x3
	ldloc y3
	call int32 Operation::Sub(int32 x3, int32 y3)
	ret
}

.method public static void PrintLeft(int32 x, int32 y, int32 z)
{
	ldstr "{0}^3-{1}^3={2}"
	
	ldarg x
	box int32
	
	ldarg y
	box int32
	
	ldarg z
	box int32
	
	call void [mscorlib]System.Console::WriteLine(string, object, object, object)
	
	ret
}

.method public static int32 RightSecond(int32 x, int32 y)
{
	.locals init(
		int32 x2,
		int32 xy,
		int32 y2,
		int32 sum
	)
	
	ldarg x
	call int32 Operation::Square(int32 x)
	stloc x2
	
	ldarg y
	call int32 Operation::Square(int32 y)
	stloc y2
	
	ldloc x2
	ldloc y2
	call int32 Operation::Sum(int32 x2, int32 y2)
	stloc sum
	
	ldarg x
	ldarg y
	call int32 Operation::Mul(int32 x, int32 y)
	stloc xy
	
	ldloc sum
	ldloc xy
	call int32 Operation::Sum(int32 sum, int32 xy)
	ret
}

.method public static int32 Right(int32 x, int32 y)
{
	.locals init(
		int32 first,
		int32 second
	)
	
	ldarg x
	ldarg y
	call int32 Operation::Sub(int32 x, int32 y)
	stloc first
	
	ldarg x
	ldarg y
	call int32 Operation::RightSecond(int32 x, int32 y)
	stloc second
	
	ldloc first
	ldloc second
	call int32 Operation::Mul(int32 x3, int32 y3)
	ret
}

.method public static void PrintRight(int32 x, int32 y, int32 z)
{
	ldstr "({0}-{1})*({0}^2+{0}*{1}+{1}^2)={2}"
	
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