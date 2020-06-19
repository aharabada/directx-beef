namespace DirectX.Common
{
	/**
	 * Indicates semantic flags for function parameters.
	 * D3D_PARAMETER_FLAGS
	*/
	public enum ParameterFlags : uint32
	{
		/**
		 * The parameter has no semantic flags.
		 * D3D_PF_NONE
		*/
        None = 0,
		/**
		 * Indicates an input parameter.
		 * D3D_PF_IN
		*/
		In = 0x1,
		/**
		 * Indicates an output parameter.
		 * D3D_PF_OUT
		*/
		Out = 0x2,
		/**
		 * Forces this enumeration to compile to 32 bits in size.
		 * Without this value, some compilers would allow this enumeration to compile to a size other than 32 bits.
		 * This value is not used.
		 * D3D_PF_FORCE_DWORD
		*/
		ForceDWord = 0x7fffffff
	}
}
