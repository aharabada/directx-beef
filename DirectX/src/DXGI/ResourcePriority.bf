namespace DirectX.DXGI
{
	/**
	The eviction priority of a resource.
	*/
	public enum ResourcePriority : uint32
	{
		/**
		DXGI_RESOURCE_PRIORITY_MINIMUM:
		*/
		Minimum = 0x28000000,
		/**
		DXGI_RESOURCE_PRIORITY_LOW:
		*/
		Low = 0x50000000,
		/**
		DXGI_RESOURCE_PRIORITY_NORMAL
		*/
		Normal = 0x78000000 ,
		/**
		DXGI_RESOURCE_PRIORITY_HIGH
		*/
		High	= 0xa0000000 ,
		/**
		DXGI_RESOURCE_PRIORITY_MAXIMUM
		*/
		Maximum = 0xc8000000
	}
}
