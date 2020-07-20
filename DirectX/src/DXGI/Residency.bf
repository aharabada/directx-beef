namespace DirectX.DXGI
{
	/**
	 * Flags indicating the memory location of a resource.
	 * DXGI_RESIDENCY
	*/
	public enum Residency : uint32
	{
		/**
		 * The resource is located in video memory.
		 * DXGI_RESIDENCY_FULLY_RESIDENT
		*/
		FullyResident = 1,
		/**
		 * At least some of the resource is located in CPU memory.
		 * DXGI_RESIDENCY_RESIDENT_IN_SHARED_MEMORY
		*/
		SharedMemory = 2,
		/**
		 * At least some of the resource has been paged out to the hard drive.
		 * DXGI_RESIDENCY_EVICTED_TO_DISK
		*/
		EvictedToDisk = 3
	}
}
