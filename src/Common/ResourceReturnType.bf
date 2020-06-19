namespace DirectX.Common
{
	/**
	 * Indicates return value type.
	 * D3D_RESOURCE_RETURN_TYPE
	*/
	public enum ResourceReturnType : uint32
	{
		/**
		 * Return type is UNORM.
		 * D3D_RETURN_TYPE_UNORM
		*/
		UNorm = 1,
		/**
		 * Return type is SNORM.
		 * D3D_RETURN_TYPE_SNORM
		*/
        SNorm = 2,
		/**
		 * Return type is SINT.
		 * D3D_RETURN_TYPE_SINT
		*/
        SInt = 3,
		/**
		 * Return type is UINT.
		 * D3D_RETURN_TYPE_UINT
		*/
        UInt = 4,
		/**
		 * Return type is FLOAT.
		 * D3D_RETURN_TYPE_FLOAT
		*/
        Float = 5,
		/**
		 * Return type is unknown.
		 * D3D_RETURN_TYPE_MIXED
		*/
        Mixed = 6,
		/**
		 * Return type is DOUBLE.
		 * D3D_RETURN_TYPE_DOUBLE
		*/
        Double = 7,
		/**
		 * Return type is a multiple-dword type, such as a double or uint64, and the component is continued from the previous component that was declared.
		 * The first component represents the lower bits.
		 * D3D_RETURN_TYPE_CONTINUED
		*/
        Continued = 8,
	}
}
