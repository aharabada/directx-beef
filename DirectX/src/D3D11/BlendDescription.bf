using System;

namespace DirectX.D3D11
{
	/**
	Describes the blend state that you use in a call to ID3D11Device::CreateBlendState to create a blend-state object.
	*/
	[CRepr]
	public struct BlendDescription
	{
		/**
		Specifies whether to use alpha-to-coverage as a multisampling technique when setting a pixel to a render target.
		For more info about using alpha-to-coverage, see Alpha-To-Coverage.
		*/
		public BOOL AlphaToCoverageEnable;
		/**
		Specifies whether to enable independent blending in simultaneous render targets. Set to TRUE to enable independent blending.
		If set to FALSE, only the RenderTarget[0] members are used; RenderTarget[1..7] are ignored.
		*/
    	public BOOL IndependentBlendEnable;
		/**
		An array of D3D11_RENDER_TARGET_BLEND_DESC structures that describe the blend states for render targets;
		these correspond to the eight render targets that can be bound to the output-merger stage at one time.
		*/
    	public RenderTargetBlendDescription[8] RenderTarget;

		public this()
		{
			this = default;
		}

		public static this()
		{
			Default = .();
			Default.AlphaToCoverageEnable = false;
			Default.IndependentBlendEnable = false;

			for(int i = 0; i < D3D11_SIMULTANEOUS_RENDER_TARGET_COUNT; i++)
			{
				Default.RenderTarget[i] = .Default;
			}
		}

		public static readonly BlendDescription Default;
	}
}
