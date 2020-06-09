using System;
using DirectX.Common;

namespace DirectX.DXGI
{
	public struct IDXGIFactory1 : IDXGIFactory, IComObject
	{
		public static new Guid IID => .("770aae78-f26f-4dba-a829-253c83d1b387");

		public struct VTable : IDXGIFactory.VTable
		{
			public function HResult(IDXGIFactory1* self, uint32 adapter, IDXGIAdapter1** ppAdapter) EnumAdapters1; 
			public function bool(IDXGIFactory1* self) IsCurrent;
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
