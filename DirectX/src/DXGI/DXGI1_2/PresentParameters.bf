using System;
using DirectX.Math;

namespace DirectX.DXGI.DXGI1_2
{
	/**
	Describes information about present that helps the operating system optimize presentation. 
	DXGI_PRESENT_PARAMETERS
	*/
	[CRepr]
	public struct PresentParameters
	{
		/**
		The number of updated rectangles that you update in the back buffer for the presented frame.
		The operating system uses this information to optimize presentation.
		You can set this member to 0 to indicate that you update the whole frame.
		*/
		public uint32 DirtyRectsCount;
		/**
		A list of updated rectangles that you update in the back buffer for the presented frame.
		An application must update every single pixel in each rectangle that it reports to the runtime;
		the application cannot assume that the pixels are saved from the previous frame.
		For more information about updating dirty rectangles, see Remarks.
		You can set this member to NULL if DirtyRectsCount is 0.
		An application must not update any pixel outside of the dirty rectangles.
		*/
		public Rectangle *pDirtyRects;
		/**
		A pointer to the scrolled rectangle.
		The scrolled rectangle is the rectangle of the previous frame from which the runtime bit-block transfers (bitblts) content.
		The runtime also uses the scrolled rectangle to optimize presentation in terminal server and indirect display scenarios.

		The scrolled rectangle also describes the destination rectangle, that is, the region on the current frame that is filled with scrolled content.
		You can set this member to NULL to indicate that no content is scrolled from the previous frame.
		*/
		public Rectangle *pScrollRect;
		/**
		A pointer to the offset of the scrolled area that goes from the source rectangle (of previous frame) to the destination rectangle (of current frame).
		You can set this member to NULL to indicate no offset.
		*/
		public Point *pScrollOffset;
	}
}
