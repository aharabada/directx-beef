using System;
using DirectX.Common;

namespace DirectX.D3D11
{
	/**
	 * A view interface specifies the parts of a resource the pipeline can access during rendering.
	*/
	public struct ID3D11View : ID3D11DeviceChild, IComObject
	{
		public static new Guid IID => .("839d1216-bb2e-412b-b7f4-a9dbebe08ed1");
		
		public struct VTable : ID3D11DeviceChild.VTable
		{
			public function [CallingConvention(.Stdcall)] void(ID3D11View* self, ID3D11Resource **ppResource) GetResource;
		}

		public new VTable* VT
		{
			[Inline]
			get => (.)mVT;
		}

		/**
		 * Get the resource that is accessed through this view.
		 *
		 * @param resource	Reference to a pointer to the resource that is accessed through this view.
		*/
		public void GetResource(out ID3D11Resource* resource) mut
		{
			resource = ?;
			VT.GetResource(&this, &resource);
		}
	}
}
