using System;

namespace DirectX.D3DCompiler
{
	/**
	 * Describes shader data.
	*/
	[CRepr]
	public struct D3DShaderData
	{
		/**
		 * A pointer to shader data.
		*/
		public void* Bytecode;
		/**
		 * Length of shader data that pBytecode points to.
		*/
		public uint BytecodeLength;
	}
}
