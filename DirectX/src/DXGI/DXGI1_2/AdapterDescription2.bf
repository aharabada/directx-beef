using System;
using DirectX.Common;

namespace DirectX.DXGI.DXGI1_2
{
	/**
	 * Describes an adapter (or video card) that uses Microsoft DirectX Graphics Infrastructure (DXGI) 1.2.
	*/
	[CRepr]
	public struct AdapterDescription2
	{
		/**
		 * A string that contains the adapter description.
		*/
		public char16[128] Description;
		/**
		 * The PCI ID of the hardware vendor.
		*/
		public UINT VendorId;
		/**
		 * The PCI ID of the hardware device.
		*/
		public UINT DeviceId;
		/**
		 * The PCI ID of the sub system.
		*/
		public UINT SubSysId;
		/**
		 * The PCI ID of the revision number of the adapter.
		*/
		public UINT Revision;
		/**
		 * The number of bytes of dedicated video memory that are not shared with the CPU.
		*/
		public SIZE_T DedicatedVideoMemory;
		/**
		 * The number of bytes of dedicated system memory that are not shared with the CPU.
		 * This memory is allocated from available system memory at boot time.
		*/
		public SIZE_T DedicatedSystemMemory;
		/**
		 * The number of bytes of shared system memory.
		 * This is the maximum value of system memory that may be consumed by the adapter during operation.
		 * Any incidental memory consumed by the driver as it manages and uses video memory is additional.
		*/
		public SIZE_T SharedSystemMemory;
		/**
		 * A unique value that identifies the adapter.
		*/
		public Luid AdapterLuid;
		/**
		 * A value of the AdapterFlags enumerated type that describes the adapter type.
		*/
		public AdapterFlags Flags;
		/**
		 * A value of the GraphicsPreemtionGranularity enumerated type that describes the granularity level at which the GPU can be preempted from performing its current graphics rendering task.
		*/
		public GraphicsPreemtionGranularity GraphicsPreemptionGranularity;
		/**
		 * A value of the ComputePreemtionGranularity enumerated type that describes the granularity level at which the GPU can be preempted from performing its current compute task.
		*/
		public ComputePreemtionGranularity ComputePreemptionGranularity;
	}
}
