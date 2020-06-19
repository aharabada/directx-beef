using System;
using DirectX.D3DCompiler;

namespace DirectX.D3D11Shader
{
	/**
	 * Describes a library.
	 * D3D11_LIBRARY_DESC
	*/
	[CRepr]
	public struct LibraryDescription
	{
		/**
		 * The name of the originator of the library.
		*/
		public char8* Creator;
		/**
		 * A combination of ShaderCompileFlags that are combined by using a bitwise OR operation.
		 * The resulting value specifies how the compiler compiles.
		*/
		public ShaderCompileFlags Flags;
		/**
		 * The number of functions exported from the library.
		*/
		public uint32 FunctionCount;
	}
}
