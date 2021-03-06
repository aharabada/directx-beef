using System;
using DirectX.DXGI;

namespace DirectX.D3D11
{
	/**
	 * Describes a 3D texture.
	*/
	[CRepr]
	public struct Texture3DDescription
	{
		/**
		 * Texture width (in texels).
		 * The range is from 1 to D3D11_REQ_TEXTURE3D_U_V_OR_W_DIMENSION (2048).
		*/
		public UINT Width;
		/**
		 * Texture height (in texels). 
		 * The range is from 1 to D3D11_REQ_TEXTURE3D_U_V_OR_W_DIMENSION (2048).
		*/
		public UINT Height;
		/**
		 * Texture depth (in texels).
		 * The range is from 1 to D3D11_REQ_TEXTURE3D_U_V_OR_W_DIMENSION (2048).
		*/
		public UINT Depth;
		/**
		 * The maximum number of mipmap levels in the texture.
		 * Use 1 for a multisampled texture; or 0 to generate a full set of subtextures.
		*/
		public UINT MipLevels;
		/**
		 * Texture format.
		*/
		public Format Format;
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

		public this(Format format, UINT width, UINT height, UINT depth, UINT mipLevels = 0, BindFlags bindFlags = .ShaderResource,
			D3D11.Usage usage = .Default, CpuAccessFlags cpuFlags = .None, ResourceMiscFlags miscFlags = .None)
		{
			Width = width;
			Height = height;
			Depth = depth;
			MipLevels = mipLevels;
			Format = format;
			Usage = usage;
			BindFlags = bindFlags;
			CpuAccessFlags = cpuFlags;
			MiscFlags = miscFlags;
		}
	}
}
