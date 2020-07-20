using System;
using DirectX.Common;

namespace DirectX.D3D11Shader
{
	/**
	 * Describes a shader signature.
	 * D3D11_SIGNATURE_PARAMETER_DESC
	*/
	[CRepr]
	public struct SignatureParameterDescription
	{
		/**
		 * A per-parameter string that identifies how the data will be used.
		*/
		public char8* SemanticName;
		/**
		 * Semantic index that modifies the semantic.
		 * Used to differentiate different parameters that use the same semantic.
		*/
		public uint32 SemanticIndex;
		/**
		 * The register that will contain this variable's data.
		*/
		public uint32 Register;
		/**
		 * A D3DName-typed value that identifies a predefined string that determines the functionality of certain pipeline stages.
		*/
		public D3DName SystemValueType;
		/**
		 * A D3D_REGISTER_COMPONENT_TYPE-typed value that identifies the per-component-data type that is stored in a register.
		 * Each register can store up to four-components of data.
		*/
		public D3DRegisterComponentType ComponentType;
		/**
		 * Mask which indicates which components of a register are used.
		*/
		//Todo: actual type: D3D10_COMPONENT_MASK
		public uint8 Mask;
		/**
		 * Mask which indicates whether a given component is never written (if the signature is an output signature) or always read (if the signature is an input signature).
		*/
		// Todo: actual type D3D_MASK_*
		public uint8 ReadWriteMask;
		/**
		 * Indicates which stream the geometry shader is using for the signature parameter.
		*/
		public uint32 Stream;
		/**
		 * A D3DMinPrecision-typed value that indicates the minimum desired interpolation precision.
		*/
		public D3DMinPrecision MinPrecision;
	}
}
