using System;
using DirectX.Common;

namespace DirectX.DXGI
{
	public struct IDXGIObject : IUnknown, IComObject
	{
		public static new Guid IID => .("aec22fb8-76f3-4639-9be0-28eb43a67a2e");

		public struct VTable : IUnknown.VTable
		{
			public function HResult(IDXGIObject* self, ref Guid Name, uint32 DataSize, void* pData) SetPrivateData;

			public function HResult(IDXGIObject* self, ref Guid Name, Windows.COM_IUnknown* pUnknown) SetPrivateDataInterface;

			public function HResult(IDXGIObject* self, ref Guid Name, out uint32 pDataSize, void* pData) GetPrivateData;

			public function HResult(IDXGIObject* self, ref Guid Name, void** ppParent) GetParent;
		}

		public new VTable* VT
		{
			[Inline]
			get
			{
				return (.)mVT;
			}
		}

		public HResult GetParent(Guid name, void** ppParent) mut
		{
			Guid guid = name;

			return VT.GetParent(&this, ref guid, ppParent);
		}
	}
}
