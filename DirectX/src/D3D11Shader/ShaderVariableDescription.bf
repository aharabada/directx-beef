using System;
using DirectX.Common;

namespace DirectX.D3D11Shader
{
	/**
	 * Describes a shader variable.
	*/
	[CRepr]
	public struct ShaderVariableDescription
	{
		/**
		 * The variable name.
		*/
		public char8* Name;
		/**
		 * Offset from the start of the parent structure to the beginning of the variable.
		*/
		public uint32 StartOffset;
		/**
		 * Size of the variable (in bytes).
		*/
		public uint32 Size;
		/**
		 * A combination of D3DShaderVariableFlags-typed values that are combined by using a bitwise OR operation.
		 * The resulting value identifies shader-variable properties.
		*/
		public D3DShaderVariableFlags uFlags;
		/**
		 * The default value for initializing the variable.
		*/
		public void* DefaultValue;
		/**
		 * Offset from the start of the variable to the beginning of the texture.
		*/
		public uint32 StartTexture;
		/**
		 * The size of the texture, in bytes.
		*/
		public uint32 TextureSize;
		/**
		 * Offset from the start of the variable to the beginning of the sampler.
		*/
		public uint32 StartSampler;
		/**
		 * The size of the sampler, in bytes.
		*/
		public uint32 SamplerSize;
	}
}
