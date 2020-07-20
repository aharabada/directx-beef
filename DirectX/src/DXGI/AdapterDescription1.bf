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
		public uint64 DedicatedVideoMemory; // SIZE_T
		public uint64 DedicatedSystemMemory; // SIZE_T
		public uint64 SharedSystemMemory; // SIZE_T
		public Luid AdapterLuid;
		public AdapterFlags Flags;
	}
}
