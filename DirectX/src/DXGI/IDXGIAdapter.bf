using System;
using DirectX;
using DirectX.Common;

namespace DirectX.DXGI
{
	/**
	 * The IDXGIAdapter interface represents a display subsystem (including one or more GPUs, DACs and video memory).
	*/
	public struct IDXGIAdapter : IDXGIObject, IComObject
	{	 
		public static new Guid IID => .("2411e7e1-12ac-4ccf-bd14-9798e8534dc0");

		public struct VTable : IDXGIObject.VTable
		{
			public function [CallingConvention(.Stdcall)] HResult(IDXGIAdapter* self, UINT output, IDXGIOutput** ppOutput) EnumOutputs;
			public function [CallingConvention(.Stdcall)] HResult(IDXGIAdapter* self, AdapterDescription* ppOutput) GetDesc;
			public function [CallingConvention(.Stdcall)] HResult(IDXGIAdapter* self, Guid* interfaceName, LargerInteger *pUMDVersion) CheckInterfaceSupport;
		}

		public new VTable* VT
		{
			[Inline]
			get => (.)mVT;
		}

		/**
		 * Checks whether the system supports a device interface for a graphics component.
		 *
		 * @param guid			The GUID of the interface of the device version for which support is being checked.
		 * @param pUMDVersion	The user mode driver version of InterfaceName.
		 *						This is returned only if the interface is supported, otherwise this parameter will be NULL.
		*/
		public HResult CheckInterfaceSupport(Guid guid, LargerInteger *pUMDVersion) mut
		{
			Guid ruid = guid;
			return VT.CheckInterfaceSupport(&this, &ruid, pUMDVersion);
		}

		/**
		 * Enumerate adapter (video card) outputs.
		 *
		 * @param output	The index of the output.
		 * @param ppOutput	The address of a pointer to an IDXGIOutput interface at the position specified by the Output parameter.
		*/
		public HResult EnumOutputs(UINT output, IDXGIOutput **ppOutput) mut
		{
			return VT.EnumOutputs(&this, output, ppOutput);
		}

		/**
		 * Gets a DXGI 1.0 description of an adapter (or video card).
		 *
		 * @param desc	A reference to a AdapterDescription structure that describes the adapter.
		 *				On feature level 9 graphics hardware, GetDesc returns zeros for the PCI ID in the VendorId, DeviceId, SubSysId, and Revision members of AdapterDescription and “Software Adapter” for the description string in the Description member.
		*/
		public HResult GetDescription(out AdapterDescription desc) mut
		{
			desc = ?;
			return VT.GetDesc(&this, &desc);
		}
	}
}