using System;
using DirectX.DXGI;

namespace DirectX.D3D11
{
	/**
	D3D11_SHADER_RESOURCE_VIEW_DESC
	*/
	[CRepr]
	public struct ShaderResourceViewDescription
	{
		public Format Format;
    	public ShaderResourceViewDimension ViewDimension;

		[Union]
		public struct SRVDesc
		{
			public D3D11_BUFFER_SRV Buffer;
		    public D3D11_TEX1D_SRV Texture1D;
		    public D3D11_TEX1D_ARRAY_SRV Texture1DArray;
		    public Texture2DShaderResourceView Texture2D;
		    public Texture2DArrayShaderResourceView Texture2DArray;
		    public D3D11_TEX2DMS_SRV Texture2DMS;
		    public D3D11_TEX2DMS_ARRAY_SRV Texture2DMSArray;
		    public D3D11_TEX3D_SRV Texture3D;
		    public D3D11_TEXCUBE_SRV TextureCube;
		    public D3D11_TEXCUBE_ARRAY_SRV TextureCubeArray;
		    public D3D11_BUFFEREX_SRV BufferEx;
		}

		public SRVDesc Description;
	}
}
