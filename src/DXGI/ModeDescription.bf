using System;

namespace DirectX.DXGI
{
	[CRepr]
	public struct ModeDescription // DXGI_MODE_DESC
	{
		public uint32 Width;
		public uint32 Height;
		public Rational RefreshRate; // DXGI_RATIONAL
		public Format Format; // DXGI_FORMAT
		public ScanlineOrder ScanlineOrdering; // DXGI_MODE_SCANLINE_ORDER
		public Scaling Scaling;	// DXGI_MODE_SCALING
	}
}
