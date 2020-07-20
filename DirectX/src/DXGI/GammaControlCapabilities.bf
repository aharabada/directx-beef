using System;

namespace DirectX.DXGI
{
	/**
	 * Controls the gamma capabilities of an adapter.
	*/
	[CRepr]
	public struct GammaControlCapabilities
	{
		/**
		 * True if scaling and offset operations are supported during gamma correction; otherwise, false.
		*/
		public BOOL ScaleAndOffsetSupported;
		/**
		 * A value describing the maximum range of the control-point positions.
		*/
		public float MaxConvertedValue;
		/**
		 * A value describing the minimum range of the control-point positions.
		*/
		public float MinConvertedValue;
		/**
		 * A value describing the number of control points in the array.
		*/
		public UINT NumGammaControlPoints;
		/**
		 * An array of values describing control points; the maximum length of control points is 1025.
		*/
		public float[1025] ControlPointPositions;
	}
}
