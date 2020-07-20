using System;

namespace DirectX.D3D11
{
	/**
	Specifies the subresource from a 2D texture to use in a render-target view.
	D3D11_TEX2D_RTV
	*/
	[CRepr]
	public struct Texture2DRenderTargetView
	{
		/**
		The index of the mipmap level to use mip slice.
		*/
		public uint32 MipSlice;
	}
}
