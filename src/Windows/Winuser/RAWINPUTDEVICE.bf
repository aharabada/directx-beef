using System;

namespace DirectX.Windows.Winuser
{
	/**
	 * Defines information for the raw input devices.
	*/
	[CRepr]
	public struct RAWINPUTDEVICE
	{
		public uint16 UsagePage;
		public uint16 Usage;
		public uint32 Flags;
		public Windows.HWnd Target;
	}
}
