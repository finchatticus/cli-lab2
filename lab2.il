.assembly extern OpLib {
	.ver 5:0:0:0
}
.assembly Lab2Assembly
{
	.ver 5:0:0:0
}

.method static void Main()
{
	.locals init(
		int32 x,
		int32 y,
		int32 s1,
		int32 s2,
		int32 s3,
		int32 s4,
		int32 s5,
		int32 s6,
		int32 s7,
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
	call int32 [OpLib]Operation::Sub(int32 x, int32 y)
	stloc s1
	
	ldloc x
	ldloc x
	call int32 [OpLib]Operation::Mul(int32 x, int32 x)
	stloc s2

	ldloc x
	ldloc y
	call int32 [OpLib]Operation::Mul(int32 x, int32 y)
	stloc s3
	
	ldloc s2
	ldloc s3
	call int32 [OpLib]Operation::Sum(int32 s2, int32 s3)
	stloc s4
	
	ldloc y
	ldloc y
	call int32 [OpLib]Operation::Mul(int32 y, int32 y)
	stloc s5
	
	ldloc s4
	ldloc s5
	call int32 [OpLib]Operation::Sum(int32 s4, int32 s5)
	stloc s6
	
	ldloc s1
	ldloc s6
	call int32 [OpLib]Operation::Mul(int32 s1, int32 s6)
	stloc s7
	
	ldloc x
	ldloc y
	ldloc s7
	call void [OpLib]Operation::Print(int32 x, int32 y, int32 s7)
	
	pop
	
	.entrypoint
	ret
	
}