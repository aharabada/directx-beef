using System;
using DirectX.Common;

namespace DirectX.D3D11Shader
{
	/**
	 * Describes how a shader resource is bound to a shader input.
	 * D3D11_SHADER_INPUT_BIND_DESC
	*/
	[CRepr]
	public struct ShaderInputBindDescription
	{
		/**
		 * Name of the shader resource.
		*/
		public char8* Name;
		/**
		 * A ShaderInputType-typed value that identifies the type of data in the resource.
		*/
		public ShaderInputType Type;
		/**
		 * Starting bind point.
		*/
		public uint32 BindPoint;
		/**
		 * Number of contiguous bind points for arrays.
		*/
		public uint32 BindCount;
		/**
		 * A combination of ShaderInputFlags-typed values for shader input-parameter options.
		*/
		public ShaderInputFlags Flags;
		/**
		 * If the input is a texture, the ResourceReturnType-typed value that identifies the return type.
		*/
		public ResourceReturnType ReturnType;
		/**
		 * A ShaderResourceViewDimension-typed value that identifies the dimensions of the bound resource.
		*/
		public ShaderResourceViewDimension Dimension;
		/**
		 * The number of samples for a multisampled texture;
		 * when a texture isn't multisampled, the value is set to -1 (0xFFFFFFFF).
		*/
		public int32 SampleCount;
	}
}
