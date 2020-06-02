using System;
using DirectX.Common;

namespace DirectX.D3D11
{
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
			get
			{
				return (.)mVT;
			}
		}

		public void GetDescription(out ShaderResourceViewDescription desc) mut
		{		 
			desc = ?;
			VT.GetDesc(&this, &desc);
		}
	}
}
