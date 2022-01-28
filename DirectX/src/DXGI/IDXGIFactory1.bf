using System;
using DirectX.Common;

namespace DirectX.DXGI
{
	/**
	 * The IDXGIFactory1 interface implements methods for generating DXGI objects.
	*/
	public struct IDXGIFactory1 : IDXGIFactory, IComObject
	{
		public static new Guid IID => .("770aae78-f26f-4dba-a829-253c83d1b387");

		public struct VTable : IDXGIFactory.VTable
		{
			public function [CallingConvention(.Stdcall)] HResult(IDXGIFactory1* self, uint32 adapter, IDXGIAdapter1** ppAdapter) EnumAdapters1; 
			public function [CallingConvention(.Stdcall)] BOOL(IDXGIFactory1* self) IsCurrent;
		}

		public new VTable* VT
		{
			[Inline]
			get => (.)mVT;
		}

		/**
		 * Enumerates both adapters (video cards) with or without outputs.
		 *
		 * @param adapter	The index of the adapter to enumerate.
		 * @param pAdapter	The address of a pointer to an IDXGIAdapter1 interface at the position specified by the Adapter parameter.
		*/
		public HResult EnumAdapters1(uint32 adapter, out IDXGIAdapter1* pAdapter) mut
		{
			pAdapter = ?;
			return VT.EnumAdapters1(&this, adapter, &pAdapter);
		}

		/**
		 * Informs an application of the possible need to re-enumerate adapters.
		 *
		 * @return 	FALSE, if a new adapter is becoming available or the current adapter is going away. TRUE, no adapter changes.
		 * 			IsCurrent returns FALSE to inform the calling application to re-enumerate adapters.
		*/
		public BOOL IsCurrent() mut
		{
			return VT.IsCurrent(&this);
		}
	}
}
