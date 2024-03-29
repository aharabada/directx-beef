using System;
using DirectX.Common;

namespace DirectX.D3D11
{
	/**
	 * A buffer interface accesses a buffer resource, which is unstructured memory. Buffers typically store vertex or index data.
	*/
	public struct ID3D11Buffer : ID3D11Resource, IComObject
	{
		public static new Guid IID => .("48570b85-d1ee-4fcd-a250-eb350722b037");
		
		public struct VTable : ID3D11Resource.VTable
		{
			 public function [CallingConvention(.Stdcall)] void(ID3D11Buffer* self, BufferDescription* desc) GetDesc;
		}

		public new VTable* VT
		{
			[Inline]
			get => (.)mVT;
		}

		/**
		 * Get the properties of a buffer resource.
		 *
		 * @param description	Reference to a resource description filled in by the method.
		*/
		public void GetDescription(out BufferDescription description) mut
		{
			description = ?;
			VT.GetDesc(&this, &description);
		}
	}
}
