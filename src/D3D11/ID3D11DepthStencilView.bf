using System;
using DirectX.Common;

namespace DirectX.D3D11
{
	public struct ID3D11DepthStencilView : ID3D11View, IComObject
	{
		public static new Guid IID => Guid("9fdac92a-1876-48c3-afad-25b94f84a9b6");
		
		public struct VTable : ID3D11View.VTable
		{
			public function void(ID3D11DepthStencilView* self, DepthStencilViewDescription *pDesc) GetDesc;
		}

		public new VTable* VT
		{
			[Inline]
			get
			{
				return (.)mVT;
			}
		}

		public void GetDescription(out DepthStencilViewDescription desc) mut
		{
			desc = ?;
			VT.GetDesc(&this, &desc);
		}
	}
}
