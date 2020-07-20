using System;

namespace DirectX.D3D11
{
	/**
	Specifies the subresources from an array of 1D textures to use in a depth-stencil view.
	*/
	[CRepr]
	public struct D3D11_TEX1D_ARRAY_DSV
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
