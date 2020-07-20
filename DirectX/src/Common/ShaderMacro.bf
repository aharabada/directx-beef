using System;

namespace DirectX.Common
{
	/**
	Defines a shader macro.
	D3D_SHADER_MACRO
	*/
	[CRepr]
	public struct ShaderMacro
	{
		/**
		* The macro name.
		*/
		public char16 *Name;
		/**
		* The macro definition.
		*/
		public char16 *Definition;
	}
}
