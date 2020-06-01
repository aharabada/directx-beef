namespace DirectX.D3D11
{
	/**
	Specifies how to access a resource used in a depth-stencil view.
	D3D11_DSV_DIMENSION
	*/
	public enum DepthStencilViewDimension : uint32
	{
		/**
		Unknown is not a valid value for DepthStencilViewDimension and is not used.
		D3D11_DSV_DIMENSION_UNKNOWN
		*/
		Unknown = 0,
		/**
		The resource will be accessed as a 1D texture.
		D3D11_DSV_DIMENSION_TEXTURE1D
		*/
		Texture1D = 1,
		/**
		The resource will be accessed as an array of 1D texture.
		D3D11_DSV_DIMENSION_TEXTURE1DARRAY
		*/
		Texture1DArray = 2,	
		/**
		The resource will be accessed as a 2D texture.
		D3D11_DSV_DIMENSION_TEXTURE2D
		*/
		Texture2D = 3,
		/**
		The resource will be accessed as an array of 2D texture.
		D3D11_DSV_DIMENSION_TEXTURE2DARRAY
		*/
		Texture2DArray = 4,
		/**
		The resource will be accessed as a 2D texture with multisampling.
		D3D11_DSV_DIMENSION_TEXTURE2DMS
		*/
		Texture2DMultisampled = 5,
		/**
		The resource will be accessed as an array of 2D textures with multisampling.
		D3D11_DSV_DIMENSION_TEXTURE2DMSARRAY
		*/
		Texture2DMultisampledArray = 6,
	}
}
