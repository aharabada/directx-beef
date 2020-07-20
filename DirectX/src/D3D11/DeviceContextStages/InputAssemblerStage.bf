using DirectX.DXGI;
using DirectX.Common;

namespace DirectX.D3D11.DeviceContextStages
{
	/**
	 * Provides access to the device contexts methods for the input assembler stage.
	*/
	public struct InputAssemblerStage : ID3D11DeviceContext
	{
		/**
		* Get a pointer to the index buffer that is bound to the input-assembler stage.
		* Any returned interfaces will have their reference count incremented by one.
		* Applications should call IUnknown::Release on the returned interfaces when they are no longer needed to avoid memory leaks.
		*
		@param pIndexBuffer	A pointer to an index buffer returned by the method (see ID3D11Buffer).
		@param format 		Specifies format of the data in the index buffer (see DXGI_FORMAT).
							These formats provide the size and type of the data in the buffer.
							The only formats allowed for index buffer data are 16-bit (DXGI_FORMAT_R16_UINT) and 32-bit (DXGI_FORMAT_R32_UINT) integers.
		@param offset		Offset (in bytes) from the start of the index buffer, to the first index to use.
		*/
		public void GetIndexBuffer(ID3D11Buffer **pIndexBuffer, Format *format, UINT *offset) mut
		{
			VT.IAGetIndexBuffer(&this, pIndexBuffer, format, offset);
		}
		
		/**
		* Get a pointer to the input-layout object that is bound to the input-assembler stage.
		* Any returned interfaces will have their reference count incremented by one.
		* Applications should call IUnknown::Release on the returned interfaces when they are no longer needed to avoid memory leaks.
		*
		@param A pointer to the input-layout object (see ID3D11InputLayout), which describes the input buffers that will be read by the IA stage.
		*/
		public void GetInputLayout(ID3D11InputLayout **ppInputLayout) mut
		{
			VT.IAGetInputLayout(&this, ppInputLayout);
		}

		/**
		* Get information about the primitive type, and data order that describes input data for the input assembler stage.
		*
		@param pTopology A pointer to the type of primitive, and ordering of the primitive data (see D3D11_PRIMITIVE_TOPOLOGY).
		*/
		public void GetPrimitiveTopology(PrimitiveTopology *pTopology) mut
		{
			VT.IAGetPrimitiveTopology(&this, pTopology);
		}

		/**
		* Get the vertex buffers bound to the input-assembler stage.
		* Any returned interfaces will have their reference count incremented by one.
		* Applications should call IUnknown::Release on the returned interfaces when they are no longer needed to avoid memory leaks.
		*
		@param startSlot		The input slot of the first vertex buffer to get. The first vertex buffer is explicitly bound to the start slot;
								this causes each additional vertex buffer in the array to be implicitly bound to each subsequent input slot. The maximum of 16 or 32 input slots (ranges from 0 to D3D11_IA_VERTEX_INPUT_RESOURCE_SLOT_COUNT - 1) are available; the maximum number of input slots depends on the feature level.
		@param numBuffers 		The number of vertex buffers to get starting at the offset. The number of buffers (plus the starting slot) cannot exceed the total number of IA-stage input slots.
		@param ppVertexBuffers	A pointer to an array of vertex buffers returned by the method (see ID3D11Buffer).
		@param pStrides			Pointer to an array of stride values returned by the method; one stride value for each buffer in the vertex-buffer array. Each stride value is the size (in bytes) of the elements that are to be used from that vertex buffer.
		@param pOffsets			Pointer to an array of offset values returned by the method; one offset value for each buffer in the vertex-buffer array. Each offset is the number of bytes between the first element of a vertex buffer and the first element that will be used.
		*/
		public void GetVertexBuffers(UINT startSlot, UINT numBuffers, ID3D11Buffer **ppVertexBuffers, UINT *pStrides, UINT *pOffsets) mut
		{
			VT.IAGetVertexBuffers(&this, startSlot, numBuffers, ppVertexBuffers, pStrides, pOffsets);
		}

		/**
		* Bind an index buffer to the input-assembler stage.
		*
		@param pIndexBuffer A pointer to an ID3D11Buffer object, that contains indices. The index buffer must have been created with the D3D11_BIND_INDEX_BUFFER flag.
		@param format A DXGI_FORMAT that specifies the format of the data in the index buffer. The only formats allowed for index buffer data are 16-bit (DXGI_FORMAT_R16_UINT) and 32-bit (DXGI_FORMAT_R32_UINT) integers.
		@param offset Offset (in bytes) from the start of the index buffer to the first index to use.
		*/
		public void SetIndexBuffer(ID3D11Buffer *pIndexBuffer, Format format, UINT offset) mut
		{
			VT.IASetIndexBuffer(&this, pIndexBuffer, format, offset);
		}

		/**
		* Bind an input-layout object to the input-assembler stage.
		@param A pointer to the input-layout object (see ID3D11InputLayout), which describes the input buffers that will be read by the IA stage.
		*/
		public void SetInputLayout(ID3D11InputLayout *pInputLayout) mut
		{
			VT.IASetInputLayout(&this, pInputLayout);
		}

		/**
		* Bind information about the primitive type, and data order that describes input data for the input assembler stage.
		*
		@param topology The type of primitive and ordering of the primitive data.
		*/
		public void SetPrimitiveTopology(PrimitiveTopology topology) mut
		{
			VT.IASetPrimitiveTopology(&this, topology);
		}

		/**
		* Bind an array of vertex buffers to the input-assembler stage.
		*
		@param startSlot		The first input slot for binding. The first vertex buffer is explicitly bound to the start slot;
								this causes each additional vertex buffer in the array to be implicitly bound to each subsequent input slot.
								The maximum of 16 or 32 input slots (ranges from 0 to D3D11_IA_VERTEX_INPUT_RESOURCE_SLOT_COUNT - 1) are available;
								the maximum number of input slots depends on the feature level.
		@param numBuffers 		The number of vertex buffers in the array.
								The number of buffers (plus the starting slot) can't exceed the total number of IA-stage input slots (ranges from 0 to D3D11_IA_VERTEX_INPUT_RESOURCE_SLOT_COUNT - StartSlot).
		@param ppVertexBuffers  A pointer to an array of vertex buffers (see ID3D11Buffer). The vertex buffers must have been created with the D3D11_BIND_VERTEX_BUFFER flag.	
		@param pStrides			Pointer to an array of stride values; one stride value for each buffer in the vertex-buffer array. Each stride is the size (in bytes) of the elements that are to be used from that vertex buffer.
		@param pOffsets			Pointer to an array of offset values; one offset value for each buffer in the vertex-buffer array. Each offset is the number of bytes between the first element of a vertex buffer and the first element that will be used.
		*/
		public void SetVertexBuffers(UINT startSlot, UINT numBuffers, ID3D11Buffer **ppVertexBuffers, UINT *pStrides, UINT *pOffsets) mut
		{
			VT.IASetVertexBuffers(&this, startSlot, numBuffers, ppVertexBuffers, pStrides, pOffsets);
		}
	}
}
