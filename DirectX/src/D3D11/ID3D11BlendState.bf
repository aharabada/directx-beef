using System;
using DirectX.Common;

namespace DirectX.D3D11
{
	/**
	 * The blend-state interface holds a description for blending state that you can bind to the output-merger stage.
	*/
	public struct ID3D11BlendState : ID3D11DeviceChild, IComObject
	{
		public static new Guid IID => .("75b68faa-347d-4159-8f45-a0640f01cd9a");
		
		public struct VTable : ID3D11DeviceChild.VTable
		{
			public function [CallingConvention(.Stdcall)] void(ID3D11BlendState* self, BlendDescription *pDesc)GetDesc;
		}

		public new VTable* VT
		{
			[Inline]
			get => (.)mVT;
		}

		/**
		 * Gets the description for blending state that you used to create the blend-state object.
		 *
		 * @param description	The reference that receives a description of the blend state.
		*/
		public void GetDescription(out BlendDescription description) mut
		{
			description = ?;
			VT.GetDesc(&this, &description);
		}
	}
}
