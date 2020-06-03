using System;

namespace DirectX.D3D11
{
	/**
	 * Describes a unordered-access 3D texture resource.
	*/
	[CRepr]
	public struct Texture3DUnorderedAccessView
	{
		/**
		 * The mipmap slice index.
		*/
		public uint32 MipSlice;
		/**
		 * The zero-based index of the first depth slice to be accessed.
		*/
		public uint32 FirstWSlice;
		/**
		 * The number of depth slices.
		*/
		public uint32 WSize;
	}
}
