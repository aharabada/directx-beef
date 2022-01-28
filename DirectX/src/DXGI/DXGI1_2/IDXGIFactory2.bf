using System;
using DirectX.Common;
using DirectX.DXGI.DXGI1_2;
using DirectX.Windows;

namespace DirectX.DXGI
{
	/**
	 * The IDXGIFactory2 interface includes methods to create a newer version swap chain with more features than IDXGISwapChain and to monitor stereoscopic 3D capabilities.
	*/
	public struct IDXGIFactory2 : IDXGIFactory1, IComObject
	{
		public static new Guid IID => .("50c83a1c-e072-4c48-87b0-3630fa36a6d0");
		
		public struct VTable : IDXGIFactory1.VTable
		{
			public function [CallingConvention(.Stdcall)] BOOL(IDXGIFactory2* self) IsWindowStereoEnabled;
			public function [CallingConvention(.Stdcall)] HResult(IDXGIFactory2* self, IUnknown* pDevice, Windows.HWnd hwnd, SwapChainDescription1* pDesc,
				SwapChainFullscreenDescription* pFullscreenDesc, IDXGIOutput* pRestrictToOutput, IDXGISwapChain1** ppSwapChain) CreateSwapChainForHwnd;
			public function [CallingConvention(.Stdcall)] HResult(IDXGIFactory2* self, IUnknown *pDevice, IUnknown *pWindow, SwapChainDescription1 *pDesc, IDXGIOutput *pRestrictToOutput, IDXGISwapChain1 **ppSwapChain) CreateSwapChainForCoreWindow;
			public function [CallingConvention(.Stdcall)] HResult(IDXGIFactory2* self, Windows.Handle hResource, Luid *pLuid) GetSharedResourceAdapterLuid;
			public function [CallingConvention(.Stdcall)] HResult(IDXGIFactory2* self, Windows.Handle windowHandle, UINT wMsg, DWORD *pdwCookie) RegisterStereoStatusWindow;
			public function [CallingConvention(.Stdcall)] HResult(IDXGIFactory2* self, Windows.Handle hEvent, DWORD *pdwCookie) RegisterStereoStatusEvent;
			public function [CallingConvention(.Stdcall)] void(IDXGIFactory2* self, DWORD dwCookie) UnregisterStereoStatus;
			public function [CallingConvention(.Stdcall)] HResult(IDXGIFactory2* self, Windows.Handle windowHandle, UINT wMsg, DWORD *pdwCookie) RegisterOcclusionStatusWindow;
			public function [CallingConvention(.Stdcall)] HResult(IDXGIFactory2* self, Windows.Handle hEvent, DWORD *pdwCookie) RegisterOcclusionStatusEvent;
			public function [CallingConvention(.Stdcall)] void(IDXGIFactory2* self, DWORD dwCookie) UnregisterOcclusionStatus;
			public function [CallingConvention(.Stdcall)] HResult(IDXGIFactory2* self, IUnknown *pDevice, SwapChainDescription1 *pDesc, IDXGIOutput *pRestrictToOutput, IDXGISwapChain1 **ppSwapChain) CreateSwapChainForComposition;
		}

		public new VTable* VT
		{
			[Inline]
			get => (.)mVT;
		}

		/**
		 * Creates a swap chain that you can use to send Direct3D content into the DirectComposition API or the Windows.UI.Xaml framework to compose in a window.
		 *
		 * @param device			For Direct3D 11, and earlier versions of Direct3D, this is a pointer to the Direct3D device for the swap chain.
		 *							For Direct3D 12 this is a pointer to a direct command queue (refer to ID3D12CommandQueue).
		 *							This parameter cannot be NULL.
		 *							Software drivers, like D3D_DRIVER_TYPE_REFERENCE, are not supported for composition swap chains.
		 * @param desc				A reference to a SwapChainDescription1 structure for the swap-chain description.
		 * 							You must specify the DXGI_SWAP_EFFECT_FLIP_SEQUENTIAL value in the SwapEffect member of SwapChainDescription1 because CreateSwapChainForComposition supports only flip presentation model.
		 *							You must also specify the DXGI_SCALING_STRETCH value in the Scaling member of SwapChainDescription1.
		 * @param restrictToOutput	A pointer to the IDXGIOutput interface for the output to restrict content to.
		 *							You must also pass the DXGI_PRESENT_RESTRICT_TO_OUTPUT flag in a IDXGISwapChain1::Present1 call to force the content to appear blacked out on any other output.
		 *							If you want to restrict the content to a different output, you must create a new swap chain.
		 *							However, you can conditionally restrict content based on the DXGI_PRESENT_RESTRICT_TO_OUTPUT flag.
		 *							Set this parameter to NULL if you don't want to restrict content to an output target.
		 * @param swapChain			A pointer to a variable that receives a pointer to the IDXGISwapChain1 interface for the swap chain that CreateSwapChainForComposition creates.
		*/
		public HResult CreateSwapChainForComposition(IUnknown *device, ref SwapChainDescription1 desc, IDXGIOutput *restrictToOutput, IDXGISwapChain1 **swapChain) mut
		{
			return VT.CreateSwapChainForComposition(&this, device, &desc, restrictToOutput, swapChain);
		}

