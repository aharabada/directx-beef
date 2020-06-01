using System;
using DirectX.DXGI;
using DirectX.Common;

namespace DirectX.D3D11.SDKLayers
{
	public struct ID3D11Debug : IUnknown, IComObject
	{
		public static new Guid IID => .("79cf2233-7536-4948-9d36-1e4692dc5760");
		
		public struct VTable : IUnknown.VTable
		{
			public function HResult(ID3D11Debug* self, FeatureMaskFlags mask) SetFeatureMask;
			public function FeatureMaskFlags(ID3D11Debug* self) GetFeatureMask;
			public function HResult(ID3D11Debug* self, uint32 milliseconds) SetPresentPerRenderOpDelay;
			public function uint32(ID3D11Debug* self) GetPresentPerRenderOpDelay;
			public function HResult(ID3D11Debug* self, IDXGISwapChain* pSwapChain) SetSwapChain; 
			public function HResult(ID3D11Debug* self, IDXGISwapChain** ppSwapChain) GetSwapChain;
			public function HResult(ID3D11Debug* self, ID3D11DeviceContext *pContext) ValidateContext;
			public function HResult(ID3D11Debug* self, ReportLiveDeviceObjectFlags flags) ReportLiveDeviceObjects;
			public function HResult(ID3D11Debug* self, ID3D11DeviceContext *pContext) ValidateContextForDispatch;
		}

		public new VTable* VT
		{
			[Inline]
			get
			{
				return (.)mVT;
			}
		}

		/**
		* Set a bit field of flags that will turn debug features on and off.
		@param mask A combination of feature-mask flags that are combined by using a bitwise OR operation.
				If a flag is present, that feature will be set to on, otherwise the feature will be set to off. 
		@return This method returns one of the Direct3D 11 Return Codes.
		*/
		public HResult SetFeatureMask(FeatureMaskFlags mask) mut
		{
			return VT.SetFeatureMask(&this, mask);
		}

		/**
		* Get a bitfield of flags that indicates which debug features are on or off.
		@return Mask of feature-mask flags bitwise ORed together. If a flag is present, then that feature will be set to on, otherwise the feature will be set to off.
		*/
		public FeatureMaskFlags GetFeatureMask() mut
		{
			return VT.GetFeatureMask(&this);
		}

		/**
		* Set the number of milliseconds to sleep after IDXGISwapChain::Present is called.
		@param milliseconds Number of milliseconds to sleep after Present is called.
		@return This method returns one of the Direct3D 11 Return Codes.
		*/
		public HResult SetPresentPerRenderOpDelay(uint32 milliseconds) mut
		{
			return VT.SetPresentPerRenderOpDelay(&this, milliseconds);
		}

		/**
		* Get the number of milliseconds to sleep after IDXGISwapChain::Present is called.
		@return Number of milliseconds to sleep after Present is called.
		*/
		public uint32 GetPresentPerRenderOpDelay() mut
		{
			return VT.GetPresentPerRenderOpDelay(&this);
		}

		/**
		* Sets a swap chain that the runtime will use for automatically calling IDXGISwapChain::Present.
		* Remarks: The swap chain set by this method will only be used if D3D11_DEBUG_FEATURE_PRESENT_PER_RENDER_OP is set in the feature mask. 
		@param swapChain Swap chain that the runtime will use for automatically calling IDXGISwapChain::Present; must have been created with the DXGI_SWAP_EFFECT_SEQUENTIAL swap-effect flag.
		@return This method returns one of the Direct3D 11 Return Codes.
		*/
		public HResult SetSwapChain(IDXGISwapChain* swapChain) mut
		{
			return VT.SetSwapChain(&this, swapChain);
		}

		/**
		* Get the swap chain that the runtime will use for automatically calling IDXGISwapChain::Present.  
		@param swapChain Swap chain that the runtime will use for automatically calling IDXGISwapChain::Present.
		@return This method returns one of the Direct3D 11 Return Codes.
		*/
		public HResult GetSwapChain(out IDXGISwapChain* swapChain) mut
		{
			return VT.GetSwapChain(&this, &(swapChain = ?));
		}

		/**
		* Check to see if the draw pipeline state is valid.
		* Remarks: Use validate prior to calling a draw method (for example, ID3D11DeviceContext::Draw); validation requires the debug layer.
		@param deviceContext A pointer to the ID3D11DeviceContext, that represents a device context.
		@return This method returns one of the following Direct3D 11 Return Codes.
		*/
		public HResult ValidateContext(ID3D11DeviceContext* deviceContext) mut
		{
			return VT.ValidateContext(&this, deviceContext);
		}

		/**
		* Report information about a device object's lifetime.
		* Remarks: ReportLiveDeviceObjects uses the value in "flags" to determine the amount of information to report about a device object's lifetime.
		@param flags A value from the D3D11_RLDO_FLAGS enumeration.
		@return This method returns one of the following Direct3D 11 Return Codes.
		*/
		public HResult ReportLiveDeviceObjects(ReportLiveDeviceObjectFlags flags) mut
		{
			return VT.ReportLiveDeviceObjects(&this, flags);
		}

		/**
		* Verifies whether the dispatch pipeline state is valid.
		* Remarks: Use this method before you call a dispatch method (for example, ID3D11DeviceContext::Dispatch). Validation requires the debug layer.
		@param A pointer to the ID3D11DeviceContext that represents a device context.
		@return This method returns one of the return codes described in the topic Direct3D 11 Return Codes.
		*/
		public HResult ValidateContextForDispatch(ID3D11DeviceContext* deviceContext) mut
		{
			return VT.ValidateContextForDispatch(&this, deviceContext);
		}
	}
}
