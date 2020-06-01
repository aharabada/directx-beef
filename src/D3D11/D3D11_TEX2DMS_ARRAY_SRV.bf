using System;

namespace DirectX.D3D11
{
	[CRepr]
	public struct D3D11_TEX2DMS_ARRAY_SRV
	{
		public uint32 FirstArraySlice;
		public uint32 ArraySize;
	}
}
