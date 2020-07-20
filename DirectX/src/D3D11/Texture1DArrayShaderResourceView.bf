using System;

namespace DirectX.D3D11
{
	/**
	 * Specifies the subresources from an array of 1D textures to use in a shader-resource view.
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
		/**
		 * The index of the first texture to use in an array of textures.
		*/
		public uint32 FirstArraySlice;
		/**
		 * Number of textures in the array.
		*/
		public uint32 ArraySize;
	}
}
