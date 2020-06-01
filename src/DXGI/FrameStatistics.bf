using System;
using DirectX.Common;

namespace DirectX.DXGI
{
	[CRepr]
	public struct FrameStatistics // DXGI_FRAME_STATISTICS
	{
		public uint32 PresentCount;
		public uint32 PresentRefreshCount;
		public uint32 SyncRefreshCount;
		public LargerInteger SyncQPCTime; // LARGE_INTEGER
		public LargerInteger SyncGPUTime; // LARGE_INTEGER
	}
}
