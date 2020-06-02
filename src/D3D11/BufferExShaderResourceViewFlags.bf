namespace DirectX.D3D11
{
	/**
	 * Identifies how to view a buffer resource.
	*/
	public enum BufferExShaderResourceViewFlags : uint32
	{
		/**
		 * View the buffer as raw.
		*/
        Raw	= 0x1,
		/**
		 * None, not a valid option.
		*/
		None = 0
	}
}
