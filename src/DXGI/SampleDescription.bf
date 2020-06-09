using System;

namespace DirectX.DXGI
{
	/**
	 * Describes multi-sampling parameters for a resource.
	*/
	[CRepr]
	public struct SampleDescription
	{
		/**
		 * The number of multisamples per pixel.
		*/
		public uint32 Count;
		/**
		 * The image quality level.
		*/
		public uint32 Quality;

		public this()
		{
			this = default;
		}

		public this(uint32 count, uint32 quality)
		{
			Count = count;
			Quality = quality;
		}
	}
}
