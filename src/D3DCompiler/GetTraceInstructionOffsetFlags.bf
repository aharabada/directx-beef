namespace DirectX.D3DCompiler
{
	public enum GetTraceInstructionOffsetFlags : uint32
	{
		/**
		 * No flags specified.
		*/
		None = 0,
		/**
		 * Include non-executable code in the retrieved information.
		*/
		IncludeNonExecutable = 1
	}
}
