using System;

namespace DirectX.D3D11
{
	/**
	 * Describes the elements in a buffer to use in a unordered-access view.
	*/
	[CRepr]
	public struct BufferUnorderedAccessView
	{
		/**
		 * The zero-based index of the first element to be accessed.
		*/
		public UINT FirstElement;
		/**
		 * The number of elements in the resource.
		 * For structured buffers, this is the number of structures in the buffer.
		*/
		public UINT NumElements;
		/**
		 * View options for the resource.
		*/
		public BufferUavFlags Flags;
	}
}
