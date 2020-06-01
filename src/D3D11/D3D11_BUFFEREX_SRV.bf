using System;

namespace DirectX.D3D11
{
	[CRepr]
	public struct D3D11_BUFFEREX_SRV
	{
		public uint32 FirstElement;
		public uint32 NumElements;
		public D3D11_BUFFEREX_SRV_FLAG Flags;
	}
}