		/**
		 * Creates a swap chain that is associated with the CoreWindow object for the output window for the swap chain.
		 *
		 * @param device			For Direct3D 11, and earlier versions of Direct3D, this is a pointer to the Direct3D device for the swap chain.
		 *							For Direct3D 12 this is a pointer to a direct command queue (refer to ID3D12CommandQueue). This parameter cannot be NULL.
		 * @param window			A pointer to the CoreWindow object that is associated with the swap chain that CreateSwapChainForCoreWindow creates.
		 * @param desc				A reference to a SwapChainDescription1 for the swap-chain description.
		 * @param restrictToOutput	A pointer to the IDXGIOutput interface that the swap chain is restricted to.
		 *							If the swap chain is moved to a different output, the content is black.
		 *							You can optionally set this parameter to an output target that uses DXGI_PRESENT_RESTRICT_TO_OUTPUT to restrict the content on this output.
		 *							If you do not set this parameter to restrict content on an output target, you can set it to NULL.
		 * @param swapChain			A pointer to a variable that receives a pointer to the IDXGISwapChain1 interface for the swap chain that CreateSwapChainForCoreWindow creates.
		*/
		public HResult CreateSwapChainForCoreWindow(IUnknown *device, IUnknown *window, ref SwapChainDescription1 desc, IDXGIOutput *restrictToOutput, IDXGISwapChain1 **swapChain) mut
		{
			return VT.CreateSwapChainForCoreWindow(&this, device, window, &desc, restrictToOutput, swapChain);
		}

		/**
		 * Creates a swap chain that is associated with the CoreWindow object for the output window for the swap chain.
		 *
		 * @param device			For Direct3D 11, and earlier versions of Direct3D, this is a pointer to the Direct3D device for the swap chain.
		 *							For Direct3D 12 this is a pointer to a direct command queue (refer to ID3D12CommandQueue).
		 *							This parameter cannot be NULL.
		 * @param windowHandle		The window handle that is associated with the swap chain that CreateSwapChainForHwnd creates.
		 *							This parameter cannot be NULL.
		 * @param desc				A reference to a SwapChainDescription1 structure for the swap-chain description.
		 * @param fullscreenDesc	A reference to a SwapChainFullscreenDescription structure for the description of a full-screen swap chain.
		 *							You can optionally set this parameter to create a full-screen swap chain. Set it to NULL to create a windowed swap chain.
		 * @param restrictToOutput	A pointer to the IDXGIOutput interface for the output to restrict content to.
		 *							Set this parameter to NULL if you don't want to restrict content to an output target.
		 * @param swapChain			A pointer to a variable that receives a pointer to the IDXGISwapChain1 interface for the swap chain that CreateSwapChainForHwnd creates.
		*/
		public HResult CreateSwapChainForHwnd(IUnknown* device, Windows.HWnd windowHandle, ref SwapChainDescription1 desc, SwapChainFullscreenDescription *fullscreenDesc, IDXGIOutput *restrictToOutput, IDXGISwapChain1 **swapChain) mut
		{
			return VT.CreateSwapChainForHwnd(&this, device, windowHandle, &desc, fullscreenDesc, restrictToOutput, swapChain);
		}

