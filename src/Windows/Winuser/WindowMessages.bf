namespace DirectX.Windows
{
	// Clipboard messages/Notifications
	static
	{
		/**
		 * An application sends a WM_CUT message to an edit control or combo box to delete (cut) the current selection,
		 * if any, in the edit control and copy the deleted text to the clipboard in CF_TEXT format.
		*/
		public const uint32 WM_CUT = 0x0300;
		/**
		 * An application sends the WM_COPY message to an edit control or combo box to copy the current selection to the clipboard in CF_TEXT format.
		*/
		public const uint32 WM_COPY = 0x0301;
		/**
		 * An application sends a WM_PASTE message to an edit control or combo box to copy the current content of the clipboard to the edit control at the current caret position.
		 * Data is inserted only if the clipboard contains data in CF_TEXT format.
		*/
		public const uint32 WM_PASTE = 0x0302;
		/**
		 * An application sends a WM_CLEAR message to an edit control or combo box to delete (clear) the current selection, if any, from the edit control.
		*/
		public const uint32 WM_CLEAR = 0x0303;
		/**
		 * Sent to the clipboard owner if it has delayed rendering a specific clipboard format and if an application has requested data in that format.
		 * The clipboard owner must render data in the specified format and place it on the clipboard by calling the SetClipboardData function.
		*/
		public const uint32 WM_RENDERFORMAT = 0x0305;
		/**
		 * Sent to the clipboard owner before it is destroyed, if the clipboard owner has delayed rendering one or more clipboard formats.
		 * For the content of the clipboard to remain available to other applications,
		 * the clipboard owner must render data in all the formats it is capable of generating,
		 * and place the data on the clipboard by calling the SetClipboardData function.
		*/
		public const uint32 WM_RENDERALLFORMATS = 0x0306;
		/**
		 * Sent when the contents of the clipboard have changed.
		*/
		public const uint32 WM_DESTROYCLIPBOARD = 0x0307;
		/**
		 * Sent to the first window in the clipboard viewer chain when the content of the clipboard changes.
		 * This enables a clipboard viewer window to display the new content of the clipboard.
		*/
		public const uint32 WM_DRAWCLIPBOARD = 0x0308;
		/**
		 * Sent to the clipboard owner by a clipboard viewer window when the clipboard contains data in the CF_OWNERDISPLAY format and the clipboard viewer's client area needs repainting.
		*/
		public const uint32 WM_PAINTCLIPBOARD = 0x0309;
		/**
		 * Sent to the clipboard owner by a clipboard viewer window when the clipboard contains data in the CF_OWNERDISPLAY format and an event occurs in the clipboard viewer's vertical scroll bar.
		 * The owner should scroll the clipboard image and update the scroll bar values.
		*/
		public const uint32 WM_VSCROLLCLIPBOARD = 0x030A;
		/**
		 * Sent to the clipboard owner by a clipboard viewer window when the clipboard contains data in the CF_OWNERDISPLAY format and the clipboard viewer's client area has changed size.
		*/
		public const uint32 WM_SIZECLIPBOARD = 0x030B;
		/**
		 * Sent to the clipboard owner by a clipboard viewer window to request the name of a CF_OWNERDISPLAY clipboard format.
		*/
		public const uint32 WM_ASKCBFORMATNAME = 0x030C;
		/**
		 * Sent to the first window in the clipboard viewer chain when a window is being removed from the chain.
		*/
		public const uint32 WM_CHANGECBCHAIN = 0x030D;
		/**
		 * Sent to the clipboard owner by a clipboard viewer window.
		 * This occurs when the clipboard contains data in the CF_OWNERDISPLAY format and an event occurs in the clipboard viewer's horizontal scroll bar.
		 * sThe owner should scroll the clipboard image and update the scroll bar values.
		*/
		public const uint32 WM_HSCROLLCLIPBOARD = 0x030E;
		/**
		 * Sent when the contents of the clipboard have changed.
		*/
		public const uint32 WM_CLIPBOARDUPDATE = 0x031D;
	}
	
	// Common Dialog Box Notifications
	static
	{
		// https://docs.microsoft.com/en-us/windows/win32/dlgbox/common-dialog-box-notifications
	}

	// DWM Messages
	static
	{
		// https://docs.microsoft.com/en-us/windows/win32/dwm/dwm-messages
	}

	// Dialog Box Notifications ... Timer Notifications
	static
	{
		// https://docs.microsoft.com/en-us/windows/win32/dlgbox/dialog-box-notifications
	}

	// Window messages
	static
	{
		/**
		 * Sets the text of a window.
		*/
		public const uint32 WM_SETTEXT = 0x000C;
		/**
		 * Copies the text that corresponds to a window into a buffer provided by the caller.
		*/
		public const uint32 WM_GETTEXT = 0x000D;
		/**
		 * Determines the length, in characters, of the text associated with a window.
		*/
		public const uint32 WM_GETTEXTLENGTH = 0x000E;
		/**
		 * Sent when the window background must be erased (for example, when a window is resized).
		 * The message is sent to prepare an invalidated portion of a window for painting.
		*/
		public const uint32 WM_ERASEBKGND = 0x0014;
		/**
		 * Sent to a window if the mouse causes the cursor to move within a window and mouse input is not captured.
		*/
		public const uint32 WM_SETCURSOR = 0x0020;
		/**
		 * Sets the font that a control is to use when drawing text.
		*/
		public const uint32 WM_SETFONT = 0x0030;
		/**
		 * Retrieves the font with which the control is currently drawing its text.
		*/
		public const uint32 WM_GETFONT = 0x0031;
		/**
		 * An application sends the WM_COPYDATA message to pass data to another application.
		*/
		public const uint32 WM_COPYDATA = 0x004A;
		/**
		 * Associates a new large or small icon with a window.
		 * The system displays the large icon in the ALT+TAB dialog box, and the small icon in the window caption.
		*/
		public const uint32 WM_SETICON = 0x0080;
		/**
		 * Retrieves the menu handle for the current window.
		*/
		public const uint32 MN_GETHMENU = 0x01E1;
	}

	// Window Notifications
	static
	{
		/**
		 * Performs no operation.
		 * An application sends the WM_NULL message if it wants to post a message that the recipient window will ignore.
		*/
		public const uint32 WM_NULL = 0x0000;
		/**
		 * Sent when an application requests that a window be created by calling the CreateWindowEx or CreateWindow function.
		 * (The message is sent before the function returns.)
		 * The window procedure of the new window receives this message after the window is created, but before the window becomes visible.
		*/
		public const uint32 WM_CREATE = 0x0001;
		/**
		 * Sent when a window is being destroyed.
		 * It is sent to the window procedure of the window being destroyed after the window is removed from the screen.
		 * This message is sent first to the window being destroyed and then to the child windows (if any) as they are destroyed.
		 * During the processing of the message, it can be assumed that all child windows still exist.
		*/
		public const uint32 WM_DESTROY = 0x0002;
		/**
		 * Sent after a window has been moved.
		*/
		public const uint32 WM_MOVE = 0x0003;
		/**
		 * Sent to a window after its size has changed.
		*/
		public const uint32 WM_SIZE = 0x0005;
		/**
		 * Sent when an application changes the enabled state of a window.
		 * It is sent to the window whose enabled state is changing.
		 * This message is sent before the EnableWindow function returns, but after the enabled state (WS_DISABLED style bit) of the window has changed.
		*/
		public const uint32 WM_ENABLE = 0x000A;
		/**
		 * The WM_PAINT message is sent when the system or another application makes a request to paint a portion of an application's window.
		 * The message is sent when the UpdateWindow or RedrawWindow function is called,
		 * or by the DispatchMessage function when the application obtains a WM_PAINT message by using the GetMessage or PeekMessage function.
		*/
		public const uint32 WM_PAINT = 0x000F;
		/**
		 * Sent as a signal that a window or an application should terminate.
		*/
		public const uint32 WM_CLOSE = 0x0010;
		/**
		 * Indicates a request to terminate an application, and is generated when the application calls the PostQuitMessage function.
		 * This message causes the GetMessage function to return zero.
		*/
		public const uint32 WM_QUIT = 0x0012;
		/**
		 * Sent to an icon when the user requests that the window be restored to its previous size and position.
		*/
		public const uint32 WM_QUERYOPEN = 0x0013;
		/**
		 * Sent to a window when the window is about to be hidden or shown.
		*/
		public const uint32 WM_SHOWWINDOW = 0x0018;
		/**
		 * Sent when a window belonging to a different application than the active window is about to be activated.
		 * The message is sent to the application whose window is being activated and to the application whose window is being deactivated.
		*/
		public const uint32 WM_ACTIVATEAPP = 0x001C;
		/**
		 * Sent to cancel certain modes, such as mouse capture.
		 * For example, the system sends this message to the active window when a dialog box or message box is displayed.
		 * Certain functions also send this message explicitly to the specified window regardless of whether it is the active window.
		 * For example, the EnableWindow function sends this message when disabling the specified window.
		*/
		public const uint32 WM_CANCELMODE = 0x001F;
		/**
		 * Sent to a child window when the user clicks the window's title bar or when the window is activated, moved, or sized.
		*/
		public const uint32 WM_CHILDACTIVATE = 0x0022;
		/**
		 * Sent to a window when the size or position of the window is about to change.
		 * An application can use this message to override the window's default maximized size and position, or its default minimum or maximum tracking size.
		*/
		public const uint32 WM_GETMINMAXINFO = 0x0024;
		/**
		 * Sent to a minimized (iconic) window.
		 * The window is about to be dragged by the user but does not have an icon defined for its class.
		 * An application can return a handle to an icon or cursor.
		 * The system displays this cursor or icon while the user drags the icon.
		*/
		public const uint32 WM_QUERYDRAGICO = 0x0037;
		/**
		 * Sent to all top-level windows when the system detects more than 12.5 percent of system time over a 30- to 60-second interval is being spent compacting memory.
		 * This indicates that system memory is low.
		*/
		public const uint32 WM_COMPACTING = 0x0041;
		/**
		 * Sent to a window whose size, position, or place in the Z order is about to change as a result of a call to the SetWindowPos function or another window-management function.
		*/
		public const uint32 WM_WINDOWPOSCHANGING = 0x0046;
		/**
		 * Sent to a window whose size, position, or place in the Z order has changed as a result of a call to the SetWindowPos function or another window-management function.
		*/
		public const uint32 WM_WINDOWPOSCHANGED = 0x0047;
		/**
		 * Posted to the window with the focus when the user chooses a new input language,
		 * either with the hotkey (specified in the Keyboard control panel application) or from the indicator on the system taskbar.
		 * An application can accept the change by passing the message to the DefWindowProc function or reject the change (and prevent it from taking place) by returning immediately.
		*/
		public const uint32 WM_INPUTLANGCHANGEREQUEST = 0x0050;
		/**
		 * Sent to the topmost affected window after an application's input language has been changed.
		 * You should make any application-specific settings and pass the message to the DefWindowProc function,
		 * which passes the message to all first-level child windows.
		 * These child windows can pass the message to DefWindowProc to have it pass the message to their child windows, and so on.
		*/
		public const uint32 WM_INPUTLANGCHANGE = 0x0051;
		/**
		 * Sent to all windows after the user has logged on or off.
		 * When the user logs on or off, the system updates the user-specific settings.
		 * The system sends this message immediately after updating the settings.
		 * Note: This message is not supported as of Windows Vista.
		*/
		public const uint32 WM_USERCHANGED = 0x0054;
		/**
		 * Sent to a window when the SetWindowLong function is about to change one or more of the window's styles.
		*/
		public const uint32 WM_STYLECHANGING = 0x007C;
		/**
		 * Sent to a window after the SetWindowLong function has changed one or more of the window's styles.
		*/
		public const uint32 WM_STYLECHANGED = 0x007D;
		/**
		 * Sent to a window to retrieve a handle to the large or small icon associated with a window.
		 * The system displays the large icon in the ALT+TAB dialog, and the small icon in the window caption.
		*/
		public const uint32 WM_GETICON = 0x007F;
		/**
		 * Sent prior to the WM_CREATE message when a window is first created.
		*/
		public const uint32 WM_NCCREATE = 0x0081;
		/**
		 * Notifies a window that its nonclient area is being destroyed.
		 * The DestroyWindow function sends the WM_NCDESTROY message to the window following the WM_DESTROY message.
		 * WM_DESTROY is used to free the allocated memory object associated with the window.
		 * The WM_NCDESTROY message is sent after the child windows have been destroyed.
		 * In contrast, WM_DESTROY is sent before the child windows are destroyed.
		*/
		public const uint32 WM_NCDESTROY = 0x0082;
		/**
		 * Sent when the size and position of a window's client area must be calculated.
		 * By processing this message, an application can control the content of the window's client area when the size or position of the window changes.
		*/
		public const uint32 WM_NCCALCSIZE = 0x0083;
		/**
		 * Sent to a window when its nonclient area needs to be changed to indicate an active or inactive state.
		*/
		public const uint32 WM_NCACTIVATE = 0x0086;
		/**
		 * Sent to a window that the user is resizing.
		 * By processing this message, an application can monitor the size and position of the drag rectangle and, if needed, change its size or position.
		*/
		public const uint32 WM_SIZING = 0x0214;
		/**
		 * Sent to a window that the user is moving.
		 * By processing this message, an application can monitor the position of the drag rectangle and, if needed, change its position.
		*/
		public const uint32 WM_MOVING = 0x0216;
		/**
		 * Notifies an application of a change to the hardware configuration of a device or the computer.
		*/
		public const uint32 WM_DEVICECHANGE = 0x0219;
		/**
		 * Sent one time to a window after it enters the moving or sizing modal loop.
		 * The window enters the moving or sizing modal loop when the user clicks the window's title bar or sizing border,
		 * or when the window passes the WM_SYSCOMMAND message to the DefWindowProc function and the wParam parameter of the message specifies the SC_MOVE or SC_SIZE value.
		 * The operation is complete when DefWindowProc returns.
		 * The system sends the WM_ENTERSIZEMOVE message regardless of whether the dragging of full windows is enabled.
		*/
		public const uint32 WM_ENTERSIZEMOVE = 0x0231;
		/**
		 * Sent one time to a window, after it has exited the moving or sizing modal loop.
		 * The window enters the moving or sizing modal loop when the user clicks the window's title bar or sizing border,
		 * or when the window passes the WM_SYSCOMMAND message to the DefWindowProc function and the wParam parameter of the message specifies the SC_MOVE or SC_SIZE value.
		 * The operation is complete when DefWindowProc returns.
		*/
		public const uint32 WM_EXITSIZEMOVE = 0x0232;
		/**
		 * Sent when the effective dots per inch (dpi) for a window has changed.
		 * The DPI is the scale factor for a window. There are multiple events that can cause the DPI to change.
		 * The following list indicates the possible causes for the change in DPI.
    	 *     - The window is moved to a new monitor that has a different DPI.
    	 *     - The DPI of the monitor hosting the window changes.
		 * The current DPI for a window always equals the last DPI sent by WM_DPICHANGED.
		 * This is the scale factor that the window should be scaling to for threads that are aware of DPI changes.
		*/
		public const uint32 WM_DPICHANGED = 0x02E0;
		/**
		 * Broadcast to every window following a theme change event.
		 * Examples of theme change events are the activation of a theme, the deactivation of a theme, or a transition from one theme to another.
		*/
		public const uint32 WM_THEMECHANGED = 0x031A;
	}
}
