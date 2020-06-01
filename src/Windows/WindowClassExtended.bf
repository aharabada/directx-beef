using System;

namespace DirectX.Windows
{	
	typealias LResult = int64;
	typealias WParam = uint64;
	typealias LParam = int64;
 
	typealias HInstance = System.Windows.HInstance;	
	typealias HIcon = System.Windows.Handle; 
	typealias HCursor = System.Windows.Handle;	
	typealias HBrush = System.Windows.Handle; 
	typealias LPCWSTR = char16*;

	static
	{
		/**
		An application-defined function that processes messages sent to a window.
		The WNDPROC type defines a pointer to this callback function.
		@param hwnd A handle to the window.
		@param uMsg The message.
				For lists of the system-provided messages, see https://docs.microsoft.com/de-de/previous-versions/windows/desktop/legacy/ms633573(v=vs.85)
		@param wParam Additional message information. The contents of this parameter depend on the value of the uMsg parameter.
		@param lParam Additional message information. The contents of this parameter depend on the value of the uMsg parameter.
		@return The return value is the result of the message processing and depends on the message sent.
		*/
		public static delegate LResult(Windows.HWnd hwnd, uint32 uMsg, WParam wParam, LParam lParam) WindowProc;
	}

	/**
	Contains window class information. It is used with the RegisterClassEx and GetClassInfoEx functions.
	WNDCLASSEXA
	*/
	[CRepr]
	public struct WindowClassExtended
	{ 
		/**
		The size, in bytes, of this structure. Set this member to sizeof(WindowClassExtended).
		Be sure to set this member before calling the GetClassInfoEx function.
		*/
		public uint32 Size = sizeof(WindowClassExtended);
		/**
		The class style(s). This member can be any combination of the Class Styles.
		*/
		public WindowClassStyles Style;

		/**
		A pointer to the window procedure.
		You must use the CallWindowProc function to call the window procedure.
		For more information, see WindowProc.
		*/
		public delegate LResult(Windows.HWnd hwnd, uint32 uMsg, WParam wParam, LParam lParam) WindowProc;
		/**
		The number of extra bytes to allocate following the window-class structure. The system initializes the bytes to zero.
		*/
		public int32       cbClsExtra;
		/**
		The number of extra bytes to allocate following the window instance.
		The system initializes the bytes to zero.
		If an application uses WNDCLASSEX to register a dialog box created by using the CLASS directive in the resource file,
		it must set this member to DLGWINDOWEXTRA.
		*/
		public int32       cbWndExtra;
		/**
		A handle to the instance that contains the window procedure for the class.
		*/
		public HInstance hInstance;
		/**
		A handle to the class icon. This member must be a handle to an icon resource.
		If this member is NULL, the system provides a default icon.
		*/
		public HIcon     hIcon;
		/**
		A handle to the class cursor. This member must be a handle to a cursor resource.
		If this member is NULL, an application must explicitly set the cursor shape whenever the mouse moves into the application's window.
		*/
		public HCursor   hCursor;
		/**
		A handle to the class background brush.
		This member can be a handle to the brush to be used for painting the background, or it can be a color value.
		A color value must be one of the standard system colors.
		*/
		public HBrush    hbrBackground;
		/**
		Pointer to a null-terminated character string that specifies the resource name of the class menu, as the name appears in the resource file. I
		f you use an integer to identify the menu, use the MAKEINTRESOURCE macro. If this member is NULL, windows belonging to this class have no default menu.
		*/
		public LPCWSTR   lpszMenuName;
		/**
		A pointer to a null-terminated string or is an atom.
		If this parameter is an atom, it must be a class atom created by a previous call to the RegisterClass or RegisterClassEx function.
		The atom must be in the low-order word of lpszClassName; the high-order word must be zero.

		If lpszClassName is a string, it specifies the window class name.
		The class name can be any name registered with RegisterClass or RegisterClassEx, or any of the predefined control-class names.

		The maximum length for lpszClassName is 256. If lpszClassName is greater than the maximum length, the RegisterClassEx function will fail.
		*/
		public LPCWSTR   lpszClassName;
		/**
		A handle to a small icon that is associated with the window class.
		If this member is NULL, the system searches the icon resource specified by the hIcon member for an icon of the appropriate size to use as the small icon.
		*/
		public HIcon     hIconSm;
	}
}
