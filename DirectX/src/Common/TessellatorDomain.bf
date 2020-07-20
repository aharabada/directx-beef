namespace DirectX.Common
{
	/**
	 * Domain options for tessellator data.
	 * D3D_TESSELLATOR_DOMAIN
	*/
	public enum TessellatorDomain : uint32
	{
		/**
		 * The data type is undefined.
		 * D3D_TESSELLATOR_DOMAIN_UNDEFINED
		*/
        Undefined = 0,
		/**
		 * Isoline data.
		 * D3D_TESSELLATOR_DOMAIN_ISOLINE
		*/
        Isoline = 1,
		/**
		 * Triangle data.
		 * D3D_TESSELLATOR_DOMAIN_TRI
		*/
        Tri = 2,
		/**
		 * Quad data.
		 * D3D_TESSELLATOR_DOMAIN_QUAD
		*/
        Quad = 3,
	}
}
