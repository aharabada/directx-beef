using System;
using DirectX.Common;

namespace DirectX.D3D11
{
	public struct ID3D11CommandList : ID3D11DeviceChild, IComObject
	{
		public static new Guid IID => Guid("4f5b196e-c2bd-495e-bd01-1fded38e4969");
		
		public struct VTable : ID3D11DeviceChild
		{
			public function UINT(ID3D11CommandList *self) GetContextFlags;
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
