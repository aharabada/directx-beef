using System;
using DirectX.DXGI;

namespace DirectX.D3D11
{
	/**
	A description of a single element for the input-assembler stage.
	D3D11_INPUT_ELEMENT_DESC 
	*/
	[CRepr]
	public struct InputElementDescription
	{
		/**
		The HLSL semantic associated with this element in a shader input-signature.
		*/
		public char8* SemanticName;
		/**
		The semantic index for the element.
		A semantic index modifies a semantic, with an integer index number.
		A semantic index is only needed in a case where there is more than one element with the same semantic.
		For example, a 4x4 matrix would have four components each with the semantic name "matrix",
		however each of the four component would have different semantic indices (0, 1, 2, and 3).
		*/
		public uint32 SemanticIndex;
		/**
		The data type of the element data.
		*/
		public Format Format;
		/**
		An integer value that identifies the input-assembler (see input slot). Valid values are between 0 and 15.
		*/
		public uint32 InputSlot;
		/**
		Optional. Offset (in bytes) from the start of the vertex. Use AppendAligned for convenience to define the current element directly after the previous one, including any packing if necessary.
		*/
		public uint32 AlignedByteOffset;
		/**
		Identifies the input data class for a single input slot.
		*/
		public InputClassification InputSlotClass;
		/**
		The number of instances to draw using the same per-instance data before advancing in the buffer by one element.
		This value must be 0 for an element that contains per-vertex data (the slot class is set to PerVertexData).
		*/
		public uint32 InstanceDataStepRate;
		
		/**
		Use AppendAligned for convenience to define the current element directly after the previous one, including any packing if necessary.
		*/
		public static readonly uint32 AppendAligned = 0xffffffff;
	}
}
