using System;
using DirectX.DXGI;
using DirectX.Math;
using DirectX.Common;

namespace DirectX.D3D11
{
	public struct ID3D11DeviceContext : ID3D11DeviceChild, IComObject
	{	
		public static new Guid IID => .("c0bfa96c-e089-44fb-8eaf-26f8796190da");
		
		public struct VTable : ID3D11DeviceChild.VTable
		{
			public function void(ID3D11DeviceContext* self, uint32 startSlot, uint32 numBuffers, ID3D11Buffer** ppConstantBuffers) VSSetConstantBuffers;
			public function void(ID3D11DeviceContext* self, uint32 startSlot, uint32 numViews, ID3D11ShaderResourceView** ppShaderResourceViews) PSSetShaderResources;

			public function void(ID3D11DeviceContext* self, ID3D11PixelShader* pPixelShader, ID3D11ClassInstance** ppClassInstance, uint32 numClassInstances) PSSetShader;
			public function void(ID3D11DeviceContext* self, uint32 startSlot, uint32 numSamplers, ID3D11SamplerState** ppSamplers) PSSetSamplers; 
			public function void(ID3D11DeviceContext* self, ID3D11VertexShader* pVertexShader, ID3D11ClassInstance** ppClassInstance, uint32 numClassInstances) VSSetShader;
			public function void(ID3D11DeviceContext* self, UINT indexCount, UINT startIndexLocation, INT baseVertexLocation) DrawIndexed;
			public function void(ID3D11DeviceContext* self, UINT vertexCount, UINT startVertexLocation) Draw;

			public function HResult(ID3D11DeviceContext* self, ID3D11Resource* pResource, UINT subresource, MapType mapType, MapFlags, MappedSubresource* pMappedResource) Map;
			public function void(ID3D11DeviceContext* self, ID3D11Resource* pResource, uint32 subresource) Unmap;
			public function void(ID3D11DeviceContext* self, uint32 startSlot, uint32 numBuffers, ID3D11Buffer** ppConstantBuffers) PSSetConstantBuffers;

			public function void(ID3D11DeviceContext* self, ID3D11InputLayout *pInputLayout) IASetInputLayout;
			public function void(ID3D11DeviceContext* self, UINT startSlot, UINT numBuffers, ID3D11Buffer** ppVertexBuffers, UINT* pStride, UINT* pOffset) IASetVertexBuffers;
			public function void(ID3D11DeviceContext* self, ID3D11Buffer* ppIndexBuffers, Format format, UINT offset) IASetIndexBuffer;

			public function void(ID3D11DeviceContext* self, UINT indexCountPerInstance, UINT instanceCount, UINT startIndexLocation, INT baseVertexLocation, UINT startInstanceLocation) DrawIndexedInstanced;
			public function void(ID3D11DeviceContext* self, UINT vertexCountPerInstance, UINT instanceCount, UINT startVertexLocation, UINT startInstanceLocation) DrawInstanced;

			public function void(ID3D11DeviceContext* self, UINT startSlot, UINT numBuffers, ID3D11Buffer **ppConstantBuffers) GSSetConstantBuffers;
			public function void(ID3D11DeviceContext* self, ID3D11GeometryShader *pComputeShader, ID3D11ClassInstance **ppClassInstances, UINT numClassInstances) GSSetShader; 
			public function void(ID3D11DeviceContext* self, PrimitiveTopology primitiveTopology) IASetPrimitiveTopology;
			public function void(ID3D11DeviceContext* self, UINT startSlot, UINT numViews, ID3D11ShaderResourceView **ppShaderResourceViews) VSSetShaderResources;
			public function void(ID3D11DeviceContext* self, UINT startSlot, UINT numBuffers, ID3D11SamplerState **ppSamplers) VSSetSamplers;

			public function void(ID3D11DeviceContext* self, ID3D11Asynchronous *pAsync) Begin;
			public function void(ID3D11DeviceContext* self, ID3D11Asynchronous *pAsync) End;

			public function HResult(ID3D11DeviceContext* self, ID3D11Asynchronous *pAsync,	void *pData, UINT dataSize, AsyncGetDataFlags getDataFlags) GetData;
			public function void(ID3D11DeviceContext* self, ID3D11Predicate *pPredicate, BOOL predicateValue) SetPredication;
			public function void(ID3D11DeviceContext* self, UINT startSlot, UINT numViews, ID3D11ShaderResourceView **ppShaderResourceViews) GSSetShaderResources;  
			public function void(ID3D11DeviceContext* self, UINT startSlot, UINT numBuffers, ID3D11SamplerState **ppSamplers) GSSetSamplers;

			public function void(ID3D11DeviceContext* self, UINT numViews, ID3D11RenderTargetView **ppRenderTargetViews, ID3D11DepthStencilView *pDepthStencilView) OMSetRenderTargets;

			public function void(ID3D11DeviceContext* self, UINT numRTVs, ID3D11RenderTargetView **ppRenderTargetViews, ID3D11DepthStencilView *pDepthStencilView,
				UINT uavStartSlot, UINT numUAVs, ID3D11UnorderedAccessView **ppUnorderedAccessViews, UINT *pUAVInitialCounts) OMSetRenderTargetsAndUnorderedAccessViews;

