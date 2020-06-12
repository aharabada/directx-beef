using System;

namespace DirectX.Windows.Winuser
{
	typealias LPMSG = Message*;

	[CRepr]
	public struct Message
	{
    	public HWND        hwnd;
    	public WindowNotification message;
    	public WPARAM      wParam;
    	public LPARAM      lParam;
    	public DWORD       time;
    	public POINT       pt;
	}

	public struct POINT
	{
    	public LONG x;
    	public LONG y;
	}
}
