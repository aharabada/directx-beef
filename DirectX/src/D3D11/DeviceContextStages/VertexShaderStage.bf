using System;

namespace DirectX.D3D11.DeviceContextStages
{
	/**
	 * Provides access to the device contexts methods for the vertex shader stage.
	*/
	public struct VertexShaderStage
	{
		ID3D11DeviceContext.VTable* mVT;
		
		[Inline]
		public ID3D11DeviceContext.VTable* VT => mVT;

		/**
		* Get the constant buffers used by the vertex-shader stage.
		* Any returned interfaces will have their reference count incremented by one.
		* Applications should call IUnknown::Release on the returned interfaces when they are no longer needed to avoid memory leaks.
		*
		@param startSlot Index into the device's zero-based array to begin retrieving constant buffers from (ranges from 0 to D3D11_COMMONSHADER_CONSTANT_BUFFER_API_SLOT_COUNT - 1).
		@param numBuffers Number of buffers to retrieve (ranges from 0 to D3D11_COMMONSHADER_CONSTANT_BUFFER_API_SLOT_COUNT - StartSlot).
		@param ppConstantBuffers Array of constant buffer interface pointers (see ID3D11Buffer) to be returned by the method.
		*/
		public void GetConstantBuffers(UINT startSlot, UINT numBuffers, ID3D11Buffer **ppConstantBuffers) mut
		{
			 VT.VSGetConstantBuffers((.)&this, startSlot, numBuffers, ppConstantBuffers);
		}

		/**
		* Get an array of sampler state interfaces from the vertex-shader stage.
		* Any returned interfaces will have their reference count incremented by one.
		* Applications should call IUnknown::Release on the returned interfaces when they are no longer needed to avoid memory leaks.
		*
		@param startSlot Index into a zero-based array to begin getting samplers from (ranges from 0 to D3D11_COMMONSHADER_SAMPLER_SLOT_COUNT - 1).
		@param numSamplers Number of samplers to get from a device context. Each pipeline stage has a total of 16 sampler slots available (ranges from 0 to D3D11_COMMONSHADER_SAMPLER_SLOT_COUNT - StartSlot).
		@param ppSamplersPointer to an array of sampler-state interfaces (see ID3D11SamplerState).
		*/
		public void GetSamplers(UINT startSlot, UINT numSamplers, ID3D11SamplerState **ppSamplers) mut
		{
			VT.VSGetSamplers((.)&this, startSlot, numSamplers, ppSamplers);
		}

		/**
		* Get the vertex shader currently set on the device.
		* Any returned interfaces will have their reference count incremented by one.
		* Applications should call IUnknown::Release on the returned interfaces when they are no longer needed to avoid memory leaks.
		*
		@param ppVertexShader Address of a pointer to a vertex shader (see ID3D11VertexShader) to be returned by the method.
		@param ppClassInstances	Pointer to an array of class instance interfaces (see ID3D11ClassInstance).
		@param pNumClassInstances The number of class-instance elements in the array.
		*/
		public void GetShader(ID3D11VertexShader **ppVertexShader, ID3D11ClassInstance **ppClassInstances, UINT *pNumClassInstances) mut
		{
			VT.VSGetShader((.)&this, ppVertexShader, ppClassInstances, pNumClassInstances);
		}

		/**
		* Get the vertex-shader resources.
		* Any returned interfaces will have their reference count incremented by one.
		* Applications should call IUnknown::Release on the returned interfaces when they are no longer needed to avoid memory leaks.
		*
		@param startSlot Index into the device's zero-based array to begin getting shader resources from (ranges from 0 to D3D11_COMMONSHADER_INPUT_RESOURCE_SLOT_COUNT - 1).
		@param numViews The number of resources to get from the device. Up to a maximum of 128 slots are available for shader resources (ranges from 0 to D3D11_COMMONSHADER_INPUT_RESOURCE_SLOT_COUNT - StartSlot).
		@param ppShaderResourceViews Array of shader resource view interfaces to be returned by the device.
		*/
		public void GetShaderResources(UINT startSlot, UINT numViews, ID3D11ShaderResourceView **ppShaderResourceViews) mut
		{
			VT.VSGetShaderResources((.)&this, startSlot, numViews, ppShaderResourceViews);
		}

