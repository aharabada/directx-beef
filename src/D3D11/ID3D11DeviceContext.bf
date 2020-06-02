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
			public function DeviceContextType(ID3D11DeviceContext* self) GeDeviceContextType;     
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
	}
}
