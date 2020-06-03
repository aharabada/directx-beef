namespace DirectX.D3D11
{
	/**
	 * Unordered-access view options.
	*/
	public enum UnorderedAccessViewDimension : uint32
	{
		/**
		 * The view type is unknown.
		 * D3D11_UAV_DIMENSION_UNKNOWN
		*/
		Unknown = 0,
		/**
		 * View the resource as a buffer.
		 * D3D11_UAV_DIMENSION_BUFFER
		*/
		Buffer = 1,
		/**
		 * View the resource as a 1D texture.
		 * D3D11_UAV_DIMENSION_TEXTURE1D
		*/
		Texture1D = 2,
		/**
		 * View the resource as a 1D texture array.
		 * D3D11_UAV_DIMENSION_TEXTURE1DARRAY
		*/
		Texture1DArray = 3,
		/**
		 * View the resource as a 2D texture.
		 * D3D11_UAV_DIMENSION_TEXTURE2D
		*/
		Texture2D = 4,
		/**
		 * View the resource as a 2D texture array.
		 * D3D11_UAV_DIMENSION_TEXTURE2DARRAY
		*/
		Texture2DArray = 5,
		/**
		 * View the resource as a 3D texture array.
		 * D3D11_UAV_DIMENSION_TEXTURE3D
		*/
		Texture3D = 8
	}
}
