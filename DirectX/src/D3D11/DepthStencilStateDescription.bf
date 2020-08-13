using System;
using DirectX.Common;

namespace DirectX.D3D11
{
	/**
	Describes depth-stencil state. 
	D3D11_DEPTH_STENCIL_DESC
	*/
	[CRepr]
	public struct DepthStencilStateDescription
	{
		/**
		Enable depth testing.
		*/
		public BigBool DepthEnable;
		/**
		Identify a portion of the depth-stencil buffer that can be modified by depth data.
		*/
		public DepthWriteMask DepthWriteMask;
		/**
		A function that compares depth data against existing depth data.
		*/
		public ComparisonFunction DepthFunction;
		/**
		Enable stencil testing.
		*/
		public BigBool StencilEnable;
		/**
		Identify a portion of the depth-stencil buffer for reading stencil data.
		*/
		public uint8 StencilReadMask;
		/**
		Identify a portion of the depth-stencil buffer for writing stencil data.
		*/
		public uint8 StencilWriteMask;
		/**
		Identify how to use the results of the depth test and the stencil test for pixels whose surface normal is facing towards the camera.
		*/
		public DepthStencilOperationDescription FrontFace;
		/**
		Identify how to use the results of the depth test and the stencil test for pixels whose surface normal is facing away from the camera.
		*/
		public DepthStencilOperationDescription BackFace;

		/**
		Instantiates a new instance of a DepthStencilStateDescription structure that is initialized with zero-values.
		*/
		public this()
		{
			this = default;
		}

		/**
		Instantiates a new instance of a DepthStencilStateDescription structure that is initialized with the specified values.
		*/
		public this(bool depthEnable, DepthWriteMask depthWriteMask, ComparisonFunction depthFunction, bool stencilEnable,
			uint8 stencilReadMask, uint8 stencilWriteMask, DepthStencilOperationDescription frontFace, DepthStencilOperationDescription backFace)
		{
			DepthEnable = depthEnable;
			DepthWriteMask = depthWriteMask;
			DepthFunction = depthFunction;
			StencilEnable = stencilEnable;
			StencilReadMask = stencilReadMask;
			StencilWriteMask = stencilWriteMask;
			FrontFace = frontFace;
			BackFace = backFace;
		}

		/**
		A DepthStencilStateDescription with its fields set to the default values
		*/
		public static readonly DepthStencilStateDescription Default = .(true, .All, .Less, false,
			D3D11_DEFAULT_STENCIL_READ_MASK, D3D11_DEFAULT_STENCIL_WRITE_MASK, .Default, .Default);
	}
}
