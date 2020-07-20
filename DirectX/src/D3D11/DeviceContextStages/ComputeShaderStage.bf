namespace DirectX.D3D11.DeviceContextStages
{
	/**
	 * Provides access to the device contexts methods for the compute shader stage.
	*/
	public struct ComputeShaderStage : ID3D11DeviceContext
	{
		/**
		* Get the constant buffers used by the compute-shader stage.
		* Any returned interfaces will have their reference count incremented by one.
		* Applications should call IUnknown::Release on the returned interfaces when they are no longer needed to avoid memory leaks.
		*
		@param startSlot Index into the device's zero-based array to begin retrieving constant buffers from (ranges from 0 to D3D11_COMMONSHADER_CONSTANT_BUFFER_API_SLOT_COUNT - 1).
		@param numBuffers Number of buffers to retrieve (ranges from 0 to D3D11_COMMONSHADER_CONSTANT_BUFFER_API_SLOT_COUNT - StartSlot).
		@param ppConstantBuffers Array of constant buffer interface pointers (see ID3D11Buffer) to be returned by the method.
		*/
		public void GetConstantBuffers(UINT startSlot, UINT numBuffers, ID3D11Buffer **ppConstantBuffers) mut
 		{
			 VT.CSGetConstantBuffers(&this, startSlot, numBuffers, ppConstantBuffers);
		}

		/**
		* Get an array of sampler state interfaces from the compute-shader stage.
		* Any returned interfaces will have their reference count incremented by one.
		* Applications should call IUnknown::Release on the returned interfaces when they are no longer needed to avoid memory leaks.
		*
		@param startSlot Index into a zero-based array to begin getting samplers from (ranges from 0 to D3D11_COMMONSHADER_SAMPLER_SLOT_COUNT - 1).
		@param numSamplers Number of samplers to get from a device context. Each pipeline stage has a total of 16 sampler slots available (ranges from 0 to D3D11_COMMONSHADER_SAMPLER_SLOT_COUNT - StartSlot).
		@param ppSamplersPointer to an array of sampler-state interfaces (see ID3D11SamplerState).
		*/
		public void GetSamplers(UINT startSlot, UINT numSamplers, ID3D11SamplerState **ppSamplers) mut
		{
			VT.CSGetSamplers(&this, startSlot, numSamplers, ppSamplers);
		}

		/**
		* Get the compute shader currently set on the device.
		* Any returned interfaces will have their reference count incremented by one.
		* Applications should call IUnknown::Release on the returned interfaces when they are no longer needed to avoid memory leaks.
		*
		@param ppComputeShader Address of a pointer to a Compute shader (see ID3D11ComputeShader) to be returned by the method.
		@param ppClassInstances	Pointer to an array of class instance interfaces (see ID3D11ClassInstance).
		@param pNumClassInstances The number of class-instance elements in the array.
		*/
		public void GetShader(ID3D11ComputeShader **ppComputeShader, ID3D11ClassInstance **ppClassInstances, UINT *pNumClassInstances) mut
		{
			VT.CSGetShader(&this, ppComputeShader, ppClassInstances, pNumClassInstances);
		}

		/**
		* Get the compute-shader resources.
		* Any returned interfaces will have their reference count incremented by one.
		* Applications should call IUnknown::Release on the returned interfaces when they are no longer needed to avoid memory leaks.
		*
		@param startSlot Index into the device's zero-based array to begin getting shader resources from (ranges from 0 to D3D11_COMMONSHADER_INPUT_RESOURCE_SLOT_COUNT - 1).
		@param numViews The number of resources to get from the device. Up to a maximum of 128 slots are available for shader resources (ranges from 0 to D3D11_COMMONSHADER_INPUT_RESOURCE_SLOT_COUNT - StartSlot).
		@param ppShaderResourceViews Array of shader resource view interfaces to be returned by the device.
		*/
		public void GetShaderResources(UINT startSlot, UINT numViews, ID3D11ShaderResourceView **ppShaderResourceViews) mut
		{
			VT.CSGetShaderResources(&this, startSlot, numViews, ppShaderResourceViews);
		}

		/**
		* Gets an array of views for an unordered resource.
		* Any returned interfaces will have their reference count incremented by one.
		* Applications should call IUnknown::Release on the returned interfaces when they are no longer needed to avoid memory leaks.
		*
		@param startSlot Index of the first element in the zero-based array to return (ranges from 0 to D3D11_1_UAV_SLOT_COUNT - 1).
		@param numUAVs Number of views to get (ranges from 0 to D3D11_1_UAV_SLOT_COUNT - StartSlot).
		@param ppUnorderedAccessViews A pointer to an array of interface pointers (see ID3D11UnorderedAccessView) to get.
		*/
		public void GetUnorderedAccessViews(UINT startSlot, UINT numUAVs, ID3D11UnorderedAccessView **ppUnorderedAccessViews) mut
 		{
			 VT.CSGetUnorderedAccessViews(&this, startSlot, numUAVs, ppUnorderedAccessViews);
		}

		/**
		* Sets the constant buffers used by the compute-shader stage.
		* The method will hold a reference to the interfaces passed in.
		*
		@param startSlot Index into the zero-based array to begin setting constant buffers to (ranges from 0 to D3D11_COMMONSHADER_CONSTANT_BUFFER_API_SLOT_COUNT - 1).
		@param numBuffers Number of buffers to set (ranges from 0 to D3D11_COMMONSHADER_CONSTANT_BUFFER_API_SLOT_COUNT - StartSlot).
		@param ppConstantBuffers Array of constant buffers (see ID3D11Buffer) being given to the device.
		*/
		public void SetConstantBuffers(UINT startSlot, UINT numBuffers, ID3D11Buffer **ppConstantBuffers) mut
		{
			VT.CSSetConstantBuffers(&this, startSlot, numBuffers, ppConstantBuffers);
		}

		/**
		* Set an array of sampler states to the compute-shader stage.
		* The method will hold a reference to the interfaces passed in.
		* Any sampler may be set to NULL; this invokes the default state, which is defined to be the following.
		* 
		@param startSlot Index into the device's zero-based array to begin setting samplers to (ranges from 0 to D3D11_COMMONSHADER_SAMPLER_SLOT_COUNT - 1).
		@param numBuffers Number of samplers in the array. Each pipeline stage has a total of 16 sampler slots available (ranges from 0 to D3D11_COMMONSHADER_SAMPLER_SLOT_COUNT - StartSlot).
		@param ppSamplers Pointer to an array of sampler-state interfaces (see ID3D11SamplerState).
		*/
		public void SetSamplers(UINT startSlot, UINT numBuffers, ID3D11SamplerState **ppSamplers) mut
		{
			VT.CSSetSamplers(&this, startSlot, numBuffers, ppSamplers);
		}

		/**
		* Set a compute shader to the device.
		* The method will hold a reference to the interfaces passed in.
		* Any sampler may be set to NULL; this invokes the default state, which is defined to be the following.
		* 
		@param pComputeShader Pointer to a compute shader (see ID3D11ComputeShader). Passing in NULL disables the shader for this pipeline stage.
		@param ppClassInstances A pointer to an array of class-instance interfaces (see ID3D11ClassInstance).
				Each interface used by a shader must have a corresponding class instance or the shader will get disabled. Set ppClassInstances to NULL if the shader does not use any interfaces.
		@param numClassInstances The number of class-instance interfaces in the array.
		*/
		public void SetShader(ID3D11ComputeShader *pComputeShader, ID3D11ClassInstance **ppClassInstances, UINT numClassInstances) mut
		{
			VT.CSSetShader(&this, pComputeShader, ppClassInstances, numClassInstances);
		}

		/**
		* Bind an array of shader resources to the compute-shader stage.
		* If an overlapping resource view is already bound to an output slot, such as a render target,
		* then the method will fill the destination shader resource slot with NULL.
		*
		@param startSlot Index into the device's zero-based array to begin setting shader resources to (ranges from 0 to D3D11_COMMONSHADER_INPUT_RESOURCE_SLOT_COUNT - 1).
		@param numViews	Number of shader resources to set. Up to a maximum of 128 slots are available for shader resources(ranges from 0 to D3D11_COMMONSHADER_INPUT_RESOURCE_SLOT_COUNT - StartSlot).
		@param ppShaderResourceViews Array of shader resource view interfaces to set to the device.
		*/
		public void SetShaderResources(UINT startSlot, UINT numViews, ID3D11ShaderResourceView **ppShaderResourceViews) mut
		{
			VT.CSSetShaderResources(&this, startSlot, numViews, ppShaderResourceViews);
		}

		/**
		* Sets an array of views for an unordered resource.
		*
		@param startSlot Index of the first element in the zero-based array to begin setting (ranges from 0 to D3D11_1_UAV_SLOT_COUNT - 1). D3D11_1_UAV_SLOT_COUNT is defined as 64.
		@param numUAVs Number of views to set (ranges from 0 to D3D11_1_UAV_SLOT_COUNT - StartSlot).
		@param ppUnorderedAccessViews A pointer to an array of ID3D11UnorderedAccessView pointers to be set by the method.
		@param pUAVInitialCounts An array of append and consume buffer offsets. A value of -1 indicates to keep the current offset.
				Any other values set the hidden counter for that appendable and consumable UAV.
				pUAVInitialCounts is only relevant for UAVs that were created with either D3D11_BUFFER_UAV_FLAG_APPEND or
				D3D11_BUFFER_UAV_FLAG_COUNTER specified when the UAV was created; otherwise, the argument is ignored.
		*/
		public void SetUnorderedAccessViews(UINT startSlot, UINT numUAVs, ID3D11UnorderedAccessView **ppUnorderedAccessViews, UINT *pUAVInitialCounts) mut
		{
			VT.CSSetUnorderedAccessViews(&this, startSlot, numUAVs, ppUnorderedAccessViews, pUAVInitialCounts);
		}
	}
}
