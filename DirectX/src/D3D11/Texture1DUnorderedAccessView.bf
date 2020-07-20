using System;

namespace DirectX.D3D11
{
	/**
	 * Describes a unordered-access 1D texture resource.
	*/
	[CRepr]
	public struct Texture1DUnorderedAccessView
	{
		/**
		 * The mipmap slice index.
		*/
		public uint32 MipSlice;
	}
}
