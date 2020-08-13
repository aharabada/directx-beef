using System;

namespace DirectX.D3D11
{
	/**
	 * Specifies the elements in a buffer resource to use in a render-target view.
	 * D3D11_BUFFER_RTV
	 */
	[CRepr]
	public struct BufferRenderTargetView
	{
		public UINT FirstElement;
		public UINT NumElements;

		/*
		union 
		    {
		    UINT FirstElement;
		    UINT ElementOffset;
		    } 	;
		union 
		    {
		    UINT NumElements;
		    UINT ElementWidth;
		    } 	;
		*/
	}

	/**
	 * Specifies the subresource from a 1D texture to use in a render-target view.
	 * D3D11_TEX1D_RTV
	 */
	[CRepr]
	public struct Texture1DRenderTargetView
	{
		/// The index of the mipmap level to use mip slice.
		public uint32 MipSlice;
	}

	/**
	 * Specifies the subresources from an array of 1D textures to use in a render-target view.
	 * D3D11_TEX1D_ARRAY_RTV
	 */
	[CRepr]
	public struct Texture1DArrayRenderTargetView
	{
		/// The index of the mipmap level to use mip slice.
		public uint32 MipSlice;
		/// The index of the first texture to use in an array of textures.
		public uint32 FirstArraySlice;
		/// Number of textures to use.
		public uint32 ArraySize;
	}

	/**
	 * Specifies the subresource from a 2D texture to use in a render-target view.
	 * D3D11_TEX2D_RTV
	 */
	[CRepr]
	public struct Texture2DRenderTargetView
	{
		/**
		The index of the mipmap level to use mip slice.
		*/
		public uint32 MipSlice;
	}

	/**
	 * Specifies the subresource from a multisampled 2D texture to use in a render-target view.
	 * D3D11_TEX2DMS_RTV
	 */
	[CRepr]
	public struct Texture2DMultisampledRenderTargetView
	{
		/**
		 * Integer of any value.
		 * Since a multisampled 2D texture contains a single subresource, there is actually nothing to specify in Texture2DMultisampledRenderTargetView.
		 * Consequently, UnusedField_NothingToDefine is included so that this structure will compile in C.
		*/
		private uint32 UnusedField_NothingToDefine;
	}

	/**
	 * Specifies the subresources from a an array of multisampled 2D textures to use in a render-target view.
	 * D3D11_TEX2DMS_ARRAY_RTV
	 */
	[CRepr]
	public struct Texture2DMultisampledArrayRenderTargetView
	{
		/// The index of the first texture to use in an array of textures.
		public uint32 FirstArraySlice;
		/// Number of textures to use.
		public uint32 ArraySize;
	}

	/**
	 * Specifies the subresources from an array of 2D textures to use in a render-target view.
	 * D3D11_TEX2D_ARRAY_RTV
	 */
	[CRepr]
	public struct Texture2DArrayRenderTargetView
	{
		/// The index of the mipmap level to use mip slice.
		public uint32 MipSlice;
		/// The index of the first texture to use in an array of textures.
		public uint32 FirstArraySlice;
		/// Number of textures in the array to use in the render target view, starting from FirstArraySlice.
		public uint32 ArraySize;
	}

	/**
	 * Specifies the subresources from a 3D texture to use in a render-target view.
	 * D3D11_TEX3D_RTV
	 */
	[CRepr]
	public struct Texture3DRenderTargetView
	{
		/// The index of the mipmap level to use mip slice.
		public uint32 MipSlice;
		/// First depth level to use.
		public uint32 FirstWSlice;
		/**
		 * Number of depth levels to use in the render-target view, starting from FirstWSlice.
		 * A value of -1 indicates all of the slices along the w axis, starting from FirstWSlice.
		 */
		public uint32 WSize;
	}
}
