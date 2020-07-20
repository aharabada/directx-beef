namespace DirectX.DXGI.DXGI1_2
{
	/**
	 * Identifies the importance of a resource’s content when you call the IDXGIDevice2::OfferResources method to offer the resource.
	 * DXGI_OFFER_RESOURCE_PRIORITY
	*/
	public enum OfferResourcePriority : uint32
	{
		/**
		 * The resource is low priority.
		 * The operating system discards a low priority resource before other offered resources with higher priority.
		 * It is a good programming practice to mark a resource as low priority if it has no useful content.
		 * DXGI_OFFER_RESOURCE_PRIORITY_LOW
		*/
        Low = 1,
		/**
		 * The resource is normal priority.
		 * You mark a resource as normal priority if it has content that is easy to regenerate.
		 * DXGI_OFFER_RESOURCE_PRIORITY_NORMAL
		*/
        Normal = (Low + 1),
		/**
		 * The resource is high priority.
		 * The operating system discards other offered resources with lower priority before it discards a high priority resource.
		 * You mark a resource as high priority if it has useful content that is difficult to regenerate.
		 * DXGI_OFFER_RESOURCE_PRIORITY_HIGH
		*/
        High = (Normal + 1),
		/**
		 * None. This is an invalid value.
		*/
		None = 0
	}
}
