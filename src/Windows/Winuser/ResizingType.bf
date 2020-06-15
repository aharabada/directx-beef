namespace DirectX.Windows
{
	/**
	 * The type of resizing requested.
	 * (The WParam for the Size (WM_SIZE) window notification.)
	*/
	public enum ResizingType : WPARAM
	{
		/**
		 * The window has been resized, but neither the Minimized (SIZE_MINIMIZED) nor Maximized (SIZE_MAXIMIZED) value applies.
		 * SIZE_RESTORED
		*/
		Restored = 0,
		/**
		 * The window has been minimized.
		 * SIZE_MINIMIZED
		*/
		Minimized = 1,
		/**
		 * The window has been maximized.
		 * SIZE_MAXIMIZED
		*/
		Maximized = 2,
		/**
		 * Message is sent to all pop-up windows when some other window has been restored to its former size.
		*/
		MaxShow = 3,
		/**
		 * Message is sent to all pop-up windows when some other window is maximized.
		*/
		MaxHide = 4,
	}
}
