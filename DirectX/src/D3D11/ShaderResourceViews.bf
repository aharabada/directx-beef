using System;

namespace DirectX.D3D11
{
	// Todo: doc
	// Todo: original has union
	[CRepr]
	public struct BufferShaderResourceView
	{
		public UINT FirstElement;
		public UINT NumElements;
		/*union 
		    {
		    UINT FirstElement;
		    UINT ElementOffset;
		    } 	;
		union 
		    {
		    UINT NumElements;
		    UINT ElementWidth;
		    } 	;*/
	}

	/**
	 * Describes the elements in a raw buffer resource to use in a shader-resource view.
	 * D3D11_BUFFEREX_SRV
	 */
	[CRepr]
	public struct BufferExShaderResourceView
	{
		/// The index of the first element to be accessed by the view.
		public uint32 FirstElement;
		/// The number of elements in the resource.
		public uint32 NumElements;
		/**
		 * Flags that identifies view options for the buffer.
		 * Currently, the only option is to identify a raw view of the buffer.
		 */
		public BufferExShaderResourceViewFlags Flags;
	}

	/**
	 * Specifies the subresource from a 1D texture to use in a shader-resource view.
	 * D3D11_TEX1D_SRV
	 */
	[CRepr]
	public struct Texture1DShaderResourceView
	{
		/**
		 * Index of the most detailed mipmap level to use;
		 * this number is between 0 and MipLevels (from the original Texture1D for which ID3D11Device::CreateShaderResourceView creates a view) -1.
		 */
		public uint32 MostDetailedMip;
		/**
		 * The maximum number of mipmap levels for the view of the texture. See the remarks.
		 *
		 * Set to -1 to indicate all the mipmap levels from MostDetailedMip on down to least detailed.
		 */
		public uint32 MipLevels;
	}

	/**
	 * Specifies the subresources from an array of 1D textures to use in a shader-resource view.
	 * D3D11_TEX1D_ARRAY_SRV
	 */
	[CRepr]
	public struct Texture1DArrayShaderResourceView
	{
		/**
		 * Index of the most detailed mipmap level to use;
		 * this number is between 0 and MipLevels (from the original Texture1D for which ID3D11Device::CreateShaderResourceView creates a view) -1.
		 */
		public uint32 MostDetailedMip;
		/**
		 * The maximum number of mipmap levels for the view of the texture. See the remarks in D3D11_TEX1D_SRV.
		 *
		 * Set to -1 to indicate all the mipmap levels from MostDetailedMip on down to least detailed.
		 */
		public uint32 MipLevels;
		/// The index of the first texture to use in an array of textures.
		public uint32 FirstArraySlice;
		/// Number of textures in the array.
		public uint32 ArraySize;
	}

	/**
	 * Specifies the subresource from a 2D texture to use in a shader-resource view.
	 * D3D11_TEX2D_SRV
	 */
	[CRepr]
	public struct Texture2DShaderResourceView
	{
		/**
		 * Index of the most detailed mipmap level to use;
		 * this number is between 0 and MipLevels (from the original Texture2D for which ID3D11Device::CreateShaderResourceView creates a view) -1.
		 */
		public UINT MostDetailedMip;
		/**
		 * The maximum number of mipmap levels for the view of the texture. See the remarks in D3D11_TEX1D_SRV.
		 * 
		 * Set to -1 (UINT.MaxValue) to indicate all the mipmap levels from MostDetailedMip on down to least detailed.
		 */
		public UINT MipLevels;
	}

	/**
	 * Specifies the subresources from an array of 2D textures to use in a shader-resource view.
	 * D3D11_TEX2D_ARRAY_SRV
	 */
	[CRepr]
	public struct Texture2DArrayShaderResourceView
	{
		/**
		 * Index of the most detailed mipmap level to use; this number is between 0 and MipLevels
		 * (from the original Texture2D for which ID3D11Device::CreateShaderResourceView creates a view) -1.
		 */
		public UINT MostDetailedMip;
		/**
		 * The maximum number of mipmap levels for the view of the texture.
		 *
		 * Set to -1 (UINT.MaxValue) to indicate all the mipmap levels from MostDetailedMip on down to least detailed.
		 */
		public UINT MipLevels;
		/// The index of the first texture to use in an array of textures.
		public UINT FirstArraySlice;
		/// Number of textures in the array.
		public UINT ArraySize;
	}

	/**
	 * Specifies the subresources from a 3D texture to use in a shader-resource view.
	 * D3D11_TEX3D_SRV
	 */
	[CRepr]
	public struct Texture3DShaderResourceView
	{
		/**
		 * Index of the most detailed mipmap level to use;
		 * this number is between 0 and MipLevels (from the original Texture3D for which ID3D11Device::CreateShaderResourceView creates a view) -1.
		 */
		public uint32 MostDetailedMip;
		/**
		 * The maximum number of mipmap levels for the view of the texture.
		 *
		 * Set to -1 to indicate all the mipmap levels from MostDetailedMip on down to least detailed.
		 */
		public uint32 MipLevels;
	}

	/**
	 * Specifies the subresource from a cube texture to use in a shader-resource view.
	 * D3D11_TEXCUBE_SRV
	 */
	[CRepr]
	public struct TextureCubeShaderResourceView
	{
		/**
		 * Index of the most detailed mipmap level to use;
		 * this number is between 0 and MipLevels (from the original TextureCube for which ID3D11Device::CreateShaderResourceView creates a view) -1.
		 */
		public uint32 MostDetailedMip;
		/**
		 * The maximum number of mipmap levels for the view of the texture. See the remarks in D3D11_TEX1D_SRV.
		 *
		 * Set to -1 to indicate all the mipmap levels from MostDetailedMip on down to least detailed.
		 */
		public uint32 MipLevels;
	}

	/**
	 * Specifies the subresources from an array of cube textures to use in a shader-resource view.
	 * D3D11_TEXCUBE_ARRAY_SRV
	 */
	[CRepr]
	public struct TextureCubeArrayShaderResourceView
	{
		/**
		 * Index of the most detailed mipmap level to use;
		 * this number is between 0 and MipLevels (from the original TextureCube for which ID3D11Device::CreateShaderResourceView creates a view) -1.
		 */
		public uint32 MostDetailedMip;
		/**
		 * The maximum number of mipmap levels for the view of the texture. See the remarks in D3D11_TEX1D_SRV.
		 *
		 * Set to -1 to indicate all the mipmap levels from MostDetailedMip on down to least detailed.
		 */
		public uint32 MipLevels;
		/// Index of the first 2D texture to use.
		public uint32 First2DArrayFace;
		/// Number of cube textures in the array.
		public uint32 NumCubes;
	}

	/**
	 * Specifies the subresources from a multisampled 2D texture to use in a shader-resource view.
	 * D3D11_TEX2DMS_SRV
	 */
	[CRepr]
	public struct Texture2DMutlisampledShaderResourceView
	{
		/**
		 * Integer of any value.
		 * Since a multisampled 2D texture contains a single subresource, there is actually nothing to specify in D3D11_TEX2DMS_RTV.
		 * Consequently, UnusedField_NothingToDefine is included so that this structure will compile in C.
		 */
		private uint32 UnusedField_NothingToDefine;
	}

	/**
	 * Specifies the subresources from an array of multisampled 2D textures to use in a shader-resource view.
	 * D3D11_TEX2DMS_ARRAY_SRV
	 */
	[CRepr]
	public struct Texture2DMultisampledArrayShaderResourceView
	{
		/// The index of the first texture to use in an array of textures.
		public uint32 FirstArraySlice;
		/// Number of textures to use.
		public uint32 ArraySize;
	}
}