using System;

namespace DirectX.Windows.Winuser
{
	/**
	 * Contains the header information that is part of the raw input data.
	*/
	[CRepr]
	public struct RAWINPUTHEADER
	{
		/**
		 * The type of raw input.
		 * It can be one of the RIM_TYPE-values.
		 */
		public DWORD Type;
		/**
		 * The size, in bytes, of the entire input packet of data.
		 * This includes RAWINPUT plus possible extra input reports in the RAWHID variable length array.
		*/
		public DWORD Size;
		/**
		 * A handle to the device generating the raw input data.
		*/
		public HANDLE Device;
		/**
		 * The value passed in the wParam parameter of the WM_INPUT message.
		*/
		public WPARAM WParam;
	}
}
