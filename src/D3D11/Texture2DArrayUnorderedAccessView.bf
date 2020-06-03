using System;

namespace DirectX.D3D11
{
	/**
	 * Describes an array of unordered-access 2D texture resources.
	*/
	[CRepr]
	public struct Texture2DArrayUnorderedAccessView
	{
		/**
		 * The mipmap slice index.
		*/
		public uint32 MipSlice;
		/**
		 * The zero-based index of the first array slice to be accessed.
		*/
		public uint32 FirstArraySlice;
		/**
		 * The number of slices in the array.
		*/
		public uint32 ArraySize;
	}
}
