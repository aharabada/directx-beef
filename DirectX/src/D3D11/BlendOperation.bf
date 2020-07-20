namespace DirectX.D3D11
{
	/**
	RGB or alpha blending operation.
	D3D11_BLEND_OP
	*/
	public enum BlendOperation : UINT
	{
		/**
		Add source 1 and source 2.
		D3D11_BLEND_OP_ADD
		*/
		Add	= 1,
		/**
		Subtract source 1 from source 2.
		D3D11_BLEND_OP_SUBTRACT
		*/
		Subtract = 2,
		/**
		Subtract source 2 from source 1.
		D3D11_BLEND_OP_REV_SUBTRACT
		*/
		ReversedSubtract = 3,
		/**
		Find the minimum of source 1 and source 2.
		D3D11_BLEND_OP_MIN	
		*/
		Min = 4,
		/**
		Find the maximum of source 1 and source 2.
		D3D11_BLEND_OP_MAX
		*/
		Max = 5
	}
}
