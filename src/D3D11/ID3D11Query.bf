using System;
using DirectX.Common;

namespace DirectX.D3D11
{
	/**
	* This interface encapsulates methods for retrieving data from the GPU asynchronously.
	*/
	public struct ID3D11Query : ID3D11Asynchronous, IComObject
	{
		public static new Guid IID => Guid("d6c00747-87b7-425e-b84d-44d108560afd");

		public struct VTable : ID3D11Asynchronous.VTable
		{
			public function void(ID3D11Query *self, QueryDescription *pDesc) GetDesc;
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