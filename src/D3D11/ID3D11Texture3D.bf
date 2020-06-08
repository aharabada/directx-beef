using System;
using DirectX.Common;

namespace DirectX.D3D11
{
	/**
	 * A 3D texture interface accesses texel data, which is structured memory.
	*/
	public struct ID3D11Texture3D : ID3D11Resource, IComObject
	{									   
		public static new Guid IID => .("037e866e-f56d-4357-a8af-9dabbe6e250e");

		public struct VTable : ID3D11Resource.VTable
		{
			public function void(ID3D11Texture3D* self, Texture3DDescription *pDesc) GetDesc;
		}

		public new VTable* VT
		{
			[Inline]
			get => (.)mVT;
		}

		/**
		 * Get the properties of the texture resource.
		 *
		 * @param desc	A reference to the structure that receives the description.
		*/
		public void GetDescription(out Texture3DDescription desc) mut
		{
			desc = ?;
			VT.GetDesc(&this, &desc);
		}
	}
}
