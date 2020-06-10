using System;

namespace DirectX.Windows.Winuser
{
	typealias WNDCLASSW = WindowClassW;
	typealias WNDCLASS = WNDCLASSW;

	[CRepr]
	public struct WindowClassW
	{
		public WindowClassStyles style;
		public WNDPROC 	lpfnWndProc;
		public int32       cbClsExtra;
		public int32       cbWndExtra;
		public HINSTANCE   hInstance;
		public HICON       hIcon;
		public HCURSOR     hCursor;
		public HBRUSH      hbrBackground;
		public LPCWSTR     lpszMenuName;
		public LPCWSTR     lpszClassName;
	}
}
