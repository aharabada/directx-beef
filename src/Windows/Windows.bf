using System;
using DirectX.Windows.Winuser;

namespace DirectX.Windows
{
	typealias HWND = Windows.HWnd;
	typealias LPCSTR = char8*;
	typealias LPCTSTR = char16*;
	/**
	 * A pointer to a constant string of 16-bit Unicode characters, which MAY be null-terminated.
	*/
	typealias LPCWSTR = char16*;
	typealias LPWSTR = char16*;
	
	typealias WORD = uint16;
	typealias DWORD = uint32;
	
	typealias ATOM = WORD;

	//typealias BOOL = int32;

	typealias LONG = int32;

	//typealias UINT = uint32;
	
	typealias LONG_PTR = int;
	typealias UINT_PTR = uint;
	typealias ULONG_PTR = UINT_PTR;

	typealias LPVOID = void*;

	typealias LRESULT = LONG_PTR;
	typealias WPARAM = UINT_PTR;
	typealias LPARAM = LONG_PTR;

	typealias HMODULE = Windows.HModule;
	typealias HINSTANCE = Windows.HInstance;

	typealias HICON = Windows.Handle;
	typealias HCURSOR = Windows.Handle;
	typealias HBRUSH = Windows.Handle;
	typealias HMENU = Windows.Handle;

	/**
	 * An application-defined function that processes messages sent to a window.
	 * The WNDPROC type defines a pointer to this callback function.
	 *
	 * @param hwnd		A handle to the window.
	 * @param uMsg		The message.
	 * @param wParam	Additional message information.
	 *					The contents of this parameter depend on the value of the uMsg parameter.
	 * @param lParam	Additional message information.
	 *					The contents of this parameter depend on the value of the uMsg parameter.
	*/
	typealias WNDPROC = function LRESULT(HWND hwnd, WindowNotification uMsg, WPARAM wParam, LPARAM lParam);
}
