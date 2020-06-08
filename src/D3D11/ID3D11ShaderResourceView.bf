using System;
using DirectX.Common;

namespace DirectX.D3D11
{
	/**
	 * A shader-resource-view interface specifies the subresources a shader can access during rendering.
	 * Examples of shader resources include a constant buffer, a texture buffer, and a texture.
	*/
	public struct ID3D11ShaderResourceView : ID3D11View, IComObject
	{	
		public static new Guid IID => .("b0e06fe0-8192-4e1a-b1ca-36d7414710b2");
		
		public struct VTable : ID3D11View.VTable
		{
			public function void(ID3D11ShaderResourceView* self, ShaderResourceViewDescription* pDesc) GetDesc;
		}

		public new VTable* VT
		{
			[Inline]
			get => (.)mVT;
		}

		/**
		 * Get the shader resource view's description.
		 *
		 * @param desc	A reference to a ShaderResourceViewDescription to be filled with data about the shader resource view.
		*/
		public void GetDescription(out ShaderResourceViewDescription desc) mut
		{		 
			desc = ?;
			VT.GetDesc(&this, &desc);
		}
	}
}