			public function void(ID3D11DeviceContext* self, ID3D11BlendState *pBlendState, ColorRGBA blendFactor, UINT sampleMask = 0xffffffff) OMSetBlendState;
			public function void(ID3D11DeviceContext* self, ID3D11DepthStencilState* pDepthStencilState, uint32 stencilRef) OMSetDepthStencilState;

			public function void(ID3D11DeviceContext* self, UINT numBuffers, ID3D11Buffer **ppSOTargets, UINT *pOffsets) SOSetTargets;

			public function void(ID3D11DeviceContext* self) DrawAuto;

			public function void(ID3D11DeviceContext* self, ID3D11Buffer *pBufferForArgs, UINT alignedByteOffsetForArgs) DrawIndexedInstancedIndirect; 
			public function void(ID3D11DeviceContext* self, ID3D11Buffer *pBufferForArgs, UINT alignedByteOffsetForArgs) DrawInstancedIndirect;

			public function void(ID3D11DeviceContext* self, UINT threadGroupCountX, UINT threadGroupCountY, UINT threadGroupCountZ) Dispatch;
			public function void(ID3D11DeviceContext* self, ID3D11Buffer *pBufferForArgs, UINT alignedByteOffsetForArgs) DispatchIndirect;

			public function void(ID3D11DeviceContext* self, ID3D11RasterizerState *pRasterizerState) RSSetState;
			public function void(ID3D11DeviceContext* self, UINT numViewports, Viewport* pViewports) RSSetViewports;
			public function void(ID3D11DeviceContext* self, UINT numRects, Rectangle *pRects) RSSetScissorRects;

			public function void(ID3D11DeviceContext* self, ID3D11Resource *pDstResource,uint32 DstSubresource, uint32 DstX, uint32 DstY, uint32 DstZ, ID3D11Resource  *pSrcResource, uint32 SrcSubresource, Box *pSrcBox) CopySubresourceRegion;
			public function void(ID3D11DeviceContext* self, ID3D11Resource* pDstResource, ID3D11Resource* pSrcResource) CopyResource;
			public function void(ID3D11DeviceContext* self, ID3D11Resource* pDstResource, uint32 dstSubresource, Box* pDstBox, void* pSrcData, uint32 srcRowPitch, uint32 srcDepthPitch) UpdateSubresource;
			public function void(ID3D11DeviceContext* self, ID3D11Buffer *pDstBuffer, uint32 dstAlignedByteOffset, ID3D11UnorderedAccessView *pSrcView) CopyStructureCount;
			public function void(ID3D11DeviceContext* self, ID3D11RenderTargetView* pRenderTargetView, ColorRGBA colorRGBA) ClearRenderTargetView;
			public function void(ID3D11DeviceContext* self, ID3D11UnorderedAccessView* pUnorderedAccessView, uint32[4] values) ClearUnorderedAccessViewUint;
			public function void(ID3D11DeviceContext* self, ID3D11UnorderedAccessView* pUnorderedAccessView, ColorRGBA colorRGBA) ClearUnorderedAccessViewFloat;

			public function void(ID3D11DeviceContext* self, ID3D11DepthStencilView* pDepthStencilView, ClearFlag clearFlags, float Depth, uint8 Stencil) ClearDepthStencilView;
			
			public function void(ID3D11DeviceContext* self, ID3D11ShaderResourceView *pShaderResourceView) GenerateMips; 
			public function void(ID3D11DeviceContext* self, ID3D11Resource *pResource, float MinLOD) SetResourceMinLOD;
			public function float(ID3D11DeviceContext* self, ID3D11Resource *pResource) GetResourceMinLOD;
			public function void(ID3D11DeviceContext* self, ID3D11Resource *pDstResource, UINT dstSubresource, ID3D11Resource *pSrcResource, UINT srcSubresource, Format format) ResolveSubresource;

			public function void(ID3D11DeviceContext* self, ID3D11CommandList *pCommandList, BOOL restoreContextState) ExecuteCommandList;

			public function void(ID3D11DeviceContext* self, UINT startSlot, UINT numViews, ID3D11ShaderResourceView **ppShaderResourceViews) HSSetShaderResources;
			public function void(ID3D11DeviceContext* self, ID3D11HullShader *pComputeShader, ID3D11ClassInstance **ppClassInstances, UINT numClassInstances) HSSetShader;   
			public function void(ID3D11DeviceContext* self, UINT startSlot, UINT numBuffers, ID3D11SamplerState **ppSamplers) HSSetSamplers;   
			public function void(ID3D11DeviceContext* self, UINT startSlot, UINT numBuffers, ID3D11Buffer **ppConstantBuffers) HSSetConstantBuffers;
  
