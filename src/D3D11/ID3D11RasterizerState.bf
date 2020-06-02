using System;
using DirectX.Common;

namespace DirectX.D3D11
{
	public struct ID3D11RasterizerState : ID3D11View, IComObject
	{
		public static new Guid IID => Guid("9bb4ab81-ab1a-4d8f-b506-fc04200b6ee7");
		
		public struct VTable : ID3D11View.VTable
		{
			public function void(ID3D11RasterizerState* self, RasterizerStateDescription *pDesc) GetDesc;
		}

		public new VTable* VT
		{
			[Inline]
			get
			{
				return (.)VT;
			}
		}

		public void GetDescription(out RasterizerStateDescription desc) mut
		{
			desc = ?;
			VT.GetDesc(&this, &desc);
		}
	}
}
