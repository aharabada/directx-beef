namespace DirectX.Common
{
	/**
	 * Output primitive types.
	 * D3D_TESSELLATOR_OUTPUT_PRIMITIVE
	*/
	public enum TessellatorOutputPrimitive : uint32
	{
		/**
		 * The output primitive type is undefined.
		 * D3D_TESSELLATOR_OUTPUT_UNDEFINED
		*/
        Undefinied = 0,
		/**
		 * The output primitive type is a point.
		 * D3D_TESSELLATOR_OUTPUT_POINT
		*/
        Point = 1,
		/**
		 * The output primitive type is a line.
		 * D3D_TESSELLATOR_OUTPUT_LINE
		*/
        Line = 2,
		/**
		 * The output primitive type is a clockwise triangle.
		 * D3D_TESSELLATOR_OUTPUT_TRIANGLE_CW
		*/
        TriangleClockWise = 3,
		/**
		 * The output primitive type is a counter clockwise triangle.
		 * D3D_TESSELLATOR_OUTPUT_TRIANGLE_CCW
		*/
        TriangleCounterClockWise = 4,
	}
}
