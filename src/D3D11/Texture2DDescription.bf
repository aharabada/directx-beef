using System;
using DirectX.DXGI;

namespace DirectX.D3D11
{
	/**
	 * Describes a 2D texture.
	*/
	[CRepr]
	public struct Texture2DDescription
	{
		/**
		 * Texture width (in texels).
		 * The range is from 1 to D3D11_REQ_TEXTURE2D_U_OR_V_DIMENSION (16384).
		 * For a texture cube-map, the range is from 1 to D3D11_REQ_TEXTURECUBE_DIMENSION (16384).
		*/
		public UINT Width;
		/**
		 * Texture height (in texels). 
		 * The range is from 1 to D3D11_REQ_TEXTURE2D_U_OR_V_DIMENSION (16384). 
		 * For a texture cube-map, the range is from 1 to D3D11_REQ_TEXTURECUBE_DIMENSION (16384).
		*/
		public UINT Height;
		/**
		 * The maximum number of mipmap levels in the texture.
		 * Use 1 for a multisampled texture; or 0 to generate a full set of subtextures.
		*/
		public UINT MipLevels;
		/**
		 * Number of textures in the texture array.
		 * The range is from 1 to D3D11_REQ_TEXTURE2D_ARRAY_AXIS_DIMENSION (2048).
		 * For a texture cube-map, this value is a multiple of 6 (that is, 6 times the value in the NumCubes member of D3D11_TEXCUBE_ARRAY_SRV), and the range is from 6 to 2046.
		*/
		public UINT ArraySize;
		/**
		 * Texture format.
		*/
		public Format Format;
		/**
		 * The multisampling parameters for the texture.
		*/
		public SampleDescription SampleDesc;
		/**
		 * Value that identifies how the texture is to be read from and written to.
		 * The most common value is Usage.Default.
		*/
		public D3D11.Usage Usage;
		/**
		 * Flags for binding to pipeline stages.
		 * The flags can be combined by a logical OR.
		*/
 		public BindFlags BindFlags;
		/**
		 * Flags to specify the types of CPU access allowed.
		 * Use None (0) if CPU access is not required.
		 * These flags can be combined with a logical OR.
		*/
		public CpuAccessFlags CpuAccessFlags;
		/**
		 * Flags that identify other, less common resource options.
		 * Use None (0) if none of these flags apply.
		 * These flags can be combined by using a logical OR.
		 * For a texture cube-map, set the ResourceMiscFlags.TextureCube flag.
		 * Cube-map arrays (that is, ArraySize > 6) require feature level D3D_FEATURE_LEVEL_10_1 or higher.
		*/
		public ResourceMiscFlags MiscFlags;

		public this()
		{
			this = default;
		}

		public this(uint32 width, uint32 height, uint32 mipLevels, uint32 arraySize, Format format,
			SampleDescription sampleDesc, D3D11.Usage usage, BindFlags bindFlags,
			CpuAccessFlags cpuFlags, ResourceMiscFlags miscFlags)
		{
			Width = width;
			Height = height;
			MipLevels = mipLevels;
			ArraySize = arraySize;
			Format = format;
			SampleDesc = sampleDesc;
			Usage = usage;
			BindFlags = bindFlags;
			CpuAccessFlags = cpuFlags;
			MiscFlags = miscFlags;
		}
	}
}
