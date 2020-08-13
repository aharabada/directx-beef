using System;

namespace DirectX.D3D11
{
	/**
	 * Description of a vertex element in a vertex buffer in an output slot.
	*/
	[CRepr]
	public struct StreamOutputDeclarationEntry
	{
		/**
		 * Zero-based, stream number.
		*/
		public UINT Stream;
		/**
		 * Type of output element; possible values include: "POSITION", "NORMAL", or "TEXCOORD0".
		 * Note that if SemanticName is NULL then ComponentCount can be greater than 4 and the described entry will be a gap in the stream out where no data will be written.
		*/
		public char8* SemanticName;
		/**
 		 * Output element's zero-based index. Should be used if, for example, you have more than one texture coordinate stored in each vertex.
		*/
		public UINT SemanticIndex;
		/**
		 * Which component of the entry to begin writing out to. Valid values are 0 to 3.
		 * For example, if you only wish to output to the y and z components of a position, then StartComponent should be 1 and ComponentCount should be 2.
		*/
		public uint8 StartComponent;
		/**
		 * The number of components of the entry to write out to. Valid values are 1 to 4.
		 * For example, if you only wish to output to the y and z components of a position, then StartComponent should be 1 and ComponentCount should be 2.
		 * Note that if SemanticName is NULL then ComponentCount can be greater than 4 and the described entry will be a gap in the stream out where no data will be written.
		*/
		public uint8 ComponentCount;
		/**
		 * The associated stream output buffer that is bound to the pipeline (see ID3D11DeviceContext::SOSetTargets).
		 * The valid range for OutputSlot is 0 to 3.
		*/
		public uint8 OutputSlot;
	}
}
