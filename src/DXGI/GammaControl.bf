using System;

namespace DirectX.DXGI
{
	/**
	 * Controls the settings of a gamma curve.
	*/
	[CRepr]
	public struct GammaControl
	{
		/**
		 * A ColorRGB structure with scalar values that are applied to rgb values before being sent to the gamma look up table.
		*/
		public ColorRGB Scale;
		/**
		 * A ColorRGB structure with offset values that are applied to the rgb values before being sent to the gamma look up table.
		*/
		public ColorRGB Offset;
		/**
		 * An array of ColorRGB structures that control the points of a gamma curve.
		*/
		public ColorRGB[1025] GammaCurve;
	}
}