			public function void(ID3D11DeviceContext* self, UINT startSlot, UINT numViews, ID3D11ShaderResourceView **ppShaderResourceViews) DSSetShaderResources;
			public function void(ID3D11DeviceContext* self, ID3D11DomainShader *pComputeShader, ID3D11ClassInstance **ppClassInstances, UINT numClassInstances) DSSetShader;   
			public function void(ID3D11DeviceContext* self, UINT startSlot, UINT numBuffers, ID3D11SamplerState **ppSamplers) DSSetSamplers;   
			public function void(ID3D11DeviceContext* self, UINT startSlot, UINT numBuffers, ID3D11Buffer **ppConstantBuffers) DSSetConstantBuffers;
  
			public function void(ID3D11DeviceContext* self, UINT startSlot, UINT numViews, ID3D11ShaderResourceView **ppShaderResourceViews) CSSetShaderResources;  
			public function void(ID3D11DeviceContext* self, UINT startSlot, UINT numUAVs, ID3D11UnorderedAccessView **ppUnorderedAccessViews, UINT *pUAVInitialCounts) CSSetUnorderedAccessViews; 
			public function void(ID3D11DeviceContext* self, ID3D11ComputeShader *pComputeShader, ID3D11ClassInstance **ppClassInstances, UINT numClassInstances) CSSetShader;   
			public function void(ID3D11DeviceContext* self, UINT startSlot, UINT numBuffers, ID3D11SamplerState **ppSamplers) CSSetSamplers;   
			public function void(ID3D11DeviceContext* self, UINT startSlot, UINT numBuffers, ID3D11Buffer **ppConstantBuffers) CSSetConstantBuffers;
  
			public function void(ID3D11DeviceContext* self, UINT startSlot, UINT numBuffers, ID3D11Buffer **ppConstantBuffers) VSGetConstantBuffers;   
			public function void(ID3D11DeviceContext* self, UINT startSlot, UINT numViews, ID3D11ShaderResourceView **ppShaderResourceViews) PSGetShaderResources;    
			public function void(ID3D11DeviceContext* self, ID3D11PixelShader **ppPixelShader, ID3D11ClassInstance **ppClassInstances, UINT *pNumClassInstances) PSGetShader;    
			public function void(ID3D11DeviceContext* self, UINT startSlot, UINT numSamplers, ID3D11SamplerState **ppSamplers) PSGetSamplers;    
			public function void(ID3D11DeviceContext* self, ID3D11VertexShader **ppVertexShader, ID3D11ClassInstance **ppClassInstances, UINT *pNumClassInstances) VSGetShader;    
			public function void(ID3D11DeviceContext* self, UINT startSlot, UINT numBuffers, ID3D11Buffer **ppConstantBuffers) PSGetConstantBuffers;
    
			public function void(ID3D11DeviceContext* self, ID3D11InputLayout **ppInputLayout) IAGetInputLayout;    
			public function void(ID3D11DeviceContext* self, UINT startSlot, UINT numBuffers, ID3D11Buffer **ppVertexBuffers, UINT *pStrides, UINT *pOffsets) IAGetVertexBuffers;    
			public function void(ID3D11DeviceContext* self, ID3D11Buffer **pIndexBuffer, Format *format, UINT *offset) IAGetIndexBuffer;
   
			public function void(ID3D11DeviceContext* self, UINT startSlot, UINT numBuffers, ID3D11Buffer **ppConstantBuffers) GSGetConstantBuffers; 
			public function void(ID3D11DeviceContext* self, ID3D11GeometryShader **ppComputeShader, ID3D11ClassInstance **ppClassInstances, uint32 *pNumClassInstances) GSGetShader;
			public function void(ID3D11DeviceContext* self, PrimitiveTopology *pTopology) IAGetPrimitiveTopology;    
			public function void(ID3D11DeviceContext* self, UINT startSlot, UINT numViews, ID3D11ShaderResourceView **ppShaderResourceViews) VSGetShaderResources;    
			public function void(ID3D11DeviceContext* self, UINT startSlot, UINT numSamplers, ID3D11SamplerState **ppSamplers) VSGetSamplers;
 
			public function void(ID3D11DeviceContext* self, ID3D11Predicate **ppPredicate, BOOL *pPredicateValue) GetPredication;
      
			public function void(ID3D11DeviceContext* self, UINT startSlot, UINT numViews, ID3D11ShaderResourceView **ppShaderResourceViews) GSGetShaderResources;   
			public function void(ID3D11DeviceContext* self, UINT startSlot, UINT numSamplers, ID3D11SamplerState **ppSamplers) GSGetSamplers;
     
			public function void(ID3D11DeviceContext* self, UINT numViews, ID3D11RenderTargetView **ppRenderTargetViews, ID3D11DepthStencilView **ppDepthStencilView) OMGetRenderTargets;
     
			public function void(ID3D11DeviceContext* self, UINT numRTVs, ID3D11RenderTargetView **ppRenderTargetViews, ID3D11DepthStencilView **ppDepthStencilView,
				UINT uavStartSlot, UINT numUAVs, ID3D11UnorderedAccessView **ppUnorderedAccessViews) OMGetRenderTargetsAndUnorderedAccessViews;
      
			public function void(ID3D11DeviceContext* self, ID3D11BlendState **ppBlendState, ColorRGBA *pBlendFactor, UINT *pSampleMask) OMGetBlendState;      
			public function void(ID3D11DeviceContext* self, ID3D11DepthStencilState **ppDepthStencilState, UINT *pStencilRef) OMGetDepthStencilState;
      
