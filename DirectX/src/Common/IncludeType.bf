namespace DirectX.Common
{
	/**
	Values that indicate the location of a shader #include file.
	D3D_INCLUDE_TYPE
	*/
	public enum IncludeType : uint32 // DWORD 
	{
		/**
		The local directory.
		D3D_INCLUDE_LOCAL and D3D10_INCLUDE_LOCAL
		*/
		Local = 0,
		/**
		D3D_INCLUDE_SYSTEM and D3D10_INCLUDE_SYSTEM
		*/
		System = (Local + 1),
		D3D_INCLUDE_FORCE_DWORD	= 0x7fffffff
	}
}
