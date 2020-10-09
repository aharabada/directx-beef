using System;

namespace DirectX.Common
{
	/**
	 * This interface is used to return data of arbitrary length.
	 */
	public struct ID3DBlob : IUnknown, IComObject
	{
		public static new Guid IID => .("8BA5FB08-5195-40e2-AC58-0D989C3A0102");
		
		public struct VTable : IUnknown.VTable
		{
			public function void*(ID3DBlob *self) GetBufferPointer;
			public function uint32(ID3DBlob *self) GetBufferSize; 
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
		 * Retrieves the size, in bytes, of the blob's data.
		 * @return The size of the blob's data, in bytes.
		 */
		public uint32 GetBufferSize() mut
		{
			return VT.GetBufferSize(&this);
		}

		/**
		 * Retrieves a pointer to the blob's data.
		 * @return A pointer to the blob's data.
		 */
		public void* GetBufferPointer() mut
		{
			return VT.GetBufferPointer(&this);
		}
	}
}
