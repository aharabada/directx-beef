using System;
using DirectX.Common;

namespace DirectX.D3D11Shader
{
	/**
	 * Describes a shader-variable type.
	 * D3D11_SHADER_TYPE_DESC
	*/
	[CRepr]
	public struct ShaderTypeDescription
	{
		/**
		 * A ShaderVariableClass-typed value that identifies the variable class as one of scalar, vector, matrix, object, and so on.
		*/
		public ShaderVariableClass Class;
		/**
		 * A ShaderVariableType-typed value that identifies the variable type.
		*/
		public ShaderVariableType Type;
		/**
		 * Number of rows in a matrix. Otherwise a numeric type returns 1, any other type returns 0.
		*/
		public uint32 Rows;
		/**
		 * Number of columns in a matrix. Otherwise a numeric type returns 1, any other type returns 0.
		*/
		public uint32 Columns;
		/**
		 * Number of elements in an array; otherwise 0.
		*/
		public uint32 Elements;
		/**
		 * Number of members in the structure; otherwise 0.
		*/
		public uint32 Members;
		/**
		 * Offset, in bytes, between the start of the parent structure and this variable. Can be 0 if not a structure member.
		*/
		public uint32 Offset;
		/**
		 * Name of the shader-variable type.
		 * This member can be NULL if it isn't used.
		 * This member supports dynamic shader linkage interface types, which have names.
		 * For more info about dynamic shader linkage, see Dynamic Linking.
		*/
		public char8* Name;
	}
}
