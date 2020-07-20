using System;
using DirectX.Common;

namespace DirectX.D3D11Shader
{
	/**
	 * Describes a function parameter.
	 * D3D11_PARAMETER_DESC
	*/
	[CRepr]
	public struct ParameterDescription
	{
		/**
		 * The name of the function parameter.
		*/
		public char8* Name;
        /**
		 * The HLSL semantic that is associated with this function parameter.
		 * This name includes the index, for example, SV_Target[n].
		*/
		public char8* SemanticName;
		/**
		 * A ShaderVariableType-typed value that identifies the variable type for the parameter.
		*/
		public ShaderVariableType Type;
    	/**
		 * A ShaderVariableClass-typed value that identifies the variable class for the parameter as one of scalar, vector, matrix, object, and so on.
		*/
		public ShaderVariableClass Class;
        /**
		 * The number of rows for a matrix parameter.
		*/
		public uint32 Rows;
        /**
		 * The number of columns for a matrix parameter.
		*/
		public uint32 Columns;
        /**
		 * A InterpolationMode-typed value that identifies the interpolation mode for the parameter.
		*/
		public InterpolationMode InterpolationMode;
        /**
		 * A combination of ParameterFlags-typed values that are combined by using a bitwise OR operation.
		 * The resulting value specifies semantic flags for the parameter.
		*/
		public ParameterFlags Flags;            
		
		/**
		 * The first input register for this parameter.
		*/
		public uint32 FirstInRegister;
        /**
		 * The first input register component for this parameter.
		*/ 
		public uint32 FirstInComponent;
        /**
		 * The first output register for this parameter.
		*/
		public uint32 FirstOutRegister;
        /**
		 * The first output register component for this parameter.
		*/
		public uint32 FirstOutComponent;
	}
}
