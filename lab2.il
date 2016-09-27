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
	
	ldstr "b=" //Push a string object for the literal string.
	call int32 [OpLib]Operation::GetNumber(string)
	stloc y
	
	ldloc x //Load local variable of index indx onto stack.
	ldloc y
	call int32 [OpLib]Operation::Left(int32 x, int32 y)
	stloc s1 //Pop a value from stack into local variable indx.
	
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
	
	pop //Pop value from the stack.
	
	.entrypoint
	ret //Return from method, possibly with a value.
	
}