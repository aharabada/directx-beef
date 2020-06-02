using System;
using DirectX.Common;

namespace DirectX.D3D11
{
	/**
	A buffer interface accesses a buffer resource, which is unstructured memory. Buffers typically store vertex or index data.
	*/
	public struct ID3D11Buffer : ID3D11Resource, IComObject
	{
		public static new Guid IID => .("48570b85-d1ee-4fcd-a250-eb350722b037");
		
		public struct VTable : ID3D11Resource.VTable
		{
			 public function void(ID3D11Buffer* self, BufferDescription* desc) GetDesc;
		}

		public new VTable* VT
		{
			[Inline]
			get
			{
				return (.)mVT;
			}
		}

		/**
		Get the properties of a buffer resource.
		*/
		public void GetDescription(out BufferDescription desc) mut
		{
			desc = ?;
			VT.GetDesc(&this, &desc);
		}
	}
}
