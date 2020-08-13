using System;

namespace DirectX.D3D11
{
	/**
	* Specifies the subresource from a 1D texture that is accessible to a depth-stencil view.
	 * D3D11_TEX1D_DSV
	*/
	[CRepr]
	public struct Texture1DDepthStencilView
	{
		/// The index of the first mipmap level to use.
		public uint32 MipSlice;
	}

	/**
	 * Specifies the subresources from an array of 1D textures to use in a depth-stencil view.
	 * D3D11_TEX1D_ARRAY_DSV
	 */
	[CRepr]
	public struct Texture1DArrayDepthStencilView
	{
		/// The index of the first mipmap level to use.
		public uint32 MipSlice;
		/// The index of the first texture to use in an array of textures.
		public uint32 FirstArraySlice;
		/// Number of textures to use.
		public uint32 ArraySize;
	}

	/**
	 * Specifies the subresource from a 2D texture that is accessible to a depth-stencil view.
	 * D3D11_TEX2D_DSV
	 */
	[CRepr]
	public struct Texture2DDepthStencilView
	{
		/// The index of the first mipmap level to use.
		public UINT MipSlice;
	}

	/**
	 * Specifies the subresources from an array 2D textures that are accessible to a depth-stencil view.
	 * D3D11_TEX2D_ARRAY_DSV
	*/
	[CRepr]
	public struct Texture2DArrayDepthStencilView
	{
		/// The index of the first mipmap level to use.
		public uint32 MipSlice;
		/// The index of the first texture to use in an array of textures.
		public uint32 FirstArraySlice;
		/// Number of textures to use.
		public uint32 ArraySize;
	}

	/**
	 * Specifies the subresource from a multisampled 2D texture that is accessible to a depth-stencil view.
	 * D3D11_TEX2DMS_DSV
	*/
	[CRepr]
	public struct Texture2DMultisampledDepthStencilView
	{
		/// Unused.
		private uint32 UnusedField_NothingToDefine;
	}

	/**
	 * Specifies the subresources from an array of multisampled 2D textures for a depth-stencil view.
	 * D3D11_TEX2DMS_ARRAY_DSV
	 */
	[CRepr]
	public struct Texture2DMultisampledArrayDepthStencilView
	{
		/// The index of the first texture to use in an array of textures.
		public uint32 FirstArraySlice;
		/// Number of textures to use.
		public uint32 ArraySize;
	}
}
