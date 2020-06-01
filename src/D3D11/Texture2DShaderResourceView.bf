using System;

namespace DirectX.D3D11
{
	/**
	Specifies the subresource from a 2D texture to use in a shader-resource view.
	D3D11_TEX2D_SRV
	*/
	[CRepr]
	public struct Texture2DShaderResourceView
	{
		/**
		Index of the most detailed mipmap level to use;
		this number is between 0 and MipLevels (from the original Texture2D for which ID3D11Device::CreateShaderResourceView creates a view) -1.
		*/
		public UINT MostDetailedMip;
		/**
		The maximum number of mipmap levels for the view of the texture. See the remarks in D3D11_TEX1D_SRV.

		Set to -1 (UINT.MaxValue) to indicate all the mipmap levels from MostDetailedMip on down to least detailed.
		*/
		public UINT MipLevels;
	}
}
