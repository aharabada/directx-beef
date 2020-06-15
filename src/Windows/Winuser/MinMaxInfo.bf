using System;

namespace DirectX.Windows
{
	/**
	 * Contains information about a window's maximized size and position and its minimum and maximum tracking size.
	*/
	[CRepr]
	public struct MinMaxInfo
	{
		/**
		 * Reserved; do not use.
		*/
		private POINT ptReserved;
		/**
		 * The maximized width (x member) and the maximized height (y member) of the window.
		 * For top-level windows, this value is based on the width of the primary monitor.
		*/
  		public POINT MaximizedSize;
		/**
		 * The position of the left side of the maximized window (x member)
		 * and the position of the top of the maximized window (y member).
		 * For top-level windows, this value is based on the position of the primary monitor.
		*/
  		public POINT MaximizedPosition;
		/**
		 * The minimum tracking width (x member) and the minimum tracking height (y member) of the window.
		 * This value can be obtained programmatically from the system metrics SM_CXMINTRACK and SM_CYMINTRACK (see the GetSystemMetrics function).
		*/
  		public POINT MinimumTrackingSize;
		/**
		 * The maximum tracking width (x member) and the maximum tracking height (y member) of the window.
		 * This value is based on the size of the virtual screen and can be obtained programmatically
		 * from the system metrics SM_CXMAXTRACK and SM_CYMAXTRACK (see the GetSystemMetrics function).
		*/
  		public POINT MaximumTrackingSize;
	}
}
