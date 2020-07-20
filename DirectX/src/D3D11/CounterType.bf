namespace DirectX.D3D11
{
	/**
	 * Data type of a performance counter.
	*/
	public enum CounterType : uint32
	{
		/**
		 * 32-bit floating point.
		*/
		Float32 = 0,
		/**
		 * 16-bit unsigned integer.
		*/
        Uint16 = (Float32 + 1),
		/**
		 * 32-bit unsigned integer.
		*/
        Uint32 = (Uint16 + 1),
		/**
		 * 64-bit unsigned integer.
		*/
        Uint64 = (Uint32 + 1) 
	}
}
