using System;

namespace DirectX.D3D11
{
	/**
	 * Specifies the subresources from an array of multisampled 2D textures to use in a shader-resource view.
	*/
	[CRepr]
	public struct Texture2DMultisampledArrayShaderResourceView
	{
		/**
		 * The index of the first texture to use in an array of textures.
		*/
		public uint32 FirstArraySlice;
		/**
		 * Number of textures to use.
		*/
		public uint32 ArraySize;
	}
}
