using System;
using DirectX;
using DirectX.Common;

namespace DirectX.DXGI
{
	public struct IDXGIAdapter : IDXGIObject, IComObject
	{	 
		public static new Guid IID => .("2411e7e1-12ac-4ccf-bd14-9798e8534dc0");

		public struct VTable : IDXGIObject.VTable
		{
			public function HResult(IDXGIAdapter* self, IDXGIOutput** ppOutput) EnumOutputs;
			public function HResult(IDXGIAdapter* self, AdapterDescription* ppOutput) GetDesc;
			public function HResult(IDXGIAdapter* self, Guid* InterfaceName, LargerInteger *pUMDVersion) CheckInterfaceSupport;
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