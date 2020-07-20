namespace DirectX.DXGI
{
	public enum WindowAssociationFlags : uint32
	{
		/**
		Prevent DXGI from monitoring an applications message queue;
		this makes DXGI unable to respond to mode changes.
		DXGI_MWA_NO_WINDOW_CHANGES
		*/
		NoWindowChanges = 1, // 1 << 0
		/**
		Prevent DXGI from responding to an alt-enter sequence. 
		DXGI_MWA_NO_ALT_ENTER 
		*/
		NoAltEnter = 2, // 1 << 1
		/**
		Prevent DXGI from responding to a print-screen key.
		DXGI_MWA_NO_PRINT_SCREEN
		*/
		NoPrintScreen = 4, // 1 << 2
		Valid = 7, // 0x7
	}
}
