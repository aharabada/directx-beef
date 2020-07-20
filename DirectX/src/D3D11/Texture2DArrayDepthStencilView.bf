using System;

namespace DirectX.D3D11
{
	/**
	Specifies the subresources from an array 2D textures that are accessible to a depth-stencil view.
	D3D11_TEX2D_ARRAY_DSV
	*/
	[CRepr]
	public struct Texture2DArrayDepthStencilView
	{
		/**
		The index of the first mipmap level to use.
		*/
		public uint32 MipSlice;
		/**
		The index of the first texture to use in an array of textures.
		*/
		public uint32 FirstArraySlice;
		/**
		Number of textures to use.
		*/
		public uint32 ArraySize;
	}
}
