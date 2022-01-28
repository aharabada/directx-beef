using System;
using DirectX.Common;

namespace DirectX.D3D11
{
	/**
	 * A 1D texture interface accesses texel data, which is structured memory.
	*/
	public struct ID3D11Texture1D : ID3D11Resource, IComObject
	{									   
		public static new Guid IID => .("f8fb5c27-c6b3-4f75-a4c8-439af2ef564c");

		public struct VTable : ID3D11Resource.VTable
		{
			public function [CallingConvention(.Stdcall)] void(ID3D11Texture1D* self, Texture1DDescription *pDesc) GetDesc;
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
		public void GetDescription(out Texture1DDescription desc) mut
		{
			desc = ?;
			VT.GetDesc(&this, &desc);
		}
	}
}
