using System;
using DirectX.Common;

namespace DirectX.DXGI
{
	public struct IDXGISwapChain : IDXGIDeviceSubObject, IComObject
	{
		/**
		DXGI_MAX_SWAP_CHAIN_BUFFERS
		*/
		public static readonly int MaxSwapChainBuffers = 16;

		public static new Guid IID => .("310d36a0-d2e7-4c0a-aa04-6a9d23b8886a");

		public struct VTable : IDXGIDeviceSubObject.VTable
		{
			public function HResult(IDXGISwapChain* self, uint32 syncInterval, PresentFlags flags) Present;
			public function HResult(IDXGISwapChain* self, uint32 buffer, Guid* riid, void **ppSurface) GetBuffer;
			public function HResult(IDXGISwapChain* self, bool fullscreen, IDXGIOutput* pTarget) SetFullscreenState;
			public function HResult(IDXGISwapChain* self, bool* fullscreen, IDXGIOutput** pTarget) GetFullscreenState;
			public function HResult(IDXGISwapChain* self, SwapChainDescription* pDesc) GetDesc;
			public function HResult(IDXGISwapChain* self, uint32 bufferCount, uint32 width, uint32 height,
				Format format, SwapChainFlags flags) ResizeBuffers;
			public function HResult(IDXGISwapChain* self, ModeDescription* pNewTargetParameters) ResizeTarget;
			public function HResult(IDXGISwapChain* self, IDXGIOutput** ppOutput) GetContainingOutput;
			public function HResult(IDXGISwapChain* self, FrameStatistics* pStats) GetFrameStatistics;
			public function HResult(IDXGISwapChain* self, uint* pLastPresentCount) GetLastPresentCount;
		}

		public new VTable* VT
		{
			[Inline]
			get
			{
				return (.)mVT; 
			}
		}

		public HResult Present(uint32 syncInterval, PresentFlags presentFlags) mut
		{
			return VT.Present(&this, syncInterval, presentFlags);
		}

		/**
		Accesses one of the swap-chain's back buffers.
		@param buffer A zero-based buffer index.
		@param iid The type of interface used to manipulate the buffer.
		@param surface A pointer to a back-buffer interface.
		*/
		public HResult GetBuffer(uint32 buffer, Guid iid, void **surface) mut
		{
			Guid guid = iid;
			return VT.GetBuffer(&this, buffer, &guid, surface);
		}

		public HResult GetDescription(out SwapChainDescription desc) mut
		{
			desc = ?;
			return VT.GetDesc(&this, &desc);
		}
	}
}
