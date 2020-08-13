using System;

namespace DirectX.D3D11
{
	/**
	 * Arguments for draw instanced indirect.
	 * D3D11_DRAW_INSTANCED_INDIRECT_ARGS
	 */
	[CRepr]
	public struct DrawInstancedIndirectArgs
	{
		/// The number of vertices to draw.
		public UINT VertexCountPerInstance;
		/// The number of instances to draw.
		public UINT InstanceCount;
		/// The index of the first vertex.
		public UINT StartVertexLocation;
		/// A value added to each index before reading per-instance data from a vertex buffer.
		public UINT StartInstanceLocation;
	}
}
