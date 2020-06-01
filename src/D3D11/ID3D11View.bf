using System;
using DirectX.Common;

namespace DirectX.D3D11
{
	public struct ID3D11View : ID3D11DeviceChild, IComObject
	{
		public static new Guid IID => .("839d1216-bb2e-412b-b7f4-a9dbebe08ed1");
		
		public struct VTable : ID3D11DeviceChild.VTable
		{
			public function void(ID3D11View* self, ID3D11Resource **ppResource) GetResource;
		}

		public new VTable* VT
		{
			[Inline]
			get
			{
				return (.)mVT;
			}
		}

		public void GetResource(out ID3D11Resource* resource) mut
		{
			VT.GetResource(&this, &(resource = ?));
		}
	}
}
