using System;

namespace DirectX.DXGI
{
	/**
	 * Describes a display mode.
	*/
	[CRepr]
	public struct ModeDescription
	{
		/**
		 * A value that describes the resolution width.
		*/
		public uint32 Width;
		/**
		 * A value that describes the resolution height.
		*/
		public uint32 Height;
		/**
		 * A Rational that describes the refresh rate in hertz.
		*/
		public Rational RefreshRate;
		/**
		 * A Format value that describes the display format.
		*/
		public Format Format;
		/**
		 * A ScanlineOrder value that describes the scan-line drawing mode.
		*/
		public ScanlineOrder ScanlineOrdering;
		/**
		 * A Scaling value that describes the scaling mode.
		*/
		public Scaling Scaling;
	}
}
