using System;

namespace DirectX.D3D11
{
	/**
	 * Specifies the subresources from a multisampled 2D texture to use in a shader-resource view.
	*/
	[CRepr]
	public struct Texture2DMutlisampledShaderResourceView
	{
		/**
		 * Integer of any value.
		 * Since a multisampled 2D texture contains a single subresource, there is actually nothing to specify in D3D11_TEX2DMS_RTV.
		 * Consequently, UnusedField_NothingToDefine is included so that this structure will compile in C.
		*/
    	private uint32 UnusedField_NothingToDefine;
	}
}
