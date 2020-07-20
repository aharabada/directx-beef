using System;
using DirectX.Common;

namespace DirectX.D3D11
{
	/**
	Describes rasterizer state.
	D3D11_RASTERIZER_DESC
	*/
	[CRepr]
	public struct RasterizerStateDescription
	{
		/**
		Determines the fill mode to use when rendering.
		*/
		public FillMode FillMode;
		/**
		Indicates triangles facing the specified direction are not drawn.
		*/
		public CullMode CullMode;
		/**
		Determines if a triangle is front- or back-facing.
		If this parameter is TRUE, a triangle will be considered front-facing
		if its vertices are counter-clockwise on the render target and considered back-facing if they are clockwise.
		If this parameter is FALSE, the opposite is true.
		*/
		public BigBool FrontCounterClockwise;
		/**
		Depth value added to a given pixel.
		*/
		public int32 DepthBias;
		/**
		Maximum depth bias of a pixel.
		*/
		public float DepthBiasClamp;
		/**
		Scalar on a given pixel's slope
		*/
    	public float SlopeScaledDepthBias;
		/**
		Enable clipping based on distance.
		The hardware always performs x and y clipping of rasterized coordinates.
		When DepthClipEnable is set to the default–TRUE, the hardware also clips the z value.
		*/
    	public BigBool DepthClipEnable;
		/**
		Enable scissor-rectangle culling. All pixels outside an active scissor rectangle are culled.
		*/
    	public BigBool ScissorEnable;
		/**
		Specifies whether to use the quadrilateral or alpha line anti-aliasing algorithm on multisample antialiasing (MSAA) render targets.
		Set to TRUE to use the quadrilateral line anti-aliasing algorithm and to FALSE to use the alpha line anti-aliasing algorithm.
		*/
    	public BigBool MultisampleEnable;
		/**
		Specifies whether to enable line antialiasing; only applies if doing line drawing and MultisampleEnable is FALSE.
		*/
    	public BigBool AntialiasedLineEnable;

		/**
		Initializes the RasterizerStateDescription with the default values
		*/
		public this()
		{
			FillMode = .Solid;
			CullMode = .Back;
			FrontCounterClockwise = false;
			DepthBias = 0; 
			DepthBiasClamp = 0.0f;
			SlopeScaledDepthBias = 0.0f;
			DepthClipEnable = true;
			ScissorEnable = false;
			MultisampleEnable = false;
			AntialiasedLineEnable = false;
		}

		/**
		Initializes the RasterizerStateDescription with the specified values
		*/
		public this(FillMode fillMode, CullMode cullMode, bool frontCounterClockwise, int32 depthBias, float depthBiasClamp,
			float slopeScaledDepthBias, bool depthClipEnable, bool scissorEnable, bool multisampleEnable, bool antialiasedLineEnable)
		{
			FillMode = fillMode;
			CullMode = cullMode;
			FrontCounterClockwise = frontCounterClockwise;
			DepthBias = depthBias; 
			DepthBiasClamp = depthBiasClamp;
			SlopeScaledDepthBias = slopeScaledDepthBias;
			DepthClipEnable = depthClipEnable;
			ScissorEnable = scissorEnable;
			MultisampleEnable = multisampleEnable;
			AntialiasedLineEnable = antialiasedLineEnable;
		}
	}
}
