using System;
using DirectX.DXGI;
using DirectX.Common;

namespace DirectX.D3D11
{
	/**
	 * Describes a shader-resource view.
	*/
	[CRepr]
	public struct ShaderResourceViewDescription
	{
		/**
		 * Specifies the viewing format.
		*/
		public Format Format;
		/**
		 * The resource type of the view.
		 * You must set ViewDimension to the same resource type as that of the underlying resource.
		 * This parameter also determines which description to use in the Description-union.
		*/
    	public ShaderResourceViewDimension ViewDimension;

		[Union]
		public struct SRVDesc
		{
			public BufferShaderResourceView Buffer;
		    public Texture1DShaderResourceView Texture1D;
		    public Texture1DArrayShaderResourceView Texture1DArray;
		    public Texture2DShaderResourceView Texture2D;
		    public Texture2DArrayShaderResourceView Texture2DArray;
		    public Texture2DMutlisampledShaderResourceView Texture2DMS;
		    public Texture2DMultisampledArrayShaderResourceView Texture2DMSArray;
		    public Texture3DShaderResourceView Texture3D;
		    public TextureCubeShaderResourceView TextureCube;
		    public TextureCubeArrayShaderResourceView TextureCubeArray;
		    public BufferExShaderResourceView BufferEx;

			public this(ShaderResourceViewDimension viewDimension, 
			UINT mostDetailedMip = 0,
			UINT mipLevels = (.)-1,
			UINT firstArraySlice = 0,
			UINT arraySize = (.)-1,
			BufferExShaderResourceViewFlags flags = .None)
			{
				this = default;

				switch (viewDimension)
				{
				case .Buffer:
				    Buffer.FirstElement = mostDetailedMip;
				    Buffer.NumElements = mipLevels;
				    break;
				case .Texture1D:
				    Texture1D.MostDetailedMip = mostDetailedMip;
				    Texture1D.MipLevels = mipLevels;
				    break;
				case .Texture1DArray:
				    Texture1DArray.MostDetailedMip = mostDetailedMip;
				    Texture1DArray.MipLevels = mipLevels;
				    Texture1DArray.FirstArraySlice = firstArraySlice;
				    Texture1DArray.ArraySize = arraySize;
				    break;
				case .Texture2D:
				    Texture2D.MostDetailedMip = mostDetailedMip;
				    Texture2D.MipLevels = mipLevels;
				    break;
				case .Texture2DArray:
				    Texture2DArray.MostDetailedMip = mostDetailedMip;
				    Texture2DArray.MipLevels = mipLevels;
				    Texture2DArray.FirstArraySlice = firstArraySlice;
				    Texture2DArray.ArraySize = arraySize;
				    break;
				case .Texture2DMultisampled:
				    break;
				case .Texture2DMultisampledArray:
				    Texture2DMSArray.FirstArraySlice = firstArraySlice;
				    Texture2DMSArray.ArraySize = arraySize;
				    break;
				case .Texture3D:
				    Texture3D.MostDetailedMip = mostDetailedMip;
				    Texture3D.MipLevels = mipLevels;
				    break;
				case .TextureCube:
				    TextureCube.MostDetailedMip = mostDetailedMip;
				    TextureCube.MipLevels = mipLevels;
				    break;
				case .TextureCubeArray:
				    TextureCubeArray.MostDetailedMip = mostDetailedMip;
				    TextureCubeArray.MipLevels = mipLevels;
				    TextureCubeArray.First2DArrayFace = firstArraySlice;
				    TextureCubeArray.NumCubes = arraySize;
				    break;
				case .BufferEx:
				    BufferEx.FirstElement = mostDetailedMip;
				    BufferEx.NumElements = mipLevels;
				    BufferEx.Flags = flags;
				    break;
				default: break;
				}
			}
		}

		public SRVDesc Description;

		public this()
		{
			this = default;
		}

