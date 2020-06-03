namespace DirectX.D3D11
{
	// Todo: original name is weird, rename to FormatSupportUav or simmilar?
	/**
	 * Unordered resource support options for a compute shader resource (see ID3D11Device::CheckFeatureSupport).
	*/
	public enum FormatSupport2 : uint32
	{
		/**
		 * Format supports atomic add.
		 * D3D11_FORMAT_SUPPORT2_UAV_ATOMIC_ADD
		*/
		UavAtomicAdd = 0x1,
		/**
		 * Format supports atomic bitwise operations.
		 * D3D11_FORMAT_SUPPORT2_UAV_ATOMIC_BITWISE_OPS
		*/
		UavAtomicBitwiseOperations = 0x2,
		/**
		 * Format supports atomic compare with store or exchange.
		 * D3D11_FORMAT_SUPPORT2_UAV_ATOMIC_COMPARE_STORE_OR_COMPARE_EXCHANGE
		*/
		UavAtomicCompareStoreOrCompareExchange = 0x4,
		/**
		 * Format supports atomic exchange.
		 * D3D11_FORMAT_SUPPORT2_UAV_ATOMIC_EXCHANGE
		*/
		UavAtomicExchange = 0x8,
		/**
		 * Format supports atomic signed min and max.
		 * D3D11_FORMAT_SUPPORT2_UAV_ATOMIC_SIGNED_MIN_OR_MAX
		*/
		UavAtomicSignedMinMax = 0x10,
		/**
		 * Format supports atomic unsigned min and max.
		 * D3D11_FORMAT_SUPPORT2_UAV_ATOMIC_UNSIGNED_MIN_OR_MAX
		*/
		UavAtomicUnsignedMinMax = 0x20,
		/**
		 * Format supports a typed load.
		 * D3D11_FORMAT_SUPPORT2_UAV_TYPED_LOAD
		*/
		UavTypedLoad = 0x40,
		/**
		 * Format supports a typed store.
		 * D3D11_FORMAT_SUPPORT2_UAV_TYPED_STORE
		*/
		UavTypedStore = 0x80,
		/**
		 * Format supports logic operations in blend state.
		 * Direct3D 11:  This value is not supported until Direct3D 11.1.
		 * D3D11_FORMAT_SUPPORT2_OUTPUT_MERGER_LOGIC_OP
		*/
		OutputMergerLogicOperations = 0x100,
		/**
		 * Format supports tiled resources.
		 * Direct3D 11:  This value is not supported until Direct3D 11.2.
		 * D3D11_FORMAT_SUPPORT2_TILED
		*/
		TiledResources = 0x200,
		/**
		 * Format supports shareable resources.
		 * Direct3D 11:  This value is not supported until Direct3D 11.2.
		 * D3D11_FORMAT_SUPPORT2_SHAREABLE
		*/
		ShareableResources = 0x400,
		/**
		 * Format supports multi-plane overlays.
		 * D3D11_FORMAT_SUPPORT2_MULTIPLANE_OVERLAY
		*/
		MultiplaneOverlays = 0x4000
	}
}
