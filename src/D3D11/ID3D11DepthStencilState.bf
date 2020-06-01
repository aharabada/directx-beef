using System;
using DirectX.Common;

namespace DirectX.D3D11
{
	/**
	The depth-stencil-state interface holds a description for depth-stencil state that you can bind to the output-merger stage.
	*/
	public struct ID3D11DepthStencilState : ID3D11DeviceChild, IComObject
	{
		public static new Guid IID => Guid("03823efb-8d8f-4e1c-9aa2-f64bb2cbfdf1");

		public struct VTable : ID3D11DeviceChild.VTable
		{
			public function void(ID3D11DepthStencilState* self, DepthStencilStateDescription* desc) GetDesc;
		};

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