		/**
		 * Identifies the adapter on which a shared resource object was created.
		 *
		 * @param resourceHandle	A handle to a shared resource object.
		 *							The IDXGIResource1::CreateSharedHandle method returns this handle.
		 * @param lud				A reference to a variable that receives a locally unique identifier (LUID) value that identifies the adapter.
		*/
		public HResult GetSharedResourceAdapterLuid(Windows.Handle resourceHandle, out Luid luid) mut
		{
			luid = ?;
			return VT.GetSharedResourceAdapterLuid(&this, resourceHandle, &luid);
		}

		/**
		 * Determines whether to use stereo mode.
		 *
		 * @return	Indicates whether to use stereo mode.
		 *			TRUE indicates that you can use stereo mode; otherwise, FALSE.
		*/
		public BOOL IsWindowStereoEnabled() mut
		{
			return VT.IsWindowStereoEnabled(&this);
		}

		/**
		 * Registers to receive notification of changes in occlusion status by using event signaling.
		 *
		 * @param eventHandle	A handle to the event object that the operating system sets when notification of occlusion status change occurs.
		 *						The CreateEvent or OpenEvent function returns this handle.
		 * @param cookie		A pointer to a key value that an application can pass to the IDXGIFactory2::UnregisterOcclusionStatus method to unregister the notification event that eventHandle specifies.
		*/
		public HResult RegisterOcclusionStatusEvent(Windows.Handle eventHandle, DWORD *cookie) mut
		{
			return VT.RegisterOcclusionStatusEvent(&this, eventHandle, cookie);
		}

		/**
		 * Registers an application window to receive notification messages of changes of occlusion status.
		 *
		 * @param windowHandle	The handle of the window to send a notification message to when occlusion status change occurs.
		 * @param wMsg			Identifies the notification message to send.
		 * @param cookie		A pointer to a key value that an application can pass to the IDXGIFactory2::UnregisterOcclusionStatus method to unregister the notification message that wMsg specifies.
		*/
		public HResult RegisterOcclusionStatusWindow(Windows.Handle windowHandle, UINT wMsg, DWORD *cookie) mut
		{
			return VT.RegisterOcclusionStatusWindow(&this, windowHandle, wMsg, cookie);
		}

		/**
		 * Registers to receive notification of changes in stereo status by using event signaling.
		 *
		 * @param eventHandle	A handle to the event object that the operating system sets when notification of stereo status change occurs.
		 *						The CreateEvent or OpenEvent function returns this handle.
		 * @param cookie		A pointer to a key value that an application can pass to the IDXGIFactory2::UnregisterStereoStatus method to unregister the notification event that eventHandle specifies.
		*/
		public HResult RegisterStereoStatusEvent(Windows.Handle eventHandle, DWORD *cookie) mut
		{
			return VT.RegisterStereoStatusEvent(&this, eventHandle, cookie);
		}

		/**
		 * Registers an application window to receive notification messages of changes of stereo status.
		 *
		 * @param windowHandle	The handle of the window to send a notification message to when stereo status change occurs.
		 * @param wMsg			Identifies the notification message to send.
		 * @param cookie		A pointer to a key value that an application can pass to the IDXGIFactory2::UnregisterStereoStatus method to unregister the notification message that wMsg specifies.
		*/
		public HResult RegisterStereoStatusWindow(Windows.Handle windowHandle, UINT wMsg, DWORD *cookie) mut
		{
			return VT.RegisterStereoStatusWindow(&this, windowHandle, wMsg, cookie);
		}

		/**
		 * Unregisters a window or an event to stop it from receiving notification when occlusion status changes.
		 *
		 * @param cookie	A key value for the window or event to unregister.
		 *					The IDXGIFactory2::RegisterOcclusionStatusWindow or IDXGIFactory2::RegisterOcclusionStatusEvent method returns this value.
		*/
		public void UnregisterOcclusionStatus(DWORD cookie) mut
		{
			VT.UnregisterOcclusionStatus(&this, cookie);
		}

		/**
		 * Unregisters a window or an event to stop it from receiving notification when stereo status changes.
		 *
		 * @param cookie	A key value for the window or event to unregister.
		 *					The IDXGIFactory2::RegisterStereoStatusWindow or IDXGIFactory2::RegisterStereoStatusEvent method returns this value.
		*/
		public void UnregisterStereoStatus(DWORD cookie) mut
		{
			VT.UnregisterStereoStatus(&this, cookie);
		}
	}
}
