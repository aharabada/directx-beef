using System;
using DirectX.Common;

namespace DirectX.DXGI
{	
	public struct IDXGIDeviceSubObject : IDXGIObject, IComObject
	{
		public static new Guid IID => .("3d3e0379-f9de-4d58-bb6c-18d62992f1a6");
		
		public struct VTable : IDXGIObject.VTable
		{
			public function HResult(IDXGIDeviceSubObject* self, Guid* riid, void** ppDevice) GetDevice;
		}

		public new VTable* VT
		{
			[Inline]
			get
			{
				return (.)mVT; 
			}
		}
	}
}
