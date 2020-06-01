using System;

namespace DirectX.D3D11
{
	[CRepr]
	public struct SubresourceData // D3D11_SUBRESOURCE_DATA
	{
		public void* pSysMem;
		public uint SysMemPitch;
		public uint SysMemSlicePitch;
	}
}
