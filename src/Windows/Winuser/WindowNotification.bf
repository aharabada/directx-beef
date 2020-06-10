namespace DirectX.Windows.Winuser
{
	public enum WindowNotification : UINT
	{
		/**
		Sent as a signal that a window or an application should terminate.
		WM_CLOSE
		*/
		Close = 0x0010,
		/**
		Sent when a window is being destroyed.
		It is sent to the window procedure of the window being destroyed after the window is removed from the screen.
		WM_DESTROY
		*/
		Destroy = 0x0002,
		/**
		 * Indicates a request to terminate an application, and is generated when the application calls the PostQuitMessage function.
		 * WM_QUIT
		*/
		Quit = 0x0012,
	}
}
