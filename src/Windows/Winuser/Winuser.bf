using System;
using DirectX.Windows;
using DirectX.Math;

namespace DirectX.Windows.Winuser
{
	static
	{
		public static int32 CW_USEDEFAULT = (int32)0x80000000;

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

		[Import("user32.dll"), CallingConvention(.Stdcall), CLink]
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
		[Import("user32.dll"), CallingConvention(.Stdcall), CLink]
		public static extern HICON LoadImageW(HINSTANCE hInstance, LPCWSTR lpIconName, ImageType type, int cx, int cy, ImageLoadFlags fuLoad);

		[Import("user32.dll"), CallingConvention(.Stdcall), CLink]
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
		[Import("user32.dll"), CallingConvention(.Stdcall), CLink]
		public static extern int32 MessageBoxW(HWND hWnd, LPCWSTR lpText, LPCWSTR lpCaption, UINT uType);

		/**
		 * Registers a window class for subsequent use in calls to the CreateWindow or CreateWindowEx function.
		 * 
		 * @param windowClass	A reference to a WindowClassExW structure.
		 * @return If the function succeeds, the return value is a class atom that uniquely identifies the class being registered.
		*/
		[Import("user32.dll"), CallingConvention(.Stdcall), CLink]
		public static extern ATOM RegisterClassExW(ref WindowClassExW windowClass);

		[Import("user32.dll"), CallingConvention(.Stdcall), CLink]
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
		[Import("user32.dll"), CallingConvention(.Stdcall), CLink]
		public static extern HWND CreateWindowExW(ExtendedWindowStyle exStyle, LPCWSTR className, LPCWSTR windowName, WindowStyles style,
			int x, int y, int widht, int height, HWND parent, HMENU menu, HINSTANCE hInstance, LPVOID lpParam);
		
		[Import("user32.dll"), CallingConvention(.Stdcall), CLink]
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
		[Import("user32.dll"), CallingConvention(.Stdcall), CLink]
		public static extern LONG_PTR SetWindowLongPtrW(HWND windowHandle, int32 index, LONG_PTR dwNewLong);

		/**
		 * Retrieves information about the specified window.
		 * The function also retrieves the value at a specified offset into the extra window memory.
		 *
		 * @param windowHandle	A handle to the window and, indirectly, the class to which the window belongs.
		 * @param index			The zero-based offset to the value to be retrieved.
		 *						Valid values are in the range zero through the number of bytes of extra window memory, minus the size of a LONG_PTR.
		*/
		[Import("user32.dll"), CallingConvention(.Stdcall), CLink]
		public static extern LONG_PTR GetWindowLongPtrW(HWND windowHandle, int32 index);

		[Import("user32.dll"), CallingConvention(.Stdcall), CLink]
		public static extern BOOL UpdateWindow(HWND hWnd);
		
		[Import("user32.dll"), CallingConvention(.Stdcall), CLink]
		public static extern BOOL GetMessageW(LPMSG lpMsg, HWND hWnd, UINT wMsgFilterMin, UINT wMsgFilterMax);

		[Import("user32.dll"), CallingConvention(.Stdcall), CLink]
		public static extern BOOL TranslateMessage(Message* lpMsg);

		[Import("user32.dll"), CallingConvention(.Stdcall), CLink]
		public static extern BOOL DispatchMessageW(Message* lpMsg);

		[Import("user32.dll"), CallingConvention(.Stdcall), CLink]
		public static extern BOOL DefWindowProcW(HWND hWnd, WindowNotification Msg, WPARAM wParam, LPARAM lParam);

		[Import("user32.dll"), CallingConvention(.Stdcall), CLink]
		public static extern void PostQuitMessage(int32 nExitCode);

		/**
		 * Dispatches incoming sent messages, checks the thread message queue for a posted message, and retrieves the message (if any exist).
		 *
		 * @param lpMsg			A pointer to an MSG structure that receives message information.
		 * @param hWnd			A handle to the window whose messages are to be retrieved. The window must belong to the current thread.
		 * @param wMsgFilterMin	The value of the first message in the range of messages to be examined. Use WM_KEYFIRST (0x0100) to specify the first keyboard message or WM_MOUSEFIRST (0x0200) to specify the first mouse message.
		 * @param wMsgFilterMax The value of the last message in the range of messages to be examined. Use WM_KEYLAST to specify the last keyboard message or WM_MOUSELAST to specify the last mouse message.
		 * @param wRemoveMsg	Specifies how messages are to be handled.
		*/
		[Import("user32.dll"), CallingConvention(.Stdcall), CLink]
		public static extern BOOL PeekMessageW(LPMSG lpMsg, HWND hWnd, UINT wMsgFilterMin, UINT wMsgFilterMax, HandleMessageFlags wRemoveMsg);

		public static MessageBoxResult MessageBox(HWND hWnd, String message, String caption, MessageBoxButtons buttons = .Ok, MessageBoxIcon icon = .None,
			MessageBoxDefaultButton defaultButton = .Button1, MessageBoxModality modality = .Application, MessageBoxOptions options = .None)
		{
			return (.)MessageBoxW(hWnd, message.ToScopedNativeWChar!(), caption.ToScopedNativeWChar!(), (.)buttons | (.)icon | (.)defaultButton | (.)modality);
		}
	}
}
