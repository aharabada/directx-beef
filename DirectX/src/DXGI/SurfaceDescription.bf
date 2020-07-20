using System;

namespace DirectX.DXGI
{
	/**
	 * Describes a surface.
	*/
	[CRepr]
	public struct SurfaceDescription
	{
		/**
		 * A value describing the surface width.
		*/
		public UINT Width;
		/**
		 * A value describing the surface height.
		*/
		public UINT Height;
		/**
		 * A member of the Format enumerated type that describes the surface format.
		*/
		public Format Format;
		/**
		 * A SampleDescription structure that describes multi-sampling parameters for the surface.
		*/
		public SampleDescription SampleDesc;
	}
}
