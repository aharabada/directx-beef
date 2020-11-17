using System;

namespace DirectX.Windows
{
	typealias LPMSG = Message*;

	[CRepr]
	public struct Message
	{
    	public HWND        hwnd;
    	public UINT 	message;
    	public WPARAM      wParam;
    	public LPARAM      lParam;
    	public DWORD       time;
    	public POINT       pt;
	}

	public struct POINT
	{
    	public LONG x;
    	public LONG y;

		public this() => this = default;

		public this(LONG x, LONG y)
		{
			this.x = x;
			this.y = y;
		}
	}
}