		/**
		* Sets the constant buffers used by the vertex-shader stage.
		* The method will hold a reference to the interfaces passed in.
		*
		@param startSlot Index into the zero-based array to begin setting constant buffers to (ranges from 0 to D3D11_COMMONSHADER_CONSTANT_BUFFER_API_SLOT_COUNT - 1).
		@param numBuffers Number of buffers to set (ranges from 0 to D3D11_COMMONSHADER_CONSTANT_BUFFER_API_SLOT_COUNT - StartSlot).
		@param ppConstantBuffers Array of constant buffers (see ID3D11Buffer) being given to the device.
		*/
		public void SetConstantBuffers(UINT startSlot, UINT numBuffers, ID3D11Buffer **ppConstantBuffers) mut
		{
			VT.VSSetConstantBuffers((.)&this, startSlot, numBuffers, ppConstantBuffers);
		}

		/**
		* Set an array of sampler states to the vertex-shader stage.
		* The method will hold a reference to the interfaces passed in.
		* Any sampler may be set to NULL; this invokes the default state, which is defined to be the following.
		* 
		@param startSlot Index into the device's zero-based array to begin setting samplers to (ranges from 0 to D3D11_COMMONSHADER_SAMPLER_SLOT_COUNT - 1).
		@param numBuffers Number of samplers in the array. Each pipeline stage has a total of 16 sampler slots available (ranges from 0 to D3D11_COMMONSHADER_SAMPLER_SLOT_COUNT - StartSlot).
		@param ppSamplers Pointer to an array of sampler-state interfaces (see ID3D11SamplerState).
		*/
		public void SetSamplers(UINT startSlot, UINT numBuffers, ID3D11SamplerState **ppSamplers) mut
		{
			VT.VSSetSamplers((.)&this, startSlot, numBuffers, ppSamplers);
		}

		/**
		* Set a vertex shader to the device.
		* The method will hold a reference to the interfaces passed in.
		* Any sampler may be set to NULL; this invokes the default state, which is defined to be the following.
		* 
		@param pVertexShader Pointer to a vertex shader (see ID3D11VertexShader). Passing in NULL disables the shader for this pipeline stage.
		@param ppClassInstances A pointer to an array of class-instance interfaces (see ID3D11ClassInstance).
				Each interface used by a shader must have a corresponding class instance or the shader will get disabled. Set ppClassInstances to NULL if the shader does not use any interfaces.
		@param numClassInstances The number of class-instance interfaces in the array.
		*/
		public void SetShader(ID3D11VertexShader *pVertexShader, ID3D11ClassInstance **ppClassInstances = null, UINT numClassInstances = 0) mut
		{
			VT.VSSetShader((.)&this, pVertexShader, ppClassInstances, numClassInstances);
		}

		/**
		* Bind an array of shader resources to the vertex-shader stage.
		* If an overlapping resource view is already bound to an output slot, such as a render target,
		* then the method will fill the destination shader resource slot with NULL.
		*
		@param startSlot Index into the device's zero-based array to begin setting shader resources to (ranges from 0 to D3D11_COMMONSHADER_INPUT_RESOURCE_SLOT_COUNT - 1).
		@param numViews	Number of shader resources to set. Up to a maximum of 128 slots are available for shader resources(ranges from 0 to D3D11_COMMONSHADER_INPUT_RESOURCE_SLOT_COUNT - StartSlot).
		@param ppShaderResourceViews Array of shader resource view interfaces to set to the device.
		*/
		public void SetShaderResources(UINT startSlot, UINT numViews, ID3D11ShaderResourceView **ppShaderResourceViews) mut
		{
			VT.VSSetShaderResources((.)&this, startSlot, numViews, ppShaderResourceViews);
		}
	}
}
