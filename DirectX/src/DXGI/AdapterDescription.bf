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
		SIZE_T DedicatedVideoMemory;
		SIZE_T DedicatedSystemMemory;
		SIZE_T SharedSystemMemory;
		Luid AdapterLuid;
	}
}
