namespace DirectX.D3D11
{
	/**
	The stencil operations that can be performed during depth-stencil testing. 
	D3D11_STENCIL_OP
	*/
	public enum StencilOperation : uint32
	{
		/**
		Keep the existing stencil data.
		D3D11_STENCIL_OP_KEEP
		*/
		Keep = 1,
		/**
		Set the stencil data to 0.
		D3D11_STENCIL_OP_ZERO
		*/
		Zero= 2,
		/**
		Set the stencil data to the reference value set by calling ID3D11DeviceContext::OMSetDepthStencilState.
		D3D11_STENCIL_OP_REPLACE
		*/
		Replace = 3,
		/**
		Increment the stencil value by 1, and clamp the result. 
		D3D11_STENCIL_OP_INCR_SAT
		*/
		IncrementAndClamp = 4,
		/**
		Decrement the stencil value by 1, and clamp the result. 
		D3D11_STENCIL_OP_DECR_SAT
		*/
		DecrementAndClamp = 5,
		/**
		Invert the stencil data. 
		D3D11_STENCIL_OP_INVERT
		*/
		Invert = 6,
		/**
		 Increment the stencil value by 1, and wrap the result if necessary. 
		D3D11_STENCIL_OP_INCR
		*/
		Increment = 7,
		/**
		Decrement the stencil value by 1, and wrap the result if necessary. 
		D3D11_STENCIL_OP_DECR
		*/
		Decrement = 8
	}
}