		public this(ShaderResourceViewDimension viewDimension, Format format = .Unknown,
			UINT mostDetailedMip = 0, // FirstElement for BUFFER
			UINT mipLevels = (.)-1, // NumElements for BUFFER
			UINT firstArraySlice = 0, // First2DArrayFace for TEXTURECUBEARRAY
			UINT arraySize = (.)-1, // NumCubes for TEXTURECUBEARRAY
			BufferExShaderResourceViewFlags flags = .None) // BUFFEREX only
		{
			Format = format;
			ViewDimension = viewDimension;
			Description = .(viewDimension, mostDetailedMip, mipLevels, firstArraySlice, arraySize, flags);
		}

		/**
		 * Instantiates a new instance of a ShaderResourceViewDescription structure that is initialized with BufferExShaderResourceView values.
		 * @param buffer A pointer to a ID3D11Buffer interface for a buffer.
		 * @param format A DXGI_FORMAT-typed value that specifies the viewing format.
		 * @param firstElement Number of bytes between the beginning of the buffer and the first element to access.
		 * @param numElements Total number of elements in the view.
		 * @param flags A D3D11_BUFFEREX_SRV_FLAG-typed value that identifies view options for a buffer.
		*/
		public this(ID3D11Buffer* buffer, Format format, uint32 firstElement, uint32 numElements, BufferExShaderResourceViewFlags flags = .None)
		{
			this = default;

			Format = format;
			ViewDimension = .BufferEx;
			Description.BufferEx.FirstElement = firstElement;
			Description.BufferEx.NumElements = numElements;
			Description.BufferEx.Flags = flags;
		}

		/**
		 * Instantiates a new instance of a ShaderResourceViewDescription structure that is initialized with Texture1DShaderResourceView or Texture1DArrayShaderResourceView values.
		 * @param tex1D A pointer to a ID3D11Texture1D interface for a 1D texture.
		 * @param viewDimension A ShaderResourceViewDimension-typed value that specifies the resource type of the view.
		 * @param format A Format-typed value that specifies the viewing format.
		 * @param mostDetailedMip Index of the most detailed mipmap level to use; this number is from 0 to mipLevels -1.
		 * @param mipLevels The maximum number of mipmap levels for the view.
		 * @param firstArraySlice The index of the first element to use in an array of elements.
		 * @param arraySize Number of elements in the array.
		*/
		public this(ID3D11Texture1D* tex1D, ShaderResourceViewDimension viewDimension, Format format = .Unknown,
        	UINT mostDetailedMip = 0, UINT mipLevels = (.)-1, UINT firstArraySlice = 0, UINT arraySize = (.)-1)
		{
			this = default;

			var format;
			var mipLevels;
			var arraySize;

			ViewDimension = viewDimension;
			if (format == .Unknown || mipLevels == (.)-1 ||
			    (arraySize == (.)-1 && viewDimension == .Texture1DArray))
			{
			    tex1D.GetDescription(let texDesc);

			    if (format == .Unknown) format = texDesc.Format;
			    if (mipLevels == (.)-1) mipLevels = texDesc.MipLevels - mostDetailedMip;
			    if (arraySize == (.)-1) arraySize = texDesc.ArraySize - firstArraySlice;
			}
			Format = format;
			switch (viewDimension)
			{
			case .Texture1D:
			    Description.Texture1D.MostDetailedMip = mostDetailedMip;
			    Description.Texture1D.MipLevels = mipLevels;
			    break;
			case .Texture1DArray:
			    Description.Texture1DArray.MostDetailedMip = mostDetailedMip;
			    Description.Texture1DArray.MipLevels = mipLevels;
			    Description.Texture1DArray.FirstArraySlice = firstArraySlice;
			    Description.Texture1DArray.ArraySize = arraySize;
			    break;
			default: break;
			}
		}

