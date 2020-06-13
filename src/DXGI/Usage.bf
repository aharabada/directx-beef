namespace DirectX.DXGI
{
	/**
	 * Flags for surface and resource creation options.
	 * DXGI_USAGE
	*/
	public enum Usage : uint32
	{
		/**
		 * Use the surface or resource as an input to a shader.
		 * DXGI_USAGE_SHADER_INPUT
		*/
		ShaderInput = 0x00000010UL,
		/**
		 * Use the surface or resource as an output render target.
		 * DXGI_USAGE_RENDER_TARGET_OUTPUT
		*/
		RenderTargetOutput = 0x00000020UL,
		/**
		 * The surface or resource is used as a back buffer.
		 * You don’t need to pass BackBuffer (DXGI_USAGE_BACK_BUFFER) when you create a swap chain.
		 * But you can determine whether a resource belongs to a swap chain when you call IDXGIResource::GetUsage and get BackBuffer (DXGI_USAGE_BACK_BUFFER).
		 * DXGI_USAGE_BACK_BUFFER
		*/
		BackBuffer = 0x00000040UL,
		/**
		 * Share the surface or resource.
		 * DXGI_USAGE_SHARED
		*/
		Shared = 0x00000080UL,
		/**
		 * Use the surface or resource for reading only.
		 * DXGI_USAGE_READ_ONLY
		*/
		ReadOnly = 0x00000100UL,
		/**
		 * This flag is for internal use only.
		 * DXGI_USAGE_DISCARD_ON_PRESENT
		*/
		DiscardOnPresent = 0x00000200UL,
		/**
		 * Use the surface or resource for unordered access.
		 * DXGI_USAGE_UNORDERED_ACCESS
		*/
		UnorderedAccess = 0x00000400UL,
		/**
		 * No usage flags specified.
		*/
		None = 0
	}
}
