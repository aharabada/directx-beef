namespace DirectX.DXGI
{
	/**
	Link: https://docs.microsoft.com/de-de/windows/win32/direct3ddxgi/dxgi-present
	*/
	public enum PresentFlags : uint32
	{
		/**
		Present a frame from each buffer (starting with the current buffer) to the output.
		*/
		None = 0,
		/**
		DXGI_PRESENT_TEST
		Do not present the frame to the output. The status of the swap chain will be tested and appropriate errors returned.
		DXGI_PRESENT_TEST is intended for use only when switching from the idle state; do not use it to determine when to
		switch to the idle state because doing so can leave the swap chain unable to exit full-screen mode.
		*/
		Test = 0x00000001UL,
		/**
		DXGI_PRESENT_DO_NOT_SEQUENCE
		Present a frame from the current buffer to the output. Use this flag so that the presentation can
		use vertical-blank synchronization instead of sequencing buffers in the chain in the usual manner.
		*/
		DoNotSequece = 0x00000002UL,
		/**
		DXGI_PRESENT_RESTART
		Specifies that the runtime will discard outstanding queued presents.
		*/
		Restart = 0x00000004UL,
		/**
		DXGI_PRESENT_DO_NOT_WAIT
		Specifies that the runtime will fail the presentation (that is, fail a call to IDXGISwapChain1::Present1)
		with the DXGI_ERROR_WAS_STILL_DRAWING error code if the calling thread is blocked; the runtime returns
		DXGI_ERROR_WAS_STILL_DRAWING instead of sleeping until the dependency is resolved.
		Direct3D 11: This enumeration value is supported starting with Windows 8.
		*/
		DoNotWait = 0x00000008UL,
		/**
		DXGI_PRESENT_STEREO_PREFER_RIGHT
		Indicates that if the stereo present must be reduced to mono, right-eye viewing is used rather than left-eye viewing.
		Direct3D 11: This enumeration value is supported starting with Windows 8.
		*/
		StereoPreferRight = 0x00000010UL,
		/**
		DXGI_PRESENT_STEREO_TEMPORARY_MONO
		Indicates that the presentation should use the left buffer as a mono buffer. An application calls the
		IDXGISwapChain1::IsTemporaryMonoSupported method to determine whether a swap chain supports "temporary mono".
		Direct3D 11: This enumeration value is supported starting with Windows 8.
		*/
		StereoTemporaryMono = 0x00000020UL,
		/**
		DXGI_PRESENT_RESTRICT_TO_OUTPUT
		Indicates that presentation content will be shown only on the particular output.
		The content will not be visible on other outputs. For example, if the user tries to
		relocate video content on another output, the video content will not be visible.
		Direct3D 11: This enumeration value is supported starting with Windows 8. 
		*/
		RestrictToOutput = 0x00000040UL,
		/**
		DXGI_PRESENT_USE_DURATION
		This flag must be set by media apps that are currently using a custom present duration (custom refresh rate).
		See IDXGISwapChainMedia.
		*/
		UseDuration = 0x00000100UL,
		/**
		DXGI_PRESENT_ALLOW_TEARING
		Allowing tearing is a requirement of variable refresh rate displays.
		The conditions for using DXGI_PRESENT_ALLOW_TEARING during Present are as follows:

		    The swap chain must be created with the DXGI_SWAP_CHAIN_FLAG_ALLOW_TEARING flag.
		    The sync interval passed in to Present (or Present1) must be 0.
		    The DXGI_PRESENT_ALLOW_TEARING flag cannot be used in an application that is currently in full screen exclusive mode (set by calling SetFullscreenState(TRUE)). It can only be used in windowed mode. To use this flag in full screen Win32 apps, the application should present to a fullscreen borderless window and disable automatic ALT+ENTER fullscreen switching using IDXGIFactory::MakeWindowAssociation. UWP apps that enter fullscreen mode by calling Windows::UI::ViewManagement::ApplicationView::TryEnterFullscreen() are fullscreen borderless windows and may use the flag.

		Calling Present (or Present1) with this flag and not meeting the conditions above will result in a DXGI_ERROR_INVALID_CALL error being returned to the calling application.
		*/
		AllowTearing = 0x00000200UL
	}
}
