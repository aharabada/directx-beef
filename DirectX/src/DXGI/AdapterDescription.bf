using System;
using DirectX.Common;

namespace DirectX.DXGI
{
	[CRepr]
	public struct AdapterDescription // DXGI_ADAPTER_DESC
	{
		char16[128] Description; //WCHAR[128]
 		uint32 VendorId;
		uint32 DeviceId;
		uint32 SubSysId;
		uint32 Revision;
		uint64 DedicatedVideoMemory; // SIZE_T
		uint64 DedicatedSystemMemory; // SIZE_T
		uint64 SharedSystemMemory; // SIZE_T
		Luid AdapterLuid;
	}
}