			public function void(ID3D11DeviceContext* self, UINT numBuffers, ID3D11Buffer **ppSOTargets) SOGetTargets;
      
			public function void(ID3D11DeviceContext* self, ID3D11RasterizerState **ppRasterizerState) RSGetState;      
			public function void(ID3D11DeviceContext* self, UINT *pNumViewports, Viewport *pViewports) RSGetViewports; 
			public function void(ID3D11DeviceContext* self, UINT *pNumRects, Rectangle *pRects) RSGetScissorRects;
   
			public function void(ID3D11DeviceContext* self, UINT startSlot, UINT numViews, ID3D11ShaderResourceView **ppShaderResourceViews) HSGetShaderResources;   
			public function void(ID3D11DeviceContext* self, ID3D11HullShader **ppComputeShader, ID3D11ClassInstance **ppClassInstances, uint32 *pNumClassInstances) HSGetShader;
			public function void(ID3D11DeviceContext* self, UINT startSlot, UINT numSamplers, ID3D11SamplerState **ppSamplers) HSGetSamplers;   
			public function void(ID3D11DeviceContext* self, UINT startSlot, UINT numBuffers, ID3D11Buffer **ppConstantBuffers) HSGetConstantBuffers;
  
			public function void(ID3D11DeviceContext* self, UINT startSlot, UINT numViews, ID3D11ShaderResourceView **ppShaderResourceViews) DSGetShaderResources;   
			public function void(ID3D11DeviceContext* self, ID3D11DomainShader **ppComputeShader, ID3D11ClassInstance **ppClassInstances, uint32 *pNumClassInstances) DSGetShader;
			public function void(ID3D11DeviceContext* self, UINT startSlot, UINT numSamplers, ID3D11SamplerState **ppSamplers) DSGetSamplers;   
			public function void(ID3D11DeviceContext* self, UINT startSlot, UINT numBuffers, ID3D11Buffer **ppConstantBuffers) DSGetConstantBuffers;

			public function void(ID3D11DeviceContext* self, UINT startSlot, UINT numViews, ID3D11ShaderResourceView **ppShaderResourceViews) CSGetShaderResources;   
			public function void(ID3D11DeviceContext* self, UINT startSlot, UINT numUAVs, ID3D11UnorderedAccessView **ppUnorderedAccessViews) CSGetUnorderedAccessViews;
			public function void(ID3D11DeviceContext* self, ID3D11ComputeShader **ppComputeShader, ID3D11ClassInstance **ppClassInstances, uint32 *pNumClassInstances) CSGetShader;
			public function void(ID3D11DeviceContext* self, UINT startSlot, UINT numSamplers, ID3D11SamplerState **ppSamplers) CSGetSamplers;   
			public function void(ID3D11DeviceContext* self, UINT startSlot, UINT numBuffers, ID3D11Buffer **ppConstantBuffers) CSGetConstantBuffers;
   
			public function void(ID3D11DeviceContext* self) ClearState;   
			public function void(ID3D11DeviceContext* self) Flush;
			public function DeviceContextType(ID3D11DeviceContext* self) GetDeviceContextType;     
			public function void(ID3D11DeviceContext* self) GetContextFlags;   

			public function HResult(ID3D11DeviceContext* self, BOOL restoreDeferredContextState, ID3D11CommandList **ppCommandList) FinishCommandList;              
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
		* Mark the beginning of a series of commands.
		@param pAsync A pointer to an ID3D11Asynchronous interface.
		*/
		public void Begin(ID3D11Asynchronous* pAsync) mut
		{
			VT.Begin(&this, pAsync);
		}

		/**
		* Clears the depth-stencil resource.
		@param pDepthStencilView Pointer to the depth stencil to be cleared.
		@param clearFlags Identify the type of data to clear.
		@param depth Clear the depth buffer with this value. This value will be clamped between 0 and 1.
		@param stencil Clear the stencil buffer with this value.
		*/
		public void ClearDepthStencilView(ID3D11DepthStencilView *pDepthStencilView, ClearFlag clearFlags, float depth, uint8 stencil) mut
		{
			VT.ClearDepthStencilView(&this, pDepthStencilView, clearFlags, depth, stencil);
		}

		/**
		* Set all the elements in a render target to one value.
		@param pRenderTargetView Pointer to the render target.
		@param color The color to fill the render target with.
		*/
		public void ClearRenderTargetView(ID3D11RenderTargetView *pRenderTargetView, ColorRGBA color) mut
		{
			VT.ClearRenderTargetView(&this, pRenderTargetView, color);
		}

		/**
		* Set all the elements in a render target to one value.
		@param pRenderTargetView Pointer to the render target.
		@param color The color to fill the render target with.
		*/
		public void ClearRenderTargetView(ID3D11RenderTargetView *pRenderTargetView, Color color) mut
		{
			VT.ClearRenderTargetView(&this, pRenderTargetView, (.)color);
		}

