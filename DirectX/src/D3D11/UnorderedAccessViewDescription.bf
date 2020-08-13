using System;
using DirectX.DXGI;

namespace DirectX.D3D11
{
	/**
	 * Specifies the subresources from a resource that are accessible using an unordered-access view.
	 * D3D11_UNORDERED_ACCESS_VIEW_DESC
	 */
	[CRepr]
	public struct UnorderedAccessViewDescription
	{
		/// The data format.
		public Format Format;
		/// The resource type, which specifies how the resource will be accessed.
		public UnorderedAccessViewDimension ViewDimension;

		[Union]
		public struct Description
		{
			/// Specifies which buffer elements can be accessed (see D3D11_BUFFER_UAV).
			public BufferUnorderedAccessView Buffer;
			/// Specifies the subresources in a 1D texture that can be accessed.
			public Texture1DUnorderedAccessView Texture1D;
			/// Specifies the subresources in a 1D texture array that can be accessed.
			public Texture1DArrayUnorderedAccessView Texture1DArray;
			/// Specifies the subresources in a 2D texture that can be accessed.
			public Texture2DUnorderedAccessView Texture2D;
			/// Specifies the subresources in a 2D texture array that can be accessed.
			public Texture2DArrayUnorderedAccessView Texture2DArray;
			/// Specifies subresources in a 3D texture that can be accessed.
			public Texture3DUnorderedAccessView Texture3D;

			public this(UnorderedAccessViewDimension viewDimension,
		        UINT mipSlice = 0, // FirstElement for BUFFER
		        UINT firstArraySlice = 0, // NumElements for BUFFER, FirstWSlice for TEXTURE3D
		        UINT arraySize = (.)-1, // WSize for TEXTURE3D
		        BufferUavFlags flags = .None)
			{
				this = default;
				
				switch (viewDimension)
				{
				case .Buffer:
				    Buffer.FirstElement = mipSlice;
				    Buffer.NumElements = firstArraySlice;
				    Buffer.Flags = flags;
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
				case .Texture3D:
				    Texture3D.MipSlice = mipSlice;
				    Texture3D.FirstWSlice = firstArraySlice;
				    Texture3D.WSize = arraySize;
				    break;
				default: break;
				}
			}
		}

		public Description Description;

		/**
		 * Instantiates a new instance of an uninitialized UnorderedAccessViewDescription structure.
		 */
		public this()
		{
			this = default;
		}

		/**
		 * Instantiates a new instance of a UnorderedAccessViewDescription structure that is initialized with UnorderedAccessViewDescription values.
		 * @param viewDimension A UnorderedAccessViewDimension-typed value that specifies the resource type of the view.
		 * @param format A Format-typed value that specifies the viewing format.
		 * @param mipSlice The index of the mipmap level to use mip slice. FirstElement for BufferUnorderedAccessView.
		 * @param firstArraySlice The index of the first element to use in an array of elements.
		 *							NumElements for BufferUnorderedAccessView. FirstWSlice for Texture3DUnorderedAccessView.
		 * @param arraySize Number of elements in the array. WSize for Texture3DUnorderedAccessView.
		 * @param flags A BufferUavFlags-typed value that identifies view options for a buffer. For BufferUnorderedAccessView only.
		 */
		public this(UnorderedAccessViewDimension viewDimension,
	        Format format = .Unknown,
	        UINT mipSlice = 0, // FirstElement for BUFFER
	        UINT firstArraySlice = 0, // NumElements for BUFFER, FirstWSlice for TEXTURE3D
	        UINT arraySize = (.)-1, // WSize for TEXTURE3D
	        BufferUavFlags flags = .None) // BUFFER only
	    {
	        Format = format;
	        ViewDimension = viewDimension;
			Description = .(ViewDimension, mipSlice, firstArraySlice, arraySize, flags);
	    }

		/**
		 * Instantiates a new instance of a UnorderedAccessViewDescription structure that is initialized with BufferUnorderedAccessView values.
		 * @param buffer A pointer to a ID3D11Buffer interface for a buffer.
		 * @param format A Format-typed value that specifies the viewing format.
		 * @param firstElement Number of bytes between the beginning of the buffer and the first element to access.
		 * @param numElements Total number of elements in the view.
		 * @param flags A BufferUavFlags-typed value that identifies view options for a buffer.
		 */
		public this(ID3D11Buffer* buffer,
	        Format format,
	        UINT firstElement,
	        UINT numElements,
	        BufferUavFlags flags = .None)
		{
			this = default;

			Format = format;
			ViewDimension = .Buffer;
			Description.Buffer.FirstElement = firstElement;
			Description.Buffer.NumElements = numElements;
			Description.Buffer.Flags = flags;
		}

		/**
		 * Instantiates a new instance of a UnorderedAccessViewDescription structure that is initialized with Texture1DUnorderedAccessView or Texture1DArrayUnorderedAccessView values.
		 * @param tex1D A pointer to a ID3D11Texture1D interface for a 1D texture.
		 * @param viewDimension A UnorderedAccessViewDimension-typed value that specifies the resource type of the view.
		 * @param format A Format-typed value that specifies the viewing format.
		 * @param mipSlice The index of the mipmap level to use mip slice.
		 * @param firstArraySlice The index of the first element to use in an array of elements.
		 * @param arraySize Number of elements in the array.
		 */
		public this(ID3D11Texture1D* tex1D,
	        UnorderedAccessViewDimension viewDimension,
	        Format format = .Unknown,
	        UINT mipSlice = 0,
	        UINT firstArraySlice = 0,
	        UINT arraySize = (.)-1 )
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
		 * Instantiates a new instance of a UnorderedAccessViewDescription structure that is initialized with 2D texture values.
		 * @param tex2D A pointer to a ID3D11Texture2D interface for a 2D texture.
		 * @param viewDimension A UnorderedAccessViewDimension-typed value that specifies the resource type of the view.
		 * @param format A Format-typed value that specifies the viewing format.
		 * @param mipSlice The index of the mipmap level to use mip slice.
		 * @param firstArraySlice The index of the first element to use in an array of elements.
		 * @param arraySize Number of elements in the array.
		 */
		public this(ID3D11Texture2D* tex2D,
	        UnorderedAccessViewDimension viewDimension,
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
	            (arraySize == (.)-1 && viewDimension == .Texture2DArray))
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
	        default: break;
	        }
	    }
		
		/**
		 * Instantiates a new instance of a UnorderedAccessViewDescription structure that is initialized with 3D texture values.
		 * @param tex3D A pointer to a ID3D11Texture3D interface for a 3D texture.
		 * @param format A Format-typed value that specifies the viewing format.
		 * @param mipSlice The index of the mipmap level to use mip slice.
		 * @param firstWSlice First depth level to use.
		 * @param wSize Number of depth levels to use in the render-target view, starting from firstWSlice. A value of -1 indicates all of the slices along the w axis, starting from firstWSlice.
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
