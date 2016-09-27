.assembly extern OpLib {
	.ver 5:0:0:0
}
.assembly Lab2Assembly
{
	.ver 6:0:0:0
}

.method static void Main()
{
	.locals init(
		int32 x,
		int32 y,
		int32 s1,
		int32 s2,
		class [OpLib]Operation obj
	)
	
	newobj instance void [OpLib]Operation::.ctor()
	stloc obj
	ldloc obj
	
	ldstr "a="
	call int32 [OpLib]Operation::GetNumber(string)
	stloc x
	
	ldstr "b="
	call int32 [OpLib]Operation::GetNumber(string)
	stloc y
	
	ldloc x
	ldloc y
	call int32 [OpLib]Operation::Left(int32 x, int32 y)
	stloc s1
	
	ldloc x
	ldloc y
	call int32 [OpLib]Operation::Right(int32 x, int32 y)
	stloc s2
	
	ldloc x
	ldloc y
	ldloc s1
	call void [OpLib]Operation::PrintLeft(int32 x, int32 y, int32 s1)
	
	ldloc x
	ldloc y
	ldloc s1
	call void [OpLib]Operation::PrintRight(int32 x, int32 y, int32 s1)
	
	pop
	
	.entrypoint
	ret
	
}