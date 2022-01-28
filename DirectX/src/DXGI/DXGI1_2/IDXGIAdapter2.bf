using System;
using DirectX;
using DirectX.Common;

namespace DirectX.DXGI.DXGI1_2
{
	/**
	 * The IDXGIAdapter2 interface represents a display subsystem, which includes one or more GPUs, DACs, and video memory.
	*/
	public struct IDXGIAdapter2 : IDXGIAdapter1, IComObject
	{	 
		public static new Guid IID => .("0AA1AE0A-FA0E-4B84-8644-E05FF8E5ACB5");
		
		public struct VTable : IDXGIAdapter1.VTable
		{
			public function [CallingConvention(.Stdcall)] HResult(IDXGIAdapter2* self, AdapterDescription2 *pDesc) GetDesc2;
		}

		public new VTable* VT
		{
			[Inline]
			get => (.)mVT;
		}

		/**
		 * Gets a Microsoft DirectX Graphics Infrastructure (DXGI) 1.2 description of an adapter or video card.
		 * This description includes information about the granularity at which the graphics processing unit (GPU) can be preempted from performing its current task.
		 *
		 * @param desc	A reference to a AdapterDescription2 structure that describes the adapter.
		 *				On feature level 9 graphics hardware, earlier versions of GetDescription2 (GetDescription and GetDescription1) return zeros for the PCI ID in the VendorId,
		 *				DeviceId, SubSysId, and Revision members of the adapter description structure and “Software Adapter” for the description string in the Description member.
		 *				GetDescription2 returns the actual feature level 9 hardware values in these members.
		*/
		public HResult GetDescription2(out AdapterDescription2 desc) mut
		{
			desc = ?;
			return VT.GetDesc2(&this, &desc);
		}
	}
}