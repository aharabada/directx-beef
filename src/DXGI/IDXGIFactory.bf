using System;
using DirectX.Common;

namespace DirectX.DXGI
{
	public struct IDXGIFactory : IDXGIObject, IComObject
	{
		public static new Guid IID => .("7b7166ec-21c7-44ae-b21a-c9ae321ae369");
		
		public struct VTable : IDXGIObject.VTable
		{
			public function HResult(IDXGIFactory* self, uint adapter, IDXGIAdapter** ppAdapter) EnumAdapters;

			public function HResult(IDXGIFactory* self,	Windows.Handle windowHandle, WindowAssociationFlags falgs) MakeWindowAssociation;
 
			public function HResult(IDXGIFactory* self, Windows.Handle* pWindowHandle) GetWindowAssociation;

			public function HResult(IDXGIFactory* self, IUnknown* pDevice, SwapChainDescription* desc, IDXGISwapChain** ppSwapChain) CreateSwapChain;

			public function HResult(IDXGIFactory* self,	Windows.Handle modlue, IDXGIAdapter **ppAdapter) CreateSoftwareAdapter;
		}

		public new VTable* VT
		{
			[Inline]
			get
			{
				return (.)mVT;
			}
		}

		public HResult EnumAdapters(uint adapter, IDXGIAdapter** pAdapter) mut
		{
			return VT.EnumAdapters(&this, adapter, pAdapter);
		}

		public HResult CreateSwapChain(IUnknown* pDevice, ref SwapChainDescription desc, out IDXGISwapChain* swapChain) mut
		{
			return VT.CreateSwapChain(&this, pDevice, &desc, &(swapChain = ?));
		}
	}
}
