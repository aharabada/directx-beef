using System;
using DirectX;
using DirectX.Math;

namespace Example
{
	/**
	 * Represents a Vertex with a 3D-Position an a Color.
	 */
	[CRepr]
	public struct VertexColor
	{
		public Vector3 Position;
		public Color Color;

		public this(Vector3 position, Color color)
		{
			Position = position;
			Color = color;
		}	
	}
}
