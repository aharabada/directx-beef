namespace DirectX.D3D11
{
	/**
	 * Indicates the tier level at which tiled resources are supported.
	*/
	public enum TiledResourceTier
	{
		/**
		 * Tiled resources are not supported.
		 * D3D11_TILED_RESOURCES_NOT_SUPPORTED
		*/
	    NotSupported = 0,
		/**
		 * Tier_1 tiled resources are supported.
		 * D3D11_TILED_RESOURCES_TIER_1
		*/
	    Tier1 = 1,
		/**
		 * Tier_2 tiled resources are supported.
		 * D3D11_TILED_RESOURCES_TIER_2
		*/
	    Tier2 = 2,
		/**
		 * Tier_3 tiled resources are supported.
		 * D3D11_TILED_RESOURCES_TIER_3
		*/
	    Tier3 = 3
	}
}
