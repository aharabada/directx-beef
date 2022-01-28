using System;
using DirectX.Common;

namespace DirectX.D3D11
{
	/**
	 * A 2D texture interface manages texel data, which is structured memory.
	*/
	public struct ID3D11Texture2D : ID3D11Resource, IComObject
	{									   
		public static new Guid IID => .("6f15aaf2-d208-4e89-9ab4-489535d34f9c");

		public struct VTable : ID3D11Resource.VTable
		{
			public function [CallingConvention(.Stdcall)] void(ID3D11Texture2D* self, Texture2DDescription *pDesc) GetDesc;
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
		public void GetDescription(out Texture2DDescription desc) mut
		{
			desc = ?;
			VT.GetDesc(&this, &desc);
		}
	}
}
