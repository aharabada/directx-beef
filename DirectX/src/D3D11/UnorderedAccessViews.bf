using System;

namespace DirectX.D3D11
{
	/**
	 * Describes the elements in a buffer to use in a unordered-access view.
	 * D3D11_BUFFER_UAV
	 */
	[CRepr]
	public struct BufferUnorderedAccessView
	{
		/// The zero-based index of the first element to be accessed.
		public UINT FirstElement;
		/**
		 * The number of elements in the resource.
		 * For structured buffers, this is the number of structures in the buffer.
		*/
		public UINT NumElements;
		/// View options for the resource.
		public BufferUavFlags Flags;
	}

	/**
	 * Describes a unordered-access 1D texture resource.
	 * D3D11_TEX1D_UAV
	 */
	[CRepr]
	public struct Texture1DUnorderedAccessView
	{
		/// The mipmap slice index.
		public uint32 MipSlice;
	}

	/**
	 * Describes an array of unordered-access 1D texture resources.
	 * D3D11_TEX1D_ARRAY_UAV
	 */
	[CRepr]
	public struct Texture1DArrayUnorderedAccessView
	{
		/// The mipmap slice index.
		public uint32 MipSlice;
		/// The zero-based index of the first array slice to be accessed.
		public uint32 FirstArraySlice;
		/// The number of slices in the array.
		public uint32 ArraySize;
	}

	/**
	 * Describes a unordered-access 2D texture resource.
	 * D3D11_TEX2D_UAV
	 */
	[CRepr]
	public struct Texture2DUnorderedAccessView
	{
		/// The mipmap slice index.
		public uint32 MipSlice;
	}

	/**
	 * Describes an array of unordered-access 2D texture resources.
	 * D3D11_TEX2D_ARRAY_UAV
	 */
	[CRepr]
	public struct Texture2DArrayUnorderedAccessView
	{
		/// The mipmap slice index.
		public uint32 MipSlice;
		/// The zero-based index of the first array slice to be accessed.
		public uint32 FirstArraySlice;
		/// The number of slices in the array.
		public uint32 ArraySize;
	}

	/**
	 * Describes a unordered-access 3D texture resource.
	 * D3D11_TEX3D_UAV
	 */
	[CRepr]
	public struct Texture3DUnorderedAccessView
	{
		/// The mipmap slice index.
		public uint32 MipSlice;
		/// The zero-based index of the first depth slice to be accessed.
		public uint32 FirstWSlice;
		/// The number of depth slices.
		public uint32 WSize;
	}
}
