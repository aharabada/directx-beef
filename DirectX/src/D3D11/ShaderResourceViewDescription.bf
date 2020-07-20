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
		}

		public SRVDesc Description;
	}
}
