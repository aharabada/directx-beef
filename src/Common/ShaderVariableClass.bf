namespace DirectX.Common
{
	/**
	 * Values that identify the class of a shader variable.
	 * D3D_SHADER_VARIABLE_CLASS
	*/
	public enum ShaderVariableClass : uint32
	{
		/**
		 * The shader variable is a scalar.
		 * D3D_SVC_SCALAR
		*/
		Scalar = 0,
		/**
		 * The shader variable is a vector.
		 * D3D_SVC_VECTOR
		*/
		Vector = ( Scalar + 1 ) ,
		/**
		 * The shader variable is a row-major matrix.
		 * D3D_SVC_MATRIX_ROWS
		*/
		MatrixRowMajor = ( Vector + 1 ) ,
		/**
		 * The shader variable is a column-major matrix.
		 * D3D_SVC_MATRIX_COLUMNS
		*/
		MatrixColumnMajor = ( MatrixRowMajor + 1 ) ,
		/**
		 * The shader variable is an object.
		 * D3D_SVC_OBJECT
		*/
		Object = ( MatrixColumnMajor + 1 ) ,
		/**
		 * The shader variable is a structure.
		 * D3D_SVC_STRUCT
		*/
		Struct = ( Object + 1 ) ,
		/**
		 * The shader variable is a class.
		 * D3D_SVC_INTERFACE_CLASS
		*/
		InterfaceClass = ( Struct + 1 ) ,
		/**
		 * The shader variable is an interface.
		 * D3D_SVC_INTERFACE_POINTER
		*/
		InterfacePointer = ( InterfaceClass + 1 ) ,
		/**
		 * This value is not used by a programmer;
		 * it exists to force the enumeration to compile to 32 bits.
		 * D3D_SVC_FORCE_DWORD
		*/
		ForceDWord = 0x7fffffff
	}
}
