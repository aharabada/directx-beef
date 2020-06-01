namespace DirectX.D3D11
{
	/**
	Identify the portion of a depth-stencil buffer for writing depth data. 
	D3D11_DEPTH_WRITE_MASK
	*/
	public enum DepthWriteMask : uint32
	{
		/**
		Turn off writes to the depth-stencil buffer. 
		D3D11_DEPTH_WRITE_MASK_ZERO
		*/
		Zero = 0,
		/**
		Turn on writes to the depth-stencil buffer. 
		D3D11_DEPTH_WRITE_MASK_ALL
		*/
		All = 1
	}
}
