using System;
using DirectX.Common;

namespace DirectX.DXGI.DXGI1_2
{
	[CRepr]
	public struct SwapChainFullscreenDescription
	{
		public Rational RefreshRate;
		public ScanlineOrder ScanlineOrdering;
		public DXGI1_2.Scaling Scaling;
		public bool Windowed;
	}
}
