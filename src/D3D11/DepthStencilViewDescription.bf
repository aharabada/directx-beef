using System;
using DirectX.DXGI;

namespace DirectX.D3D11
{
	/**
	Specifies the subresources of a texture that are accessible from a depth-stencil view.
	D3D11_DEPTH_STENCIL_VIEW_DESC
	*/
	[CRepr]
	public struct DepthStencilViewDescription
	{
		/**
		Resource data format. 
		The valid formats for a depth-stencil view are: 
    		- D16_UNorm (DXGI_FORMAT_D16_UNORM)
    		- D24_UNorm_S8_UInt(DXGI_FORMAT_D24_UNORM_S8_UINT)
    		- D32_Float (DXGI_FORMAT_D32_FLOAT)
    		- D32_Float_S8X24_UInt (DXGI_FORMAT_D32_FLOAT_S8X24_UINT)
    		- Unknown (DXGI_FORMAT_UNKNOWN)
		A depth-stencil view cannot use a typeless format.
		If the format chosen is Unknown(DXGI_FORMAT_UNKNOWN), then the format of the parent resource is used. 
		*/
		public Format Format;
		/**
		Type of resource.
		Specifies how a depth-stencil resource will be accessed; the value is stored in the union in this structure.
		*/
		public DepthStencilViewDimension ViewDimension;
		/**
		A value that describes whether the texture is read only.
		Pass None(0) to specify that it is not read only;
		otherwise, pass one of the members of the DepthStencilViewOptions enumerated type.
		*/
		public DepthStencilViewOptions Options;

		[Union]
		public struct DSVDesc
		{
			/**
			Specifies a 1D texture subresource.
			*/
		    public D3D11_TEX1D_DSV Texture1D;
			/**
			Specifies an array of 1D texture subresources.
			*/
		    public D3D11_TEX1D_ARRAY_DSV Texture1DArray;
			/**
			Specifies a 2D texture subresource.
			*/
		    public Texture2DDepthStencilView Texture2D;
			/**
			Specifies an array of 2D texture subresources.
			*/
		    public Texture2DArrayDepthStencilView Texture2DArray;
			/**
			Specifies a multisampled 2D texture.
			*/
		    public D3D11_TEX2DMS_DSV Texture2DMultisampled;
			/**
			Specifies an array of multisampled 2D textures.
			*/
		    public D3D11_TEX2DMS_ARRAY_DSV Texture2DMultisampledArray;
		}

		/**
		Specifies the subresource.
		*/
		public DSVDesc Description;
	}
}
