using System;
using DirectX.Common;

namespace DirectX.D3D11Shader
{
	/**
	 * Describes a shader constant-buffer.
	 * D3D11_SHADER_BUFFER_DESC
	*/
	[CRepr]
	public struct ShaderBufferDescription
	{
		/**
		 * The name of the buffer.
		*/
		public char8* Name;
		/**
		 * A D3DCBufferType-typed value that indicates the intended use of the constant data.
		*/
		public D3DCBufferType Type;
		/**
		 * The number of unique variables.
		*/
		public uint32 Variables;
		/**
		 * Buffer size (in bytes).
		*/
		public uint32 Size;
		/**
		 * A combination of D3D_SHADER_CBUFFER_FLAGS-typed values that are combined by using a bitwise OR operation.
		 * The resulting value specifies properties for the shader constant-buffer.
		*/
		public D3DShaderCBufferFlags Flags;
	}
}
