using System;
using DirectX.DXGI;
using DirectX.Math; 
using DirectX.Common;

namespace DirectX.D3D11.DeviceContextStages
{
	/**
	 * Provides access to the device contexts methods for the rasterizer shader stage.
	*/
	public struct RasterizerStage
	{
		ID3D11DeviceContext.VTable* mVT;
		
		[Inline]
		public ID3D11DeviceContext.VTable* VT => mVT;

		/**
		* Get the array of scissor rectangles bound to the rasterizer stage.
		*
		@param pNumRects	The number of scissor rectangles (ranges between 0 and D3D11_VIEWPORT_AND_SCISSORRECT_OBJECT_COUNT_PER_PIPELINE) bound;
							set pRects to NULL to use pNumRects to see how many rectangles would be returned.
		@param pRects 		An array of scissor rectangles (see D3D11_RECT).
							If NumRects is greater than the number of scissor rects currently bound, then unused members of the array will contain 0.
		*/
		public void GetScissorRects(UINT *pNumRects, Rectangle *pRects) mut
		{
			VT.RSGetScissorRects((.)&this, pNumRects, pRects);
		}

		/**
		* Get the rasterizer state from the rasterizer stage of the pipeline.
		* Any returned interfaces will have their reference count incremented by one.
		* Applications should call IUnknown::Release on the returned interfaces when they are no longer needed to avoid memory leaks.
		*
		@param ppRasterizerState 	Address of a pointer to a rasterizer-state interface (see ID3D11RasterizerState) to fill with information from the device.
		*/
		public void GetState(ID3D11RasterizerState **ppRasterizerState) mut
		{
			VT.RSGetState((.)&this, ppRasterizerState);
		}

		/**
		* Gets the array of viewports bound to the rasterizer stage.
		*
		@param pNumViewports	A pointer to a variable that, on input, specifies the number of viewports (ranges from 0 to D3D11_VIEWPORT_AND_SCISSORRECT_OBJECT_COUNT_PER_PIPELINE) in the pViewports array;
								on output, the variable contains the actual number of viewports that are bound to the rasterizer stage.
								If pViewports is NULL, RSGetViewports fills the variable with the number of viewports currently bound.
		@param pViewports		An array of D3D11_VIEWPORT structures for the viewports that are bound to the rasterizer stage.
								If the number of viewports (in the variable to which pNumViewports points) is greater than the actual number of viewports currently bound, unused elements of the array contain 0.
		*/
		public void GetViewports(UINT *pNumViewports, Viewport *pViewports) mut
		{
			VT.RSGetViewports((.)&this, pNumViewports, pViewports);
		}

		/**
		* Bind an array of scissor rectangles to the rasterizer stage.
		*
		@param numRects	Number of scissor rectangles to bind.
		@param pRects 	An array of scissor rectangles.
		*/
		public void SetScissorRects(UINT numRects, Rectangle *pRects) mut
		{
			VT.RSSetScissorRects((.)&this, numRects, pRects);
		}

		/**
		* Set the rasterizer state for the rasterizer stage of the pipeline.
		* The method will hold a reference to the interfaces passed in.
		*
		@param pRasterizerState Pointer to a rasterizer-state interface (see ID3D11RasterizerState) to bind to the pipeline.
		*/
		public void SetState(ID3D11RasterizerState *pRasterizerState) mut
		{
			VT.RSSetState((.)&this, pRasterizerState);
		}

		/**
		* Bind an array of viewports to the rasterizer stage of the pipeline.
		*
		@param numViewports	Number of viewports to bind.
		@param pViewports	An array of D3D11_VIEWPORT structures to bind to the device.
		*/
		public void SetViewports(UINT numViewports, Viewport *pViewports) mut
		{
			VT.RSSetViewports((.)&this, numViewports, pViewports);
		}
	}
}
