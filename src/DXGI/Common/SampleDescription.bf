using System;

namespace DirectX.DXGI.Common
{
	[CRepr]
	public struct SampleDescription
	{
		public uint32 Count;
		public uint32 Quality;

		public this()
		{
			this = default;
		}

		public this(uint32 count, uint32 quality)
		{
			Count = count;
			Quality = quality;
		}
	}
}
