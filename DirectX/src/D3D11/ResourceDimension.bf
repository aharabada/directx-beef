namespace DirectX.D3D11
{
	/**
	D3D11_RESOURCE_DIMENSION:
	Identifies the type of resource being used.
	*/
	public enum ResourceDimension : uint32
	{
		/**
		D3D11_RESOURCE_DIMENSION_UNKNOWN:
		Resource is of unknown type.
		*/
	    Unknown = 0,
		/**
		D3D11_RESOURCE_DIMENSION_BUFFER:
		Resource is a buffer.
		*/
	    Buffer = 1,
		/**
		D3D11_RESOURCE_DIMENSION_TEXTURE1D:
		Resource is a 1D texture.
		*/
	    Texture1D = 2,
		/**
		D3D11_RESOURCE_DIMENSION_TEXTURE2D:
		Resource is a 2D texture.
		*/
	    Texture2D = 3,
		/**
		D3D11_RESOURCE_DIMENSION_TEXTURE3D:
		Resource is a 3D texture.
		*/
	    Texture3D = 4
	}
}
