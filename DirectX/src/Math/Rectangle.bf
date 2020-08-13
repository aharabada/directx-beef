using System;

namespace DirectX.Math
{
	/**
	 * Represents a rectangle and provides convenience methods for creating rectangles.
	*/
	public struct Rectangle
	{
		public int32 Left;
		public int32 Top;
		public int32 Right;
		public int32 Bottom;

		/**
		 * Instantiates a new instance of an uninitialized Rectangle structure.
		*/
		public this()
		{
			this = default;
		}

		/**
		 * Instantiates a new instance of a Rectangle structure that is initialized with the dimensions of a rectangle.
		*/
		public this(int32 left, int32 top, int32 right, int32 bottom)
		{
			Left = left;
			Top = top;
			Right = right;
			Bottom = bottom;
		}

		[Inline]
		public static bool operator ==(Rectangle l, Rectangle r)
		{
			return l.Left == r.Left && l.Top == r.Top && l.Right == r.Right && l.Bottom == r.Bottom;
		}

		[Inline]
		public static bool operator !=(Rectangle l, Rectangle r)
		{
			return !(l == r);
		}
	}
}
