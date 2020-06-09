using System;
using DirectX;
using DirectX.Common;

namespace DirectX.DXGI
{
	public struct IDXGIAdapter1 : IComObject
	{	 
		public static Guid IID => .("29038f61-3839-4626-91fd-086879011a05");
		
		

		public struct VTable : IDXGIAdapter.VTable
		{
			public function HResult(IDXGIAdapter1* self, AdapterDescription1 *pDesc)GetDesc1;
		}

		protected VTable* mVT;
		public VTable* VT
		{
			get
			{
				return (.)mVT;
			}
		}

		public void Dispose() mut
		{
			mVT.Release((.)&this);
		}

		// Todo: use inheritance instead of casting
		[Inline]
		public IUnknown* ToIUnknown() mut
		{
			return (.)&this;
		}

		[Inline]
		public IDXGIObject* ToIDXGIObject() mut
		{
			return (IDXGIObject*)&this;
		}
	}
}