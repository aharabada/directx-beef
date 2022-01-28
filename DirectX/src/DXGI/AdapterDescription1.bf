using System;
using DirectX.Common;

namespace DirectX.DXGI
{
	[CRepr]
	public struct AdapterDescription1 // DXGI_ADAPTER_DESC1
	{
		public char16[128] Description; //WCHAR[128]
		public uint32 VendorId;
		public uint32 DeviceId;
		public uint32 SubSysId;
		public uint32 Revision;
		public SIZE_T DedicatedVideoMemory;
		public SIZE_T DedicatedSystemMemory;
		public SIZE_T SharedSystemMemory;
		public Luid AdapterLuid;
		public AdapterFlags Flags;
	}
}
