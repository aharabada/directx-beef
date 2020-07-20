namespace DirectX.D3D11.SDKLayers
{
	public enum FeatureMaskFlags : uint32
	{
		/**
		Runtime will additionally call ID3D11DeviceContext::Flush.
		*/
		D3D11_DEBUG_FEATURE_FLUSH_PER_RENDER_OP = 0x1,
		/**
		Application will wait for the GPU to finish processing the rendering operation before continuing.
		*/
		D3D11_DEBUG_FEATURE_FINISH_PER_RENDER_OP = 0x2,
		/**
		Runtime will call IDXGISwapChain::Present. Presentation of render buffers will occur according to
		the settings established by prior calls to ID3D11Debug::SetSwapChain and ID3D11Debug::SetPresentPerRenderOpDelay.
		*/
		D3D11_DEBUG_FEATURE_PRESENT_PER_RENDER_OP = 0x4,
		/**
		Requires D3D11.1 or higher:
		When you call IDXGIDevice2::OfferResources to offer resources while this flag is enabled, their content is always discarded.
		Use this flag to test code paths that regenerate resource content on reclaim. You cannot use this flag in combination with D3D11_DEBUG_FEATURE_NEVER_DISCARD_OFFERED_RESOURCE.
		*/
		D3D11_DEBUG_FEATURE_ALWAYS_DISCARD_OFFERED_RESOURCE = 0x8,
		/**	
		Requires D3D11.1 or higher:
		When you call IDXGIDevice2::OfferResources to offer resources while this flag is enabled, their content is never discarded.
		Use this flag to test code paths that do not need to regenerate resource content on reclaim. You cannot use this flag in combination with D3D11_DEBUG_FEATURE_ALWAYS_DISCARD_OFFERED_RESOURCE.
		*/
		D3D11_DEBUG_FEATURE_NEVER_DISCARD_OFFERED_RESOURCE = 0x10,
		/**
		Requires D3D11.1 or higher:
		When the debug layer is enabled, it performs certain actions to reveal application problems.
		By setting the D3D11_DEBUG_FEATURE_AVOID_BEHAVIOR_CHANGING_DEBUG_AIDS feature-mask flag, you can enable the debug layer without getting the following default debugging behavior:
		1. If an application calls ID3D11DeviceContext1::DiscardView, the runtime fills in the resource with a random color.
		2. If an application calls IDXGISwapChain1::Present1 with partial presentation parameters, the runtime ignores the partial presentation information.
		*/
		D3D11_DEBUG_FEATURE_AVOID_BEHAVIOR_CHANGING_DEBUG_AIDS = 0x40,
		/**
		Requires D3D11.2 or higher:
		By default (that is, without D3D11_DEBUG_FEATURE_DISABLE_TILED_RESOURCE_MAPPING_TRACKING_AND_VALIDATION set),
		the debug layer validates the proper usage of all tile mappings for tiled resources for bound resources for every operation performed on the device context
		(for example, draw, copy, and so on). Depending on the size of the tiled resources used (if any), this validation can be processor intensive and slow.
		Apps might want to initially run with tiled resource tile mapping validation on; then, when they determine that the calling pattern is safe, they can disable
		the validation by setting D3D11_DEBUG_FEATURE_DISABLE_TILED_RESOURCE_MAPPING_TRACKING_AND_VALIDATION.

		If D3D11_DEBUG_FEATURE_DISABLE_TILED_RESOURCE_MAPPING_TRACKING_AND_VALIDATION is set when a tiled resource is created,
		the debug layer never performs the tracking of tile mapping for that resource for its entire lifetime. Alternatively,
		if D3D11_DEBUG_FEATURE_DISABLE_TILED_RESOURCE_MAPPING_TRACKING_AND_VALIDATION is set for any given device context method call (like draw or copy calls) involving tiled resources,
		the debug layer skips all tile mapping validation for the call.
		*/
		D3D11_DEBUG_FEATURE_DISABLE_TILED_RESOURCE_MAPPING_TRACKING_AND_VALIDATION = 0x80,
	}
}
