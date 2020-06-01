using System;
using DirectX.DXGI;
using DirectX.DXGI.Common;

namespace DirectX.D3D11
{
	[CRepr]
	/**
	D3D11_TEXTURE2D_DESC
	*/
	public struct Texture2DDescription
	{
		public UINT Width;
		public UINT Height;
		public UINT MipLevels;
		public UINT ArraySize;
		public Format Format;
		public SampleDescription SampleDesc;
		public D3D11.Usage Usage;
 		public BindFlags BindFlags;
		public CpuAccessFlags CpuAccessFlags;
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
