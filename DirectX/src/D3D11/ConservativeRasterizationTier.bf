namespace DirectX.D3D11
{
	/**
	 * Specifies if the hardware and driver support conservative rasterization and at what tier level.
	 * D3D11_CONSERVATIVE_RASTERIZATION_TIER
	*/
	public enum ConservativeRasterizationTier : uint32
	{
		/**
		 * Conservative rasterization isn't supported.
		 * D3D11_CONSERVATIVE_RASTERIZATION_NOT_SUPPORTED
		*/
		NotSupported = 0,
		/**
		 *  	Tier_1 conservative rasterization is supported.
		 * D3D11_CONSERVATIVE_RASTERIZATION_TIER_1
		*/
		Tier1 = 1,
		/**
		 * Tier_2 conservative rasterization is supported.
		 * D3D11_CONSERVATIVE_RASTERIZATION_TIER_2
		*/
		Tier2 = 2,
		/**
		 * Tier_3 conservative rasterization is supported.
		 * D3D11_CONSERVATIVE_RASTERIZATION_TIER_3
		*/
		Tier3 = 3,
	}
}
