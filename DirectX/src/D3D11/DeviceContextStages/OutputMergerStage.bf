using System;
using DirectX.DXGI;
using DirectX.Common;

namespace DirectX.D3D11.DeviceContextStages
{
	/**
	 * Provides access to the device contexts methods for the output merger stage.
	*/
	public struct OutputMergerStage
	{
		ID3D11DeviceContext.VTable* mVT;
		
		[Inline]
		public ID3D11DeviceContext.VTable* VT => mVT;

		/**
		* Get the blend state of the output-merger stage.
		* The reference count of the returned interface will be incremented by one when the blend state is retrieved.
		* Applications must release returned pointer(s) when they are no longer needed, or else there will be a memory leak.
		*
		@param ppBlendState	Address of a pointer to a blend-state interface (see ID3D11BlendState).
		@param pBlendFactor Pointer to the blend factors.
		@param pSampleMaskPointer to a sample mask.
		*/
		public void GetBlendState(ID3D11BlendState **ppBlendState, ColorRGBA *pBlendFactor, UINT *pSampleMask) mut
		{
			VT.OMGetBlendState((.)&this, ppBlendState, pBlendFactor, pSampleMask);
		}
		
		/**
		* Gets the depth-stencil state of the output-merger stage.
		* Any returned interfaces will have their reference count incremented by one.
		* Applications should call IUnknown::Release on the returned interfaces when they are no longer needed to avoid memory leaks.
		*
		@param ppDepthStencilState	Address of a pointer to a depth-stencil state interface (see ID3D11DepthStencilState) to be filled with information from the device.
		@param pStencilRef			Pointer to the stencil reference value used in the depth-stencil test.
		*/
		public void GetDepthStencilState(ID3D11DepthStencilState **ppDepthStencilState, UINT *pStencilRef) mut
		{
			VT.OMGetDepthStencilState((.)&this, ppDepthStencilState, pStencilRef);
		}

		/**
		* Get pointers to the resources bound to the output-merger stage.
		* Any returned interfaces will have their reference count incremented by one.
		* Applications should call IUnknown::Release on the returned interfaces when they are no longer needed to avoid memory leaks.
		*
		@param numViews				Number of render targets to retrieve.
		@param ppRenderTargetViews	Pointer to an array of ID3D11RenderTargetViews which represent render target views.
									Specify NULL for this parameter when retrieval of a render target is not needed.	
		@param ppDepthStencilView	Pointer to a ID3D11DepthStencilView, which represents a depth-stencil view.
									Specify NULL for this parameter when retrieval of the depth-stencil view is not needed.
		*/
		public void GetRenderTargets(UINT numViews, ID3D11RenderTargetView **ppRenderTargetViews, ID3D11DepthStencilView **ppDepthStencilView) mut
		{
			VT.OMGetRenderTargets((.)&this, numViews, ppRenderTargetViews, ppDepthStencilView);
		}

		/**
		* Get pointers to the resources bound to the output-merger stage.
		* Any returned interfaces will have their reference count incremented by one.
		* Applications should call IUnknown::Release on the returned interfaces when they are no longer needed to avoid memory leaks.
		*
		@param numRTVs 					The number of render-target views to retrieve.
		@param ppRenderTargetViews		Pointer to an array of ID3D11RenderTargetViews, which represent render-target views.
										Specify NULL for this parameter when retrieval of render-target views is not required.
		@param ppDepthStencilView		Pointer to a ID3D11DepthStencilView, which represents a depth-stencil view.
										Specify NULL for this parameter when retrieval of the depth-stencil view is not required.
		@param uavStartSlot				Index into a zero-based array to begin retrieving unordered-access views (ranges from 0 to D3D11_PS_CS_UAV_REGISTER_COUNT - 1).
										For pixel shaders UAVStartSlot should be equal to the number of render-target views that are bound.
		@param numUAVs					Number of unordered-access views to return in ppUnorderedAccessViews. This number ranges from 0 to D3D11_PS_CS_UAV_REGISTER_COUNT - UAVStartSlot.
		@param ppUnorderedAccessViews	Pointer to an array of ID3D11UnorderedAccessViews, which represent unordered-access views that are retrieved.
										Specify NULL for this parameter when retrieval of unordered-access views is not required.
		*/
		public void GetRenderTargetsAndUnorderedAccessViews(UINT numRTVs, ID3D11RenderTargetView **ppRenderTargetViews, ID3D11DepthStencilView **ppDepthStencilView,
			UINT uavStartSlot, UINT numUAVs, ID3D11UnorderedAccessView **ppUnorderedAccessViews) mut
		{
			VT.OMGetRenderTargetsAndUnorderedAccessViews((.)&this, numRTVs, ppRenderTargetViews, ppDepthStencilView, uavStartSlot, numUAVs, ppUnorderedAccessViews);
		}

		/**
		* Set the blend state of the output-merger stage.
		*
		@param pBlendState 	Pointer to a blend-state interface (see ID3D11BlendState). Pass NULL for a default blend state. For more info about default blend state, see Remarks.
							Passing in NULL for the blend-state interface indicates to the runtime to set a default blending state. The following table indicates the default blending parameters.
		@param blendFactor 	Blend factors for each RGBA component
		@param sampleMask 	32-bit sample coverage. The default value is 0xffffffff.
		*/
		public void SetBlendState(ID3D11BlendState *pBlendState, ColorRGBA blendFactor, UINT sampleMask = 0xffffffff) mut
		{
			VT.OMSetBlendState((.)&this, pBlendState, blendFactor, sampleMask);
		}

