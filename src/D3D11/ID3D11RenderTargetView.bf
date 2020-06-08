using System;
using DirectX.Common;

namespace DirectX.D3D11
{
	/**
	 * A render-target-view interface identifies the render-target subresources that can be accessed during rendering.
	*/
	public struct ID3D11RenderTargetView : ID3D11View, IComObject
	{
		public static new Guid IID => Guid("dfdba067-0b8d-4865-875b-d7b4516cc164");
		
		public struct VTable : ID3D11View.VTable
		{
			public function void(ID3D11RenderTargetView* self, RenderTargetViewDescription *pDesc) GetDesc;
		}

		public new VTable* VT
		{
			[Inline]
			get => (.)mVT;
		}

		/**
		 * Get the properties of a render target view.
		 *
		 * @param desc	Reference to the description of a render target view.
		*/
		public void GetDescription(out RenderTargetViewDescription desc) mut
		{
			desc = ?;
			VT.GetDesc(&this, &desc);
		}
	}
}