		/**
		* Restore all default settings.
		* This method resets any device context to the default settings.
		* This sets all input/output resource slots, shaders, input layouts, predications,
		* scissor rectangles, depth-stencil state, rasterizer state, blend state, sampler state,
		* and viewports to NULL. The primitive topology is set to UNDEFINED.
		*/
		public void ClearState() mut
		{
			VT.ClearState(&this);
		}

		/**
		* Clears an unordered access resource with a float value.
		* This API works on FLOAT, UNORM, and SNORM unordered access views (UAVs),
		* with format conversion from FLOAT to *NORM where appropriate.
		* On other UAVs, the operation is invalid and the call will not reach the driver.
		*
		@param pDepthStencilView The ID3D11UnorderedAccessView to clear.
		@param color The color to copy to corresponding channels.
		*/
		public void ClearUnorderedAccessViewFloat(ID3D11UnorderedAccessView *pUnorderedAccessView, ColorRGBA color) mut
		{
			VT.ClearUnorderedAccessViewFloat(&this, pUnorderedAccessView, color);
		}

		/**
		* Clears an unordered access resource with bit-precise values.
		* This API copies the lower ni bits from each array element i to the corresponding channel,
		* where ni is the number of bits in the ith channel of the resource format (for example, R8G8B8_FLOAT has 8 bits for the first 3 channels).
		* This works on any UAV with no format conversion. For a raw or structured buffer view, only the first array element value is used.
		*
		@param pDepthStencilView The ID3D11UnorderedAccessView to clear.
		@param values Values to copy to corresponding channels, see remarks.
		*/
		public void ClearUnorderedAccessViewUint(ID3D11UnorderedAccessView *pUnorderedAccessView, uint32[4] values) mut
		{
			VT.ClearUnorderedAccessViewUint(&this, pUnorderedAccessView, values);
		}

		/**
		* Copy the entire contents of the source resource to the destination resource using the GPU.
		*
		@param pDstResource A pointer to the ID3D11Resource interface that represents the destination resource.
		@param pSrcResource A pointer to the ID3D11Resource interface that represents the source resource.
		*/
		public void CopyResource(ID3D11Resource *pDstResource, ID3D11Resource *pSrcResource) mut
		{
			VT.CopyResource(&this, pDstResource, pSrcResource);
		}

		/**
		* Copies data from a buffer holding variable length data.
		*
		@param pDstBuffer Pointer to ID3D11Buffer. This can be any buffer resource that other copy commands, such as DeviceContext.CopyResource or DeviceContext.CopySubresourceRegion, are able to write to.
		@param dstAlignedByteOffset Offset from the start of pDstBuffer to write 32-bit UINT structure (vertex) count from pSrcView.
		@param pSrcView	Pointer to an ID3D11UnorderedAccessView of a Structured Buffer resource created with either D3D11_BUFFER_UAV_FLAG_APPEND or D3D11_BUFFER_UAV_FLAG_COUNTER specified when the UAV was created.
				These types of resources have hidden counters tracking "how many" records have been written.
		*/
		public void CopyStructureCount(ID3D11Buffer *pDstBuffer, uint32 dstAlignedByteOffset, ID3D11UnorderedAccessView *pSrcView) mut
		{
			VT.CopyStructureCount(&this, pDstBuffer, dstAlignedByteOffset, pSrcView);
		}

		/**
		* Copy a region from a source resource to a destination resource.
		*
		@param pDstResource A pointer to the destination resource (see ID3D11Resource).
		@param dstSubresource Destination subresource index.
		@param dstX The x-coordinate of the upper left corner of the destination region.
		@param dstY The y-coordinate of the upper left corner of the destination region. For a 1D subresource, this must be zero.
		@param dstZ	The z-coordinate of the upper left corner of the destination region. For a 1D or 2D subresource, this must be zero.
		@param pSrcResource	A pointer to the source resource (see ID3D11Resource).
		@param srcSubresource Source subresource index.
		@param pSrcBox A pointer to a 3D box (see D3D11_BOX) that defines the source subresource that can be copied. If NULL, the entire source subresource is copied. The box must fit within the source resource.
					An empty box results in a no-op. A box is empty if the top value is greater than or equal to the bottom value, or the left value is greater than or equal to the right value,
					or the front value is greater than or equal to the back value. When the box is empty, CopySubresourceRegion doesn't perform a copy operation.
		*/
		public void CopySubresourceRegion(ID3D11Resource *pDstResource, uint32 dstSubresource, uint32 dstX, uint32 dstY, uint32 dstZ, ID3D11Resource  *pSrcResource, uint32 srcSubresource, Box *pSrcBox) mut
		{
			VT.CopySubresourceRegion(&this, pDstResource, dstSubresource, dstX, dstY, dstZ, pSrcResource, srcSubresource, pSrcBox);
		}

