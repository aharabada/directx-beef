namespace DirectX.D3D11
{
	/**
	Specifies the parts of the depth stencil to clear. 
	D3D11_CLEAR_FLAG
	*/
	public enum ClearFlag : uint32
	{
		/**
		Clear the depth buffer, using fast clear if possible, then place the resource in a compressed state. 
		D3D11_CLEAR_DEPTH
		*/
	    Depth = 0x1L,
		/**
		Clear the stencil buffer, using fast clear if possible,	then place the resource in a compressed state. 
		D3D11_CLEAR_STENCIL
		*/
	    Stencil = 0x2L
	}
}
