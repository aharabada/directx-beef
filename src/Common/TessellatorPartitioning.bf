namespace DirectX.Common
{
	/**
	 * Partitioning options.
	 * D3D_TESSELLATOR_PARTITIONING
	*/
	public enum TessellatorPartitioning : uint32
	{
		/**
		 * The partitioning type is undefined.
		 * D3D_TESSELLATOR_PARTITIONING_UNDEFINED
		*/
        Undefined = 0,
		/**
		 * Partition with integers only.
		 * D3D_TESSELLATOR_PARTITIONING_INTEGER
		*/
        Integer = 1,
		/**
		 * Partition with a power-of-two number only.
		 * D3D_TESSELLATOR_PARTITIONING_POW2
		*/
        Pow2 = 2,
		/**
		 * Partition with an odd, fractional number.
		 * D3D_TESSELLATOR_PARTITIONING_FRACTIONAL_ODD
		*/
        Odd = 3,
		/**
		 * Partition with an even, fractional number.
		 * D3D_TESSELLATOR_PARTITIONING_FRACTIONAL_EVEN
		*/
        Even = 4,
	}
}
