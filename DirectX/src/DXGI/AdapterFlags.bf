namespace DirectX.DXGI
{
	/**
	Identifies the type of DXGI adapter. 
	DXGI_ADAPTER_FLAG
	*/
	public enum AdapterFlags : uint32
	{
		/**
		Specifies no flags. 
		DXGI_ADAPTER_FLAG_NONE
		*/
		None = 0,
		/**
		Value always set to 0. This flag is reserved. 
		DXGI_ADAPTER_FLAG_REMOTE
		*/
		Remote = 1,
		/**
		Specifies a software adapter. For more info about this flag, see new info in Windows 8 about enumerating adapters. 
		Direct3D 11:  This enumeration value is supported starting with Windows 8.
		DXGI_ADAPTER_FLAG_SOFTWARE
		*/
		Software = 2,
		/**
		Forces this enumeration to compile to 32 bits in size.
		Without this value, some compilers would allow this enumeration to compile
		to a size other than 32 bits. This value is not used. 
		DXGI_ADAPTER_FLAG_FORCE_DWORD
		*/
		ForceDword = 0xffffffff
	}
}