		/**
		* Execute a command list from a thread group.
		*
		@param threadGroupCountX The number of groups dispatched in the x direction. ThreadGroupCountX must be less than or equal to ComputeShaderStage.DispatchMaxThreadGroupsPerDimension (65535).
		@param threadGroupCountY The number of groups dispatched in the y direction. ThreadGroupCountY must be less than or equal to ComputeShaderStage.DispatchMaxThreadGroupsPerDimension (65535).
		@param threadGroupCountZ The number of groups dispatched in the z direction. ThreadGroupCountZ must be less than or equal to ComputeShaderStage.DispatchMaxThreadGroupsPerDimension (65535).
				In feature level 10 the value for ThreadGroupCountZ must be 1.
		*/
		public void Dispatch(UINT threadGroupCountX, UINT threadGroupCountY, UINT threadGroupCountZ) mut
		{
			VT.Dispatch(&this, threadGroupCountX, threadGroupCountY, threadGroupCountZ);
		}

		/**
		* Execute a command list over one or more thread groups.
		*
		@param pBufferForArgs A pointer to an ID3D11Buffer, which must be loaded with data that matches the argument list for ID3D11DeviceContext::Dispatch.
		@param alignedByteOffsetForArgs	A byte-aligned offset between the start of the buffer and the arguments.
		*/
		public void DispatchIndirect(ID3D11Buffer *pBufferForArgs, UINT alignedByteOffsetForArgs) mut
		{
			VT.DispatchIndirect(&this, pBufferForArgs, alignedByteOffsetForArgs);
		}

		/**
		* Draw non-indexed, non-instanced primitives.
		*
		@param vertexCount Number of vertices to draw.
		@param startVertexLocation Index of the first vertex, which is usually an offset in a vertex buffer.
		*/
		public void Draw(UINT vertexCount, UINT startVertexLocation) mut
		{
			VT.Draw(&this, vertexCount, startVertexLocation);
		}

		/**
		* Draw geometry of an unknown size.
		*/
		public void DrawAuto() mut
		{
			VT.DrawAuto(&this);
		}

		/**
		* Draw geometry of an unknown size.
		*
		@param indexCount Number of indices to draw.
		@param startIndexLocation The location of the first index read by the GPU from the index buffer.
		@param baseVertexLocation A value added to each index before reading a vertex from the vertex buffer.
		*/
		public void DrawIndexed(UINT indexCount, UINT startIndexLocation, INT baseVertexLocation) mut
		{
			VT.DrawIndexed(&this, indexCount, startIndexLocation, baseVertexLocation);
		}

		/**
		* Draw indexed, instanced primitives.
		*
		@param indexCountPerInstance Number of indices read from the index buffer for each instance.
		@param instanceCount Number of instances to draw.
		@param startIndexLocation The location of the first index read by the GPU from the index buffer.
		@param baseVertexLocation A value added to each index before reading a vertex from the vertex buffer.
		@param startInstanceLocation A value added to each index before reading per-instance data from a vertex buffer.
		*/
		public void DrawIndexedInstanced(UINT indexCountPerInstance, UINT instanceCount, UINT startIndexLocation, INT baseVertexLocation, UINT startInstanceLocation) mut
		{
			VT.DrawIndexedInstanced(&this, indexCountPerInstance, instanceCount, startIndexLocation, baseVertexLocation, startInstanceLocation);
		}

		/**
		* Draw indexed, instanced, GPU-generated primitives.
		*
		@param pBufferForArgs A pointer to an ID3D11Buffer, which is a buffer containing the GPU generated primitives.
		@param alignedByteOffsetForArgs Offset in pBufferForArgs to the start of the GPU generated primitives.
		*/
		public void DrawIndexedInstancedIndirect(ID3D11Buffer *pBufferForArgs, UINT alignedByteOffsetForArgs) mut
		{
			VT.DrawIndexedInstancedIndirect(&this, pBufferForArgs, alignedByteOffsetForArgs);
		}

		/**
		* Draw non-indexed, instanced primitives.
		*
		@param vertexCountPerInstance Number of vertices to draw.
		@param instanceCount Number of instances to draw.
		@param startVertexLocation Index of the first vertex.
		@param startInstanceLocation A value added to each index before reading per-instance data from a vertex buffer.
		*/
		public void DrawInstanced(UINT vertexCountPerInstance, UINT instanceCount, UINT startVertexLocation, UINT startInstanceLocation) mut
		{
			VT.DrawInstanced(&this, vertexCountPerInstance, instanceCount, startVertexLocation, startInstanceLocation);
		}

		/**
		* Draw instanced, GPU-generated primitives.
		*
		@param pBufferForArgs A pointer to an ID3D11Buffer, which is a buffer containing the GPU generated primitives.
		@param alignedByteOffsetForArgs Offset in pBufferForArgs to the start of the GPU generated primitives.
		*/
		public void DrawInstancedIndirect(ID3D11Buffer *pBufferForArgs, UINT alignedByteOffsetForArgs) mut
		{
			VT.DrawInstancedIndirect(&this, pBufferForArgs, alignedByteOffsetForArgs);
		}

		/**
		* Mark the end of a series of commands.
		*
		@param pAsync A pointer to an ID3D11Asynchronous interface.
		*/
		public void End(ID3D11Asynchronous *pAsync) mut
		{
			VT.End(&this, pAsync);
		}

