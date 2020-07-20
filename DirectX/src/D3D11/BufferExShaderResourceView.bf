using System;

namespace DirectX.D3D11
{
	/**
	 * Describes the elements in a raw buffer resource to use in a shader-resource view.
	*/
	[CRepr]
	public struct BufferExShaderResourceView
	{
		/**
		 * The index of the first element to be accessed by the view.
		*/
		public uint32 FirstElement;
		/**
		 * The number of elements in the resource.
		*/
		public uint32 NumElements;
		/**
		 * Flags that identifies view options for the buffer.
		 * Currently, the only option is to identify a raw view of the buffer.
		*/
		public BufferExShaderResourceViewFlags Flags;
	}
}
