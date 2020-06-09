using System;
using DirectX.Common;
using DirectX.DXGI.DXGI1_2;

namespace DirectX.DXGI
{
	public struct IDXGIFactory2 : IDXGIFactory1, IComObject
	{
		public static new Guid IID => .("50c83a1c-e072-4c48-87b0-3630fa36a6d0");
		
		public struct VTable : IDXGIFactory1.VTable
		{
			public function bool(IDXGIFactory2* self) IsWindowStereoEnabled;
			public function HResult(IDXGIFactory2* self, IUnknown* pDevice, Windows.Handle hwnd, SwapChainDescription1* pDesc,
				SwapChainFullscreenDescription* pFullscreenDesc, IDXGIOutput* pRestrictToOutput, IDXGISwapChain1** ppSwapChain) CreateSwapChainForHwnd;
			public function bool(IDXGIFactory2* self) bla0;
			public function bool(IDXGIFactory2* self) bla1;
			public function bool(IDXGIFactory2* self) bla2;
			public function bool(IDXGIFactory2* self) bla3;
			public function bool(IDXGIFactory2* self) bla4;
			public function bool(IDXGIFactory2* self) bla5;
			public function bool(IDXGIFactory2* self) bla6;
			public function bool(IDXGIFactory2* self) bla7;
			public function bool(IDXGIFactory2* self) bla8;
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
