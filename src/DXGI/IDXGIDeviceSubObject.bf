using System;
using DirectX.Common;

namespace DirectX.DXGI
{
	/**
	 * Inherited from objects that are tied to the device so that they can retrieve a pointer to it.
	*/
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
			get => (.)mVT;
		}

		/**
		 * Retrieves the device.
		 *
		 * @param iid 		The id for the device.
		 * @param ppDevice	The address of a pointer to the device.
		*/
		public HResult GetDevice(Guid iid, void **ppDevice) mut
		{
			Guid riid = iid;
			return VT.GetDevice(&this, &riid, ppDevice);
		}
	}
}
