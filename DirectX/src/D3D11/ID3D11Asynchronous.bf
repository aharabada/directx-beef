using System;
using DirectX.Common;

namespace DirectX.D3D11
{
	/**
	* This interface encapsulates methods for retrieving data from the GPU asynchronously.
	*/
	public struct ID3D11Asynchronous : ID3D11DeviceChild, IComObject
	{
		public static new Guid IID => Guid("4b35d0cd-1e15-4258-9c98-1b1333f6dd3b");
		
		public struct VTable : ID3D11DeviceChild.VTable
		{
			public function UINT(ID3D11Asynchronous *self) GetDataSize;
		}

		public new VTable* VT => (.)mVT;

		/**
		 * Get the size of the data (in bytes) that is output when calling ID3D11DeviceContext::GetData.
		 *
		 * @return Size of the data (in bytes) that is output when calling GetData.
		*/
		public UINT GetDataSize() mut
		{
			return VT.GetDataSize(&this);
		}
	}
}
