namespace DirectX.DXGI
{
	/**
	 * Options for enumerating display modes.
	 * DXGI_ENUM_MODES
	*/
	public enum EnumerationModes : uint32
	{
		/**
		 * Include interlaced modes.
		 * DXGI_ENUM_MODES_INTERLACED
		*/
		Interlaced = 1UL,
		/**
		 * Include stretched-scaling modes.
		 * DXGI_ENUM_MODES_SCALING
		*/
		Scaling = 2UL,
		/**
		 * nclude stereo modes.
		 * DXGI_ENUM_MODES_INTERLACED
		*/
		DXGI_ENUM_MODES_STEREO = 4UL,
		/**
		 * Include stereo modes that are hidden because the user has disabled stereo.
		 * DXGI_ENUM_MODES_INTERLACED
		*/
		DXGI_ENUM_MODES_DISABLED_STEREO = 8UL,
	}
}
