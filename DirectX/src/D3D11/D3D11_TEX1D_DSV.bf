using System;

namespace DirectX.D3D11
{
	/**
	Specifies the subresource from a 1D texture that is accessible to a depth-stencil view.
	*/
	[CRepr]
	public struct D3D11_TEX1D_DSV
	{
		/**
		The index of the first mipmap level to use.
		*/
		public uint32 MipSlice;
	}
}
