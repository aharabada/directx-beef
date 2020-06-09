using System;
using DirectX.Common;

namespace DirectX.DXGI
{
	/**
	 * An IDXGISwapChain interface implements one or more surfaces for storing rendered data before presenting it to an output.
	*/
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
			public function HResult(IDXGISwapChain* self, uint32* pLastPresentCount) GetLastPresentCount;
		}

		public new VTable* VT
		{
			[Inline]
			get => (.)mVT;
		}

		//
		// Essential Methods
		//
		
		/**
		* Accesses one of the swap-chain's back buffers.
		*
		* @param buffer		A zero-based buffer index.
		* @param iid		The type of interface used to manipulate the buffer.
		* @param surface	A pointer to a back-buffer interface.
		* @return Returns one of the DXGI_ERROR-Codes.
		*/
		public HResult GetBuffer(uint32 buffer, Guid iid, void **surface) mut
		{
			Guid riid = iid;
			return VT.GetBuffer(&this, buffer, &riid, surface);
		}

		/**
		 * Get the output (the display monitor) that contains the majority of the client area of the target window.
		 *
		 * @param ppOutput	A pointer to the output interface (see IDXGIOutput).
		*/
		public HResult GetContainingOutput(IDXGIOutput **ppOutput) mut
		{
			return VT.GetContainingOutput(&this, ppOutput);
		}
		
		/**
		 * Get a description of the swap chain.
		 *
		 * @param desc	A pointer to the swap-chain description.
		*/
		public HResult GetDescription(out SwapChainDescription desc) mut
		{
			desc = ?;
			return VT.GetDesc(&this, &desc);
		}

		/**
		 * Gets performance statistics about the last render frame.
		 *
		 * @param stats	The structure for the frame statistics.
		*/
		public HResult GetFrameStatistics(out FrameStatistics stats) mut
		{
			stats = ?;
			return VT.GetFrameStatistics(&this, &stats);
		}

		/**
		 * Gets the number of times that IDXGISwapChain::Present or IDXGISwapChain1::Present1 has been called.
		 *
		 * @param lastPresentCount	The variable that receives the number of calls.
		*/
		public HResult GetLastPresentCount(out uint32 lastPresentCount) mut
		{
			lastPresentCount = ?;
			return VT.GetLastPresentCount(&this, &lastPresentCount);
		}

		/**
		 * Presents a rendered image to the user.
		 *
		 * @param syncInterval	An integer that specifies how to synchronize presentation of a frame with the vertical blank.
		 * @param presentFlags	The swapchain presentation options.
		*/
		public HResult Present(uint32 syncInterval, PresentFlags presentFlags) mut
		{
			return VT.Present(&this, syncInterval, presentFlags);
		}
		
		/**
		 * Sets the display state to windowed or full screen.
		 *
		 * @param fullscreen 	A Boolean value that specifies whether to set the display state to windowed or full screen.
		 *						TRUE for full screen, and FALSE for windowed.
		 * @param target		If you pass TRUE to the Fullscreen parameter to set the display state to full screen,
		 *						you can optionally set this parameter to a pointer to an IDXGIOutput interface for the output target that contains the swap chain.
		 *						If you set this parameter to NULL, DXGI will choose the output based on the swap-chain's device and the output window's placement.
		 *						If you pass FALSE to Fullscreen, you must set this parameter to NULL.
		*/
		public HResult SetFullscreenState(bool fullscreen, IDXGIOutput* target) mut
		{
			return VT.SetFullscreenState(&this, fullscreen, target);
		}

		/**
		 * Get the state associated with full-screen mode.
		 *
		 * @param fullscreen 	A Boolean value that specifies whether to set the display state to windowed or full screen.
		 *						TRUE for full screen, and FALSE for windowed.
		 * @param target		If you pass TRUE to the Fullscreen parameter to set the display state to full screen,
		 *						you can optionally set this parameter to a pointer to an IDXGIOutput interface for the output target that contains the swap chain.
		 *						If you set this parameter to NULL, DXGI will choose the output based on the swap-chain's device and the output window's placement.
		 *						If you pass FALSE to Fullscreen, you must set this parameter to NULL.
		*/
		public HResult GetFullscreenState(out bool fullscreen, out IDXGIOutput* target) mut
		{
			fullscreen = ?;
			target = ?;
			return VT.GetFullscreenState(&this, &fullscreen, &target);
		}

		/**
		 * Changes the swap chain's back buffer size, format, and number of buffers.
		 * This should be called when the application window is resized.
		 *
		 * @param bufferCount	The number of buffers in the swap chain (including all back and front buffers).
		 *						This number can be different from the number of buffers with which you created the swap chain.
		 *						This number can't be greater than DXGI_MAX_SWAP_CHAIN_BUFFERS.
		 *						Set this number to zero to preserve the existing number of buffers in the swap chain.
		 *						You can't specify less than two buffers for the flip presentation model.
		 * @param width			The new width of the back buffer.
		 * 						If you specify zero, DXGI will use the width of the client area of the target window.
		 * @param height		The new height of the back buffer.
		 *						If you specify zero, DXGI will use the height of the client area of the target window.
		 * @param newFormat		The new format of the back buffer.
		 *						Set this value to Format.Unknown to preserve the existing format of the back buffer.
		 * @param flags			A combination of SwapChainFlags that are combined by using a bitwise OR operation.
		 *						The resulting value specifies options for swap-chain behavior.
		*/
		public HResult ResizeBuffers(uint32 bufferCount, uint32 width, uint32 height, Format newFormat, SwapChainFlags flags) mut
		{
			return VT.ResizeBuffers(&this, bufferCount, width, height, newFormat, flags);
		}

		/**
		 * Resizes the output target.
		 *
		 * @param pNewTargetParameters	The new ModeDescription.
		*/
		public HResult ResizeTarget(ref ModeDescription newTargetParameters) mut
		{
			return VT.ResizeTarget(&this, &newTargetParameters);
		}

		//
		// Convenience Methods
		//

		/**
		* Accesses one of the swap-chain's back buffers.
		*
		* @param buffer		A zero-based buffer index.
		* @param iid		The type of interface used to manipulate the buffer.
		* @param surface	A pointer to a back-buffer interface.
		* @return Returns one of the DXGI_ERROR-Codes.
		*/
		public HResult GetBuffer<T>(uint32 buffer, out T* surface) mut where T : IUnknown, IComObject
		{
			surface = ?;
			Guid riid = T.IID;
			return VT.GetBuffer(&this, buffer, &riid, (void**)&surface);
		}
	}
}
