using System;
using DirectX.Common;

namespace DirectX.D3D11
{
	/**
	 * The sampler-state interface holds a description for sampler state that you can bind to any shader stage of the pipeline for reference by texture sample operations.
	*/
	public struct ID3D11SamplerState : ID3D11DeviceChild, IComObject 
	{
		public static new Guid IID => .("da6fea51-564c-4487-9810-f0d0f9b4e3a5");
		
		public struct VTable : ID3D11DeviceChild.VTable
		{
			public function [CallingConvention(.Stdcall)] void(ID3D11SamplerState* seld, SamplerStateDescription* pDesc)GetDesc;
		}

		public new VTable* VT
		{
			[Inline]
			get => (.)mVT;
		}

		/**
		 * Gets the description for sampler state that you used to create the sampler-state object.
		 *
		 * @param desc	A reference to a SamplerStateDescription that receives a description of the sampler state.
		*/
		public void GetDescription(out SamplerStateDescription desc) mut
		{
			desc = ?;
			VT.GetDesc(&this, &desc);
		}
	}
}
