using System;

namespace DirectX.D3D11.SDKLayers
{
	[CRepr]
	public struct InfoQueueFilter
	{
		public InfoQueueFilterDescription AllowList;
		public InfoQueueFilterDescription DenyList;
	}
}
