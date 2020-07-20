using System;

namespace DirectX.DXGI.DXGI1_2
{
	/**
	 * Describes a display mode and whether the display mode supports stereo.
	*/
	[CRepr]
	public struct ModeDescription1 : ModeDescription
	{
		/**
		 * Specifies whether the full-screen display mode is stereo.
		 * TRUE if stereo; otherwise, FALSE.
		*/
		public BOOL Stereo;
	}
}