		/**
		* Queues commands from a command list onto a device.
		* Use this method to play back a command list that was recorded by a deferred context on any thread.
		* 
		@param pCommandList A pointer to an ID3D11CommandList interface that encapsulates a command list.
		@param restoreContextState A Boolean flag that determines whether the target context state is saved prior to and restored after the execution of a command list.
				Use TRUE to indicate that the runtime needs to save and restore the state. Use FALSE to indicate that no state shall be saved or restored,
				which causes the target context to return to its default state after the command list executes.
				Applications should typically use FALSE unless they will restore the state to be nearly equivalent to the state that the runtime would restore if TRUE were passed.
				When applications use FALSE, they can avoid unnecessary and inefficient state transitions.
		*/
		public void ExecuteCommandList(ID3D11CommandList *pCommandList, BOOL restoreContextState) mut
		{
			 VT.ExecuteCommandList(&this, pCommandList, restoreContextState);
		}

		/**
		* Create a command list and record graphics commands into it.
		*
		@param restoreDeferredContextState A Boolean flag that determines whether the runtime saves deferred context state before it executes FinishCommandList and restores it afterwards.
				Use TRUE to indicate that the runtime needs to save and restore the state. Use FALSE to indicate that the runtime will not save or restore any state.
				In this case, the deferred context will return to its default state after the call to FinishCommandList completes. For information about default state, see ID3D11DeviceContext::ClearState.
				Typically, use FALSE unless you restore the state to be nearly equivalent to the state that the runtime would restore if you passed TRUE.
				When you use FALSE, you can avoid unnecessary and inefficient state transitions.

		@param ppCommandList Upon completion of the method, the passed pointer to an ID3D11CommandList interface pointer is initialized with the recorded command list information.
				The resulting ID3D11CommandList object is immutable and can only be used with ID3D11DeviceContext::ExecuteCommandList.

		@returns Returns S_OK if successful; otherwise, returns one of the following:
					- Returns DXGI_ERROR_DEVICE_REMOVED if the video card has been physically removed from the system, or a driver upgrade for the video card has occurred.
						If this error occurs, you should destroy and recreate the device.
					- Returns DXGI_ERROR_INVALID_CALL if FinishCommandList cannot be called from the current context.
					- Returns E_OUTOFMEMORY if the application has exhausted available memory.

		*/
		public HResult FinishCommandList(BOOL restoreDeferredContextState, ID3D11CommandList **ppCommandList) mut
		{
			return VT.FinishCommandList(&this, restoreDeferredContextState, ppCommandList);
		}

		/**
		* Sends queued-up commands in the command buffer to the graphics processing unit (GPU).
		* Most applications don't need to call this method. If an application calls this method when not necessary,
		* it incurs a performance penalty. Each call to Flush incurs a significant amount of overhead.
		*/
		public void Flush() mut
		{
			VT.Flush(&this);
		}

		/**
		* Generates mipmaps for the given shader resource.
		*
		@param pShaderResourceView A pointer to an ID3D11ShaderResourceView interface that represents the shader resource.
		*/
		public void GenerateMips(ID3D11ShaderResourceView *pShaderResourceView) mut
		{
			VT.GenerateMips(&this, pShaderResourceView);
		}

		/**
		* Get data from the graphics processing unit (GPU) asynchronously.
		*
		@param pAsync		A pointer to an ID3D11Asynchronous interface for the object about which GetData retrieves data.
		@param pData 		Address of memory that will receive the data. If NULL, GetData will be used only to check status.
							The type of data output depends on the type of asynchronous interface.
		@param dataSize		Size of the data to retrieve or 0. Must be 0 when pData is NULL.
		@param getDataFlags Optional flags. Can be None (0) or any combination of the flags enumerated by AsyncGetDataFlagsAsyncGetDataFlags.

		@returns	This method returns one of the Direct3D 11 Return Codes.
					A return value of S_OK indicates that the data at pData is available for the calling application to access.
					A return value of S_FALSE indicates that the data is not yet available.
					If the data is not yet available, the application must call GetData until the data is available.
		*/
		public void GetData(ID3D11Asynchronous *pAsync,	void *pData, UINT dataSize, AsyncGetDataFlags getDataFlags) mut
		{
			VT.GetData(&this, pAsync, pData, dataSize, getDataFlags);
		}

		/**
		* Get the rendering predicate state.
		* Any returned interfaces will have their reference count incremented by one.
		* Applications should call IUnknown::Release on the returned interfaces when they are no longer needed to avoid memory leaks.
		*
		@param ppPredicate 		Address of a pointer to a predicate (see ID3D11Predicate). Value stored here will be NULL upon device creation.
		@param pPredicateValue 	Address of a boolean to fill with the predicate comparison value. FALSE upon device creation.
		*/
		public void GetPredication(ID3D11Predicate **ppPredicate, BOOL *pPredicateValue) mut
		{
			VT.GetPredication(&this, ppPredicate, pPredicateValue);
		}

		/**
		* Gets the minimum level-of-detail (LOD).
		*
		@param pResource A pointer to an ID3D11Resource which represents the resource.
		@return Returns the minimum LOD.
		*/
		public float GetResourceMinLOD(ID3D11Resource *pResource) mut
		{
			return VT.GetResourceMinLOD(&this, pResource);
		}

