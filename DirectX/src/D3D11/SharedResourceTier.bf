namespace DirectX.D3D11
{
	/**
	 * Defines constants that specify a tier for shared resource support.
	*/
	public enum SharedResourceTier : uint32
	{
		/**
		 * Specifies the support available when D3D11_FEATURE_DATA_D3D11_OPTIONS::ExtendedResourceSharing is FALSE.
		*/
		Tier0 = 0,
		/**
		 * Specifies the support available when D3D11_FEATURE_DATA_D3D11_OPTIONS::ExtendedResourceSharing is TRUE.
		*/
		Tier1 = 1,
		/**
		 * Specifies the support available when D3D11_FEATURE_DATA_D3D11_OPTIONS4::ExtendedNV12SharedTextureSupported is TRUE. Also see Extended NV12 texture support.
		*/
		Tier2 = 2,
		/**
		 * Specifies that DXGI_FORMAT_R11G11B10_FLOAT supports NT handle sharing. Also see CreateSharedHandle.
		*/
		Tier3 = 3
	}
}
