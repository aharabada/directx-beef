using System;
using DirectX.DXGI;

namespace DirectX.D3D11
{
	[CRepr]
	/**
	D3D11_RENDER_TARGET_VIEW_DESC
	*/
	public struct RenderTargetViewDescription
	{
		public Format Format;
		public RenderTargetViewDimension ViewDimension;

		[Union]
		public struct RTVDesc
		{
			public D3D11_BUFFER_RTV Buffer;
		    public D3D11_TEX1D_RTV Texture1D;
		    public D3D11_TEX1D_ARRAY_RTV Texture1DArray;
		    public Texture2DRenderTargetView Texture2D;
		    public Texture2DArrayRenderTargetView Texture2DArray;
		    public D3D11_TEX2DMS_RTV Texture2DMS;
		    public D3D11_TEX2DMS_ARRAY_RTV Texture2DMSArray;
		    public D3D11_TEX3D_RTV Texture3D;
		}

		public RTVDesc Description;
	}
}
