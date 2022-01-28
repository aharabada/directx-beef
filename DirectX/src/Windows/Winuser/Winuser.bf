using System;
using DirectX.Math;

namespace DirectX.Windows.Winuser
{
	static
	{
		public const int32 CW_USEDEFAULT = (int32)0x80000000;
		
		/**
		 * The BeginPaint function prepares the specified window for painting and fills a PAINTSTRUCT structure with information about the painting.
		 *
		 * @param windowHandle	Handle to the window to be repainted.
		 * @param paintStruct	Pointer to the PAINTSTRUCT structure that will receive painting information.
		*/
		[Import("user32.lib"), CallingConvention(.Stdcall), CLink]
		public static extern Windows.Handle BeginPaint(HWND windowHandle, void *paintStruct);

		/**
		 * The EndPaint function marks the end of painting in the specified window.
		 * This function is required for each call to the BeginPaint function, but only after painting is complete.
		 *
		 * @param windowHandle	Handle to the window that has been repainted.
		 * @param paintStruct	Pointer to a PAINTSTRUCT structure that contains the painting information retrieved by BeginPaint.
		*/
		[Import("user32.lib"), CallingConvention(.Stdcall), CLink]
		public static extern BOOL EndPaint(HWND windowHandle, void *paintStruct);

		/**
		 * Retrieves the coordinates of a window's client area.
		 *
		 * @param windowHandle	A handle to the window whose client coordinates are to be retrieved.
		 * @param rect			A reference to a RECT structure that receives the client coordinates.
		 *						The left and top members are zero.
		 *						The right and bottom members contain the width and height of the window.
		 * @return	If the function succeeds, the return value is nonzero.
		 *			If the function fails, the return value is zero.
		*/
		[Import("user32.lib"), CallingConvention(.Stdcall), CLink]
		public static extern BOOL GetClientRect(HWND windowHandle, out Rectangle rect);

		[Import("user32.lib"), CallingConvention(.Stdcall), CLink]
		public static extern BOOL GetWindowRect(HWND windowHandle, out Rectangle rect);

		[Import("user32.lib"), CallingConvention(.Stdcall), CLink]
		public static extern HICON LoadIconW(HINSTANCE hInstance, LPCWSTR lpIconName);

		/**
		 * Loads an icon, cursor, animated cursor, or bitmap.
		 *
		 * @param hInstance		A handle to the module of either a DLL or executable (.exe) that contains the image to be loaded.
		 * @param lpIconName	The image to be loaded.
		 * @param type			The type of image to be loaded.
		 * @param cx			The width, in pixels, of the icon or cursor.
		 * @param cy			The height, in pixels, of the icon or cursor.
		 * @param fuLoad		The image load flags.
		*/
		[Import("user32.lib"), CallingConvention(.Stdcall), CLink]
		public static extern HICON LoadImageW(HINSTANCE hInstance, LPCWSTR lpIconName, ImageType type, int cx, int cy, ImageLoadFlags fuLoad);

		[Import("user32.lib"), CallingConvention(.Stdcall), CLink]
		public static extern HCURSOR LoadCursorW(HINSTANCE hInstance, LPCWSTR lpCursorName);

		/**
		 * Converts an integer value to a resource type compatible with the resource-management functions.
		 * This macro is used in place of a string containing the name of the resource.
		 *
		 * @param i	The integer value to be converted.
		*/
		public static LPWSTR MAKEINTRESOURCEW(int i)
		{
			return (LPWSTR)(void*)((ULONG_PTR)((WORD)(i)));
		}

		/**
		 * Displays a modal dialog box that contains a system icon, a set of buttons, and a brief application-specific message, such as status or error information.
		 * The message box returns an integer value that indicates which button the user clicked.
		 *
		 * @param hWnd		A handle to the owner window of the message box to be created. If this parameter is NULL, the message box has no owner window.
		 * @param lpText	The message to be displayed. If the string consists of more than one line, you can separate the lines using a carriage return and/or linefeed character between each line.
		 * @param lpCaption	The dialog box title. If this parameter is NULL, the default title is Error.
		 * @param uType		The contents and behavior of the dialog box. This parameter can be a combination of flags.
		*/
		[Import("user32.lib"), CallingConvention(.Stdcall), CLink]
		public static extern int32 MessageBoxW(HWND hWnd, LPCWSTR lpText, LPCWSTR lpCaption, UINT uType);

		/**
		 * Registers a window class for subsequent use in calls to the CreateWindow or CreateWindowEx function.
		 * 
		 * @param windowClass	A reference to a WindowClassExW structure.
		 * @return If the function succeeds, the return value is a class atom that uniquely identifies the class being registered.
		*/
		[Import("user32.lib"), CallingConvention(.Stdcall), CLink]
		public static extern ATOM RegisterClassExW(ref WindowClassExW windowClass);

		[Import("user32.lib"), CallingConvention(.Stdcall), CLink]
		public static extern ATOM RegisterClassW(WNDCLASSW *lpWndClass);

		/**
		 * Creates an overlapped, pop-up, or child window with an extended window style.
		 *
		 * @param exStyle		The extended window style of the window being created.
		 * @param className		A null-terminated string or a class atom created by a previous call to the RegisterClass or RegisterClassEx function.
		 * @param windowName	The window name.
		 *						If the window style specifies a title bar, the window title pointed to by windowName is displayed in the title bar.
		 * @param style			The style of the window being created.
		 * @param x				The initial horizontal position of the window.
		 * @param y				The initial vertical position of the window.
		 * @param width			The width, in device units, of the window.
		 * @param height		The height, in device units, of the window.
		 * @param parent		A handle to the parent or owner window of the window being created.
		 *						To create a child window or an owned window, supply a valid window handle.
		 *						This parameter is optional for pop-up windows.
		 * @param menu			A handle to a menu, or specifies a child-window identifier, depending on the window style.
		 * @param hInstance		A handle to the instance of the module to be associated with the window.
		 * @param lpParam		Pointer to a value to be passed to the window through the CREATESTRUCT structure (lpCreateParams member) pointed to by the lParam param of the WM_CREATE message.
		 *						This message is sent to the created window by this function before it returns.
		*/
		[Import("user32.lib"), CallingConvention(.Stdcall), CLink]
		public static extern HWND CreateWindowExW(ExtendedWindowStyle exStyle, LPCWSTR className, LPCWSTR windowName, WindowStyles style,
			int x, int y, int widht, int height, HWND parent, HMENU menu, HINSTANCE hInstance, LPVOID lpParam);

		[Import("user32.lib"), CallingConvention(.Stdcall), CLink]
		public static extern BOOL ShowWindow(HWND hWnd, int32 nCmdShow);

		/**
		 * Changes an attribute of the specified window.
		 * The function also sets a value at the specified offset in the extra window memory.
		 *
		 * @param windowHandle	A handle to the window and, indirectly, the class to which the window belongs.
		 *						The SetWindowLongPtr function fails if the process that owns the window specified by the windowHandle parameter
		 *						is at a higher process privilege in the UIPI hierarchy than the process the calling thread resides in.
		 * @param index			The zero-based offset to the value to be set.
		 *						Valid values are in the range zero through the number of bytes of extra window memory, minus the size of a LONG_PTR.
		 * @param dwNewLong		The replacement value.
		 *
		 * @return 	If the function succeeds, the return value is the previous value of the specified offset.
		 * 			If the function fails, the return value is zero.
		*/
#if BF_64_BIT
		[Import("user32.lib"), CallingConvention(.Stdcall), CLink]
		public static extern LONG_PTR SetWindowLongPtrW(HWND windowHandle, int32 index, LONG_PTR dwNewLong);
#else
		[Import("user32.lib"), CallingConvention(.Stdcall), LinkName("SetWindowLongW")]
		public static extern LONG_PTR SetWindowLongPtrW(HWND windowHandle, int32 index, LONG_PTR dwNewLong);
#endif

		/**
		 * Retrieves information about the specified window.
		 * The function also retrieves the value at a specified offset into the extra window memory.
		 *
		 * @param windowHandle	A handle to the window and, indirectly, the class to which the window belongs.
		 * @param index			The zero-based offset to the value to be retrieved.
		 *						Valid values are in the range zero through the number of bytes of extra window memory, minus the size of a LONG_PTR.
		*/
#if BF_64_BIT
		[Import("user32.lib"), CallingConvention(.Stdcall), CLink]
		public static extern LONG_PTR GetWindowLongPtrW(HWND windowHandle, int32 index);
#else
		[Import("user32.lib"), CallingConvention(.Stdcall), LinkName("GetWindowLongW")]
		public static extern LONG_PTR GetWindowLongPtrW(HWND windowHandle, int32 index);
#endif

		[Import("user32.lib"), CallingConvention(.Stdcall), CLink]
		public static extern int32 GetWindowTextW(HWND windowHandle, char16 *string, int32 maxCount);

		[Import("user32.lib"), CallingConvention(.Stdcall), CLink]
		public static extern BOOL SetWindowTextW(HWND windowHandle, char16 *string);

		[Import("user32.lib"), CallingConvention(.Stdcall), CLink]
		public static extern int32 GetWindowTextLengthW(HWND windowHandle);

		[Import("user32.lib"), CallingConvention(.Stdcall), CLink]
		public static extern BOOL UpdateWindow(HWND hWnd);

		[Import("user32.lib"), CallingConvention(.Stdcall), CLink]
		public static extern BOOL GetMessageW(LPMSG lpMsg, HWND hWnd, UINT wMsgFilterMin, UINT wMsgFilterMax);

		[Import("user32.lib"), CallingConvention(.Stdcall), CLink]
		public static extern BOOL TranslateMessage(Message* lpMsg);

		[Import("user32.lib"), CallingConvention(.Stdcall), CLink]
		public static extern BOOL DispatchMessageW(Message* lpMsg);

		[Import("user32.lib"), CallingConvention(.Stdcall), CLink]
		public static extern LRESULT DefWindowProcW(HWND hWnd, uint32 Msg, WPARAM wParam, LPARAM lParam);

		[Import("user32.lib"), CallingConvention(.Stdcall), CLink]
		public static extern void PostQuitMessage(int32 nExitCode);

		/**
		 * Retrieves the status of the specified virtual key.
		 * The status specifies whether the key is up, down, or toggled (on, off—alternating each time the key is pressed).
		*/
		[Import("User32.lib"), CallingConvention(.Stdcall), CLink]
		public static extern uint16 GetKeyState(int32 nVrtKey);

		/**
		 * Determines whether a key is up or down at the time the function is called, and whether the key was pressed after a previous call to GetAsyncKeyState.
		*/
		[Import("User32.lib"), CallingConvention(.Stdcall), CLink]
		public static extern uint16 GetAsyncKeyState(int32 nVrtKey);

		/**
		 * Copies the status of the 256 virtual keys to the specified buffer.
		 *
		 * @param lpKeyState	The 256-byte array that receives the status data for each virtual key.
		 * @return If the function succeeds, the return value is nonzero.
		*/
		[Import("User32.lib"), CallingConvention(.Stdcall), CLink]
		public static extern BOOL GetKeyboardState(uint8 *lpKeyState);

		/**
		 * Retrieves a string that represents the name of a key.
		 *
		 * @param lParam	The second parameter of the keyboard message (such as WM_KEYDOWN) to be processed.
		 * @param lpString	The buffer that will receive the key name.
		 * @param cchSize	The maximum length, in characters, of the key name, including the terminating null character.
		 *					(This parameter should be equal to the size of the buffer pointed to by the lpString parameter.)
		 * @return	If the function succeeds, a null-terminated string is copied into the specified buffer, and the return value is the length of the string, in characters, not counting the terminating null character.
		*/
		[Import("User32.lib"), CallingConvention(.Stdcall), CLink]
		public static extern int32 GetKeyNameTextW(int32 lParam, char16* lpString, int cchSize);

		public const uint32 MAPVK_VK_TO_VSC = 0;
		public const uint32 MAPVK_VSC_TO_VK = 1;
		public const uint32 MAPVK_VK_TO_CHAR = 2;
		public const uint32 MAPVK_VSC_TO_VK_EX = 3;

		/**
		 * Translates (maps) a virtual-key code into a scan code or character value, or translates a scan code into a virtual-key code.
		*/
		[Import("User32.lib"), CallingConvention(.Stdcall), CLink]
		public static extern uint32 MapVirtualKeyW(uint32 uCode, uint32 uMapType);

		/**
		 * Dispatches incoming sent messages, checks the thread message queue for a posted message, and retrieves the message (if any exist).
		 *
		 * @param lpMsg			A pointer to an MSG structure that receives message information.
		 * @param hWnd			A handle to the window whose messages are to be retrieved. The window must belong to the current thread.
		 * @param wMsgFilterMin	The value of the first message in the range of messages to be examined. Use WM_KEYFIRST (0x0100) to specify the first keyboard message or WM_MOUSEFIRST (0x0200) to specify the first mouse message.
		 * @param wMsgFilterMax The value of the last message in the range of messages to be examined. Use WM_KEYLAST to specify the last keyboard message or WM_MOUSELAST to specify the last mouse message.
		 * @param wRemoveMsg	Specifies how messages are to be handled.
		*/
		[Import("user32.lib"), CallingConvention(.Stdcall), CLink]
		public static extern BOOL PeekMessageW(LPMSG lpMsg, HWND hWnd, UINT wMsgFilterMin, UINT wMsgFilterMax, HandleMessageFlags wRemoveMsg);
		
		/**
		 * Converts the client-area coordinates of a specified point to screen coordinates.
		 *
		 * @param hWnd	A handle to the window whose client area is used for the conversion.
		 * @param point	A pointer to a POINT structure that contains the client coordinates to be converted.
		 *				The new screen coordinates are copied into this structure if the function succeeds.
		 * @return	If the function succeeds, the return value is nonzero.
		 *			If the function fails, the return value is zero.
		*/
		[Import("user32.lib"), CallingConvention(.Stdcall), CLink]
		public static extern BOOL ClientToScreen(Windows.HWnd hWnd, POINT* point);

		/**
		 * Converts the screen coordinates of a specified point on the screen to client-area coordinates.
		 *
		 * @param hWnd	A handle to the window whose client area will be used for the conversion.
		 * @param point	A pointer to a POINT structure that specifies the screen coordinates to be converted.
		 * @return	If the function succeeds, the return value is nonzero.
		 *			If the function fails, the return value is zero.
		*/
		[Import("user32.lib"), CallingConvention(.Stdcall), CLink]
		public static extern BOOL ScreenToClient(Windows.HWnd hWnd, POINT* point);

		public static MessageBoxResult MessageBox(HWND hWnd, String message, String caption, MessageBoxButtons buttons = .Ok, MessageBoxIcon icon = .None,
			MessageBoxDefaultButton defaultButton = .Button1, MessageBoxModality modality = .Application, MessageBoxOptions options = .None)
		{
			return (.)MessageBoxW(hWnd, message.ToScopedNativeWChar!(), caption.ToScopedNativeWChar!(), (.)buttons | (.)icon | (.)defaultButton | (.)modality);
		}

		////
		//// Default cursors
		////

		/**
		 * Standard arrow and small hourglass.
		*/
		public static readonly char16* IDC_APPSTARTING = MAKEINTRESOURCEW(32650);
		/**
		 * Standard arrow.
		*/
		public static readonly char16* IDC_ARROW = MAKEINTRESOURCEW(32512);
		/**
		 * Crosshair.
		*/
		public static readonly char16* IDC_CROSS = MAKEINTRESOURCEW(32515);
		/**
		 * Hand.
		*/
		public static readonly char16* IDC_HAND = MAKEINTRESOURCEW(32649);
		/**
		 * Arrow and question mark.
		*/
		public static readonly char16* IDC_HELP = MAKEINTRESOURCEW(32651);
		/**
		 * I-beam.
		*/
		public static readonly char16* IDC_IBEAM = MAKEINTRESOURCEW(32513);
		/**
		 * Obsolete for applications marked version 4.0 or later.
		*/
		public static readonly char16* IDC_ICON = MAKEINTRESOURCEW(32641);
		/**
		 * Slashed circle.
		*/
		public static readonly char16* IDC_NO = MAKEINTRESOURCEW(32648);
		/**
		 * Obsolete for applications marked version 4.0 or later. Use IDC_SIZEALL.
		*/
		public static readonly char16* IDC_SIZE = MAKEINTRESOURCEW(32640);
		/**
		 * Four-pointed arrow pointing north, south, east, and west.
		*/
		public static readonly char16* IDC_SIZEALL = MAKEINTRESOURCEW(32646);
		/**
		 * Double-pointed arrow pointing northeast and southwest.
		*/
		public static readonly char16* IDC_SIZENESW = MAKEINTRESOURCEW(32643);
		/**
		 * Double-pointed arrow pointing north and south.
		*/
		public static readonly char16* IDC_SIZENS = MAKEINTRESOURCEW(32645);
		/**
		 * Double-pointed arrow pointing northwest and southeast.
		*/
		public static readonly char16* IDC_SIZENWSE = MAKEINTRESOURCEW(32642);
		/**
		 * Double-pointed arrow pointing west and east.
		*/
		public static readonly char16* IDC_SIZEWE = MAKEINTRESOURCEW(32644);
		/**
		 * Vertical arrow.
		*/
		public static readonly char16* IDC_UPARROW = MAKEINTRESOURCEW(32516);
		/**
		 * Hourglass.
		*/
		public static readonly char16* IDC_WAIT = MAKEINTRESOURCEW(32514);

		////
		//// Default icons
		////

		/**
		 * Default application icon.
		*/
		public static readonly char16* IDI_APPLICATION = MAKEINTRESOURCEW(32512);
		/**
		 * Asterisk icon. Same as IDI_INFORMATION.
		*/
		public static readonly char16* IDI_ASTERISK = MAKEINTRESOURCEW(32516);
		/**
		 * Hand-shaped icon.
		*/
		public static readonly char16* IDI_ERROR = MAKEINTRESOURCEW(32513);
		/**
		 * Exclamation point icon. Same as IDI_WARNING.
		*/
		public static readonly char16* IDI_EXCLAMATION = MAKEINTRESOURCEW(32515);
		/**
		 * Hand-shaped icon. Same as IDI_ERROR.
		*/
		public static readonly char16* IDI_HAND = MAKEINTRESOURCEW(32513);
		/**
		 * Asterisk icon.
		*/
		public static readonly char16* IDI_INFORMATION = MAKEINTRESOURCEW(32516);
		/**
		 * Question mark icon.
		*/
		public static readonly char16* IDI_QUESTION = MAKEINTRESOURCEW(32514);
		/**
		 * Security Shield icon.
		*/
		public static readonly char16* IDI_SHIELD = MAKEINTRESOURCEW(32518);
		/**
		 * Exclamation point icon.
		*/
		public static readonly char16* IDI_WARNING = MAKEINTRESOURCEW(32515);
		/**
		 * Default application icon.
		 * Windows 2000:  Windows logo icon.
		*/
		public static readonly char16* IDI_WINLOGO = MAKEINTRESOURCEW(32517);

		/*
		* Window field offsets for GetWindowLong()
		*/
		public const int32 GWL_WNDPROC = (-4);
		public const int32 GWL_HINSTANCE = (-6);
		public const int32 GWL_HWNDPARENT = (-8);
		public const int32 GWL_STYLE = (-16);
		public const int32 GWL_EXSTYLE = (-20);
		public const int32 GWL_USERDATA = (-21);
		public const int32 GWL_ID = (-12);

		/*
		* Class field offsets for GetClassLong()
		*/
		public const int32 GCL_MENUNAME =(-8);
		public const int32 GCL_HBRBACKGROUND = (-10);
		public const int32 GCL_HCURSOR = (-12);
		public const int32 GCL_HICON = (-14);
		public const int32 GCL_HMODULE = (-16);
		public const int32 GCL_CBWNDEXTRA = (-18);
		public const int32 GCL_CBCLSEXTRA = (-20);
		public const int32 GCL_WNDPROC = (-24);
		public const int32 GCL_STYLE = (-26);
		public const int32 GCW_ATOM = (-32);
		public const int32 GCL_HICONSM = (-34);
	}
}
