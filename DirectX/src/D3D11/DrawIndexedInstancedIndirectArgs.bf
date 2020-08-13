using System;

namespace DirectX.D3D11
{
	/**
	 * Arguments for draw indexed instanced indirect.
	 * D3D11_DRAW_INDEXED_INSTANCED_INDIRECT_ARGS
	*/
	[CRepr]
	public struct DrawIndexedInstancedIndirectArgs
	{
		/// The number of indices read from the index buffer for each instance.
		public UINT IndexCountPerInstance;
		/// The number of instances to draw.
		public UINT InstanceCount;
		/// The location of the first index read by the GPU from the index buffer.
		public UINT StartIndexLocation;
		/// A value added to each index before reading a vertex from the vertex buffer.
		public INT BaseVertexLocation;
		/// A value added to each index before reading per-instance data from a vertex buffer.
		public UINT StartInstanceLocation;
	}
}
