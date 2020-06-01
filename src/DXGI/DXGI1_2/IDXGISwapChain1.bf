using System;
using DirectX.Common;

namespace DirectX.DXGI.DXGI1_2
{
	public struct IDXGISwapChain1 : IDXGISwapChain, IComObject
	{
		public static new Guid IID => .("790a45f7-0d42-4876-983a-0a55cfe6f4aa");
		
		public struct VTable : IDXGISwapChain.VTable
		{
			// Todo: add missing functions
			private function HResult(IDXGISwapChain1* self) GetDesc1;
			private function HResult(IDXGISwapChain1* self) GetFullscreenDesc;
			private function HResult(IDXGISwapChain1* self) GetHwnd;
			private function HResult(IDXGISwapChain1* self) GetCoreWindow; 
			public function HResult(IDXGISwapChain1* self, uint32 syncInterval, PresentFlags presentFlags, PresentParameters *pPresentParameters) Present1;
			private function HResult(IDXGISwapChain1* self) IsTemporaryMonoSupported;
			private function HResult(IDXGISwapChain1* self) GetRestrictToOutput;
			private function HResult(IDXGISwapChain1* self) SetBackgroundColor;
			private function HResult(IDXGISwapChain1* self) GetBackgroundColor;
			private function HResult(IDXGISwapChain1* self) SetRotation;
			private function HResult(IDXGISwapChain1* self) GetRotation;
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
