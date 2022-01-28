using System;
using DirectX.Common;

namespace DirectX.DXGI.DXGI1_2
{
	/**
	 * Provides presentation capabilities that are enhanced from IDXGISwapChain.
	 * These presentation capabilities consist of specifying dirty rectangles and scroll rectangle to optimize the presentation.
	*/
	public struct IDXGISwapChain1 : IDXGISwapChain, IComObject
	{
		public static new Guid IID => .("790a45f7-0d42-4876-983a-0a55cfe6f4aa");
		
		public struct VTable : IDXGISwapChain.VTable
		{
			public function [CallingConvention(.Stdcall)] HResult(IDXGISwapChain1* self, SwapChainDescription1* pDesc) GetDesc1;
			public function [CallingConvention(.Stdcall)] HResult(IDXGISwapChain1* self, SwapChainFullscreenDescription* pDesc) GetFullscreenDesc;
			public function [CallingConvention(.Stdcall)] HResult(IDXGISwapChain1* self,  Windows.Handle* hwnd) GetHwnd;
			public function [CallingConvention(.Stdcall)] HResult(IDXGISwapChain1* self, Guid* guid, void **ppUnk) GetCoreWindow; 
			public function [CallingConvention(.Stdcall)] HResult(IDXGISwapChain1* self, uint32 syncInterval, PresentFlags presentFlags, PresentParameters *pPresentParameters) Present1;
			public function [CallingConvention(.Stdcall)] BOOL(IDXGISwapChain1* self) IsTemporaryMonoSupported;
			public function [CallingConvention(.Stdcall)] HResult(IDXGISwapChain1* self, IDXGIOutput **ppRestrictToOutput) GetRestrictToOutput;
			public function [CallingConvention(.Stdcall)] HResult(IDXGISwapChain1* self, ColorRGBA* pColor) SetBackgroundColor;
			public function [CallingConvention(.Stdcall)] HResult(IDXGISwapChain1* self, ColorRGBA* pColor) GetBackgroundColor;
			public function [CallingConvention(.Stdcall)] HResult(IDXGISwapChain1* self, ModeRotation rotation) SetRotation;
			public function [CallingConvention(.Stdcall)] HResult(IDXGISwapChain1* self, ModeRotation* pRotation) GetRotation;
		}

		public new VTable* VT
		{
			[Inline]
			get => (.)mVT;
		}

		/**
		 * Gets a description of the swap chain.
		 *
		 * @param desc	The structure that receives the swap chain description.
		*/
		public HResult GetDescription1(out SwapChainDescription1 desc) mut
		{
			desc = ?;
			return VT.GetDesc1(&this, &desc);
		}

		/**
		 * Gets a description of a full-screen swap chain.
		 *
		 * @param desc	The structure that receives the full-screen description.
		*/
		public HResult GetFullscreenDescription(out SwapChainFullscreenDescription desc) mut
		{
			desc = ?;
			return VT.GetFullscreenDesc(&this, &desc);
		}

		/**
		 * Retrieves the underlying window handle for this swap-chain object.
		 *
		 * @param hwnd The variable that receives the window handle for the swap-chain object.
		*/
		public HResult GetWindowHandle(out Windows.Handle hwnd) mut
		{
			hwnd = ?;
			return VT.GetHwnd(&this, &hwnd);
		}

		/**
		 * Retrieves the underlying CoreWindow object for this swap-chain object.
		 *
		 * @param guid	A pointer to the globally unique identifier (GUID) of the CoreWindow object that is referenced by the ppUnk parameter.
		 * @param ppUnk	A pointer to a variable that receives a pointer to the CoreWindow object.
		*/
		public HResult GetCoreWindow(Guid* guid, void **ppUnk) mut
		{
			// Todo: I have no clue how this method is supposed to work as I never worked with UWP
 			// Todo: this method takes a void** this screames for a generic implementation!
			// Todo: the guid is probably input? so we might consider passing a normal guid and reference a local copy
			return VT.GetCoreWindow(&this, guid, ppUnk);
		}

		/**
		 * Presents a frame on the display screen.
		 *
		 * @param syncInterval		An integer that specifies how to synchronize presentation of a frame with the vertical blank.
		 * @param presentFlags		The swap-chain presentation options.
		 * @param presentParameters The structure that describes updated rectangles and scroll information of the frame to present.
		*/
		public HResult Present1(uint32 syncInterval, PresentFlags presentFlags, ref PresentParameters presentParameters) mut
		{
			return VT.Present1(&this, syncInterval, presentFlags, &presentParameters);
		}

		/**
		 * Determines whether a swap chain supports “temporary mono.”
		 *
		 * @return Indicates whether to use the swap chain in temporary mono mode. TRUE indicates that you can use temporary-mono mode; otherwise, FALSE.
		*/
		bool IsTemporaryMonoSupported() mut
		{
			return VT.IsTemporaryMonoSupported(&this);
		}

		/**
		 * Gets the output (the display monitor) to which you can restrict the contents of a present operation.
		 *
		 * @param restrictToOutput	A pointer to a buffer that receives a pointer to the IDXGIOutput interface for the restrict-to output.
		*/
		public HResult GetRestrictToOutput(IDXGIOutput **restrictToOutput) mut
		{
			return VT.GetRestrictToOutput(&this, restrictToOutput);
		}

		/**
		 * Retrieves the background color of the swap chain.
		 *
		 * @param color	Receives the background color of the swap chain.
		*/
		public HResult GetBackgroundColor(out ColorRGBA color) mut
		{
			color = ?;
			return VT.GetBackgroundColor(&this, &color);
		}

		/**
		 * Changes the background color of the swap chain.
		 *
		 * @param colorThe background color of the swap chain.
		*/
		public HResult SetBackgroundColor(ColorRGBA color) mut
		{
			ColorRGBA rcolor = color;
			return VT.SetBackgroundColor(&this, &rcolor);
		}

		/**
		 * Gets the rotation of the back buffers for the swap chain.
		 *
		 * @param rotation	The variable that receives the rotation of the back buffers for the swap chain.
		*/
		public HResult GetRotation(out ModeRotation rotation) mut
		{
			rotation = ?;
			return VT.GetRotation(&this, &rotation);
		}

		/**
		 * Gets the rotation of the back buffers for the swap chain.
		 *
		 * @param rotation	The variable that receives the rotation of the back buffers for the swap chain.
		*/
		public HResult SetRotation(ModeRotation rotation) mut
		{
			return VT.SetRotation(&this, rotation);
		}
	}
}
