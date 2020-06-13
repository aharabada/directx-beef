namespace DirectX.DXGI
{
	/**
	 * Options for handling pixels in a display surface after calling IDXGISwapChain1::Present1.
	 * DXGI_SWAP_EFFECT
	*/
	public enum SwapEffect : uint32
	{
		/**
		 * Use this flag to specify the bit-block transfer (bitblt) model and to specify that DXGI discard the contents of the back buffer after you call IDXGISwapChain1::Present1.
		 * This flag is valid for a swap chain with more than one back buffer, although, applications only have read and write access to buffer 0.
		 * Use this flag to enable the display driver to select the most efficient presentation technique for the swap chain.
		 * DXGI_SWAP_EFFECT_DISCARD
		*/
        Discard = 0,
		/**
		 * Use this flag to specify the bitblt model and to specify that DXGI persist the contents of the back buffer after you call IDXGISwapChain1::Present1.
		 * Use this option to present the contents of the swap chain in order, from the first buffer (buffer 0) to the last buffer.
		 * This flag cannot be used with multisampling.
		 * DXGI_SWAP_EFFECT_SEQUENTIAL
		*/
        Sequential = 1,
        /**
		 * Use this flag to specify the flip presentation model and to specify that DXGI persist the contents of the back buffer after you call IDXGISwapChain1::Present1.
		 * This flag cannot be used with multisampling.
		 * Direct3D 11:  This enumeration value is supported starting with Windows 8.
		 * DXGI_SWAP_EFFECT_FLIP_SEQUENTIAL
		*/
		FlipSequential = 3,
		/**
		 * Use this flag to specify the flip presentation model and to specify that DXGI discard the contents of the back buffer after you call IDXGISwapChain1::Present1.
		 * This flag cannot be used with multisampling and partial presentation.
		 * Direct3D 11:  This enumeration value is supported starting with Windows 10.
		 * DXGI_SWAP_EFFECT_FLIP_DISCARD
		*/
        FlipDiscard = 4
	}
}
