using System;
using DirectX.DXGI;

namespace DirectX.D3D11
{
	/**
	 * Specifies the subresources from a resource that are accessible using a render-target view.
	 * D3D11_RENDER_TARGET_VIEW_DESC
	 */
	[CRepr]
	public struct RenderTargetViewDescription
	{
		public Format Format;
		public RenderTargetViewDimension ViewDimension;

		[Union]
		public struct RTVDesc
		{
			public BufferRenderTargetView Buffer;
		    public Texture1DRenderTargetView Texture1D;
		    public Texture1DArrayRenderTargetView Texture1DArray;
		    public Texture2DRenderTargetView Texture2D;
		    public Texture2DArrayRenderTargetView Texture2DArray;
		    public Texture2DMultisampledRenderTargetView Texture2DMS;
		    public Texture2DMultisampledArrayRenderTargetView Texture2DMSArray;
		    public Texture3DRenderTargetView Texture3D;

			public this(RenderTargetViewDimension viewDimension,
		        UINT mipSlice = 0, // FirstElement for BUFFER
		        UINT firstArraySlice = 0, // NumElements for BUFFER, FirstWSlice for TEXTURE3D
		        UINT arraySize = (.)-1 ) // WSize for TEXTURE3D
			{
				this = default;

				switch (viewDimension)
				{
				case .Buffer:
				    Buffer.FirstElement = mipSlice;
				    Buffer.NumElements = firstArraySlice;
				    break;
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
				case .Texture2DMultisample:
				    break;
				case .Texture2DArrayMultisample:
				    Texture2DMSArray.FirstArraySlice = firstArraySlice;
				    Texture2DMSArray.ArraySize = arraySize;
				    break;
				case .Texture3D:
				    Texture3D.MipSlice = mipSlice;
				    Texture3D.FirstWSlice = firstArraySlice;
				    Texture3D.WSize = arraySize;
				    break;
				default: break;
				}
			}
		}

		public RTVDesc Description;

		public this()
		{
			this = default;
		}

		/**
		 * Instantiates a new instance of a RenderTargetViewDescription.
		 * @param viewDimension A RenderTargetViewDimension-typed value that specifies the resource type of the view.
		 * @param format A Format-typed value that specifies the viewing format.
		 * @param mipSlice The index of the mipmap level to use mip slice. FirstElement for BufferRenderTargetView.
		 * @param firstArraySlice The index of the first element to use in an array of elements.
		 *							NumElements for BufferRenderTargetView.
		 *							FirstWSlice for Texture3DRenderTargetView.
		 * @param arraySize Number of elements in the array. WSize for Texture3DRenderTargetView.
		*/
		public this(RenderTargetViewDimension viewDimension,
	        Format format = .Unknown,
	        UINT mipSlice = 0, // FirstElement for BUFFER
	        UINT firstArraySlice = 0, // NumElements for BUFFER, FirstWSlice for TEXTURE3D
	        UINT arraySize = (.)-1 ) // WSize for TEXTURE3D
		{
			this = default;

			Format = format;
			ViewDimension = viewDimension;
			Description = .(viewDimension, mipSlice, firstArraySlice, arraySize);
		}

		/**
		 * Instantiates a new instance of a RenderTargetViewDescription structure that is initialized with BufferRenderTargetView values.
		 * @param buffer A pointer to a ID3D11Buffer interface for a buffer.
		 * @param format A Format-typed value that specifies the viewing format.
		 * @param firstElement Number of bytes between the beginning of the buffer and the first element to access.
		 * @param numElements Total number of elements in the view.
		*/
		public this(ID3D11Buffer* buffer,
        	Format format,
        	UINT firstElement,
        	UINT numElements)
		{
			this = default;

			Format = format;
			ViewDimension = .Buffer;
			Description.Buffer.FirstElement = firstElement;
			Description.Buffer.NumElements = numElements;
		}

		/**
		 * Instantiates a new instance of a RenderTargetViewDescription structure that is initialized
		 * with Texture1DRenderTargetView or Texture1DArrayRenderTargetView values.
		 * @param tex1D A pointer to a ID3D11Texture1D interface for a 1D texture.
		 * @param viewDimension A RenderTargetViewDimension-typed value that specifies the resource type of the view.
		 * @param format A Format-typed value that specifies the viewing format.
		 * @param mipSlice The index of the mipmap level to use mip slice.
		 * @param firstArraySlice The index of the first element to use in an array of elements.
		 * @param arraySize Number of elements in the array.
		*/
		public this(ID3D11Texture1D* tex1D,
	        RenderTargetViewDimension viewDimension,
	        Format format = .Unknown,
	        UINT mipSlice = 0,
	        UINT firstArraySlice = 0,
	        UINT arraySize = (.)-1)
	    {
			this = default;

			var format;
			var arraySize;

	        ViewDimension = viewDimension;
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
		 * Instantiates a new instance of a RenderTargetViewDescription structure that is initialized with 2D texture values.
		 * @param tex2D A pointer to a ID3D11Texture2D interface for a 2D texture.
		 * @param viewDimension A RenderTargetViewDimension-typed value that specifies the resource type of the view.
		 * @param format A Format-typed value that specifies the viewing format.
		 * @param mipSlice The index of the mipmap level to use mip slice.
		 * @param firstArraySlice The index of the first element to use in an array of elements.
		 * @param arraySize Number of elements in the array.
		*/
		public this(ID3D11Texture2D* tex2D,
	        RenderTargetViewDimension viewDimension,
	        Format format = .Unknown,
	        UINT mipSlice = 0,
	        UINT firstArraySlice = 0,
	        UINT arraySize = (.)-1)
	    {
			this = default;

			var format;
			var arraySize;

	        ViewDimension = viewDimension;
	        if (format == .Unknown ||
	            (arraySize == (.)-1 &&
	                (viewDimension == .Texture2DArray ||
	                viewDimension == .Texture2DArrayMultisample)))
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
	        case .Texture2DMultisample:
	            break;
	        case .Texture2DArrayMultisample:
	            Description.Texture2DMSArray.FirstArraySlice = firstArraySlice;
	            Description.Texture2DMSArray.ArraySize = arraySize;
	            break;
	        default: break;
	        }
	    }

		/**
		 * Instantiates a new instance of a RenderTargetViewDescription structure that is initialized with 3D texture values.
		 * @param tex3D A pointer to a ID3D11Texture3D interface for a 3D texture.
		 * @param format A Format-typed value that specifies the viewing format.
		 * @param mipSlice The index of the mipmap level to use mip slice.
		 * @param firstWSlice First depth level to use.
		 * @param wSize Number of depth levels to use in the render-target view, starting from firstWSlice.
		 * 				A value of -1 indicates all of the slices along the w axis, starting from firstWSlice.
		*/
		public this(ID3D11Texture3D* tex3D,
	        Format format = .Unknown,
	        UINT mipSlice = 0,
	        UINT firstWSlice = 0,
	        UINT wSize = (.)-1)
	    {
			this = default;

			var format;
			var wSize;

	        ViewDimension = .Texture3D;
	        if (format == .Unknown || wSize == (.)-1)
	        {
	            tex3D.GetDescription(let texDesc);
	            if (format == .Unknown) format = texDesc.Format;
	            if (wSize == (.)-1) wSize = texDesc.Depth - firstWSlice;
	        }

	        Format = format;
	        Description.Texture3D.MipSlice = mipSlice;
	        Description.Texture3D.FirstWSlice = firstWSlice;
	        Description.Texture3D.WSize = wSize;
	    }
	}
}
