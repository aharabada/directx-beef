using System;

namespace DirectX
{
	/**
	 * Represents an RGB color.
	*/
	[CRepr]
	public struct ColorRGB
	{
		/**
		 * A value representing the color of the red component.
		 * The range of this value is between 0 and 1.
		*/
		public float Red;
		/**
		 * A value representing the color of the green component.
		 * The range of this value is between 0 and 1.
		*/
		public float Green;
		/**
		 * A value representing the color of the blue component.
		 * The range of this value is between 0 and 1.
		*/
		public float Blue;

		public this()
		{
			this = default;
		}

		public this(float red, float green, float blue)
		{
			Red = red;
			Green = green;
			Blue = blue;
		}
	}
}
