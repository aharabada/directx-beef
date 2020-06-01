using System;

namespace DirectX.D3D11
{
	[CRepr]
	public struct D3D11_TEX1D_ARRAY_RTV
	{
		public uint32 MipSlice;
		public uint32 FirstArraySlice;
		public uint32 ArraySize;
	}
}
