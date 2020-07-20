using System;
using DirectX;
using DirectX.Common;

namespace DirectX.DXGI
{
	/**
	 * The IDXGIAdapter1 interface represents a display sub-system (including one or more GPU's, DACs and video memory).
	*/
	public struct IDXGIAdapter1 : IDXGIAdapter, IComObject
	{	 
		public static new Guid IID => .("29038f61-3839-4626-91fd-086879011a05");
		
		public struct VTable : IDXGIAdapter.VTable
		{
			public function HResult(IDXGIAdapter1* self, AdapterDescription1 *pDesc)GetDesc1;
		}

		public new VTable* VT
		{
			[Inline]
			get => (.)mVT;
		}

		/**
		 * Gets a DXGI 1.1 description of an adapter (or video card).
		 *
		 * @param desc	A pointer to a AdapterDescription1 structure that describes the adapter.
		 *				On feature level 9 graphics hardware, GetDesc1 returns zeros for the PCI ID in the VendorId, DeviceId, SubSysId, and Revision members of AdapterDescription1 and “Software Adapter” for the description string in the Description member.
		*/
		public HResult GetDescription1(out AdapterDescription1 desc) mut
		{
			desc = ?;
			return VT.GetDesc1(&this, &desc);
		}
	}
}