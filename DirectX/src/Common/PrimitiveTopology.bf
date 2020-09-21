namespace DirectX.Common
{
	// Todo: C#ify
	// Todo: Document
	public enum PrimitiveTopology : uint32
	{
		/**
		 * @native: D3D_PRIMITIVE_TOPOLOGY_UNDEFINED
		 */
	    Undefined	= 0,
		/**
		 * @native: D3D_PRIMITIVE_TOPOLOGY_POINTLIST
		 */
	    PointList	= 1,
		/**
		 * @native: D3D_PRIMITIVE_TOPOLOGY_LINELIST
		 */
	    LineList	= 2,
		/**
		 * @native: D3D_PRIMITIVE_TOPOLOGY_LINESTRIP
		 */
	    LineStrip	= 3,
		/**
		 * @native: D3D_PRIMITIVE_TOPOLOGY_TRIANGLELIST
		 */
	    TriangleList	= 4,
		/**
		 * @native: D3D_PRIMITIVE_TOPOLOGY_TRIANGLESTRIP
		 */
	    TriangleStrip	= 5,
		/**
		 * @native: D3D_PRIMITIVE_TOPOLOGY_LINELIST_ADJ
		 */
	    LineListWithAdjacency	= 10,
		/**
		 * @native: D3D_PRIMITIVE_TOPOLOGY_LINESTRIP_ADJ
		 */
	    LineStripWithAdjacency	= 11,
		/**
		 * @native: D3D_PRIMITIVE_TOPOLOGY_TRIANGLELIST_ADJ
		 */
	    TriangleListWithAdjacency	= 12,
		/**
		 * @native: D3D_PRIMITIVE_TOPOLOGY_TRIANGLESTRIP_ADJ
		 */
	    TriangleStripWithAdjacency	= 13,
		/**
		 * @native: D3D_PRIMITIVE_TOPOLOGY_1_CONTROL_POINT_PATCHLIST
		 */
	    PatchListWith1ControlPoints	= 33,
		/**
		 * @native: D3D_PRIMITIVE_TOPOLOGY_2_CONTROL_POINT_PATCHLIST
		 */
	    PatchListWith2ControlPoints	= 34,
		/**
		 * @native: D3D_PRIMITIVE_TOPOLOGY_3_CONTROL_POINT_PATCHLIST
		 */
	    PatchListWith3ControlPoints	= 35,
		/**
		 * @native: D3D_PRIMITIVE_TOPOLOGY_4_CONTROL_POINT_PATCHLIST
		 */
	    PatchListWith4ControlPoints	= 36,
		/**
		 * @native: D3D_PRIMITIVE_TOPOLOGY_5_CONTROL_POINT_PATCHLIST
		 */
	    PatchListWith5ControlPoints	= 37,
		/**
		 * @native: D3D_PRIMITIVE_TOPOLOGY_6_CONTROL_POINT_PATCHLIST
		 */
	    PatchListWith6ControlPoints	= 38,
		/**
		 * @native: D3D_PRIMITIVE_TOPOLOGY_7_CONTROL_POINT_PATCHLIST
		 */
	    PatchListWith7ControlPoints	= 39,
		/**
		 * @native: D3D_PRIMITIVE_TOPOLOGY_8_CONTROL_POINT_PATCHLIST
		 */
	    PatchListWith8ControlPoints	= 40,
		/**
		 * @native: D3D_PRIMITIVE_TOPOLOGY_9_CONTROL_POINT_PATCHLIST
		 */
	    PatchListWith9ControlPoints	= 41,
		/**
		 * @native: D3D_PRIMITIVE_TOPOLOGY_10_CONTROL_POINT_PATCHLIST
		 */
	    PatchListWith10ControlPoints	= 42,
		/**
		 * @native: D3D_PRIMITIVE_TOPOLOGY_11_CONTROL_POINT_PATCHLIST
		 */
	    PatchListWith11ControlPoints	= 43,
		/**
		 * @native: D3D_PRIMITIVE_TOPOLOGY_12_CONTROL_POINT_PATCHLIST
		 */
	    PatchListWith12ControlPoints	= 44,
		/**
		 * @native: D3D_PRIMITIVE_TOPOLOGY_13_CONTROL_POINT_PATCHLIST
		 */
	    PatchListWith13ControlPoints	= 45,
		/**
		 * @native: D3D_PRIMITIVE_TOPOLOGY_14_CONTROL_POINT_PATCHLIST
		 */
	    PatchListWith14ControlPoints	= 46,
		/**
		 * @native: D3D_PRIMITIVE_TOPOLOGY_15_CONTROL_POINT_PATCHLIST
		 */
	    PatchListWith15ControlPoints	= 47,
		/**
		 * @native: D3D_PRIMITIVE_TOPOLOGY_16_CONTROL_POINT_PATCHLIST
		 */
	    PatchListWith16ControlPoints	= 48,
		/**
		 * @native: D3D_PRIMITIVE_TOPOLOGY_17_CONTROL_POINT_PATCHLIST
		 */
	    PatchListWith17ControlPoints	= 49,
		/**
		 * @native: D3D_PRIMITIVE_TOPOLOGY_18_CONTROL_POINT_PATCHLIST
		 */
	    PatchListWith18ControlPoints	= 50,
		/**
		 * @native: D3D_PRIMITIVE_TOPOLOGY_19_CONTROL_POINT_PATCHLIST
		 */
	    PatchListWith19ControlPoints	= 51,
		/**
		 * @native: D3D_PRIMITIVE_TOPOLOGY_20_CONTROL_POINT_PATCHLIST
		 */
	    PatchListWith20ControlPoints	= 52,
		/**
		 * @native: D3D_PRIMITIVE_TOPOLOGY_21_CONTROL_POINT_PATCHLIST
		 */
	    PatchListWith21ControlPoints	= 53,
		/**
		 * @native: D3D_PRIMITIVE_TOPOLOGY_22_CONTROL_POINT_PATCHLIST
		 */
	    PatchListWith22ControlPoints	= 54,
		/**
		 * @native: D3D_PRIMITIVE_TOPOLOGY_23_CONTROL_POINT_PATCHLIST
		 */
	    PatchListWith23ControlPoints	= 55,
		/**
		 * @native: D3D_PRIMITIVE_TOPOLOGY_24_CONTROL_POINT_PATCHLIST
		 */
	    PatchListWith24ControlPoints	= 56,
		/**
		 * @native: D3D_PRIMITIVE_TOPOLOGY_25_CONTROL_POINT_PATCHLIST
		 */
	    PatchListWith25ControlPoints	= 57,
		/**
		 * @native: D3D_PRIMITIVE_TOPOLOGY_26_CONTROL_POINT_PATCHLIST
		 */
	    PatchListWith26ControlPoints	= 58,
		/**
		 * @native: D3D_PRIMITIVE_TOPOLOGY_27_CONTROL_POINT_PATCHLIST
		 */
	    PatchListWith27ControlPoints	= 59,
		/**
		 * @native: D3D_PRIMITIVE_TOPOLOGY_28_CONTROL_POINT_PATCHLIST
		 */
	    PatchListWith28ControlPoints	= 60,
		/**
		 * @native: D3D_PRIMITIVE_TOPOLOGY_29_CONTROL_POINT_PATCHLIST
		 */
	    PatchListWith29ControlPoints	= 61,
		/**
		 * @native: D3D_PRIMITIVE_TOPOLOGY_30_CONTROL_POINT_PATCHLIST
		 */
	    PatchListWith30ControlPoints	= 62,
		/**
		 * @native: D3D_PRIMITIVE_TOPOLOGY_31_CONTROL_POINT_PATCHLIST
		 */
	    PatchListWith31ControlPoints	= 63,
		/**
		 * @native: D3D_PRIMITIVE_TOPOLOGY_32_CONTROL_POINT_PATCHLIST
		 */
	    PatchListWith32ControlPoints	= 64,
	}
}
