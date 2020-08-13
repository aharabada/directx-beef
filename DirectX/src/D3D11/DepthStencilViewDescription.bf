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
		public DepthStencilViewOptions Flags;

		[Union]
		public struct DSVDesc
		{
			/**
			Specifies a 1D texture subresource.
			*/
		    public Texture1DDepthStencilView Texture1D;
			/**
			Specifies an array of 1D texture subresources.
			*/
		    public Texture1DArrayDepthStencilView Texture1DArray;
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
		    public Texture2DMultisampledDepthStencilView Texture2DMultisampled;
			/**
			Specifies an array of multisampled 2D textures.
			*/
		    public Texture2DMultisampledArrayDepthStencilView Texture2DMultisampledArray;

			public this(DepthStencilViewDimension viewDimension,
		        UINT mipSlice = 0,
		        UINT firstArraySlice = 0,
		        UINT arraySize = (.)-1,
		        DepthStencilViewOptions flags = .None)
			{
				this = default;
		        switch (viewDimension)
		        {
		        case .Texture1D:
		            Texture1D.MipSlice = mipSlice;
		            break;
		        case .Texture1DArray:
		            Texture1DArray.MipSlice = mipSlice;
		            Texture1DArray.FirstArraySlice = firstArraySlice;
		            Texture1DArray.ArraySize = arraySize;
		            break;
		        case .Texture2D:
		            Texture2D.MipSlice = mipSlice;
		            break;
		        case .Texture2DArray:
		            Texture2DArray.MipSlice = mipSlice;
		            Texture2DArray.FirstArraySlice = firstArraySlice;
		            Texture2DArray.ArraySize = arraySize;
		            break;
		        case .Texture2DMultisampled:
		            break;
		        case .Texture2DMultisampledArray:
		            Texture2DMultisampledArray.FirstArraySlice = firstArraySlice;
		            Texture2DMultisampledArray.ArraySize = arraySize;
		            break;
		        default: break;
		        }
			}
		}

		/**
		Specifies the subresource.
		*/
		public DSVDesc Description;

		public this()
		{
			this = default;
		}

		/**
		 * Instantiates a new instance of a DepthStencilViewDescription structure.
		 * @param viewDimension A DepthStencilViewDimension-typed value that specifies the depth-stencil type of the view.
		 * @param format A Format-typed value that specifies the viewing format.
		 * @param mipSlice The index of the mipmap level to use mip slice.
		 * @param firstArraySlice The index of the first element to use in an array of elements.
		 * @param arraySize Number of elements in the array.
		 * @param flags A value that describes whether the texture is read only.
		 *				Pass DepthStencilViewOptions.None (0) to specify that it is not read only;
		 *				otherwise, pass one of the members of the DepthStencilViewOptions enumerated type.
		*/
		public this(DepthStencilViewDimension viewDimension,
	        Format format = .Unknown,
	        UINT mipSlice = 0,
	        UINT firstArraySlice = 0,
	        UINT arraySize = (.)-1,
	        DepthStencilViewOptions flags = .None)
	    {
	        Format = format;
	        ViewDimension = viewDimension;
	        Flags = flags;
			Description = .(viewDimension, mipSlice, firstArraySlice, arraySize, flags);
	    }

		/**
		 * Instantiates a new instance of a DepthStencilViewDescription structure that is initialized with Texture1DDepthStencilView or Texture1DArrayDepthStencilView values.
		 * @param tex1D A pointer to a ID3D11Texture1D interface for a 1D texture.
		 * @param viewDimension A DepthStencilViewDimension-typed value that specifies the depth-stencil type of the view.
		 * @param format A Format-typed value that specifies the viewing format.
		 * @param mipSlice The index of the mipmap level to use mip slice.
		 * @param firstArraySlice The index of the first element to use in an array of elements.
		 * @param arraySize Number of elements in the array.
		 * @param flags A value that describes whether the texture is read only.
		 *				Pass DepthStencilViewOptions.None (0) to specify that it is not read only;
		 *				otherwise, pass one of the members of the DepthStencilViewOptions enumerated type.
		*/
		public this(ID3D11Texture1D* tex1D,
	        DepthStencilViewDimension viewDimension,
	        Format format = .Unknown,
	        UINT mipSlice = 0,
	        UINT firstArraySlice = 0,
	        UINT arraySize = (.)-1,
	        DepthStencilViewOptions flags = .None)
	    {
			this = default;

			var format;
			var arraySize;

	        ViewDimension = viewDimension;
	        Flags = flags;
	        if (format == .Unknown ||
	            (arraySize == (.)-1 && viewDimension == .Texture1DArray))
	        {
	            tex1D.GetDescription(let texDesc);
	            if (format == .Unknown) format = texDesc.Format;
	            if (arraySize == (.)-1) arraySize = texDesc.ArraySize - firstArraySlice;
	        }

	        Format = format;
	        switch (viewDimension)
	        {
	        case .Texture1D:
	            Description.Texture1D.MipSlice = mipSlice;
	            break;
	        case .Texture1DArray:
	            Description.Texture1DArray.MipSlice = mipSlice;
	            Description.Texture1DArray.FirstArraySlice = firstArraySlice;
	            Description.Texture1DArray.ArraySize = arraySize;
	            break;
	        default: break;
	        }
	    }
		
		/**
		 * Instantiates a new instance of a DepthStencilViewDescription structure that is initialized with 2D texture values.
		 * @param tex2D A pointer to a ID3D11Texture2D.
		 * @param viewDimension A DepthStencilViewDimension-typed value that specifies the depth-stencil type of the view.
		 * @param format A Format-typed value that specifies the viewing format.
		 * @param mipSlice The index of the mipmap level to use mip slice.
		 * @param firstArraySlice The index of the first element to use in an array of elements.
		 * @param arraySize Number of elements in the array.
		 * @param flags A value that describes whether the texture is read only.
		 *				Pass DepthStencilViewOptions.None (0) to specify that it is not read only;
		 *				otherwise, pass one of the members of the DepthStencilViewOptions enumerated type.
		*/
		public this(ID3D11Texture2D* tex2D,
	        DepthStencilViewDimension viewDimension,
	        Format format = .Unknown,
	        UINT mipSlice = 0,
	        UINT firstArraySlice = 0,
	        UINT arraySize = (.)-1,
	        DepthStencilViewOptions flags = .None)
	    {
			this = default;

			var format;
			var arraySize;

	        ViewDimension = viewDimension;
	        Flags = flags;
	        if (format == .Unknown || 
	            (arraySize == (.)-1 &&
	                (viewDimension == .Texture2DArray ||
	                viewDimension == .Texture2DMultisampledArray)))
	        {
	            tex2D.GetDescription(let texDesc);
	            if (format == .Unknown) format = texDesc.Format;
	            if (arraySize == (.)-1) arraySize = texDesc.ArraySize - firstArraySlice;
	        }

	        Format = format;
	        switch (viewDimension)
	        {
	        case .Texture2D:
	            Description.Texture2D.MipSlice = mipSlice;
	            break;
	        case .Texture2DArray:
	            Description.Texture2DArray.MipSlice = mipSlice;
	            Description.Texture2DArray.FirstArraySlice = firstArraySlice;
	            Description.Texture2DArray.ArraySize = arraySize;
	            break;
	        case .Texture2DMultisampled:
	            break;
	        case .Texture2DMultisampledArray:
	            Description.Texture2DMultisampledArray.FirstArraySlice = firstArraySlice;
	            Description.Texture2DMultisampledArray.ArraySize = arraySize;
	            break;
	        default: break;
	        }
	    }
	}
}
