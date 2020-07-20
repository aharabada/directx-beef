namespace DirectX.D3D11
{
	/**
	Depth-stencil view options.
	D3D11_DSV_FLAG
	*/
	public enum DepthStencilViewOptions : uint32
	{
		/**
		Indicates that depth values are read only.
		D3D11_DSV_READ_ONLY_DEPTH
		*/
		ReadOnlyDepth = 0x1L,
		/**
		Indicates that stencil values are read only.
		D3D11_DSV_READ_ONLY_STENCIL
		*/
		ReadOnlyStencil = 0x2L,
		/**
		Indicates that neither depth nor stencil values are read only.
		*/
		None = 0
	}
}
