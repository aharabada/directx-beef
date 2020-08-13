namespace DirectX.D3D11
{
	/**
	These flags identify the type of resource that will be viewed as a render target.
	D3D11_RTV_DIMENSION
	// Todo: Rename
	*/
	enum RenderTargetViewDimension : uint32
	{
		/**
		Do not use this value, as it will cause ID3D11Device::CreateRenderTargetView to fail.
		D3D11_RTV_DIMENSION_UNKNOWN
		*/
	    Unknown = 0,
		/**
		The resource will be accessed as a buffer.
		D3D11_RTV_DIMENSION_BUFFER
		*/
	    Buffer = 1,
		/**
		The resource will be accessed as a 1D texture.
		D3D11_RTV_DIMENSION_TEXTURE1D
		*/
	    Texture1D = 2,
		/**
		The resource will be accessed as an array of 1D textures.
		D3D11_RTV_DIMENSION_TEXTURE1DARRAY
		*/
	    Texture1DArray = 3,
		/**
		The resource will be accessed as a 2D texture.
		D3D11_RTV_DIMENSION_TEXTURE2D
		*/
	    Texture2D = 4,
		/**
		The resource will be accessed as an array of 2D textures.
		D3D11_RTV_DIMENSION_TEXTURE2DARRAY
		*/
	    Texture2DArray = 5,
		/**
		The resource will be accessed as a 2D texture with multisampling.
		D3D11_RTV_DIMENSION_TEXTURE2DMS
		*/
	    Texture2DMultisample = 6,
		/**
		The resource will be accessed as an array of 2D textures with multisampling.
		D3D11_RTV_DIMENSION_TEXTURE2DMSARRAY
		*/
	    Texture2DArrayMultisample = 7,
		/**
		The resource will be accessed as a 3D texture.
		D3D11_RTV_DIMENSION_TEXTURE3D
		*/
	    Texture3D = 8
	}
}
