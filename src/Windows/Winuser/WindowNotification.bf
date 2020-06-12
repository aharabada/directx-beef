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
		 * Sent to a window after its size has changed.
		 * WM_SIZE
		*/
		Size = 0x0005,
		/**
		 * Indicates a request to terminate an application, and is generated when the application calls the PostQuitMessage function.
		 * WM_QUIT
		*/
		Quit = 0x0012,
		/**
		 * The Paint message is sent when the system or another application makes a request to paint a portion of an application's window.
		 * WM_PAINT
		*/
		Paint = 0x000F,
		/**
		 * Sent to a window when the size or position of the window is about to change.
		 * An application can use this message to override the window's default maximized size and position, or its default minimum or maximum tracking size.
		 * WM_GETMINMAXINFO 
		*/
		GetMinMaxInfo = 0x0024,
		/**
		 * Sent one time to a window after it enters the moving or sizing modal loop.
		 * WM_ENTERSIZEMOVE
		*/
		EnterSizeMove = 0x0231,
		/**
		 * Sent one time to a window, after it has exited the moving or sizing modal loop.
		 * WM_EXITSIZEMOVE
		*/
		ExitSizeMove = 0x0232,
		/**
		 * Sent to a window that the user is resizing.
		 * WM_SIZE
		*/
		Sizing = 0x0214,
	}
}
