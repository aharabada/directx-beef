namespace DirectX.Common
{
	/**
	 * Values that identify information about a shader variable.
	 * D3D_SHADER_VARIABLE_FLAGS
	*/
	public enum D3DShaderVariableFlags : uint32
	{
		/**
		 * Indicates that the registers assigned to this shader variable were explicitly declared in shader code (instead of automatically assigned by the compiler).
		 * D3D_SVF_USERPACKED
		*/
        Userpacked = 1,
		/**
		 * Indicates that this variable is used by this shader.
		 * This value confirms that a particular shader variable (which can be common to many different shaders) is indeed used by a particular shader.
		 * D3D_SVF_USED
		*/
        Used = 2,
		/**
		 * Indicates that this variable is an interface.
		 * D3D_SVF_INTERFACE_POINTER
		*/
        InterfacePointer = 4,
		/**
		 *
		 * D3D_SVF_INTERFACE_PARAMETER
		*/
        InterfaceParameter = 8,
		/**
		 * This value is not used by a programmer;
		 * it exists to force the enumeration to compile to 32 bits.
		 * D3D_SVF_FORCE_DWORD
		*/
        ForceDWord = 0x7fffffff
	}
}