		/**
		 * Instantiates a new instance of a ShaderResourceViewDescription structure that is initialized with 2D texture values.
		* @param tex2D A pointer to a ID3D11Texture2D interface for a 2D texture.
		* @param viewDimension A ShaderResourceViewDimension-typed value that specifies the resource type of the view.
		* @param format A Format-typed value that specifies the viewing format.
		* @param mostDetailedMip Index of the most detailed mipmap level to use; this number is from 0 to mipLevels -1.
		* @param mipLevels The maximum number of mipmap levels for the view.
		* @param firstArraySlice The index of the first element to use in an array of elements. First2DArrayFace of TextureCubeArrayShaderResourceView.
		* @param arraySize Number of elements in the array. NumCubes of TextureCubeArrayShaderResourceView.
		*/
		public this(ID3D11Texture2D* tex2D,
	        ShaderResourceViewDimension viewDimension,
	        Format format = .Unknown,
	        UINT mostDetailedMip = 0,
	        UINT mipLevels = (.)-1,
	        UINT firstArraySlice = 0, // First2DArrayFace for TEXTURECUBEARRAY
	        UINT arraySize = (.)-1 ) // NumCubes for TEXTURECUBEARRAY
	    {
			this = default;

			var format;
			var mipLevels;
			var arraySize;

	        ViewDimension = viewDimension;
	        if (format == .Unknown || 
	            (mipLevels == (.)-1 &&
	                viewDimension != .Texture2DMultisampled &&
	                viewDimension != .Texture2DMultisampledArray) ||
	            (arraySize == (.)-1 &&
	                (viewDimension != .Texture2DArray ||
	                viewDimension != .Texture2DMultisampledArray ||
	                viewDimension != .TextureCubeArray)))
	        {
	            tex2D.GetDescription(let texDesc);
	            if (format == .Unknown) format = texDesc.Format;
	            if (mipLevels == (.)-1) mipLevels = texDesc.MipLevels - mostDetailedMip;
	            if (arraySize == (.)-1)
	            {
	                arraySize = texDesc.ArraySize - firstArraySlice;
	                if (viewDimension == .TextureCubeArray) arraySize /= 6;
	            }
	        }
	        Format = format;
	        switch (viewDimension)
	        {
	        case .Texture2D:
	            Description.Texture2D.MostDetailedMip = mostDetailedMip;
	            Description.Texture2D.MipLevels = mipLevels;
	            break;
	        case .Texture2DArray:
	            Description.Texture2DArray.MostDetailedMip = mostDetailedMip;
	            Description.Texture2DArray.MipLevels = mipLevels;
	            Description.Texture2DArray.FirstArraySlice = firstArraySlice;
	            Description.Texture2DArray.ArraySize = arraySize;
	            break;
	        case .Texture2DMultisampled:
	            break;
	        case .Texture2DMultisampledArray:
	            Description.Texture2DMSArray.FirstArraySlice = firstArraySlice;
	            Description.Texture2DMSArray.ArraySize = arraySize;
	            break;
	        case .TextureCube:
	            Description.TextureCube.MostDetailedMip = mostDetailedMip;
	            Description.TextureCube.MipLevels = mipLevels;
	            break;
	        case .TextureCubeArray:
	            Description.TextureCubeArray.MostDetailedMip = mostDetailedMip;
	            Description.TextureCubeArray.MipLevels = mipLevels;
	            Description.TextureCubeArray.First2DArrayFace = firstArraySlice;
	            Description.TextureCubeArray.NumCubes = arraySize;
	            break;
	        default: break;
	        }
	    }

		/**
		 * Instantiates a new instance of a ShaderResourceViewDescription structure that is initialized with 3D texture values.
		 * @param tex3D A pointer to a ID3D11Texture3D interface for a 3D texture.
		 * @param format A Format-typed value that specifies the viewing format.
		 * @param mostDetailedMip Index of the most detailed mipmap level to use; this number is from 0 to mipLevels -1.
		 * @param mipLevels The maximum number of mipmap levels for the view.
		*/
		public this(
		    ID3D11Texture3D* tex3D,
		    Format format = .Unknown,
		    UINT mostDetailedMip = 0,
		    UINT mipLevels = (.)-1 )
		{
			this = default;

			var format;
			var mipLevels;

		    ViewDimension = .Texture3D;
		    if (format == .Unknown || mipLevels == (.)-1)
		    {
		        tex3D.GetDescription(let texDesc);
		        if (format == .Unknown) format = texDesc.Format;
		        if (mipLevels == (.)-1) mipLevels = texDesc.MipLevels - mostDetailedMip;
		    }
		    Format = format;
		    Description.Texture3D.MostDetailedMip = mostDetailedMip;
		    Description.Texture3D.MipLevels = mipLevels;
		}
	}
}
