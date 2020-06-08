using System;
using DirectX.Common;

namespace DirectX.D3D11
{
	/**
	 * The rasterizer-state interface holds a description for rasterizer state that you can bind to the rasterizer stage.
	*/
	public struct ID3D11RasterizerState : ID3D11View, IComObject
	{
		public static new Guid IID => Guid("9bb4ab81-ab1a-4d8f-b506-fc04200b6ee7");
		
		public struct VTable : ID3D11View.VTable
		{
			public function void(ID3D11RasterizerState* self, RasterizerStateDescription *pDesc) GetDesc;
		}

		public new VTable* VT
		{
			[Inline]
			get => (.)VT;
		}

		/**
		 * Gets the description for rasterizer state that you used to create the rasterizer-state object.
		 *
		 * @param desc	A reference to a RasterizerStateDescription that receives a description of the rasterizer state.
		*/
		public void GetDescription(out RasterizerStateDescription desc) mut
		{
			desc = ?;
			VT.GetDesc(&this, &desc);
		}
	}
}
