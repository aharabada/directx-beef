using System;

namespace DirectX.DXGI
{
	/**
	 * Describes a mapped rectangle that is used to access a surface.
	*/
	[CRepr]
	public struct MappedRectangle
	{
		/**
		 * A value that describes the width, in bytes, of the surface.
		*/
		public INT Pitch;
		/**
		 * A pointer to the image buffer of the surface.
		*/
		public uint8 *pBits;
	}
}