		/**
		* Gets the type of device context.
		*
		@return A member of DeviceContextType that indicates the type of device context. 
		*/
		public DeviceContextType GetDeviceContextType() mut
		{
			return VT.GetDeviceContextType(&this);
		}

		/**
		* Gets a pointer to the data contained in a subresource, and denies the GPU access to that subresource.
		*
		@param pResource 		A pointer to a ID3D11Resource interface.
		@param subresource 		Index number of the subresource.
		@param mapType 			A D3D11_MAP-typed value that specifies the CPU's read and write permissions for a resource.
		@param mapFlags			Flag that specifies what the CPU does when the GPU is busy. This flag is optional.
		@param pMappedResource	A pointer to the D3D11_MAPPED_SUBRESOURCE structure for the mapped subresource. See the Remarks section regarding NULL pointers.
		@return This method returns one of the Direct3D 11 Return Codes.
					- This method also returns DXGI_ERROR_WAS_STILL_DRAWING if MapFlags specifies D3D11_MAP_FLAG_DO_NOT_WAIT and the GPU is not yet finished with the resource.
					- This method also returns DXGI_ERROR_DEVICE_REMOVED if MapType allows any CPU read access and the video card has been removed.
		*/
		public HResult Map(ID3D11Resource *pResource, UINT subresource, MapType mapType, MapFlags mapFlags, MappedSubresource *pMappedResource) mut
		{
			return VT.Map(&this, pResource, subresource, mapType, mapFlags, pMappedResource);
		}

		/**
		* Copy a multisampled resource into a non-multisampled resource.
		*
		@param pDstResource		Destination resource. Must be a created with the D3D11_USAGE_DEFAULT flag and be single-sampled. See ID3D11Resource.
		@param dstSubresource	A zero-based index, that identifies the destination subresource. Use D3D11CalcSubresource to calculate the index.
		@param pSrcResource		Source resource. Must be multisampled.
		@param srcSubresource	The source subresource of the source resource.
		@param format			A DXGI_FORMAT that indicates how the multisampled resource will be resolved to a single-sampled resource.
		*/
		public void ResolveSubresource(ID3D11Resource *pDstResource, UINT dstSubresource, ID3D11Resource *pSrcResource, UINT srcSubresource, Format format) mut
		{
			VT.ResolveSubresource(&this, pDstResource, dstSubresource, pSrcResource, srcSubresource, format);
		}

		/**
		* Set a rendering predicate.
		*
		@param pPredicate		A pointer to the ID3D11Predicate interface that represents the rendering predicate.
								A NULL value indicates "no" predication; in this case, the value of PredicateValue is irrelevant but will be preserved for ID3D11DeviceContext::GetPredication.
		@param predicateValue	If TRUE, rendering will be affected by when the predicate's conditions are met.
								If FALSE, rendering will be affected when the conditions are not met.	
		*/
		public void SetPredication(ID3D11Predicate *pPredicate, BOOL predicateValue) mut
		{
			VT.SetPredication(&this, pPredicate, predicateValue);
		}

		/**
		* Sets the minimum level-of-detail (LOD) for a resource.
		*
		@param pResource 	A pointer to an ID3D11Resource that represents the resource.
		@param minLOD		The level-of-detail, which ranges between 0 and the maximum number of mipmap levels of the resource.
							For example, the maximum number of mipmap levels of a 1D texture is specified in the MipLevels member of the D3D11_TEXTURE1D_DESC structure.
		*/
		public void SetResourceMinLOD(ID3D11Resource *pResource, float minLOD) mut
		{
			VT.SetResourceMinLOD(&this, pResource, minLOD);
		}

		/**
		* Invalidate the pointer to a resource and reenable the GPU's access to that resource.
		*
		@param pResource	A pointer to a ID3D11Resource interface.
		@param subresource	A subresource to be unmapped.
		*/
		public void Unmap(ID3D11Resource *pResource, UINT subresource) mut
		{
			VT.Unmap(&this, pResource, subresource);
		}

		/**
		* The CPU copies data from memory to a subresource created in non-mappable memory.
		*
		@param pDstResource		A pointer to the destination resource (see ID3D11Resource).	
		@param dstSubresource	A zero-based index, that identifies the destination subresource. See D3D11CalcSubresource for more details.
		@param pDstBox			A pointer to a box that defines the portion of the destination subresource to copy the resource data into.
								Coordinates are in bytes for buffers and in texels for textures.
								If NULL, the data is written to the destination subresource with no offset.
								The dimensions of the source must fit the destination (see D3D11_BOX).

								An empty box results in a no-op.
		@param pSrcData		    A pointer to the source data in memory.
		@param srcRowPitch		The size of one row of the source data.
		@param srcDepthPitch	The size of one depth slice of source data.
		*/
		public void UpdateSubresource(ID3D11Resource *pDstResource, UINT dstSubresource, Box *pDstBox, void *pSrcData, UINT srcRowPitch, UINT srcDepthPitch) mut
		{
			VT.UpdateSubresource(&this, pDstResource, dstSubresource, pDstBox, pSrcData, srcRowPitch, srcDepthPitch);
		}
	}
}
