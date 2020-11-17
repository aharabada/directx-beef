using System;

namespace DirectX.Windows.Winuser
{
	static
	{
		/**
		 * Retrieves a handle to the window (if any) that has captured the mouse.
		 *
		 * @return	The return value is a handle to the capture window associated with the current thread.
		 *			If no window in the thread has captured the mouse, the return value is NULL.
		*/
		[Import("user32.lib"), CLink]
		public static extern Windows.HWnd GetCapture();

		/**
		 * Sets the mouse capture to the specified window belonging to the current thread.
		 *
		 * @param hWnd	A handle to the window in the current thread that is to capture the mouse.
		 * @return	The return value is a handle to the window that had previously captured the mouse.
		 *			If there is no such window, the return value is NULL.
		*/
		[Import("user32.lib"), CLink]
		public static extern Windows.HWnd SetCapture(Windows.HWnd hWnd);

		/**
		 * Retrieves the position of the mouse cursor, in screen coordinates.
		 *
		 * @param point	A pointer to a POINT structure that receives the screen coordinates of the cursor.
		 * @return Returns nonzero if successful or zero otherwise.
		*/
		[Import("user32.lib"), CLink]
		public static extern BOOL GetCursorPos(POINT* point);

		/**
		 * Moves the cursor to the specified screen coordinates.
		 * If the new coordinates are not within the screen rectangle set by the most recent ClipCursor function call, the system automatically adjusts the coordinates so that the cursor stays within the rectangle.
		 *
		 * @param x	The new x-coordinate of the cursor, in screen coordinates.
		 * @param y	The new y-coordinate of the cursor, in screen coordinates.
		 * @return Returns nonzero if successful or zero otherwise.
		*/
		[Import("user32.lib"), CLink]
		public static extern BOOL SetCursorPos(int32 x, int32 y);

		/**
		 * Displays or hides the cursor.
		 *
		 * @param show	If bShow is TRUE, the display count is incremented by one.
		 *				If bShow is FALSE, the display count is decremented by one.
		 * @return	The return value specifies the new display counter.
		*/
		[Import("user32.lib"), CLink]
		public static extern int32 ShowCursor(BOOL show);
		/**
		 * Releases the mouse capture from a window in the current thread and restores normal mouse input processing.
		 *
		 * @return	If the function succeeds, the return value is nonzero.
		 *			If the function fails, the return value is zero.
		*/
		[Import("user32.lib"), CLink]
		public static extern BOOL ReleaseCapture();

		public const uint32 MK_LBUTTON = 0x0001;
		public const uint32 MK_RBUTTON = 0x0002;
		public const uint32 MK_SHIFT = 0x0004;
		public const uint32 MK_CONTROL = 0x0008;
		public const uint32 MK_MBUTTON = 0x0010;
		public const uint32 MK_XBUTTON1 = 0x0020;
		public const uint32 MK_XBUTTON2 = 0x0040;

		
		public const uint32 WM_LBUTTONDOWN = 0x0201;
		public const uint32 WM_LBUTTONUP = 0x0202;
		public const uint32 WM_LBUTTONDBLCLK = 0x0203;

		public const uint32 WM_RBUTTONDOWN = 0x0204;
		public const uint32 WM_RBUTTONUP = 0x0205;
		public const uint32 WM_RBUTTONDBLCLK = 0x0206;

		public const uint32 WM_MBUTTONDOWN = 0x0207;
		public const uint32 WM_MBUTTONUP = 0x0208;
		public const uint32 WM_MBUTTONDBLCLK = 0x0209;

		public const uint32 WM_MOUSEWHEEL = 0x020A;
		public const uint32 WM_MOUSEHWHEEL = 0x020E;

		public const uint32 WM_XBUTTONDOWN = 0x020B;
		public const uint32 WM_XBUTTONUP = 0x020C;
		public const uint32 WM_XBUTTONDBLCLK = 0x020D;

		public const uint32 WHEEL_DELTA = 120;

		/**
		 * High order word of wparam for WM_XBUTTON messages.
		 * The first X button was clicked.
		*/
		public const uint32 XBUTTON1 = 0x0001;
		/**
		 * High order word of wparam for WM_XBUTTON messages.
		 * The second X button was clicked.
		*/
		public const uint32 XBUTTON2 = 0x0002;
	}
}