		/**
		* Sets the depth-stencil state of the output-merger stage.
		* The method will hold a reference to the interfaces passed in.
		*
		@param pDepthStencilState	Pointer to a depth-stencil state interface (see ID3D11DepthStencilState) to bind to the device.
									Set this to NULL to use the default state listed in D3D11_DEPTH_STENCIL_DESC.
		@param stencilRef			Reference value to perform against when doing a depth-stencil test.
		*/
		public void SetDepthStencilState(ID3D11DepthStencilState *pDepthStencilState, UINT stencilRef) mut
		{
			VT.OMSetDepthStencilState((.)&this, pDepthStencilState, stencilRef);
		}

		/**
		* Bind one or more render targets atomically and the depth-stencil buffer to the output-merger stage.
		* The method will hold a reference to the interfaces passed in.
		*
		@param numViews				Number of render targets to bind (ranges between 0 and D3D11_SIMULTANEOUS_RENDER_TARGET_COUNT).
									If this parameter is nonzero, the number of entries in the array to which ppRenderTargetViews points must equal the number in this parameter.
		@param ppRenderTargetViews	Pointer to an array of ID3D11RenderTargetView that represent the render targets to bind to the device.
									If this parameter is NULL and NumViews is 0, no render targets are bound.
		@param pDepthStencilView	Pointer to a ID3D11DepthStencilView that represents the depth-stencil view to bind to the device.
									If this parameter is NULL, the depth-stencil state is not bound.
		*/
		public void SetRenderTargets(UINT numViews, ID3D11RenderTargetView **ppRenderTargetViews, ID3D11DepthStencilView *pDepthStencilView) mut
		{
			VT.OMSetRenderTargets((.)&this, numViews, ppRenderTargetViews, pDepthStencilView);
		}

		/**
		* Binds resources to the output-merger stage.
		*
		@param numRTVs					Number of render targets to bind (ranges between 0 and D3D11_SIMULTANEOUS_RENDER_TARGET_COUNT).
										If this parameter is nonzero, the number of entries in the array to which ppRenderTargetViews points must equal the number in this parameter.
										If you set NumRTVs to D3D11_KEEP_RENDER_TARGETS_AND_DEPTH_STENCIL (0xffffffff), this method does not modify the currently bound render-target views (RTVs) and also does not modify depth-stencil view (DSV).
		@param ppRenderTargetViews		Pointer to an array of ID3D11RenderTargetViews that represent the render targets to bind to the device.
										If this parameter is NULL and NumRTVs is 0, no render targets are bound.
		@param pDepthStencilView		Pointer to a ID3D11DepthStencilView that represents the depth-stencil view to bind to the device.
										If this parameter is NULL, the depth-stencil state is not bound.
		@param uavStartSlot				Index into a zero-based array to begin setting unordered-access views (ranges from 0 to D3D11_PS_CS_UAV_REGISTER_COUNT - 1). 
										For the Direct3D 11.1 runtime, which is available starting with Windows 8, this value can range from 0 to D3D11_1_UAV_SLOT_COUNT - 1. D3D11_1_UAV_SLOT_COUNT is defined as 64.
										For pixel shaders, UAVStartSlot should be equal to the number of render-target views being bound.
		@param numUAVs					Number of unordered-access views (UAVs) in ppUnorderedAccessViews.
										If you set NumUAVs to D3D11_KEEP_UNORDERED_ACCESS_VIEWS (0xffffffff), this method does not modify the currently bound unordered-access views.
										For the Direct3D 11.1 runtime, which is available starting with Windows 8, this value can range from 0 to D3D11_1_UAV_SLOT_COUNT - UAVStartSlot.
		@param ppUnorderedAccessViews	Pointer to an array of ID3D11UnorderedAccessViews that represent the unordered-access views to bind to the device.
										If this parameter is NULL and NumUAVs is 0, no unordered-access views are bound.  
		@param pUAVInitialCounts		An array of append and consume buffer offsets. A value of -1 indicates to keep the current offset.
										Any other values set the hidden counter for that appendable and consumable UAV.
										pUAVInitialCounts is relevant only for UAVs that were created with either D3D11_BUFFER_UAV_FLAG_APPEND or
										D3D11_BUFFER_UAV_FLAG_COUNTER specified when the UAV was created; otherwise, the argument is ignored.
		*/
		public void	SetRenderTargetsAndUnorderedAccessViews(UINT numRTVs, ID3D11RenderTargetView **ppRenderTargetViews, ID3D11DepthStencilView *pDepthStencilView,
			UINT uavStartSlot, UINT numUAVs, ID3D11UnorderedAccessView **ppUnorderedAccessViews, UINT *pUAVInitialCounts) mut
		{
			VT.OMSetRenderTargetsAndUnorderedAccessViews((.)&this, numRTVs, ppRenderTargetViews, pDepthStencilView, uavStartSlot, numUAVs, ppUnorderedAccessViews, pUAVInitialCounts);
		}
	}
}
