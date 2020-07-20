using System;

namespace DirectX.D3D11
{
	/**
	Stencil operations that can be performed based on the results of stencil test.
	D3D11_DEPTH_STENCILOP_DESC
	*/
	[CRepr]
	public struct DepthStencilOperationDescription
	{
		/**
		The stencil operation to perform when stencil testing fails.
		*/
		public StencilOperation StencilFailOp;
		/**
		The stencil operation to perform when stencil testing passes and depth testing fails.
		*/
		public StencilOperation StencilDepthFailOp;
		/**
		The stencil operation to perform when stencil testing and depth testing both pass.
		*/
		public StencilOperation StencilPassOp;
		/**
		A function that compares stencil data against existing stencil data.
		*/
		public ComparisonFunction StencilFunc;

		/**
		Initializes a new instance of a	DepthStencilOperationDescription with all zero values.
		*/
		public this()
		{
			this = default;
		}
		
		/**
		Initializes a new instance of a	DepthStencilOperationDescription with the specified values.
		*/
		public this(StencilOperation stencilFailOp, StencilOperation stencilDepthFailOp, StencilOperation stencilPassOp, ComparisonFunction stencilFunc)
		{
			StencilFailOp = stencilFailOp;
			StencilDepthFailOp = stencilDepthFailOp;
			StencilPassOp = stencilPassOp;
			StencilFunc = stencilFunc;
		}

		public static readonly DepthStencilOperationDescription	Default = .(.Keep, .Keep, .Keep, .Always);
	}
}
