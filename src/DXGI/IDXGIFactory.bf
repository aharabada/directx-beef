using System;
using DirectX.Common;

namespace DirectX.DXGI
{
	/**
	 * An IDXGIFactory interface implements methods for generating DXGI objects (which handle full screen transitions).
	*/
	public struct IDXGIFactory : IDXGIObject, IComObject
	{
		public static new Guid IID => .("7b7166ec-21c7-44ae-b21a-c9ae321ae369");
		
		public struct VTable : IDXGIObject.VTable
		{
			public function HResult(IDXGIFactory* self, uint32 adapter, IDXGIAdapter** ppAdapter) EnumAdapters;
			public function HResult(IDXGIFactory* self,	Windows.HWnd windowHandle, WindowAssociationFlags falgs) MakeWindowAssociation;
			public function HResult(IDXGIFactory* self, Windows.HWnd* pWindowHandle) GetWindowAssociation;
			public function HResult(IDXGIFactory* self, IUnknown* pDevice, SwapChainDescription* desc, IDXGISwapChain** ppSwapChain) CreateSwapChain;
			public function HResult(IDXGIFactory* self,	Windows.HModule modlue, IDXGIAdapter **ppAdapter) CreateSoftwareAdapter;
		}

		public new VTable* VT
		{
			[Inline]
			get => (.)mVT;
		}

		/**
		 *
		 *
		 * @param module	Handle to the software adapter's dll. HMODULE can be obtained with GetModuleHandle or LoadLibrary.
		 * @param adapter	Reference to a pointer to an adapter.
		*/
		public HResult CreateSoftwareAdapter(Windows.HModule module, out IDXGIAdapter *adapter) mut
		{
			adapter = ?;
			return VT.CreateSoftwareAdapter(&this, module, &adapter);
		}

		/**
		 * Creates a swap chain.
		 *
		 * @param device	For Direct3D 11, and earlier versions of Direct3D, this is a pointer to the Direct3D device for the swap chain.
		 *					For Direct3D 12 this is a pointer to a direct command queue (refer to ID3D12CommandQueue).
		 * @param desc		A reference to a SwapChainDescription.
		 * @param swapChain	A reference to a variable that receives a pointer to the IDXGISwapChain interface for the swap chain that CreateSwapChain creates.
		*/
		public HResult CreateSwapChain(IUnknown* device, ref SwapChainDescription desc, out IDXGISwapChain* swapChain) mut
		{
			swapChain = ?;
			return VT.CreateSwapChain(&this, device, &desc, &swapChain);
		}

		/**
		 * Enumerates the adapters (video cards).
		 *
		 * @param adapter	The index of the adapter to enumerate.
		 * @param pAdapter	The reference to a pointer to an IDXGIAdapter interface at the position specified by the Adapter parameter.
		*/
		public HResult EnumAdapters(uint32 adapter, out IDXGIAdapter* pAdapter) mut
		{
			pAdapter = ?;
			return VT.EnumAdapters(&this, adapter, &pAdapter);
		}

		/**
		 * Get the window through which the user controls the transition to and from full screen.
		 *
		 * @param windowHandle	A reference to a window handle.
		*/
		public HResult GetWindowAssociation(out Windows.HWnd windowHandle) mut
		{
			windowHandle = ?;
			return VT.GetWindowAssociation(&this, &windowHandle);
		}

		/**
		 * Get the window through which the user controls the transition to and from full screen.
		 *
		 * @param windowHandle	The handle of the window that is to be monitored. This parameter can be NULL; but only if the flags are also 0.
		 * @param flags			One or more window association flags
		*/
		public HResult MakeWindowAssociation(Windows.HWnd windowHandle, WindowAssociationFlags flags) mut
		{
			return VT.MakeWindowAssociation(&this, windowHandle, flags);
		}
	}
}
