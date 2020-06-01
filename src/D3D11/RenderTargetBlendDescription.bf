using System;

namespace DirectX.D3D11
{
	/**
	Describes the blend state for a render target.
	D3D11_RENDER_TARGET_BLEND_DESC
	*/
	[CRepr]
	public struct RenderTargetBlendDescription
	{
		/**
		Enable (or disable) blending.
		*/
		public BOOL BlendEnable;
		/**
		This blend option specifies the operation to perform on the RGB value that the pixel shader outputs.
		The BlendOp member defines how to combine the SrcBlend and DestBlend operations.
		*/
    	public Blend SourceBlend;
		/**
		This blend option specifies the operation to perform on the current RGB value in the render target.
		The BlendOp member defines how to combine the SrcBlend and DestBlend operations.
		*/
    	public Blend DestinationBlend;
		/**
		This blend operation defines how to combine the SourceBlend and DestinationBlend operations.
		*/
    	public BlendOperation BlendOperation;
		/**
		This blend option specifies the operation to perform on the alpha value that the pixel shader outputs.
		Blend options that end in _COLOR are not allowed. The BlendOpAlpha member defines how to combine the SrcBlendAlpha and DestBlendAlpha operations.
		*/
    	public Blend SourceBlendAlpha;
		/**
		This blend option specifies the operation to perform on the current alpha value in the render target.
		Blend options that end in _COLOR are not allowed. The BlendOpAlpha member defines how to combine the SrcBlendAlpha and DestBlendAlpha operations.
		*/
    	public Blend DestinationBlendAlpha;
		/**
		This blend operation defines how to combine the SrcBlendAlpha and DestBlendAlpha operations.
		*/
    	public BlendOperation BlendOperationAlpha;
		/**
		A write mask.
		*/
    	public ColorWriteEnable RenderTargetWriteMask;

		public this()
		{
			this = default;
		}

		public this(BOOL blendEnable, Blend sourceBlend, Blend destinationBlend, BlendOperation blendOperation,
			Blend sourceBlendAlpha, Blend destinationBlendAlpha, BlendOperation blendOperationAlpha, ColorWriteEnable renderTargetWriteMask)
		{
			BlendEnable = blendEnable;
			SourceBlend = sourceBlend;
			DestinationBlend = destinationBlend;
			BlendOperation = blendOperation;
			SourceBlendAlpha = sourceBlendAlpha;
			DestinationBlendAlpha = destinationBlendAlpha;
			BlendOperationAlpha = blendOperationAlpha;
			RenderTargetWriteMask = renderTargetWriteMask;
		}

		public static readonly RenderTargetBlendDescription Default = .(false, .One, .Zero, .Add, .One, .Zero, .Add, .All);
	}
}
