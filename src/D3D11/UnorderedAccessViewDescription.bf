using System;
using DirectX.DXGI;

namespace DirectX.D3D11
{
	/**
	 * Specifies the subresources from a resource that are accessible using an unordered-access view.
	*/
	[CRepr]
	public struct UnorderedAccessViewDescription
	{
		/**
		 * The data format.
		*/
		public Format Format;
		/**
		 * The resource type, which specifies how the resource will be accessed.
		*/
		public UnorderedAccessViewDimension ViewDimension;

		[Union]
		public struct Description
		{
			/// Specifies which buffer elements can be accessed (see D3D11_BUFFER_UAV).
			public BufferUnorderedAccessView Buffer;
			/// Specifies the subresources in a 1D texture that can be accessed.
			public Texture1DUnorderedAccessView Texture1D;
			/// Specifies the subresources in a 1D texture array that can be accessed.
			public Texture1DArrayUnorderedAccessView Texture1DArray;
			/// Specifies the subresources in a 2D texture that can be accessed.
			public Texture2DUnorderedAccessView Texture2D;
			/// Specifies the subresources in a 2D texture array that can be accessed.
			public Texture2DArrayUnorderedAccessView Texture2DArray;
			/// Specifies subresources in a 3D texture that can be accessed.
			public Texture3DUnorderedAccessView Texture3D;
		}

		public Description Description;
	}
}
