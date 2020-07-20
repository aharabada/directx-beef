using System;  
using DirectX;
using DirectX.Common;

namespace DirectX.D3D11
{
	/**
	 * This interface encapsulates an HLSL class.
	*/
	public struct ID3D11ClassInstance : ID3D11DeviceChild, IComObject
	{
		public static new Guid IID => Guid("a6cd7faa-b0b7-4a2f-9436-8662a65797cb");

		public struct VTable : ID3D11DeviceChild.VTable
		{
			public function void (ID3D11ClassInstance *self, ID3D11ClassLinkage **ppLinkage) GetClassLinkage;
			public function void (ID3D11ClassInstance *self, ClassInstanceDescription *pDesc) GetDesc;
			public function void (ID3D11ClassInstance *self, LPSTR pInstanceName, SIZE_T *pBufferLength) GetInstanceName;
			public function void (ID3D11ClassInstance *self, LPSTR pTypeName, SIZE_T *pBufferLength) GetTypeName;
		}

		public new VTable* VT
		{
			[Inline]
			get => (.)mVT;
		}

		/**
		 * Gets the ID3D11ClassLinkage object associated with the current HLSL class.
		 *
		 * @param ppLinkage	A pointer to a ID3D11ClassLinkage interface pointer.
		*/
		public void GetClassLinkage(ID3D11ClassLinkage** ppLinkage) mut
		{
			VT.GetClassLinkage(&this, ppLinkage);
		}

		/**
		 * Gets a description of the current HLSL class.
		 *
		 * @param description	A reference to a D3D11_CLASS_INSTANCE_DESC structure that describes the current HLSL class.
		*/
		public void GetDescription(out ClassInstanceDescription description) mut
		{
			description = ?;
			VT.GetDesc(&this, &description);
		}

		/**
		 * Gets the instance name of the current HLSL class.
		 *
		 * @param pInstanceName	The instance name of the current HLSL class.
		 * @param pBufferLength	The length of the pInstanceName parameter.
		*/
		public void GetInstanceName(LPSTR pInstanceName, SIZE_T *pBufferLength) mut
		{
			VT.GetInstanceName(&this, pInstanceName, pBufferLength);
		}

		/**
		 * Gets the type of the current HLSL class.
		 *
		 * @param pTypeName		Type of the current HLSL class.
		 * @param pBufferLength	TThe length of the pTypeName parameter.
		*/
		public void GetTypeName(LPSTR pTypeName, SIZE_T *pBufferLength) mut
		{
			VT.GetTypeName(&this, pTypeName, pBufferLength);
		}
	}
}
