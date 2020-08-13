using System;
using DirectX.DXGI;

namespace DirectX.D3D11
{
	/**
	Describes a 1D texture.
	*/
	[CRepr]
	public struct Texture1DDescription
	{
		/**
		 * Texture width (in texels). The range is from 1 to D3D11_REQ_TEXTURE1D_U_DIMENSION (16384).
		*/
		public UINT Width;
		/**
		 * The maximum number of mipmap levels in the texture. 
		 * Use 1 for a multisampled texture; or 0 to generate a full set of subtextures.
		*/
		public UINT MipLevels;
		/**
		 * Number of textures in the array.
		 * The range is from 1 to D3D11_REQ_TEXTURE1D_ARRAY_AXIS_DIMENSION (2048).
		*/
		public UINT ArraySize;
		/**
		 * Texture forma.
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
		 * For a 1D texture, the allowable values are: DBindFlags.ShaderResource, BindFlags.RenderTarget and BindFlags.DepthStencil.
		*/
		public BindFlags BindFlags;
		/**
		 * Flags to specify the types of CPU access allowed.
		 * Use CpuAccessFlags.None (0) if CPU access is not required.
		 * These flags can be combined with a logical OR.
		*/
		public CpuAccessFlags CpuAccessFlags;
		/**
		 * Flags that identify other, less common resource options.
		 * Use ResourceMiscFlags.None (0) if none of these flags apply.
		 * These flags can be combined with a logical OR.
		*/
		public ResourceMiscFlags MiscFlags;

		public this()
		{
			this = default;
		}

		public this(Format format, uint32 width, uint32 arraySize = 1, uint32 mipLevels = 0, 
			BindFlags bindFlags = .ShaderResource, D3D11.Usage usage = .Default, CpuAccessFlags cpuFlags = .None,
			ResourceMiscFlags miscFlags = .None)
		{
			Width = width;
			MipLevels = mipLevels;
			ArraySize = arraySize;
			Format = format;
			Usage = usage;
			BindFlags = bindFlags;
			CpuAccessFlags = cpuFlags;
			MiscFlags = miscFlags;
		}
	}
}
