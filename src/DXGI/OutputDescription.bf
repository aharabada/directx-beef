using System;
using DirectX.Math;

namespace DirectX.DXGI
{
	[CRepr]
	class OutputDescription	// DXGI_OUTPUT_DESC
	{
		public char16[32] DeviceName; // WCHAR
		public Rectangle DesktopCoordinates; // RECT
		public bool AttachedToDesktop;
		public ModeRotation Rotation; // DXGI_MODE_ROTATION 
		public Windows.Handle Monitor; // HMONITOR
	}
}
