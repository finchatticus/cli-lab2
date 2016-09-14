.assembly extern OpLib {
	.ver 4:0:0:0
}
.assembly Lab2Assembly
{
	.ver 4:0:0:0
}

.method static void Main()
{
	.locals init(
		int32 x,
		int32 y,
		int32 z,
		class [OpLib]Operation obj
	)
	
	newobj instance void [OpLib]Operation::.ctor()
	stloc obj
	ldloc obj
	
	ldstr "x="
	call int32 [OpLib]Operation::GetNumber(string)
	stloc x
	
	ldstr "y="
	call int32 [OpLib]Operation::GetNumber(string)
	stloc y
	
	ldloc x
	ldloc y
	call int32 [OpLib]Operation::Sum(int32 x, int32 y)
	stloc z
	
	ldloc x
	ldloc y
	ldloc z
	call void [OpLib]Operation::SumPrint(int32 x, int32 y, int32 z)
	
	pop
	
	.entrypoint
	ret
	
}