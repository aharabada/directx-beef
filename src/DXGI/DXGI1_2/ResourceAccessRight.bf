namespace DirectX.DXGI.DXGI1_2
{
	public enum ResourceAccessRight : uint32
	{
		/**
		 * Specifies read access to the resource.
		*/
		Read = 0x80000000L,
		/**
		 * Write access.
		*/
		Write = 0x40000000L,
		/**
		 * Execute access.
		*/
		Execute = 0x20000000L,
		/**
		 * All possible access rights.
		*/
		All = 0x10000000L,
		/**
		 * Specifies write access to the resource.
		*/
		SharedResourceWrite = 1
	}
}
