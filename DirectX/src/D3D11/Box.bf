using System;

namespace DirectX.D3D11
{
	/**
	Defines a 3D box, where the origin is the left, front, top corner.
	D3D11_BOX
	*/
	[CRepr]
	public struct Box
	{
		/// The x position of the left hand side of the box.
		public uint32 Left;
		/// The y position of the top of the box.
		public uint32 Top;
		/// The z position of the front of the box.
		public uint32 Front;
		/// The x position of the right hand side of the box.
		public uint32 Right;
		/// The y position of the bottom of the box.
		public uint32 Bottom;
		/// The z position of the back of the box.
		public uint32 Back;

		/**
		Returns true if the box is empty.
		A box is empty if the top value is greater than or equal to the bottom value,
		or the left value is greater than or equal to the right value,
		or the front value is greater than or equal to the back value.
		*/
		public bool IsEmpty => Top >= Bottom || Left >= Right || Front >= Back;

		/**
		 * Instantiates a new instance of an uninitialized Box structure.
		*/
		public this()
		{
			this = default;
		}

		/**
		 * Instantiates a new instance of a Box structure that is initialized with the dimensions of a box.
		*/
		public this(uint32 left, uint32 top, uint32 front, uint32 right, uint32 bottom, uint32 back)
		{
			Left = left;
			Top = top;
			Front = front;
			Right = right;
			Bottom = bottom;
			Back = back;
		}

		[Inline]
		public static bool operator ==(Box l, Box r)
		{
			return l.Left == r.Left && l.Top == r.Top && l.Front == r.Front &&
				l.Right == r.Right && l.Bottom == r.Bottom && l.Back == r.Back;
		}
		
		[Inline]
		public static bool operator !=(Box l, Box r)
		{
			return !(l == r);
		}
	}
}
