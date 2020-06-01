using System;  
using DirectX;
using DirectX.Common;

namespace DirectX.D3D11
{
	public struct ID3D11ClassInstance : ID3D11DeviceChild, IComObject
	{
		public static new Guid IID => Guid("a6cd7faa-b0b7-4a2f-9436-8662a65797cb");

		public struct VTable : ID3D11DeviceChild.VTable
		{
			public function void(ID3D11ClassLinkage **ppLinkage) GetClassLinkage;

			public function void GetDesc(ClassInstanceDescription *pDesc);

			public function void GetInstanceName(LPSTR pInstanceName, SIZE_T *pBufferLength);

			public function void GetTypeName(LPSTR pTypeName, SIZE_T *pBufferLength);
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
