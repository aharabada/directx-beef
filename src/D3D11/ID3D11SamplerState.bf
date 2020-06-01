using System;
using DirectX.Common;

namespace DirectX.D3D11
{	
	public struct ID3D11SamplerState : ID3D11DeviceChild, IComObject 
	{
		public static new Guid IID => .("da6fea51-564c-4487-9810-f0d0f9b4e3a5");
		
		public struct VTable : ID3D11DeviceChild.VTable
		{
			public function void(ID3D11SamplerState* seld, SamplerStateDescription* pDesc)GetDesc;
		}

		public new VTable* VT
		{
			[Inline]
			get
			{
				return (.)mVT;
			}
		}
	}
}
