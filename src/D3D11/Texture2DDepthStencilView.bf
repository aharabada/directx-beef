using System;

namespace DirectX.D3D11
{
	/**
	Specifies the subresource from a 2D texture that is accessible to a depth-stencil view.
	D3D11_TEX2D_DSV
	*/
	[CRepr]
	public struct Texture2DDepthStencilView
	{
		/**
		The index of the first mipmap level to use.
		*/
		public UINT MipSlice;
	}
}
