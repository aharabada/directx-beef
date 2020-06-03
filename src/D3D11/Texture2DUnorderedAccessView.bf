using System;

namespace DirectX.D3D11
{
	/**
	 * Describes a unordered-access 2D texture resource.
	*/
	[CRepr]
	public struct Texture2DUnorderedAccessView
	{
		/**
		 * The mipmap slice index.
		*/
		public uint32 MipSlice;
	}
}
