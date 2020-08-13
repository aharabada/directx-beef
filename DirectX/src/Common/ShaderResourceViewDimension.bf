namespace DirectX.Common
{
	/**
	These flags identify the type of resource that will be viewed as a shader resource.
 	D3D11_SRV_DIMENSION
	*/
	public enum ShaderResourceViewDimension : uint32
	{
		/**
		The type is unknown. 
		D3D11_SRV_DIMENSION_UNKNOWN
		*/
		Unknown = 0,
		/**
		The resource is a buffer.
		D3D11_SRV_DIMENSION_BUFFER
		*/
		Buffer = 1,
		/**
		The resource is a 1D texture.
		D3D11_SRV_DIMENSION_TEXTURE1D
		*/
		Texture1D = 2,
		/**
		The resource is an array of 1D textures.
		D3D11_SRV_DIMENSION_TEXTURE1DARRAY
		*/
		Texture1DArray = 3,
		/**
		The resource is a 2D texture.
		D3D11_SRV_DIMENSION_TEXTURE2D
		*/
		Texture2D = 4,
		/**
		The resource is an array of 2D textures.
		D3D11_SRV_DIMENSION_TEXTURE2DARRAY   
		*/
		Texture2DArray = 5,
		/**
		The resource is a multisampling 2D texture.
		D3D11_SRV_DIMENSION_TEXTURE2DMS       
		*/
		Texture2DMultisampled = 6,
		/**
		The resource is an array of multisampling 2D textures.
		D3D11_SRV_DIMENSION_TEXTURE2DMSARRAY  
		*/
		Texture2DMultisampledArray= 7, 
		/**
		The resource is a 3D texture.
		D3D11_SRV_DIMENSION_TEXTURE3D         
		*/
		Texture3D = 8, 
		/**
		The resource is a cube texture.
		D3D11_SRV_DIMENSION_TEXTURECUBE       
		*/
		TextureCube = 9, 
		/**
		The resource is an array of cube textures.
		D3D11_SRV_DIMENSION_TEXTURECUBEARRAY  
		*/
		TextureCubeArray = 10,
		/**
		The resource is a raw buffer.
		D3D11_SRV_DIMENSION_BUFFEREX          
		*/
		BufferEx = 11
	}
}
