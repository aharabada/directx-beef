using System;

namespace DirectX.D3D11
{
	/**
	Defines the dimensions of a viewport.
	*/
	[CRepr]
	public struct Viewport
	{												   
		public static readonly float BoundsMax = 32768.0f;
		public static readonly float BoundsMin = -32768.0f;

		/**
		X position of the left hand side of the viewport. Ranges between BoundsMin and BoundsMax.
		TopLeftX
		*/
		public float Left;
		/**
		Y position of the top of the viewport. Ranges between BoundsMin and BoundsMax.
		TopLeftY
		*/
		public float Top;
		/**
		Width of the viewport.
		*/
		public float Width;
		/**
		Height of the viewport.
		*/
		public float Height;
		/**
		Minimum depth of the viewport. Ranges between 0 and 1.
		*/
		public float MinDepth;
		/**
		Maximum depth of the viewport. Ranges between 0 and 1.
		*/
		public float MaxDepth;

		public this()
		{
			this = default;
		}

		public this(float left, float top, float width, float height, float minDepth, float maxDepth)
		{
			Left = left;
			Top = top;
			Width = width;
			Height = height;
			MinDepth = minDepth;
			MaxDepth = maxDepth;
		}
	}
}
